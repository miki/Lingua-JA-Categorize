use strict;
use warnings;
use blib;
use Lingua::JA::Categorize;
use YAML;

my $data        = YAML::Load( join '', <DATA> );
my $generator   = Lingua::JA::Categorize->new;
my $save_file   = "sample.bin";

$generator->generate($data);
$generator->save($save_file);

__DATA__
---
旅行・レジャー・生活 / 国内 / 中国・四国:
  keyword:
    - 旅行 中国 四国
  weight: 1
旅行・レジャー・生活 / 国内 / 九州・沖縄:
  keyword:
    - 旅行 九州 沖縄
  weight: 1
旅行・レジャー・生活 / 国内 / 北海道:
  keyword:
    - 旅行 北海道
  weight: 1
旅行・レジャー・生活 / 国内 / 国内:
  keyword:
    - 旅行 国内
  weight: 3
旅行・レジャー・生活 / 国内 / 国内旅行(全国):
  keyword:
    - 旅行 国内旅行(全国)
  weight: 1
旅行・レジャー・生活 / 国内 / 東北:
  keyword:
    - 旅行 東北
  weight: 1
旅行・レジャー・生活 / 国内 / 東海:
  keyword:
    - 旅行 東海
  weight: 1
旅行・レジャー・生活 / 国内 / 甲信越・北陸:
  keyword:
    - 旅行 甲信越 北陸
  weight: 1
旅行・レジャー・生活 / 国内 / 遊園地・テーマパーク(全国):
  keyword:
    - 遊園地 テーマパーク
  weight: 1
旅行・レジャー・生活 / 国内 / 関東:
  keyword:
    - 旅行 関東
  weight: 1
旅行・レジャー・生活 / 国内 / 関西:
  keyword:
    - 旅行 関西
  weight: 1
旅行・レジャー・生活 / 国内 / 食べ歩き(全国):
  keyword:
    - 旅行 食べ歩き
  weight: 1
旅行・レジャー・生活 / 海外 / アジア:
  keyword:
    - 旅行 アジア
  weight: 1
旅行・レジャー・生活 / 海外 / アフリカ:
  keyword:
    - 旅行 アフリカ
  weight: 1
旅行・レジャー・生活 / 海外 / オセアニア:
  keyword:
    - 旅行 オセアニア
  weight: 1
旅行・レジャー・生活 / 海外 / ヨーロッパ:
  keyword:
    - 旅行 ヨーロッパ
  weight: 1
旅行・レジャー・生活 / 海外 / 中南米・カリブ:
  keyword:
    - 旅行 中南米 カリブ
  weight: 1
旅行・レジャー・生活 / 海外 / 中東:
  keyword:
    - 旅行 中東
  weight: 1
旅行・レジャー・生活 / 海外 / 北アメリカ:
  keyword:
    - 旅行 北アメリカ
  weight: 1
旅行・レジャー・生活 / 海外 / 海外:
  keyword:
    - 旅行 海外
  weight: 3
旅行・レジャー・生活 / 海外 / 海外旅行(全般):
  keyword:
    - 海外旅行
  weight: 1
コンピューター / OS / BSD系OS:
  keyword:
    - BSD OS
  weight: 1
コンピューター / OS / Linux系OS:
  keyword:
    - Linux OS
  weight: 1
コンピューター / OS / OS:
  keyword:
    - OS コンピュータ
  weight: 3
コンピューター / OS / Solaris系OS:
  keyword:
    - Solaris OS
  weight: 1
コンピューター / OS / Windows系OS:
  keyword:
    - Windows OS
  weight: 1
コンピューター / データベース / MySQL:
  keyword:
    - データベース MySQL
  weight: 1
コンピューター / データベース / Oracle:
  keyword:
    - データベース Oracle
  weight: 1
コンピューター / データベース / PostgreSQL:
  keyword:
    - データベース PostgreSQL
  weight: 1
コンピューター / データベース / SQL Server:
  keyword:
    - データベース SQL Server
  weight: 1
コンピューター / データベース / データベース:
  keyword:
    - データベース
  weight: 3
コンピューター / プログラミング / CGI:
  keyword:
    - プログラミング CGI
  weight: 1
