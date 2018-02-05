<?php
echo time();
echo "<br>";
echo date("y-m-d");

$start_time = strtotime("2015-03-01 00:00");
$end_time = strtotime("2015-03-29 00:00");
select * from Art where lasttime > $start_time and lasttime <= $end_time;
?>