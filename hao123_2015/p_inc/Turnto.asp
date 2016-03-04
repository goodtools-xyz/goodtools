<!--#include file="qingtiancms.com.config___.asp"-->
<%
u=Request("u")
IF left(u,1)="/" Then Response.Write "<script>window.location='"&u&"'</scri"&"pt>"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style type="text/css">
*{margin:0;padding:0}
body{color:#000;font-family:"宋体";font-size:12px; background:#fff;}
h1,h2,h3,h4,input,textarea,from{ font-size:12px;}
img{border:0}
ul,li{list-style:none}
pre{ white-space: pre-wrap;/* css-3 */white-space: -moz-pre-wrap; /* Mozilla, since 1999 */white-space: -pre-wrap;/* Opera 4-6 */white-space: -o-pre-wrap;/* Opera 7 */word-wrap: break-word;/* Internet Explorer 5.5+ */}
.l{float:left}
.r{float:right}
a{color:#c31212;text-decoration:none}
a:hover{color:#ff5500; text-decoration:underline}
.tan-kk{ width:450px; height:256px; /*background:url(../images/search/1.gif) no-repeat;*/ margin:0 auto;}
.tan-l{ text-align:center; padding-top:30px;}
.tan-b{ text-align:center; padding-top:15px;}
.tan-c{ text-align:center; padding-top:8px;}
</style>
<title>跳转中间页</title>
</head>
<body>
<div class="tan-kk" style="margin-top:100px;">
    <div class="tan-c" style="margin-top:13px;">您好，请点击后面的链接进行跳转，<a href="<%=u%>" style="color:#ff5500; font-size:13px;text-decoration:underline;">请点击这里</a></div>

</div>
</body>
</html>