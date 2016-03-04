<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->
<%
	Dim str,path
	str=""
	sid=Bint(Request("id"))
	Set oRs=conn.Execute("Select * From qingtiandy_url Where id="&sid&" And w_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
	IF Not oRs.Eof Then
		str=oRs("w_ser")
		path=Add_Root_Dir(G_BIG_T&"/users/0/"&oRs("id")&".txt")
		N_Fso.CreateFolderFile path,str
		TransferFile path, "text/plain",""&G_union_my&".txt"		
		Response.End()
	End IF
	
%>