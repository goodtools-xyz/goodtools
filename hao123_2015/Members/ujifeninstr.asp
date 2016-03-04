<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
IF G_jinbi_kaifang="2" Then
	doAlert "对不起，此功能暂未开放，点击确定转向首页","../"
	Response.End()
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
<script type="text/javascript" src="Ujs/checkUser.js"></script>
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<script>
function copycode(str){
	window.clipboardData.setData("Text",str);
	alert("代码已经复制到剪贴板！");
}
</script>
<title>关于如何使用绑定本机获取<%=G_jifen_jifen_name%>功能 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<script type="text/javascript" src="../p_inc/public.js"></script>
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> 用户中心</a></h1>
		<p class="gray text-right pv10">
			<a href="../">网站首页</a> | 
			<a href="./">用户中心</a> | 
			<a href="./login.asp">登陆</a>  |  
			<a href="./reg.asp"><font color="#FF0000">注册新用户</font></a>
		</p>
		<div class="guide">				
			<span class="head_left_1">金币绑定本机详细描述</span>
			<span class="head_left_2" id="head_left_2"></span>
		</div>
	</div>
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">相关功能说明</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 ga2">
					为什么把<%=G_WEBURL_2%>网址导航设为首页，就可以赚钱！
				</div>	
				<div class="handle px10 black line20p">
					<a href="<%=G_WEBURL%>" target="_blank"><%=G_WEBURL_2%></a>在为用户提供优质美观的网址导航之余，还为用户提供了<%=G_jifen_jifen_name%>回馈服务。它不仅是您的最佳网络伴侣，将它设为您的主页后，每天打开页面时您的帐户<%=G_jifen_jifen_name%>也随之增加，或者把它推荐给您的好友，也可增加<%=G_jifen_jifen_name%>。用这些<a href="./j_tikuan.asp"><font color="#ff0000"><%=G_jifen_jifen_name%>可以兑换现金</font></a>（现金将会通过支付宝支付）。您只<a href="./reg.asp">需要注册一个帐号</a>，即可开始赚分。<span style="color:#0000ff; font-weight:bold"><%=G_WEBNAME%>是经专业团队打造的优秀网址导航，在一个优秀网址导航的陪伴下上网冲浪的同时，又可获得盈利，一举两得，何乐而不为呢？</span>
				</div>							
				<div class="handle p10 ga2">
					<%=G_jifen_jifen_name%>换现金的比率是多少？多少钱才可以提款？
				</div>	
				<div class="handle px10 black line20p">
					 本活动的现金比率相对于其它网赚任务来说是很高的，<strong><font color="#ff0000">比例：<%=G_jifen_jifen_zhifubao_bili%><%=G_jifen_jifen_name%>兑换人民币1元，1元即可提款</font></strong>，基本没有最低提款限制。
				</div>		
				<div class="handle p10 ga2">
					注册后要怎么操作，我的帐户才会计分？
				</div>	
				<div class="handle px10 black line20p">
					只需要登录您的会员，点一下右上角的“绑定本机<%=G_jifen_jifen_name%>”（见下图）<br>
					<img border="0" src="Uimg/jifen/0.jpg"><br><br>
					绑定成功后，会显示绿色的“<%=G_jifen_jifen_name%>已绑定本机”（见下图）<br>
					<img border="0" src="Uimg/jifen/1.jpg"><br><br>
					绑定<%=G_jifen_jifen_name%>后，以后<strong><font color="#ff0000">每次打开IE访问<%=G_WEBURL_2%>主页时，就会自动加<%=G_jifen_home%><%=G_jifen_jifen_name%></font></strong>，同一24小时内重复打开的计<%=G_jifen_home%><%=G_jifen_jifen_name%>。这样<strong><font color="#0000ff">如果您将几个亲戚朋友的电脑设置主页绑定，每天就会增加不少<%=G_jifen_jifen_name%>，因为IE每时每刻都是要打开使用的。</font></strong>
					</p>
				</div>	
				<div class="handle p10 ga2">
					<%=G_jifen_jifen_name%>如何兑换成现金？如何提款？
				</div>		
				<div class="handle px10 black line20p">
					登录后点击右侧的“我要提款”，填写提款数量提交后，我们会在一天之内受理，把款项汇给您。<br>
					<img border="0" src="Uimg/jifen/2.jpg">
				</div>	
				<div class="handle p10 ga2">
					怎样快速赚取币？一个帐户只能绑定一台电脑吗？
				</div>									
				<div class="handle px10 black line20p">
					一个帐户可以绑定多台电脑，您可以在其它亲戚朋友的电脑上登录您的<%=G_WEBURL_2%>会员帐号，点击一下绑定本机<%=G_jifen_jifen_name%>，并把<%=G_WEBURL_2%>设为该电脑的主页，那么以后这个朋友在他的电脑打开IE访问<%=G_WEBURL_2%>时，<%=G_jifen_jifen_name%>也会计入您的帐户。如果您这样设置了十台电脑，那么您的<%=G_jifen_jifen_name%>将会以十倍的速度增长。所以，加快获取<%=G_jifen_jifen_name%>的最好方法就是多推荐您的朋友把<%=G_WEBURL_2%>设为主页，当然您还要在那台电脑上登录一下绑定您的帐户<%=G_jifen_jifen_name%>。
				</div>	
				<div class="handle p10 ga2">
					疑难解答：可以不设置主页赚<%=G_jifen_jifen_name%>吗？
				</div>					
				<div class="handle px10 black line20p">
					答：可以的。比如说 您用了哪台电脑 之后登陆一下您的ID 点了 绑定本机  之后即使这台电脑主页不设置为 <%=G_WEBURL_2%>  只要这台电脑访问了<%=G_WEBURL_2%>  您的<%=G_jifen_jifen_name%>就会增加，更不用非得登录才可以记录<%=G_jifen_jifen_name%>。
					 <br>
例如：您去网吧 登陆了ID 绑定了本机   之后只要有人用这台电脑打开过<%=G_WEBURL_2%>您的<%=G_jifen_jifen_name%>就到手了，如果不设置主页，可以弄个快捷方式放在桌面上，那只要有人点了这个快捷方式登录<%=G_WEBURL_2%> 那您的<%=G_jifen_jifen_name%>也就到手了。 
				</div>											
						
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>