コンピューター / プログラミング / C＆C++:
  keyword:
    - プログラミング C＆C++
  weight: 1
コンピューター / プログラミング / Flash:
  keyword:
    - プログラミング Flash
  weight: 1
コンピューター / プログラミング / HTML:
  keyword:
    - プログラミング HTML
  weight: 1
コンピューター / プログラミング / Java:
  keyword:
    - プログラミング Java
  weight: 1
コンピューター / プログラミング / JavaScript:
  keyword:
    - プログラミング JavaScript
  weight: 1
コンピューター / プログラミング / Microsoft ASP:
  keyword:
    - プログラミング Microsoft ASP
  weight: 1
コンピューター / プログラミング / PHP:
  keyword:
    - プログラミング PHP
  weight: 1
コンピューター / プログラミング / Perl:
  keyword:
    - プログラミング Perl
  weight: 1
コンピューター / プログラミング / Visual Basic:
  keyword:
    - プログラミング Visual Basic
  weight: 1
コンピューター / プログラミング / Web Page Design:
  keyword:
    - プログラミング Web Page Design
  weight: 1
コンピューター / プログラミング / XML:
  keyword:
    - プログラミング XML
  weight: 1
コンピューター / プログラミング / プログラミング:
  keyword:
    - プログラミング
  weight: 3
コンピューター / 業務ソフトウェア / CAD・DTP:
  keyword:
    - CAD DTP
  weight: 1
コンピューター / 業務ソフトウェア / オープンソース:
  keyword:
    - オープンソース
  weight: 1
コンピューター / 業務ソフトウェア / グラフィックソフト:
  keyword:
    - グラフィックソフト
  weight: 1
コンピューター / 業務ソフトウェア / グループウェア:
  keyword:
    - グループウェア
  weight: 1
コンピューター / 業務ソフトウェア / 会計ソフト:
  keyword:
    - 会計ソフト
  weight: 1
コンピューター / 業務ソフトウェア / 業務ソフトウェア:
  keyword:
    - 業務ソフトウェア
  weight: 3
エンターテインメント / TV / CM:
  keyword:
    - テレビ CM
  weight: 1
エンターテインメント / TV / CS・BS:
  keyword:
    - テレビ CS BS
  weight: 1
エンターテインメント / TV / TV:
  keyword:
    - TV テレビ
  weight: 3
エンターテインメント / TV / ドラマ:
  keyword:
    - テレビ ドラマ
  weight: 1
エンターテインメント / TV / 懐かしの芸能人・TV:
  keyword:
    - 懐かしの芸能人 TV
  weight: 1
エンターテインメント / TV / 欧米芸能人・タレント:
  keyword:
    - 欧米 芸能人 タレント
  weight: 1
エンターテインメント / TV / 番組:
  keyword:
    - テレビ 番組
  weight: 1
エンターテインメント / TV / 芸能人・タレント:
  keyword:
    - 芸能人 タレント
  weight: 1
エンターテインメント / TV / 華流芸能人・タレント:
  keyword:
    - 華流 芸能人 タレント
  weight: 1
エンターテインメント / TV / 韓流芸能人・タレント:
  keyword:
    - 韓流 芸能人 タレント
  weight: 1
エンターテインメント / ギャンブル / ギャンブル:
  keyword:
    - ギャンブル
  weight: 3
エンターテインメント / ギャンブル / パチンコ・スロット:
  keyword:
    - パチンコ スロット
  weight: 1
エンターテインメント / ギャンブル / 競馬:
  keyword:
    - 競馬
  weight: 1
エンターテインメント / スポーツ / ウィンタースポーツ:
  keyword:
    - ウィンタースポーツ
  weight: 1
エンターテインメント / スポーツ / ゴルフ:
  keyword:
    - ゴルフ
  weight: 1
エンターテインメント / スポーツ / サッカー:
  keyword:
    - サッカー
  weight: 1
エンターテインメント / スポーツ / スポーツ:
  keyword:
    - スポーツ
  weight: 3
エンターテインメント / スポーツ / ソフトボール:
  keyword:
    - ソフトボール
  weight: 1
エンターテインメント / スポーツ / テニス:
  keyword:
    - テニス
  weight: 1
