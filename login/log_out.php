<?php
//功能：用户登出
//创建日期：2018.3.4
//返回工具首页
header("Content-type:text/html;charset=utf-8");
setcookie('user_email','',time()-1,'/','tool321.com');
setcookie('user_password','',time()-1,'/','tool321.com');
echo "<script>alert('您已成功退出登录！');window.location.href='/';</script>";
