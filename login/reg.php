<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Goodtools-注册</title>
    <link rel="stylesheet" href="/css/nav.css">
</head>

<body>
    <?php
    include "../cn/nav.html";
    ?>
    <div>
        <br>
        <form method="POST" action="conduct.php">
            Email：
            <input type="email" name="user_email" placeholder="input your email" required="required" />
            Password：
            <input type="password" name="password" placeholder="password" required="required" />
            Confirm the Password:
            <input type="password" name="password_confirmed" placeholder="Confirm the password" required="required" />
            <!-- verify code： -->
            <!-- <input type="text" name="verify_code" placeholder="verify code" required="required" /> -->
            <input type="submit" value="注册" name="login" />
        </form>

        <ul>
            <li>？已注册,<a href="/login/login.html">登录</a></li>
            <li><a href="https://oapi.dingtalk.com/connect/qrconnect?appid=dingoanobgxi6mcrgq49mq&response_type=code&scope=snsapi_login&state=STATE&redirect_uri=http://tool321.com">使用钉钉扫码登录</a></li>
            <li><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=ww63b212f636803f4d&redirect_uri=http://tool321.com&response_type=code&scope=snsapi_base&agentid=AGENTID&state=STATE#wechat_redirect">使用企业微信扫码登录</a></li>

        </ul>
    </div>
    <?php
    include "../cn/footer.html";
    ?>
</body>

</html>