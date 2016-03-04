<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<%
ReturnF=True
k_uid=Request.ServerVariables("QUERY_STRING")
IF Instr(k_uid,"&p=index")>0 Then
	ReturnF=False
	k_uid=Replace(k_uid,"&p=index","")
	k_uid=Request("a")
End IF
k_uid=Bint(k_uid)

IF G_xiaxian_1="1" or G_xiaxian_2="1" Then
'下线Cookies
response.Cookies(G_u_Cookies+"xiaxian")=k_uid	
End IF	
IF G_jifen_tuiguang_s="" Then
	IF Request.Cookies(G_u_Cookies+"_c")="ok" Then '已经推广过了 
		Response.Redirect "../"
		Response.End()
	End IF
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then '自己本身不能做推广
		Response.Redirect "../"
		Response.End()
	End IF
End IF
IF Bint(Request.Cookies(G_u_Cookies)("soojs_id"))<>0 Then '有了登陆积分，就不能有推广积分了
	Response.End()		
End IF
	

k_uip=GetIp()
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
End IF
Get_qingtiandy_jifen_ip k_uid,2,0
response.Cookies(G_u_Cookies+"_c")="ok"
Response.Cookies(G_u_Cookies+"_c").expires=now()+1	

IF ReturnF Then Response.Redirect "../"
%>
