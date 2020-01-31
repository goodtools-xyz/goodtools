<?php
//功能：用户登出
//创建日期：2020.2.4
//返回工具首页
header("Content-type:text/html;charset=utf-8");
setcookie('user_email','',time()-1,'/','goodtools.xyz');
setcookie('user_password','',time()-1,'/','goodtools.xyz');
echo "<script>alert('您已成功退出登录！');window.location.href='/';</script>";
?>
