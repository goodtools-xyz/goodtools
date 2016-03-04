<!--#include file="../../../p_inc/Include_func.asp"-->
<!--#include file="../../inc/public.asp"-->
<!--#include file="../../inc/openconn.asp"-->
<!--#include file="Config.asp"-->
<!--#include file="qingtiancms.com.config____.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>命令操作</title>
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
</head>

<body>

<%

movieid=replace(request("selAnnounce")," ","")
if request("selAnnounce")="" then
	response.write("<script>alert('请选择一个条目!');history.go(-1)</script>")
	response.end
end if
if request("tag")="News_del" then
	conn.execute("delete from "&G_16_Table&" where id in("&movieid&")")	
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()
ElseIF request("tag")="News_show" Then
	conn.execute("update "&G_16_Table&" set n_look=1 where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="New_hide" Then
	conn.execute("update "&G_16_Table&" set n_look=0 where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="del_err" Then
	conn.execute("delete from "&G_16_Table&" where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="News_datet" Then
	conn.execute("update "&G_16_Table&" set n_date='"&ForMatDate(now(),55)&"' where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF Request("tag")="News_t" Then
	sn_type1=Replace_Text(Request("n_type1"))
	Call G16_1(G_16_Table,sn_type1)
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()							
Else
End IF
%>
</body>
</html>
