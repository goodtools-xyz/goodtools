<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	str=""	
	str=str&"<qingtiandy_url>"
	Set oRs=conn.Execute("Select * From qingtiandy_jifen_goods Order By Id Desc ")
	Do While Not oRs.Eof 
		sid=oRs("id")
		sg_jifen=oRs("g_jifen")
		sg_name=oRs("g_name")
		sg_pic=oRs("g_pic")
		sg_content=oRs("g_content")

		str=str&sg_jifen&"|||"&sg_name&"|||"&sg_pic&"|||"&sg_content&"####"
		oRs.MoveNext
	Loop
	str=str&"</qingtiandy_url>"
	Response.Write str
%>