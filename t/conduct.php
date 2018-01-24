<!-- 工具提交数据后台 -->
<?php
header("Content-type: text/html;charset=utf-8");
$con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
mysql_select_db('qdm208731188_db');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$tool_name = $_POST['tool_name'];
$tool_url = $_POST['tool_url'];
$tool_introduction=$_POST['tool_introduction'];
mysql_select_db("my_db", $con);
mysql_query("set names utf8;");
mysql_query("INSERT INTO tool321_tool (tool_name, tool_url,tool_introduction) VALUES ('$tool_name','$tool_url','$tool_introduction')");
echo "感谢您提交工具 $tool_name";
}
mysql_close($con);
echo "<script>location.href='tool.php';</script>";
?>

