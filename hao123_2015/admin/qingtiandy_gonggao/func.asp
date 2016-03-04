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
	response.write("<script>alert('请选择一个条目!');history.go(-1)</script>")
	response.end
end if
if request("tag")="News_del" then
	conn.execute("delete from qingtiandy_gonggao where id in("&movieid&")")	
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()
ElseIF request("tag")="News_show" Then
	conn.execute("update qingtiandy_gonggao set n_look=1 where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="New_hide" Then
	conn.execute("update qingtiandy_gonggao set n_look=0 where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="del_err" Then
	conn.execute("delete from qingtiandy_gbook where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="del_err_g" Then
	conn.execute("delete from g_b where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_where" Then	
	m_where_1=request("m_where_1")
	IF m_where_1<>"" Then
		conn.execute("update qingtiandy_movie set m_where='"&m_where_1&"' where id in ("&movieid&")")
		conn.close
		set conn=nothing
	End IF
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_xing" Then	
	m_xing_1=request("m_xing_1")
	IF m_xing_1<>"" Then
		conn.execute("update qingtiandy_movie set m_xing="&m_xing_1&" where id in ("&movieid&")")
		conn.close
		set conn=nothing
	End IF
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_type1" Then	
	m_type1_1=request("m_type1_1")
	IF m_type1_1<>"" Then
		conn.execute("update qingtiandy_movie set m_type1="&m_type1_1&" where id in ("&movieid&")")
		conn.close
		set conn=nothing
	End IF
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_type2" Then	
	m_type1_1=request("m_type2_1")
	IF m_type1_1<>"" Then
		conn.execute("update qingtiandy_movie set m_type2="&m_type1_1&" where id in ("&movieid&")")
		conn.close
		set conn=nothing
	End IF
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_hits" Then	
	m_hits_1=request("m_hits_1")
	IF m_hits_1<>"" Then
		conn.execute("update qingtiandy_movie set m_hits=m_hits+"&m_hits_1&" where id in ("&movieid&")")
		conn.close
		set conn=nothing
	End IF
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_fen" Then	
	m_fen_1=request("m_fen_1")
	IF m_fen_1<>"" Then
		conn.execute("update qingtiandy_movie set m_fen=m_fen+"&m_fen_1&" where id in ("&movieid&")")
		conn.close
		set conn=nothing
	End IF
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_hits_click0" Then	
	conn.execute("update qingtiandy_movie set m_hits=0 ")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()	
ElseIF request("tag")="m_fen_click0" Then	
	conn.execute("update qingtiandy_movie set m_fen=0 ")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()
ElseIF request("tag")="News_datet" Then
	conn.execute("update qingtiandy_gonggao set n_date='"&ForMatDate(now(),55)&"' where id in ("&movieid&")")
	conn.close
	set conn=nothing
	response.Redirect request.ServerVariables("HTTP_REFERER")
	response.End()							
Else
End IF
%>
</body>
</html>
