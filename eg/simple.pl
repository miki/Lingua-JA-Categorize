use strict;
use Lingua::JA::Categorize;
use Lingua::JA::TFIDF;
use Time::HiRes qw(gettimeofday tv_interval);
use Data::Dumper;

my $calc = Lingua::JA::TFIDF->new;

my $categorizer = Lingua::JA::Categorize->new;
$categorizer->load("sample.bin");

my $text =
'石破氏が総裁選に意欲 「特別国会前に実施を」2009年8月31日（月）12:34　石破茂農相                                                                                                                                                                                       は３１日、次期自民党総裁選について「火中のクリは拾いたくないぞ、と言うつもりはな                                                                                                                                                                                       い」と述べ、出馬に意欲を示した。石破氏は「支援者の気持ちを聞いて徹底的に議論する                                                                                                                                                                                       。竹下亘衆院議員ら、思いを一つにしてきた人たちがどう考えているか聞いた上で判断し                                                                                                                                                                                       たい」と述べた。特別国会の前に総裁選を実施すべきかについては「すべきだと思う。そ                                                                                                                                                                                       れが公党としての国民に対する責任の果たし方だ」と指摘した。2009衆議院選挙特集
石破氏が総裁選に意欲 「特別国会前に実施を」2009年8月31日（月）12:34　石破茂農相                                                                                                                                                                                       は３１日、次期自民党総裁選について「火中のクリは拾いたくないぞ、と言うつもりはな                                                                                                                                                                                       い」と述べ、出馬に意欲を示した。石破氏は「支援者の気持ちを聞いて徹底的に議論する                                                                                                                                                                                       。竹下亘衆院議員ら、思いを一つにしてきた人たちがどう考えているか聞いた上で判断し                                                                                                                                                                                       たい」と述べた。特別国会の前に総裁選を実施すべきかについては「すべきだと思う。そ                                                                                                                                                                                       れが公党としての国民に対する責任の果たし方だ」と指摘した。2009衆議院選挙特集
';

#my $list = $calc->tfidf($text)->list;
#my $word_set;
#for (@$list) {
#    my ( $word, $score ) = each(%$_);
#    $word_set->{$word} = $score;
#}

#my $word_set = $categorizer->tokenizer->tokenize( \$text );

#    my $score = $categorizer->categorizer->categorize($word_set);
#    print Dumper $score;
{
    my $t0     = [gettimeofday];
    my $result = $categorizer->categorize($text);
    print tv_interval ( $t0, [gettimeofday] ), "\n";
}
{
    my $t0     = [gettimeofday];
    my $result = $categorizer->categorize($text);
    print tv_interval ( $t0, [gettimeofday] ), "\n";
}
{
    my $t0     = [gettimeofday];
    my $result = $categorizer->categorize($text);
    print tv_interval ( $t0, [gettimeofday] ), "\n";
}

#print Dumper $result->word_set;
#print "-" x 20, "\n";
#print Dumper $result->score(10);
#print "-" x 20, "\n";

