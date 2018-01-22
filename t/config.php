<!doctype html>
<html lang="zh-cn">
<head>
    <title>NewTool| Query | Configuration</title>
    <link rel="stylesheet" media="all"
          href="//rs-assets.b0.upaiyun.com/assets/application-42c32762eecd4d5bbe1bf9fbe93ec812.css"
          data-turbolinks-track="true">
    <!-- meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" href="/favicon.ico">
    <!-- info -->
    <meta name="author" content="Tool321">
    <meta name="description" content="NewTool">
    <meta name="keywords" content="NewTool">
    <link rel="author" href="/humans.txt">

    <!--iOS -->
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-title" content="Title">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">

    <!-- iOS Icons -->
    <link rel="apple-touch-icon-precomposed"
          href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-57x57-precomposed-1da8545c70471b56426fa2cc67f530fb.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-72x72-precomposed-49a257378535625c2714f61feb063a67.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-114x114-precomposed-7990816b04e8690b7b7b004bcbd822a2.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-144x144-precomposed-2571dd51f7ccb3a6a533e9aa812f29d2.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180"
          href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-180x180-precomposed-8170abf429725528622d216ae0843bdd.png">

    <!-- Prefetch -->
    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link rel="dns-prefetch" href="//google-analytics.com">
    <link rel="dns-prefetch" href="//www.google-analytics.com">
    <link rel="dns-prefetch" href="//platform.twitter.com">

    <meta property='og:type' content='webpage'/>

</head>

<body class="">
<!--[if lt IE 9]>
  <div class="for-ie-suckers">
    <div class="row">
      <b>36<del>0</del>氪安全卫士提醒您：</b>您的 IE 浏览器不被支持。试试其他的：<a href="http://www.google.com/chrome">Google 浏览器</a>、<a href="http://firefox.com.cn/">火狐浏览器</a>、<a href="http://www.apple.com.cn/safari/">Safari</a>
    </div>
  </div>
<![endif]-->

<div class="container" id='container'>
    <header class="topbar top_v2">
        <h1 class="brand">
            <a id="logo" class="logo" href="/">
                NewTool
            </a> <span class="slogan">不错过任何一个新工具</span>
        </h1>

        <div class="header_inner cf">
            <nav class="navigation text-center">
                <ul>
                    <li class="notification-menu" id="notification_center">
                        <a data-remote="true" data-type="html" class="main-nav normal-nav trigger"
                           href="/notifications">
                            <i class="icon_alert"></i>
                        </a> <i class="unread hide"></i>
                        <div class="dropdown notification-dropdown">
                            <ul class="cf">
                                <li>加载中...</li>
                            </ul>
                            <footer class="notification-footer cf">
                                <a class="left clear-all" data-method="put" data-remote="true"
                                   href="/notifications/clear">清空</a>
                                <a class="right" href="/notifications">查看全部</a>
                            </footer>
                        </div>
                    </li>

                    <li class="account login-menu">
                        <a class="account-menu main-nav" href="javascript:">
                            <img class="avatar"
                                 src="//rs-assets.b0.upaiyun.com/assets/fallback/user-86922c18c005db5e716b45e6ffd9169b.png"
                                 alt="User" width="30" height="30"/>
                            <i class="down_arrow"></i>
                        </a>
                        <ul class="dropdown account-dropdown">
                            <li><a href="/users/198358">我的主页</a></li>
                            <li><a href="/users/198358/edit?ok_url=%2Fposts">个人设置</a></li>
                            <li><a rel="nofollow" data-method="delete" href="/users/sign_out?ok_url=%2Fposts">退出登录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="search">
                <form action="/posts/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden"
                                                                                        value="&#x2713;"/>
                    <span class="icon">🔎</span>
                    <input type="text" name="query" id="query" autocomplete="off" autocapitalize="off"
                           spellcheck="false"/>
                </form>
            </div>
        </div>
    </header>


    <div class="header_nav">
        <div class="header_inner">
            <div class="left">

                <ul class='nav' data-toggle='fetch' data-target="#content">
                    <li class="active">
                        <a href="/posts">工具</a>
                    </li>
                    <li>
                        <a href="/users/feeds">发现</a>
                    </li>
                    <li>
                        <a href="/posts/collections">工具集</a>
                    </li>
                </ul>
            </div>
            <div class="right">
                <ul class="nav">
                    <li>
                        <a class="next-app" target="_blank"
                           href="http://a.app.qq.com/o/simple.jsp?pkgname=com.android36kr.next.app&amp;g_f=991653">
                            <i class="icon_iphone"></i>
                            <div class="app-tooltip">
                                <img class="qrcode"
                                     src="//rs-assets.b0.upaiyun.com/assets/apps-qrcode-d674c192c030184d645fe2615c9add01.jpg"
                                     alt="Apps qrcode" width="120" height="120"/>
                                <p class="app-download-text">扫码下载 App</p>
                            </div>
                        </a></li>
                    <li>
                        <a class="create_btn popup new-product" href="add.php">
                            <i class="icon_plus"></i> 分享新工具
                        </a>
					</li>
                </ul>
            </div>
        </div>
    </div>
<?php
header("Content-type: text/html;charset=utf-8");

$con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
mysql_select_db('qdm208731188_db');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db("my_db", $con);
mysql_query("set names utf8;");


$result = mysql_query("SELECT * FROM tool321_tool");



while($row = mysql_fetch_array($result))
  {
  echo "<ul class='product-list reorderable'>";
  echo "<li class='item product-item '><a href=" . $row['tool_url'] . ">" . $row['tool_name'] . "</a></li>";
  echo "<span class='post-tagline'>" . $row['tool_introduction'] . "</span>";

  echo "</ul>";
  }



mysql_close($con);

?>
</div>
</body>
