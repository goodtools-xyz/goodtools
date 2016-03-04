<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<%
Response.Write "非法来路!六合人家提供技术支持，QQ：260075702"
Response.Cookies("logintime")=""
k_uid=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
IF k_uid<>0 Then
	Set oRs_f=Server.CreateObject(G_RS)
	oRs_f.open "Select top 1 * From soojs_un Where id="&k_uid&"",conn,1,1
	IF oRs_f.Eof Then
		Response.Redirect "../"
		Response.End()	
	Else	
		osoojs_u_f1=Bint(oRs_f("soojs_u_f1"))
		IF osoojs_u_f1="1" Then '被锁定
			Response.End()
		End IF	
		IF datediff("d",oRs_f("soojs_lastdate"),now())>0 Then
			Get_qingtiandy_jifen_ip k_uid,3,0
		End IF
	End IF
	IF G_jinbi_kaifang="" Then
		Get_qingtiandy_jifen_ip k_uid,8,0
	End IF
End IF

%>
