<!doctype html>
<html lang="zh-cn">
<head>
    <title>NewTool | 不错过任何一个新工具</title>
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
    <meta name="description" content="NewTool - 不错过任何一个新工具">
    <meta name="keywords" content="NewTool，新工具，创业，互联网工具，Startup">
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



<?php
header("Content-type: text/html;charset=utf-8");
$tool_name = $_POST['tool_name'];
$tool_url = $_POST['tool_url'];
$tool_introduction=$_POST['tool_introduction'];

$con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
mysql_select_db('qdm208731188_db');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db("my_db", $con);
mysql_query("set names utf8;");
mysql_query("INSERT INTO tool321_tool (tool_name, tool_url,tool_introduction) VALUES ('$tool_name','$tool_url','$tool_introduction')");
echo "感谢您提交工具 $tool_name";
mysql_close($con);
echo "<script>location.href='tool.php';</script>";
?>

