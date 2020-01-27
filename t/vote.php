
<?php
header("Content-type: text/html;charset=utf-8");
include '/login/mysql.php';

$result = mysqli_query($con, "SELECT * FROM goodtools_tool WHERE tool_id='$_GET[id]'");
$row = mysqli_fetch_array($result);
//更新id的点击数+1
mysqli_query($con, "UPDATE goodtools_tool SET tool_voted_count = tool_voted_count+1 WHERE tool_id='$_GET[id]'");
//$num = $_GET['num'];
//$aindex = $_GET['aindex'];
//更新tool_adder的记录工具
//mysql_query("INSERT INTO tool321_user WHERE user_email='$_GET[user_email]'");
//更新tool_adder的记录工具

echo "<script>window.location.href='/t/tool.php';</script>";

mysqli_close($con);

/*

$num = $_GET['num'];
$aindex = $_GET['aindex'];
$con = mysql_connect("localhost","root","");
 
if (!$con){
 die('Could not connect: ' . mysql_error());
}
 
mysql_select_db("goodplus", $con);
 
$sql0s = "SELECT * FROM `good` where `id` = ".$aindex;
$sql0 = mysql_query($sql0s);
 
if($_GET['flag'] == 0){
 while($row = mysql_fetch_array($sql0)){
 echo $row['value'];
 }
}else if($_GET['flag'] == 1){
 $sql="UPDATE `goodplus`.`good` SET `value` = '".$num."' WHERE `good`.`id` = ".$aindex;
  
 if (!mysql_query($sql,$con)){
 die('Error: ' . mysql_error());
 }
 echo $num;
}
mysql_close($con)

*/
?>
