<?php
/*session_start();

//注销登录
if($_GET['action'] == "logout"){
    unset($_SESSION['user_id']);
    unset($_SESSION['user_email']);
    echo '注销登录成功！点击此处 <a href="login.html">登录</a>';
    exit;
}

*/

//登录

if(isset($_POST['submit'])){
    echo('正常访问!');
}

$user_email = $_POST['user_email'];
$password = $_POST['password'];


//包含数据库连接文件
include('mysql.php');
//检测用户名及密码是否正确
$check_query = mysql_query("SELECT user_email,user_password FROM tool321_user WHERE user_email='$user_email' and password='$password' ");

if($result = mysql_fetch_array($check_query)){
    //登录成功
    $_SESSION['user_email'] = $user_email;
    $_SESSION['userid'] = $result['uid'];
    echo $name,' 欢迎你！进入 <a href="user_profile.php">用户中心</a><br />';
    echo '点击此处 <a href="login.php?action=logout">注销</a> 登录！<br />';
    exit;
} else {
    exit('登录失败！点击此处 <a href="javascript:history.back(-1);">返回</a> 重试');
}
?>

<?php
session_start();

//检测是否登录，若没登录则转向登录界面
if(!isset($_SESSION['userid'])){
    header("Location:login.html");
    exit();
}

//包含数据库连接文件
include('conduct.php');
$userid = $_SESSION['userid'];
$username = $_SESSION['username'];
$user_query = mysql_query("select * from user where uid=$userid limit 1");
$row = mysql_fetch_array($user_query);
echo '用户信息：<br />';
echo '用户ID：',$userid,'<br />';
echo '用户名：',$user_email,'<br />';
echo '邮箱：',$row['email'],'<br />';
echo '注册日期：',date("Y-m-d", $row['regdate']),'<br />';
echo '<a href="login.php?action=logout">注销</a> 登录<br />';
?>
