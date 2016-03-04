<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->

<%
	IF Request.Cookies("qingtian")("soojs_u")<>"" Then
		Response.Redirect "Default.asp"
		Response.End()
	End IF

		Session("u_email")=""
		Session("u_email_str")=""
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="<%=G_WEBNAME%>用户中心，只要您注册了<%=G_WEBNAME%>账号，就可以享受<%=G_WEBNAME%>为您提供的所有个性化服务，只要您有一号在手，就可一站通行。" name="description">
<meta content="<%=G_WEBNAME%>用户中心,<%=G_WEBURL_2%>,用户中心,一站通" name="keywords">
<link rel="stylesheet" type="text/css" href="Ucss//reset.css" />
<link rel="stylesheet" type="text/css" href="Ucss//common.css" />
<link rel="stylesheet" type="text/css" href="Ucss//layout.css" />
<script type="text/javascript" src="Ujs/checkUser.js"></script>
<style type="text/css">
	.wrap{ padding-top:15px; width:778px;}
	#leftbar{ width:100%; float:left; margin-right:-310px;}
	#header{ background:url(Uimg/logo.gif) no-repeat; width:158px; height:46px; margin-bottom:10px;}
	#banner{ background:#ace url(Uimg/banner.jpg) no-repeat left center; height:113px; padding:17px 320px 0 227px; color:#fff;}
	#desc{ padding:30px; line-height:24px;}
	#userbar{ float:right; display:inline;  margin-right:20px; width:290px;}
	.box{ margin:20px 0; background:#F8F8F8; border:1px #BFBFBF solid; padding:10px; }
	.box label.obj{line-height:24px;}
	.button{ margin:5px 0; font-size:12px; *padding-left:5px; *padding-right:5px;cursor:pointer;}
	.input-text{ width:256px;}
	form div{ padding:3px 0; position:static;}
	form div span { color:#666;}
	.foot{ clear:left; margin-top:10px;}
</style>
<title>用户登陆 - <%=G_WEBNAME%></title>
</head>
<body>
<%
op=Request("p")
oErr=""
IF Instr(op,"\n")>0 Then
	oErr_a=Split(op,"\n")
	oErr=oErr_a(0)
Else
	oErr=op
End IF

oreurl=Request("reurl")
oreurl=server.HTMLEncode(LoseeeHtml(oreurl))

%>
<div class="wrap">
	<div class="clearfix">
		
		<div id="leftbar">
			<div id="header">
				<h1><span class="none"><%=G_WEBURL_2%></span></h1>
			</div>
			<div id="banner">
				<h2 class="font-14" >上网先上<%=G_WEBURL_2%>！</h2>
				<p>只要您注册了<%=G_WEBURL_2%>账号<br />就可以享受所有个性化服务<br />只要您有一号在手，就可一站通行</p>
			</div>
			<div id="desc">
				<h3><a href="#" title="积分赚取人民币" target="_blank">积分赚取人民币</a></h3>
				<p class="mb5 gray9">只要您达到一定的积分，您就可以提款人民币，最低提款1元</p>
				<h3><a href="#" title="网络收藏夹" target="_blank" onfocus="">网络收藏夹</a></h3>
				<p class="gray9">无限量收藏夹，随时分享资源，快速安全稳定</p>
			</div>
		</div>
		
		<div id="userbar">
			<div class="box mb5">
				<strong>没有账号？</strong>
				<p class="text-center p10">
					<input  type="button" class="button btn-blue" id="reg"  value="立即注册账号"  onclick="window.location='./reg.asp?r=1001'"/>
				</p>
				<form method="post" action="regok.asp" style="border-top:1px #bfbfbf solid; padding-top:5px;">
					<input type="hidden" name="Back_url" value="<%=oreurl%>" />
					<input type="hidden" name="action" value="login"/>
					<input type="hidden" name="alt" value="a"/>
					<strong class="font-14">
						注册用户直接登录
					</strong>
					<%IF oErr<>"" Then%>
					<div>
					<p class="form-info error-info" id="message"><%=oErr%></p>	
					</div>
					<%End IF%>
					<div>
						<label for="username" class="obj">昵称/Email地址：</label>
						<input type="text" tabindex="1" class="input-text" id="soojs_u_email" name="soojs_u_email" value="" maxlength="60" />
					</div>
					<div>
						<a href="ugetpass.asp" class="fr inline" id="getpass" style="line-height:24px;">找回密码</a>
						<label for="userpas" class="obj">密 码：</label>
						<input  type="password" tabindex="2" class="input-text" id="soojs_u_pass"  name="soojs_u_pass" maxlength="20" />
					</div>

					<div>
						<input type="submit" tabindex="5"  class="button btn-blue mr5" value="登录" />
						<input type="button" tabindex="5"  class="button btn-blue mr5" value="返回首页" onclick="window.location='../'" />
					<a href="http://www.panxinyou.com/Api_qqlogin/redirect.asp"><img src="http://www.panxinyou.com/template/skin19_4_20100527/images/other/qq_login.png"></a>
					</div>

				</form>
			</div>
		</div>
	</div>
	<div class="foot">
		<p>2009 <%=G_WEBURL_2%> - <a href="<%=G_WEBURL%>"><%=G_WEBNAME%>主页</a> - <a href="#" target="_self">服务条款</a></p>
	</div>
</div>
<script>$_soojs("soojs_u_email").focus()</script>
</body>
</html>