エンターテインメント / スポーツ / バスケットボール＆バレーボール:
  keyword:
    - バスケットボール バレーボール
  weight: 1
エンターテインメント / スポーツ / バドミントン:
  keyword:
    - バドミントン
  weight: 1
エンターテインメント / スポーツ / マリンスポーツ:
  keyword:
    - マリンスポーツ
  weight: 1
エンターテインメント / スポーツ / モータースポーツ:
  keyword:
    - モータースポーツ
  weight: 1
エンターテインメント / スポーツ / 体操・新体操:
  keyword:
    - 体操 新体操
  weight: 1
エンターテインメント / スポーツ / 北京五輪:
  keyword:
    - オリンピック 五輪
  weight: 1
エンターテインメント / スポーツ / 卓球:
  keyword:
    - 卓球
  weight: 1
エンターテインメント / スポーツ / 格闘技:
  keyword:
    - 格闘技
  weight: 1
エンターテインメント / スポーツ / 水泳:
  keyword:
    - 水泳
  weight: 1
エンターテインメント / スポーツ / 野球:
  keyword:
    - 野球
  weight: 1
エンターテインメント / スポーツ / 陸上:
  keyword:
    - 陸上
  weight: 1
エンターテインメント / 卓上ゲーム / 卓上ゲーム:
  keyword:
    - 卓上ゲーム
  weight: 3
エンターテインメント / 卓上ゲーム / 囲碁・将棋:
  keyword:
    - 囲碁 将棋
  weight: 1
エンターテインメント / 卓上ゲーム / 麻雀:
  keyword:
    - 麻雀
  weight: 1
エンターテインメント / 映画 / アジア映画:
  keyword:
    - アジア映画
  weight: 1
エンターテインメント / 映画 / 俳優・女優:
  keyword:
    - 俳優 女優
  weight: 1
エンターテインメント / 映画 / 映画:
  keyword:
    - 映画
  weight: 3
エンターテインメント / 映画 / 洋画:
  keyword:
    - 洋画
  weight: 1
エンターテインメント / 映画 / 邦画:
  keyword:
    - 邦画
  weight: 1
エンターテインメント / 音楽・ダンス / インディーズ:
  keyword:
    - 音楽 インディーズ
  weight: 1
エンターテインメント / 音楽・ダンス / カラオケ:
  keyword:
    - カラオケ
  weight: 1
エンターテインメント / 音楽・ダンス / クラシック:
  keyword:
    - 音楽 クラシック
  weight: 1
エンターテインメント / 音楽・ダンス / ダンス:
  keyword:
    - ダンス
  weight: 1
エンターテインメント / 音楽・ダンス / ナツメロ:
  keyword:
    - ナツメロ
  weight: 1
エンターテインメント / 音楽・ダンス / 国内アーティスト:
  keyword:
    - 国内アーティスト
  weight: 1
エンターテインメント / 音楽・ダンス / 楽器・演奏:
  keyword:
    - 楽器 演奏
  weight: 1
エンターテインメント / 音楽・ダンス / 海外アーティスト:
  keyword:
    - 海外アーティスト
  weight: 1
エンターテインメント / 音楽・ダンス / 現代音楽:
  keyword:
    - 現代音楽
  weight: 1
エンターテインメント / 音楽・ダンス / 音楽・ダンス:
  keyword:
    - 音楽 ダンス
  weight: 3
エンターテインメント / 音楽・ダンス / 音楽配信:
  keyword:
    - 音楽配信
  weight: 1
デジタルライフ / PC周辺機器 / PC周辺機器:
  keyword:
    - PC周辺機器
  weight: 3
デジタルライフ / PC周辺機器 / サウンドカード:
  keyword:
    - サウンドカード
  weight: 1
デジタルライフ / PC周辺機器 / ディスプレイ:
  keyword:
    - ディスプレイ
  weight: 1
デジタルライフ / PC周辺機器 / ネットワーク機器:
  keyword:
    - ネットワーク機器
  weight: 1
デジタルライフ / PC周辺機器 / ビデオカード:
  keyword:
    - ビデオカード
  weight: 1
