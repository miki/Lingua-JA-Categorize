use strict;
use blib;
use POE;
use POE::Component::Server::HTTP;
use Lingua::JA::Categorize;
use HTML::Feature;
use Data::Dumper;
use YAML;
use Template;
use CGI;
use HTTP::Request::AsCGI;

my $yaml = YAML::Load( join '', <DATA> );

my $config   = $yaml->{config};
my $template = $yaml->{template};

my $server = POE::Component::Server::HTTP->new(
    Port           => 8080,
    ContentHandler => {
        '/'           => \&index,
        '/my.js'      => \&js,
        '/feature'    => \&feature,
        '/categorize' => \&categorize,
        '/train'      => \&train,
    }
);

POE::Session->create(
    inline_states => {
        _start => sub {
            $_[KERNEL]->alias_set("main");
            my $heap = @_[HEAP];
            $heap->{categorizer} = Lingua::JA::Categorize->new(%$config);
            $heap->{categorizer}->load( $config->{state_file} );
            $heap->{extractor} = HTML::Feature->new;
            $heap->{tt}        = Template->new;
        },
    }
);

POE::Kernel->run();

sub index {
    my ( $req, $res ) = @_;
    my $heap     = $poe_kernel->alias_resolve("main")->get_heap();
    my $tt       = $heap->{tt};
    my $template = $template->{index};
    $tt->process( \$template, "", \my $content );
    $res->code(RC_OK);
    $res->content_type('text/html; charset=UTF-8');
    $res->content($content);
}

sub js {
    my ( $req, $res ) = @_;
    my $heap     = $poe_kernel->alias_resolve("main")->get_heap();
    my $tt       = $heap->{tt};
    my $template = $template->{js};
    $tt->process( \$template, "", \my $content );
    $res->code(RC_OK);
    $res->content_type('text/javascript; charset=UTF-8');
    $res->content($content);
}

sub feature {
    my ( $req, $res ) = @_;
    my $q;
    {
        my $cgi = HTTP::Request::AsCGI->new($req)->setup;
        $q = CGI->new;
    }
    my $url       = $q->param("url");
    my $heap      = $poe_kernel->alias_resolve("main")->get_heap();
    my $extractor = $heap->{extractor};
    my $text      = $extractor->parse($url)->text;
    $res->code(RC_OK);
    $res->content_type('text/html; charset=UTF-8');
    $res->content($text);
}

sub categorize {
    my ( $req, $res ) = @_;
    my $q;
    {
        my $cgi = HTTP::Request::AsCGI->new($req)->setup;
        $q = CGI->new;
    }
    my $text        = $q->param("text");
    my $heap        = $poe_kernel->alias_resolve("main")->get_heap();
    my $categorizer = $heap->{categorizer};
    my $result      = $categorizer->categorize($text);

    my $tt       = $heap->{tt};
    my $template = $template->{score_table};

    my $word_set = $result->word_set;
    my $score    = $result->score;

    #-- word_setの整形処理
    my @word_set;
    for (@$word_set) {
        my ( $key, $value ) = each %$_;
        my $item;
        $item->{word}  = $key;
        $item->{count} = $value;
        push( @word_set, $item );
    }

    #-- scoreの整形処理
    my @score;
    for (@$score) {
        my ( $key, $value ) = each %$_;
        my $item;
        $item->{label} = $key;
        $item->{score} = $value;
        push( @score, $item );
    }

    #-- categories の整形処理
    my @categories =
      keys %{ $categorizer->categorizer->{brain}->{'model'}->{'prior_probs'} };
    @categories = sort @categories;
    $tt->process(
        \$template,
        {
            score      => \@score,
            word_set   => \@word_set,
            categories => \@categories
        },
        \my $content
    );

    #print Dumper $tt;
    $res->code(RC_OK);
    $res->content_type('text/html; charset=UTF-8');
    $res->content($content);
}

sub train {
    my ( $req, $res ) = @_;
    my $q;
    {
        my $cgi = HTTP::Request::AsCGI->new($req)->setup;
        $q = CGI->new;
    }
    my $text        = $q->param("text");
    my $category    = $q->param("category");
    my $num         = $q->param("num");
    my $heap        = $poe_kernel->alias_resolve("main")->get_heap();
    my $categorizer = $heap->{categorizer};
    my $brain       = $categorizer->categorizer->brain;
    $num ||= 1;

    for ( 1 .. $num ) {
        my $word_set = $categorizer->tokenizer->tokenize( \$text );
        $brain->add_instance( attributes => $word_set, label => $category );
    }
    $brain->train;
    $categorizer->save($config->{state_file});
    $res->code(RC_OK);
    $res->content_type('text/html; charset=UTF-8');
    $res->content("学習成功");
}

