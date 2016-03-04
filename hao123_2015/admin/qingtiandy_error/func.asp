<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
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
	response.write("<script>alert('请选择一个信息!');history.go(-1)</script>")
	response.end
end if
if request("tag")="del_err" then
	conn.execute("delete from qingtiandy_gbook where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()
				
Else
End IF
%>
</body>
</html>