デジタルライフ / PC周辺機器 / プリンター＆スキャナー:
  keyword:
    - プリンター スキャナー
  weight: 1
デジタルライフ / PC周辺機器 / ワイヤレス・無線LAN:
  keyword:
    - ワイヤレス 無線LAN
  weight: 1
デジタルライフ / Windows / Windows:
  keyword:
    - Windows
  weight: 3
デジタルライフ / Windows / Windows 95/98:
  keyword:
    - Windows 95/98
  weight: 1
デジタルライフ / Windows / Windows Me:
  keyword:
    - Windows Me
  weight: 1
デジタルライフ / Windows / Windows NT/2000:
  keyword:
    - Windows NT/2000
  weight: 1
デジタルライフ / Windows / Windows Vista:
  keyword:
    - Windows Vista
  weight: 1
デジタルライフ / Windows / Windows XP:
  keyword:
    - Windows XP
  weight: 1
デジタルライフ / インターネット接続 / ADSL:
  keyword:
    - ADSL
  weight: 1
デジタルライフ / インターネット接続 / FTTH(光ファイバー):
  keyword:
    - FTTH(光ファイバー)
  weight: 1
デジタルライフ / インターネット接続 / ISDN:
  keyword:
    - ISDN
  weight: 1
デジタルライフ / インターネット接続 / ISP(プロバイダ):
  keyword:
    - ISP(プロバイダ)
  weight: 1
デジタルライフ / インターネット接続 / インターネット接続:
  keyword:
    - インターネット接続
  weight: 3
デジタルライフ / インターネット接続 / ホームページスペース・ASP:
  keyword:
    - ホームページスペース ASP
  weight: 1
デジタルライフ / ゲーム / オンラインゲーム:
  keyword:
    - オンラインゲーム
  weight: 1
デジタルライフ / ゲーム / ゲーム:
  keyword:
    - ゲーム
  weight: 3
デジタルライフ / ゲーム / ゲームソフト:
  keyword:
    - ゲームソフト
  weight: 1
デジタルライフ / ゲーム / ゲーム機:
  keyword:
    - ゲーム機
  weight: 1
デジタルライフ / ソフトウェア / Office系ソフト:
  keyword:
    - Office ソフト
  weight: 1
デジタルライフ / ソフトウェア / はがきソフト:
  keyword:
    - はがきソフト
  weight: 1
デジタルライフ / ソフトウェア / ソフトウェア:
  keyword:
    - ソフトウェア
  weight: 3
デジタルライフ / ソフトウェア / フリーウェア:
  keyword:
    - フリーウェア
  weight: 1
デジタルライフ / ソフトウェア / ブラウザ:
  keyword:
    - ブラウザ
  weight: 1
デジタルライフ / ソフトウェア / ホームページ作成ソフト:
  keyword:
    - ホームページ作成ソフト
  weight: 1
デジタルライフ / ネットショッピング / オークション:
  keyword:
    - オークション
  weight: 1
デジタルライフ / ネットショッピング / ネットショッピング:
  keyword:
    - ネットショッピング
  weight: 3
デジタルライフ / ネットショッピング / ネット通販:
  keyword:
    - ネット通販
  weight: 1
デジタルライフ / ハードウェア / デスクトップPC:
  keyword:
    - デスクトップPC
  weight: 1
デジタルライフ / ハードウェア / ノートPC:
  keyword:
    - ノートPC
  weight: 1
デジタルライフ / ハードウェア / ハードウェア:
  keyword:
    - ハードウェア
  weight: 3
デジタルライフ / ハードウェア / モバイル端末:
  keyword:
    - モバイル端末
  weight: 1
デジタルライフ / マルチメディア / デジタルカメラ:
  keyword:
    - デジタルカメラ
  weight: 1
デジタルライフ / マルチメディア / デジタルビデオカメラ:
  keyword:
    - デジタルビデオカメラ
  weight: 1
デジタルライフ / マルチメディア / マルチメディア:
  keyword:
    - マルチメディア
  weight: 3
デジタルライフ / マルチメディア / メディア(記憶媒体):
  keyword:
    - メディア(記憶媒体)
  weight: 1
デジタルライフ / 携帯・PHS / DoCoMo:
  keyword:
    - DoCoMo
  weight: 1
