
<?php
header("Content-type: text/html;charset=utf-8");
$con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
mysql_select_db('qdm208731188_db');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db("my_db", $con);
mysql_query("set names utf8;");


$result = mysql_query("SELECT * FROM tool321_tool");
$row = mysql_fetch_array($result);
$row['tool_voted_count']++;
$num = $_GET['num'];
$aindex = $_GET['aindex'];

echo $row['tool_name'];
echo $row['tool_voted_count'];

mysql_close($con);

?>

<?php
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
?>