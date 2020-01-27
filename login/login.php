
<?php
session_start();
header("Content-type:text/html;charset=utf-8");
include 'mysql.php';
$user_email = $_POST['user_email'];
$user_password = $_POST['password'];
echo $_SESSION['user_email'] = $user_email;
echo $_SESSION['$password'];

//$name=$_POST['username'];
//$pwd=$_POST['password'];
//$yzm=$_POST['yzm'];
//$hadden=$_POST['hadden'];
if ($user_email == '') {
    echo "<script>alert('请输入用户名');location='" . $_SERVER['HTTP_REFERER'] . "'</script>";
    exit;
}
if ($user_password == '') {

    echo "<script>alert('请输入密码');location='" . $_SERVER['HTTP_REFERER'] . "'</script>";
    exit;
}
/*
 if($yzm!=$_SESSION['VCODE']){

 echo"<script>alert('你的验证码不正确，请重新输入');location='".$_SERVER['HTTP_REFERER']. "'</script>";
 exit;
 }
*/
$result = mysqli_num_rows(mysqli_query($con,"SELECT * FROM goodtools_user WHERE user_email='$user_email' AND user_password='$user_password'"));
//显示是否查询到记录 echo "$result";

//echo "<script>alert('result+$result');</script>";
if (!$result) {
 echo "<script>alert('您输入的用户名不存在');location='login.html'</script>";
  exit ;
} else {
     //保存cookie
setcookie("user_email", "$user_email", time()+(60*60*24*30),"/","goodtools.xyz");
setcookie("user_password","$user_password",time()+(60*60*24*30),"/","goodtools.xyz");
 echo "<script>alert('登录成功');location='user_profile.php'</script>";
    exit ;
}

$sql_select = mysqli_query($con, "SELECT * FROM goodtools_user WHERE user_email='$user_email' AND user_password='$user_password'"); //从数据库查询信息'
echo "login10";
echo "$sql_select";
$stmt = mysqli_prepare($link, $sql_select);
mysqli_stmt_bind_param($stmt, 's', $user_email);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$row = mysqli_fetch_assoc($result);

if ($row) {

    if ($user_password != $row['user_password'] || $name != $row['user_email']) {

        echo "<script>alert('密码错误，请重新输入');location='login.html'</script>";
        exit;
    } else {
        $_SESSION['user_email'] = $row['user_email'];
        $_SESSION['user_id'] = $row['user_id'];


        echo "<script>alert('登录成功');location='user_profile.html'</script>";
    }
} else {
    echo "<script>alert('您输入的用户名不存在');location='login.html'</script>";
    exit;
};