デジタルライフ / 携帯・PHS / SoftBank:
  keyword:
    - SoftBank
  weight: 1
デジタルライフ / 携帯・PHS / WILLCOM:
  keyword:
    - WILLCOM
  weight: 1
デジタルライフ / 携帯・PHS / au:
  keyword:
    - au
  weight: 1
デジタルライフ / 携帯・PHS / イーモバイル:
  keyword:
    - イーモバイル
  weight: 1
デジタルライフ / 携帯・PHS / スマートフォン:
  keyword:
    - スマートフォン
  weight: 1
デジタルライフ / 携帯・PHS / モバイルゲーム:
  keyword:
    - モバイルゲーム
  weight: 1
デジタルライフ / 携帯・PHS / 携帯・PHS:
  keyword:
    - 携帯 PHS
  weight: 3
デジタルライフ / 携帯・PHS / 着メロ・画像:
  keyword:
    - 着メロ 画像
  weight: 1
デジタルライフ / 通信 / FAX:
  keyword:
    - FAX
  weight: 1
デジタルライフ / 通信 / IP電話:
  keyword:
    - IP電話
  weight: 1
デジタルライフ / 通信 / 固定電話:
  keyword:
    - 固定電話
  weight: 1
デジタルライフ / 通信 / 通信:
  keyword:
    - 通信
  weight: 3
ビジネス＆キャリア / 就職・転職 / アルバイト・パート:
  keyword:
    - アルバイト パート
  weight: 1
ビジネス＆キャリア / 就職・転職 / 就職:
  keyword:
    - 就職
  weight: 1
ビジネス＆キャリア / 就職・転職 / 就職・転職:
  keyword:
    - 就職 転職
  weight: 3
ビジネス＆キャリア / 就職・転職 / 履歴書:
  keyword:
    - 履歴書
  weight: 1
ビジネス＆キャリア / 就職・転職 / 派遣:
  keyword:
    - 派遣
  weight: 1
ビジネス＆キャリア / 就職・転職 / 転職:
  keyword:
    - 転職
  weight: 1
ビジネス＆キャリア / 資格 / Microsoft認定技術者:
  keyword:
    - Microsoft認定技術者
  weight: 1
ビジネス＆キャリア / 資格 / TOEFL・TOEIC・英語検定:
  keyword:
    - TOEFL TOEIC 英語検定
  weight: 1
ビジネス＆キャリア / 資格 / フィナンシャルプランナー:
  keyword:
    - フィナンシャルプランナー
  weight: 1
ビジネス＆キャリア / 資格 / 公認会計士:
  keyword:
    - 公認会計士
  weight: 1
ビジネス＆キャリア / 資格 / 建築士:
  keyword:
    - 建築士
  weight: 1
ビジネス＆キャリア / 資格 / 情報処理技術者:
  keyword:
    - 情報処理技術者
  weight: 1
ビジネス＆キャリア / 資格 / 旅行業務取扱管理者:
  keyword:
    - 旅行業務取扱管理者
  weight: 1
ビジネス＆キャリア / 資格 / 栄養士:
  keyword:
    - 栄養士
  weight: 1
ビジネス＆キャリア / 資格 / 看護師:
  keyword:
    - 看護師
  weight: 1
ビジネス＆キャリア / 資格 / 簿記:
  keyword:
    - 簿記
  weight: 1
ビジネス＆キャリア / 資格 / 行政書士・司法書士:
  keyword:
    - 行政書士 司法書士
  weight: 1
ビジネス＆キャリア / 資格 / 販売士:
  keyword:
    - 販売士
  weight: 1
ビジネス＆キャリア / 資格 / 資格:
  keyword:
    - 資格
  weight: 3
マネー / 保険 / 保険:
  keyword:
    - 保険
  weight: 3
マネー / 保険 / 健康保険:
  keyword:
    - 健康保険
  weight: 1
マネー / 保険 / 損害保険:
  keyword:
    - 損害保険
  weight: 1
マネー / 保険 / 生命保険:
  keyword:
    - 生命保険
  weight: 1
マネー / 保険 / 雇用保険:
  keyword:
    - 雇用保険
  weight: 1