__DATA__
---
config:
    state_file: 'sample.bin'
    tokenizer_config:
        threshold: 30
template:
    index: |
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="my.js"></script>

        <style type="text/css">
            .box
            {
                margin:10px 0 20px 0;
            }
            .rightPos
            {
                float:right;
            }
        </style>

        <title>Lingua::JA::Categorize</title>
        </head>
        <body>

        <table width=800>
            <tr>
                <td><h1>日本語意味分類エンジン</h1></td>
            </tr>
        </table>

        <hr />

        <h2>重要部分抽出（ use HTML::Feature ）</h2>
        <table width=800>
            <tr>
                <td>
                    URL<input type="text" name="url" id="url" size="83">
                    <button type="submit" onclick="javascript:do_extract()">重要部分抽出</button>
                    <button type="submit" onclick="javascript:do_clear()">クリア</button>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="featured" id="featured" cols=90 rows=10></textarea>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>

        <table width=800>
            <tr>
                <td><button type="submit" class="rightPos" onclick="javascript:do_categorize()">分野判定</button></td>
            </tr>
        </table>
       
        <div class="box" id="score">
        </div>

        <div class="box" id="learn">
        </div>

        </body>
        </html>

    score_table: |
        <h2>特徴語（ use Lingua::JA::TFIDF ）</h2>
        <table border=2px width=800>
            [% FOREACH item IN word_set %]
            <tr><td> [% item.word %] </td><td> [% item.count %] </td></tr>
            [% END %]
        </table>
        <br><br>
        <h2>分野（ use Algorithm::NaiveBayes ）</h2>
        <table border=2px width=800>
        [% FOREACH item IN score %]
        <tr>
            <td> [% item.label %] </td><td> [% item.score %] </td>
        </tr>
        [% END %]
        </table>
        <br><br>
        <table width=800>
            <tr>
                <td>
                    補正候補
                    <select id="train_category">
                        [% FOREACH item IN categories %]
                            <option value="[% item %]">[% item %]</option>
                        [% END %]
                    </select>
                    <input type="text" onkeyup="search(this.value)">
                </td>
                <td><div id="train"></div></td>
            </tr>
            <tr>
                <td>
                    補正回数<input id="train_num" type="text" size="10" value="1">回
                </td>
                <td>
                    <button class="rightPos" type="submit" onclick="javascript:do_train()">学習</button>
                </td>
            </tr>
        </table>

    js: |
        function do_extract(){
            var url = encodeURIComponent($("#url").val());
            if(url.length == 0){
                alert("からっぽだよ");
                return;
            }
            $.ajax({
                procmsg: 'now loading',
                type: "POST",
                url: "feature",
                data: "url=" + url,
                success: function(msg){
                    $("#featured").val(msg);
                }
            });
        }
        function do_categorize(){
            var text = encodeURIComponent($("#featured").val());
            $.ajax({
                type: "POST",
                url: "categorize",
                data: "text=" + text,
                success: function(msg){
                    $("#score").html(msg);
                }
            });
           
        }
        function do_train(){
            var text     = $("#featured").val();
            var category = $("#train_category").val();
            var num      = $("#train_num").val();
            $("train").val="";
            $.ajax({
                type: "POST",
                url: "train",
                data: "category=" + category + "&num=" + num + "&text=" + text,
                success: function(msg){
                    $("#train").text("学習成功");
                    do_categorize();
                    setTimeout(function(){
                        $("#train_category").val(category);
                    },1000);
                }
            });
        }
        function do_clear(){
            $("#url").val("");
            $("#featured").val("");
        }
        function search(pattern)
        {
            var pulldown = document.getElementById('train_category');
           
            if (!pulldown.a)
            {
                pulldown.a = [];
                for (var i = 0; i < pulldown.options.length; i++)
                {
                    pulldown.a[i] = pulldown.options.item(i);
                }
            }
           
            pulldown.length = 0;
            var matcheCount = 0;
            for (var i = 0; i < pulldown.a.length; i++)
            {
                if (-1 != (pulldown.a[i].text).toLowerCase().indexOf(pattern))
                {
                    pulldown[matcheCount] = pulldown.a[i];
                    matcheCount++;
                }
            }
           
            if (pattern.length == 0)
            {
                pulldown.a = null;
            };
        }

