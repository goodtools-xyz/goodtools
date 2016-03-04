<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
u=left(Replace(Request("u"),"'",""),32)
e=left(Replace(Request("e"),"'",""),32)
Sql="select soojs_yz_str from soojs_un where soojs_u_name='"&u&"'"
Set oRs=Conn.Execute(Sql)
IF oRs.EOf Then
	Response.Write "激活失败!!"
Else
	osoojs_yz_str=GetRp(oRs("soojs_yz_str"))
	IF len(osoojs_yz_str)<>20 Then
		Response.Write "激活失败!!"		
	Else
		IF e=MD5(osoojs_yz_str,32) Then
			Response.Write "已经成功激活.>>><a href='login.asp'>点此登陆</a>"
			Response.Write "<meta http-equiv=""refresh"" content=""3;url=login.asp"">"
			Conn.Execute("Update soojs_un Set soojs_yz_str='',soojs_u_f1=0 Where soojs_u_name='"&u&"'")
		Else
			Response.Write "激活失败!"
		End IF
	End IF
End IF	
%>