マネー / 投資・融資 / ヨーロッパ株:
  keyword:
    - 投資 ヨーロッパ株
  weight: 1
マネー / 投資・融資 / 中国株:
  keyword:
    - 投資 中国株
  weight: 1
マネー / 投資・融資 / 債券:
  keyword:
    - 投資 債券
  weight: 1
マネー / 投資・融資 / 先物:
  keyword:
    - 投資 先物
  weight: 1
マネー / 投資・融資 / 北米株:
  keyword:
    - 投資 北米株
  weight: 1
マネー / 投資・融資 / 国内株:
  keyword:
    - 投資 国内株
  weight: 1
マネー / 投資・融資 / 投資・融資:
  keyword:
    - 投資 融資
  weight: 3
マネー / 投資・融資 / 投資信託:
  keyword:
    - 投資信託
  weight: 1
マネー / 投資・融資 / 新興国株:
  keyword:
    - 投資 新興国株
  weight: 1
マネー / 投資・融資 / 株式全般:
  keyword:
    - 投資 株式
  weight: 1
マネー / 投資・融資 / 為替:
  keyword:
    - 投資 為替
  weight: 1
マネー / 投資・融資 / 融資:
  keyword:
    - 融資
  weight: 1
マネー / 暮らしのマネー / ネットバンキング:
  keyword:
    - ネットバンキング
  weight: 1
マネー / 暮らしのマネー / 年金:
  keyword:
    - 年金
  weight: 1
マネー / 暮らしのマネー / 暮らしのマネー:
  keyword:
    - 暮らしのマネー
  weight: 3
マネー / 暮らしのマネー / 消費者金融:
  keyword:
    - 消費者金融
  weight: 1
マネー / 暮らしのマネー / 税金:
  keyword:
    - 税金
  weight: 1
マネー / 暮らしのマネー / 貯蓄:
  keyword:
    - 貯蓄
  weight: 1
ライフ / ペット / ペット:
  keyword:
    - ペット
  weight: 3
ライフ / ペット / 犬・猫:
  keyword:
    - 犬 猫
  weight: 1
ライフ / 住まい / DIY(日曜大工):
  keyword:
    - 日曜大工
  weight: 1
ライフ / 住まい / インテリア・エクステリア:
  keyword:
    - インテリア エクステリア
  weight: 1
ライフ / 住まい / ガーデニング:
  keyword:
    - ガーデニング
  weight: 1
ライフ / 住まい / 不動産・引っ越し:
  keyword:
    - 不動産 引っ越し
  weight: 1
ライフ / 住まい / 住まい:
  keyword:
    - 住まい
  weight: 3
ライフ / 住まい / 建築・リフォーム:
  keyword:
    - 建築 リフォーム
  weight: 1
ライフ / 出産・育児 / 出産・育児:
  keyword:
    - 出産 育児
  weight: 3
ライフ / 出産・育児 / 妊娠・出産:
  keyword:
    - 妊娠 出産
  weight: 1
ライフ / 出産・育児 / 育児:
  keyword:
    - 育児
  weight: 1
ライフ / 恋愛・人生相談 / いじめ相談:
  keyword:
    - いじめ相談
  weight: 1
ライフ / 恋愛・人生相談 / シニアライフ:
  keyword:
    - シニアライフ
  weight: 1
ライフ / 恋愛・人生相談 / 夫婦・家族:
  keyword:
    - 夫婦 家族
  weight: 1
ライフ / 恋愛・人生相談 / 恋愛・人生相談:
  keyword:
    - 恋愛 人生相談
  weight: 3
ライフ / 恋愛・人生相談 / 恋愛相談:
  keyword:
    - 恋愛相談
  weight: 1
ライフ / 恋愛・人生相談 / 社会・職場:
  keyword:
    - 社会 職場
  weight: 1
ライフ / 料理・グルメ / お茶・ドリンク:
  keyword:
    - お茶 ドリンク
  weight: 1
ライフ / 料理・グルメ / お酒:
  keyword:
    - お酒
  weight: 1
ライフ / 料理・グルメ / スイーツ:
  keyword:
    - スイーツ
  weight: 1
