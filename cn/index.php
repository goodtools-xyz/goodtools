<!doctype html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="职业导航，工具导航，行业导航，生产力,效率,工具,自媒体导航,导航,正版，云端，在线，微信，小程序，企业应用商店，different,productivity,efficiency,tool,navigation,SAAS,online,cloud,自媒体">
    <meta name="author" content="马背岭，Horseback">
    <meta name="description" content="由从事质量十年的一个专业职业人创建，主要是为了解决自己频繁试用各种最新工具而建，目的在于减少自己的搜索量，直达工具在线使用页面或者下载页面。收集了目前各个领域里的最好工具，方便自己的同时，方便所有互联网的使用者">
    <base target="_blank">
    <!--用户可方便地通过 Windows 启动磁贴来查找和固定您的网页-->
    <meta name="msapplication-square150x150logo" content="square.png" />
    <title>goodtools_不可错过任何一个工具</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/styel_css.css">
    <link rel="shortcut icon" href="/img/T.png">


    <script src="/js/baidutongji.js" type="text/javascript"></script>

    
</head>

<body>
    <?php     include "nav.php" ?>
 <br>

 <div>
            <p>功能正在开发中，欢迎收藏网址关注。--Goodtools，专注效率和生产力工具</p>
            <form method="POST" action="/login/login.php"> Email：
                <input type="email" name="user_email" value="<?php echo $_COOKIE['user_email']?>" placeholder="input your email" required="required"  /> Password：
                <input type="password" name="password" placeholder="password" required="required" value="<?php  echo $_COOKIE['user_password'] ?>" />
                <input type="submit" value="login" name="login" /> <a href="/login/help.html">Forget the password?</a> </form>

            <ul>
                <li><a href="/login/reg.php">注册</a></li>
                <li><a href="https://oapi.dingtalk.com/connect/qrconnect?appid=dingoanobgxi6mcrgq49mq&response_type=code&scope=snsapi_login&state=STATE&redirect_uri=http://tool321.com">使用钉钉扫码登录</a></li>
                <li><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww63b212f636803f4d&redirect_uri=http://tool321.com&response_type=code&scope=snsapi_base&agentid=AGENTID&state=STATE#wechat_redirect">使用企业微信扫码登录</a></li>

            </ul>
        </div>
 
         <?php     include "footer.php" ?>   
 <?php include_once("baidu_js_push.php") ?>

                             
                                   
</body>

</html>