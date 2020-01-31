<?php
header("Content-type: text/html;charset=utf-8");

$con = mysqli_connect("qdm208731188.my3w.com","qdm208731188","funnsy716057");
//mysqli 是php7

mysqli_select_db($con,'qdm208731188_db');

if (!$con) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}
mysqli_select_db("my_db", $con);
mysqli_query($con,'set names utf8'); 
echo "mysql connect success!";
?>