ライフ / 料理・グルメ / 地方特産・名産:
  keyword:
    - 地方特産 名産
  weight: 1
ライフ / 料理・グルメ / 料理レシピ:
  keyword:
    - 料理レシピ
  weight: 1
ライフ / 料理・グルメ / 料理・グルメ:
  keyword:
    - 料理 グルメ
  weight: 3
ライフ / 料理・グルメ / 素材・食材:
  keyword:
    - 素材 食材
  weight: 1
ライフ / 料理・グルメ / 食器・キッチン用品:
  keyword:
    - 食器 キッチン用品
  weight: 1
ライフ / 生活お役立ち / コンビニ・ファーストフード:
  keyword:
    - コンビニ ファーストフード
  weight: 1
ライフ / 生活お役立ち / マナー・冠婚葬祭:
  keyword:
    - マナー 冠婚葬祭
  weight: 1
ライフ / 生活お役立ち / リサイクル:
  keyword:
    - リサイクル
  weight: 1
ライフ / 生活お役立ち / 季節の行事:
  keyword:
    - 季節の行事
  weight: 1
ライフ / 生活お役立ち / 家事・生活:
  keyword:
    - 家事 生活
  weight: 1
ライフ / 生活お役立ち / 正月・年末年始:
  keyword:
    - 正月 年末年始
  weight: 1
ライフ / 生活お役立ち / 生活お役立ち:
  keyword:
    - 生活お役立ち
  weight: 3
ライフ / 生活お役立ち / 防犯・セキュリティ:
  keyword:
    - 防犯 セキュリティ
  weight: 1
ライフ / 結婚 / ハネムーン・新生活:
  keyword:
    - ハネムーン 新生活
  weight: 1
ライフ / 結婚 / 挙式・披露宴:
  keyword:
    - 挙式 披露宴
  weight: 1
ライフ / 結婚 / 段取り・結婚準備:
  keyword:
    - 段取り 結婚準備
  weight: 1
ライフ / 結婚 / 結婚:
  keyword:
    - 結婚
  weight: 3
学問＆教育 / 学校 / イベント:
  keyword:
    - 学校 イベント
  weight: 1
学問＆教育 / 学校 / 中学校:
  keyword:
    - 中学校
  weight: 1
学問＆教育 / 学校 / 大学・大学院・短大:
  keyword:
    - 大学 大学院 短大
  weight: 1
学問＆教育 / 学校 / 学校:
  keyword:
    - 学校
  weight: 3
学問＆教育 / 学校 / 専門学校:
  keyword:
    - 専門学校
  weight: 1
学問＆教育 / 学校 / 小学校:
  keyword:
    - 小学校
  weight: 1
学問＆教育 / 学校 / 幼稚園・保育所:
  keyword:
    - 幼稚園 保育所
  weight: 1
学問＆教育 / 学校 / 施設:
  keyword:
    - 施設
  weight: 1
学問＆教育 / 学校 / 高校:
  keyword:
    - 高校
  weight: 1
社会 / エネルギー / エコロジー:
  keyword:
    - エコロジー
  weight: 1
社会 / エネルギー / エネルギー:
  keyword:
    - エネルギー
  weight: 3
社会 / エネルギー / 電力発電:
  keyword:
    - 電力発電
  weight: 1
社会 / カルチャー / カルチャー:
  keyword:
    - カルチャー
  weight: 3
社会 / カルチャー / 伝統文化・行事:
  keyword:
    - 伝統文化 行事
  weight: 1
社会 / カルチャー / 流行・カルチャー:
  keyword:
    - 流行 カルチャー
  weight: 1
社会 / 社会問題 / ニュース・時事問題:
  keyword:
    - ニュース 時事問題
  weight: 1
社会 / 社会問題 / メディア・マスコミ:
  keyword:
    - メディア マスコミ
  weight: 1
社会 / 社会問題 / 教育問題:
  keyword:
    - 教育問題
  weight: 1
社会 / 社会問題 / 社会問題:
  keyword:
    - 社会問題
  weight: 3
社会 / 社会問題 / 自然環境問題:
  keyword:
    - 自然環境問題
  weight: 1
社会 / 社会問題 / 防災 ・災害:
  keyword:
    - 防災 災害
  weight: 1
