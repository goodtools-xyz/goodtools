<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->

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
<title>获取<%=G_jifen_jifen_name%>推广代码 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">获取<%=G_jifen_jifen_name%>推广代码</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 red">
					1个IP获取<%=G_jifen_tuijian%>个<%=G_jifen_jifen_name%>，不能重复获取，<%=G_jifen_jifen_name%>可以用来兑奖哦~<br />
				</div>				
				<table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#C2DAEF"  >
				<tr>
				  <td><strong>推广连接：</strong><input NAME="codetxt0" ROWS="1" size="70" value="<%=G_WEBURL%><%=IIf(G_VIRTUAL_ROOT_DIR="","",G_VIRTUAL_ROOT_DIR&"/")%>?<%=zsoojs_id%>" id="codetxt0"> <a href="javascript:copycode(document.getElementById('codetxt0').value)">复制</a><br>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#666666">把上面的链接发给您的朋友，同学，同事，密友吧！</font>)</td>
				</tr>
				</table>		
						
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>