<!doctype html>
<html lang="zh">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>音乐发烧友</title>
	<meta name="keywords" content="音乐，发烧友，在线音乐，导航，工具">
	<meta name="description" content="汇集在线音乐歌台，满足你的天籁之音享受">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--correct small inconsistencies across browsers and devices-->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.0.0/normalize.css">
	<!--Bootstrap CDN-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
</head>



<body>
	<nav class="navbar navbar-dark bg-inverse">
		<a class="navbar-brand" href="#">Tool321</a>
		<ul class="nav navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="/">首页 <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">影音工具</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">娱乐行业</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="http://v4-alpha.getbootstrap.com/components">A bootsstrap 4.0alpha demo webpage(safari compatible)</a>
			</li>
		</ul>
	</nav>
	<?php
echo "我的第一段 PHP 脚本！";
?>

<?php
	$dbh = mysql_connect(qdm208731188.my3w.com,qdm208731188,funnsy716057);
mysql_select_db('qdm208731188_db');
$query = "insert into requests(date, request, email, priority,status) values (NOW(),'$description', '$email', '$priority', 'NEW')";
$res = mysql_query($query, $dbh);
$query = "select max(id) from requests";
$res = mysql_query($query, $dbh);
$err = mysql_error();
if($err){
echo "发生错误，请通知管理员";
}
$row = mysql_fetch_row($res);
echo "未来您使用的号码为: ".$row[0];

?>
		<ol class="breadcrumb" style="margin-bottom: 5px;">
			<li><a href="/">首页</a></li>
			<li><a href="#">个人工具</a></li>
			<li class="active">天籁之音</li>
		</ol>

		<div id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-primary">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          在线音乐
        </a>
      </h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
					A collection of online echo make you dive in thinking.
					<div class="list-group">
						<a href="#" class="list-group-item active"> 在线音乐 </a>
						<a href="http://music.baidu.com" class="list-group-item "> 百度音乐 </a>
						<a href="http://music.hao123.com/" class="list-group-item">Hao123音乐</a>
						<a href="http://y.qq.com" class="list-group-item">QQ音乐</a>
						<a href="http://music.163.com/" class="list-group-item">网易云音乐</a>
						<a href="http://www.kuwo.cn/" class="list-group-item">酷我音乐</a>
						<a href="http://web.kugou.com/" class="list-group-item">酷狗音乐</a>
						<a href="http://mp3.sogou.com/" class="list-group-item">搜狗音乐</a>
						<a href="#" class="list-group-item active"> 在线FM </a>
						<a href="http://douban.fm/" class="list-group-item">豆瓣FM</a>
						<a href="http://douban.fm/" class="list-group-item">蜻蜓FM</a>
						<a href="http://www.ximalaya.com" class="list-group-item">喜马拉雅FM</a>
						<a href="http://www.kaolafm.com/" class="list-group-item">考拉FM</a>
						<a href="http://www.radio.cn/" class="list-group-item">中央人民广播电台</a>
					</div>
				</div>
			</div>

		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>

</body>

</html>