社会 / 福祉 / 介護:
  keyword:
    - 福祉 介護
  weight: 1
社会 / 福祉 / 施設:
  keyword:
    - 福祉 施設
  weight: 1
社会 / 福祉 / 福祉:
  keyword:
    - 福祉
  weight: 3
美容＆健康 / ヘアケア / 【プロが回答】教えて！ヘアケア:
  keyword:
    - 【プロが回答】教えて！ヘアケア
  weight: 1
美容＆健康 / 健康 / ヘルスケア(健康管理):
  keyword:
    - ヘルスケア
  weight: 1
美容＆健康 / 健康 / メンタルヘルス:
  keyword:
    - メンタルヘルス
  weight: 1
美容＆健康 / 健康 / 健康:
  keyword:
    - 健康
  weight: 3
美容＆健康 / 健康 / 性の悩み:
  keyword:
    - 性の悩み
  weight: 1
美容＆健康 / 健康 / 栄養:
  keyword:
    - 栄養
  weight: 1
美容＆健康 / 健康 / 病気:
  keyword:
    - 病気
  weight: 1
美容＆健康 / 健康 / 禁煙・禁酒:
  keyword:
    - 禁煙 禁酒
  weight: 1
趣味 / AV機器 / AV機器:
  keyword:
    - AV機器
  weight: 3
趣味 / AV機器 / DVDプレーヤー:
  keyword:
    - DVDプレーヤー
  weight: 1
趣味 / AV機器 / TV＆ビデオデッキ:
  keyword:
    - TV ビデオデッキ
  weight: 1
趣味 / AV機器 / オーディオ:
  keyword:
    - オーディオ
  weight: 1
趣味 / AV機器 / カメラ全般:
  keyword:
    - カメラ
  weight: 1
趣味 / AV機器 / ポータブル製品:
  keyword:
    - ポータブル製品
  weight: 1
趣味 / アウトドア / BBQ・アウトドア料理:
  keyword:
    - BBQ アウトドア料理
  weight: 1
趣味 / アウトドア / アウトドア:
  keyword:
    - アウトドア
  weight: 3
趣味 / アウトドア / フィッシング:
  keyword:
    - フィッシング
  weight: 1
趣味 / アウトドア / 登山・キャンプ:
  keyword:
    - 登山 キャンプ
  weight: 1
趣味 / アウトドア / 鉄道＆路線:
  keyword:
    - 鉄道 路線
  weight: 1
趣味 / 芸術・アート / 手芸・ホビークラフト:
  keyword:
    - 手芸 ホビークラフト
  weight: 1
趣味 / 芸術・アート / 書道:
  keyword:
    - 書道
  weight: 1
趣味 / 芸術・アート / 絵画・写真・オブジェ:
  keyword:
    - 絵画 写真 オブジェ
  weight: 1
趣味 / 芸術・アート / 芸術・アート:
  keyword:
    - 芸術 アート
  weight: 3
趣味 / 芸術・アート / 茶道・華道:
  keyword:
    - 茶道 華道
  weight: 1
趣味 / 読書 / コミック:
  keyword:
    - コミック
  weight: 1
趣味 / 読書 / 書籍・文庫:
  keyword:
    - 書籍 文庫
  weight: 1
趣味 / 読書 / 画集・写真集:
  keyword:
    - 画集 写真集
  weight: 1
趣味 / 読書 / 絵本・子供の本:
  keyword:
    - 絵本 子供の本
  weight: 1
趣味 / 読書 / 読書:
  keyword:
    - 読書
  weight: 3
趣味 / 読書 / 雑誌:
  keyword:
    - 雑誌
  weight: 1
趣味 / 車 / バイク:
  keyword:
    - バイク
  weight: 1
趣味 / 車 / 中古車売買:
  keyword:
    - 中古車売買
  weight: 1
趣味 / 車 / 国産車:
  keyword:
    - 国産車
  weight: 1
趣味 / 車 / 自転車:
  keyword:
    - 自転車
  weight: 1
趣味 / 車 / 車:
  keyword:
    - 車
  weight: 3
趣味 / 車 / 輸入車:
  keyword:
    - 輸入車
  weight: 1
