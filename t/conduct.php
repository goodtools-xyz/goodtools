<!-- 工具提交数据后台 -->
<?php
header("Content-type: text/html;charset=utf-8");
include '/login/mysql.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tool_name = $_POST['tool_name'];
    $tool_url = $_POST['tool_url'];
    $tool_introduction = $_POST['tool_introduction'];
    mysqli_select_db("my_db", $con);
    mysqli_query($con, "INSERT INTO goodtools_tool (tool_name, tool_url,tool_introduction) VALUES ('$tool_name','$tool_url','$tool_introduction')");
    echo "感谢您提交工具 $tool_name";
}
mysqli_close($con);
//echo "<script>location.href='tool.php';</script>";
?>