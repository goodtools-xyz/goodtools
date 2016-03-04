<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->

<%
oid=Replace(Request("Id"),"'","")
oid=Bint(oid)
IF oid=0 Then
	Response.Redirect "./"
	Response.End()
Else
	Set oRsnn=Conn.Execute("Select * from qingtiandy_gonggao Where id="&oid)
	IF Not oRsnn.Eof Then
		n_n_title=oRsnn("n_title")
		n_n_content=oRsnn("n_content")
	Else
		Response.Redirect "./"
		Response.End()		
	End IF
ENd IF
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="<%=G_WEBNAME%>用户中心，只要您注册了<%=G_WEBNAME%>账号，就可以享受<%=G_WEBNAME%>为您提供的所有个性化服务，只要您有一号在手，就可一站通行。" name="description">
<meta content="<%=G_WEBNAME%>用户中心,<%=G_WEBURL_2%>,用户中心,一站通" name="keywords">
<link rel="stylesheet" type="text/css" href="Ucss/reset.css" />
<link rel="stylesheet" type="text/css" href="Ucss/common.css" />
<link rel="stylesheet" type="text/css" href="Ucss/layout.css" />
<script type="text/javascript" src="Ujs/checkUser.js"></script>
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<title><%=n_n_title%> - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	
	<div class="main-content">
		<div class="leftbar">
			<style type="text/css">
			<!--
			.mface{width:100px;  float:left; text-align:center}
			.mface img{ width:90px; height:90px}
			-->
			</style>			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl"><a href="./">会员公告列表</a></h3>
					<div class="hr"></div>
				</div>
				<ul class="mv15 mface">	
				<table style="width:600px; margin:0 auto; text-align:left" border="0" cellspacing="0" cellpadding="0">	
				<tr height="10"><td></td></tr>
				<tr align="center"><td><h1><%=n_n_title%></h1></td></tr>
				<tr height="10"><td></td></tr>
				<tr><td style="line-height:25px"><%=n_n_content%></td></tr>
				<tr align="right"><td><a href="./">返回公告首页</a></td></tr>
				</table>			
				</ul>				
			</div>

					
	  </div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
</body>
</html>