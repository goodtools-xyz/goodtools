<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #E4EDF9;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
<%
oSkins=Trim(Request("Skins"))
n=Get_pifu_q(oSkins)

IF n=dbname_2 Then 
	Response.Write "<font color=red>该模板还没有设置前缀!!!!</font>"
	Response.End()
End IF
IF G_moshi="" Then
	Response.Write "<font color=red>请先开启静态模式!!!!</font>"
	Response.End()	
End IF
Response.Redirect "makeall.asp?skins="&server.URLEncode(oSkins)&"&skinsa="&n
%>
