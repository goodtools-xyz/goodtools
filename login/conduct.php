

<?php
header("Content-type:text/html;charset=utf-8");

$user_email = $_POST['user_email'];
$password = $_POST['password'];
$password_confirmed = $_POST['password_confirmed'];

include 'mysql.php';


if ($password==$password_confirmed) {
mysql_query("INSERT INTO tool321_user (user_email, user_password) VALUES ('$user_email','$password')");

//保存cookie
setcookie("user_email", "$user_email", time()+(60*60*24*30),"/","tool321.com");
setcookie("user_password","$password",time()+(60*60*24*30),"/","tool321.com");
if (isset($_COOKIE["user_email"]))
  echo "Welcome " . $_COOKIE["user_email"] . "!<br />";
else
  echo "Welcome guest!<br />";

mysql_close($con);
echo "$user_email,感谢您注册使用goodtools！";
echo '<a  href="/login/user_profile.php">';
echo  "$user_email,个人设置";
echo "</a>";

}
else 
  echo "两次输入的密码不一致";

?>

