<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
IF Not ChkPost Then
	'response.Redirect G_error_page_2
	'response.End()
End IF
dim title,action,sql,errorstr,str
title=replace(request("title"),"'","")
action=request("action")
m_type1=replace(request("m_type1"),"'","")
m_type2=replace(request("m_type2"),"'","")
m_type3=replace(request("m_type3"),"'","")
set rs=server.CreateObject("adodb.recordset")
if action="Music" then 
	sql="select m_name from qingtiandh_List where m_name='"&title&"' ANd m_type1="&m_type1&" And m_type2="&m_type2&" ANd m_type3="&m_type1
ElseIF action="email" Then
	sql="Select soojs_u_email From soojs_un Where soojs_u_email='"&title&"'"
ElseIF action="soojs_u_name" Then
	sql="Select soojs_u_name From soojs_un Where soojs_u_name='"&title&"'"
ElseIF action="w_url" Then
	sql="Select w_url From qingtiandy_url Where w_url='"&title&"'"
Elseif action="Music2" then 
	sql="select m_name from qingtiandh_List2 where m_name='"&title&"' ANd m_type1="&m_type1
end if
rs.open sql,conn,1,1
if not (rs.Bof and rs.eof) then
	errorstr="<font color=red>×此名称数据库中已经存在！</font>"
	str=str&"<script language='javascript'>"& vbcrlf
	str=str&"alert('此名称数据库已经存在')"&vbcrlf
	str=str&"parent.document.getElementById(""m_name"").focus()"&vbcrlf
	str=str&""& vbcrlf	
	errorstr2="此名称数据库已经存在"
else
	errorstr="<font color=blue>√此名称可以使用!</font>"
	errorstr2=""
end if
str=""
if action="Music" or action="email" or action="soojs_u_name" or action="w_url" then
	IF errorstr2<>"" Then
		str=str&"<script language='javascript'>"& vbcrlf
		str=str&"alert('"&errorstr2&"')"&vbcrlf
		str=str&"</script>"& vbcrlf
	End IF
end if

response.Write str
%>