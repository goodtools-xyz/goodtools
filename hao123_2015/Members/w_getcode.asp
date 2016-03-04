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
<title>获取推广代码 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">获取推广代码</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 red">
					请在您的站点添加本站的友情链接或自定义连接，连接地址：<b><%=G_WEBURL%></b> 文字可以自定义。<br />
					本站<b><%=maxReBack%>倍流量返还</b>，来的越多，返还的也越多，大家可以在您的网站的醒目位置放上本站的连接即可
				</div>				
				<table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#C2DAEF"  >
				<tr>
				  <td><strong>代码地址：</strong><input NAME="codetxt0" ROWS="1" size="70" value="<%=G_WEBURL%><%=IIf(G_VIRTUAL_ROOT_DIR="","",G_VIRTUAL_ROOT_DIR&"/")%>#<%=zsoojs_id%>" id="codetxt0"> <a href="javascript:copycode(document.getElementById('codetxt0').value)">复制</a><br>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#666666">您可以自定义此链接的文字或者图片,随意DIY，想怎么链怎么链！</font>)</td>
				</tr>
				</table>
				<br />
				下面有多种代码供您选择，若您担心图片打开速度，您也可以把图片或JS上传到您的空间，双击即可复制<br /><br />
				<B><font color=red>·点弹代码，点击率高，适合各种站点</font></B> <a href="../qtUnion/js/1.html" target="_blank">演示</a> <a href="javascript:copycode(document.getElementById('codetxt1').value)">复制</a><br>
				<TEXTAREA NAME="codetxt1" ROWS="5" COLS="110" ondblclick="copycode(this.value);" id="codetxt1"><script src="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>qtUnion/js/1.js"></script></TEXTAREA>
				<br><br>

				<B><font color=red>·右下角漂浮代码(256x160)</font></B> <a href="../qtUnion/js/2.html" target="_blank">演示</a> <a href="javascript:copycode(document.getElementById('codetxt2').value)">复制</a><br>
				<TEXTAREA NAME="codetxt2" ROWS="5" COLS="110" ondblclick="copycode(this.value);" id="codetxt2"><script src="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>qtUnion/js/2.js"></script></textarea> 
				<br><br>
				
				<B><font color=red>·友情链接代码</font></B> <a href="../qtUnion/js/3.html" target="_blank">演示</a> <a href="javascript:copycode(document.getElementById('codetxt3').value)">复制</a><br>
				<TEXTAREA NAME="codetxt3" ROWS="5" COLS="110" ondblclick="copycode(this.value);" id="codetxt3"><a href="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>#<%=zsoojs_id%>" target="_blank"><img src="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>qtUnion/img/3.gif" alt="<%=WebName%>" border="0"></a></textarea>  
				<br><br>		
						
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>