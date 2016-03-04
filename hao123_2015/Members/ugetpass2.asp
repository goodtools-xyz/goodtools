<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
p=Request("p")
IF p="1" Then
	Session("u_email")=""
	Session("u_email_str")=""
End IF
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
<script type="text/javascript" src="Ujs/getpass.js"></script>
<title>找回密码 - <%=G_WEBNAME%></title>
</head>
<body>
<div class="wrap">
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> 用户中心</a></h1>
		<p class="gray text-right pv10">
			<a href="../">返回首页</a> |  
			<a href="./">返回我的帐户</a>
		</p>
		<div class="guide">				
			<h2 class="font-14">&nbsp;</h2>
		</div>
	</div>
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">找回密码</h3>
					<div class="hr"></div>
				</div>
				<%IF Session("u_email")="" Then%>
				<div class="step-bar">
						<span class="step current">1、填写E-mail</span>
						<span class="font-12">＞</span>
						<span class="step">2、填写昵称</span>
						<span class="font-12">＞</span>
						<span class="step">3、获取密码</span>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
				    <form method="post" action="./regok.asp" id="form" onsubmit="return check_getpass()">
                    <tr>
						<th width="110"><label for="email">邮箱地址：</label></th>
						<td width="267"><input type="text" class="input-text" name="email" id="email" value="" /></td>
						<td width="223">
						   <em class="form-info" id="email_1"></em>
						</td>
					</tr>
					<tr>
						<th><input type="hidden" name="action" value="getpass11" /></th>
						<td>
						<input type="submit" class="button btn-blue" value="下一步" /> 
						<input type="button" class="button btn-gray" value="返回登陆" onclick="window.location='./login.asp'"  />
						</td>
						<td>&nbsp;</td>
					</tr>
					<script>$_soojs("email").focus()</script>
					</form>
				</table>
				<%ElseIF Session("u_email")="1" Then%>
				<div class="step-bar">
						<span class="step">1、填写E-mail</span>
						<span class="font-12">＞</span>
						<span class="step current">2、填写昵称</span>
						<span class="font-12">＞</span>
						<span class="step">3、获取密码</span>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
				    <form method="post" action="./regok.asp" id="form" onsubmit="return check_getusername()">
					<input type="hidden" name="soojs_u_email" value="<%=Session("u_email_str")%>" />
                    <tr>
						<th width="110"><label for="email">昵称：</label></th>
						<td width="267"><input type="text" class="input-text" name="soojs_u_name" id="soojs_u_name" value="" /></td>
						<td width="223">
						   <em class="form-info" id="soojs_u_name_1"></em>
						</td>
					</tr>
					<tr>
						<th><input type="hidden" name="action" value="getpass22" /></th>
						<td><input type="button" class="button btn-blue" value="上一步" onclick="window.location='ugetpass2.asp?p=1'" /> <input type="submit" class="button btn-blue" value="下一步" /></td>
						<td>&nbsp;</td>
					</tr>
					</form>
					<script>$_soojs("soojs_u_name").focus()</script>
				</table>	
				<%ElseIF Session("u_email")="2" Then%>	
				<div class="step-bar">
						<span class="step">1、发送邮件</span>
						<span class="font-12">＞</span>
						<span class="step">2、重置密码</span>
						<span class="font-12">＞</span>
						<span class="step current">3、成功</span>
				</div>
				<%IF Request("p")="ok" Then%>
               	<div class="pl-110">
					<div class="box-yellow p10 mv10">
						<h4 class="ico-success font-14 ">
                            恭喜您！<br />
							您的登陆密码已经发到你的邮箱了：<font color="#FF0000"><%=Request("e")%></font><br />
							请牢记您的登陆密码，点<a href="./login.asp">这里</a>进行登陆
						</h4>
						<div class="p5 mt5" style="border-top:1px #ccc solid">
							<strong>后续操作？</strong>
							<p class=" gray9">
								<a href="../">1、返回网站首页</a><br />
							    <a href="./login.asp">2、返回登陆界面，进行用户登陆</a></p>
								<a href="./ugetpass.asp?n=1&p=1">3、邮件没收到？点这里利用身份证件取回密码</a></p>
						</div>
					</div>
               </div>
			   <%ElseIF Request("p")="error" Then%>
               	<div class="pl-110">
					<div class="box-yellow p10 mv10">
						<h4 class="font-14 ">
                            <font color="#FF0000">邮件系统正在维护！</font><br />
							你可以用您的身份证找回密码,<a href="ugetpass.asp?n=1&p=1">点击这里找回密码.</a>
						</h4>
						<div class="p5 mt5" style="border-top:1px #ccc solid">
							<strong>后续操作？</strong>
							<p class=" gray9">
								<a href="../">1、返回网站首页</a><br />
							    <a href="./login.asp">2、返回登陆界面，进行用户登陆</a></p>
						</div>
					</div>
               </div>
			   <%End IF%>			   
			   <%End IF%>
			</div>			
		</div>
	</div>
	<!--#include file="ubottom.asp"-->
</div>
</body>
</html>