
<?php
header("Content-type: text/html;charset=utf-8");
$con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
mysql_select_db('qdm208731188_db');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db("my_db", $con);
mysql_query("set names utf8;");

$result = mysql_query("SELECT * FROM tool321_tool WHERE tool_id='$_GET[id]'");
$row = mysql_fetch_array($result);
//更新id的点击数+1
mysql_query("UPDATE tool321_tool SET tool_voted_count = tool_voted_count +1 WHERE tool_id='$_GET[id]'");
//$num = $_GET['num'];
//$aindex = $_GET['aindex'];
//更新tool_adder的记录工具
//mysql_query("INSERT INTO tool321_user WHERE user_email='$_GET[user_email]'");
//更新tool_adder的记录工具

echo "<script>window.location.href='/t/tool.php';</script>";

mysql_close($con);

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
