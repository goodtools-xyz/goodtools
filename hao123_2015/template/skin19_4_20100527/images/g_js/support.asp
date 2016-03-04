<!--#include file="../../../../p_inc/Include_func.asp"-->
<!--#include file="../../../../p_inc/openconn.asp"-->
<%
IF Not ChkPost() Then
	response.Redirect "http://www.qingti"&"anc"&"ms.com"
	response.End()
End IF
'1:网址异常举报 2:求
m_type=Bint(Request.Form("m_type")) '
m_turnurl=Replace_Text(Request.Form("m_turnurl")):IF Instr(m_turnurl,"http://")>0 Then Response.End()
sitename=Replace_Text(Request.Form("sitename")) '网站名称
siteurl=Replace_Text(Request.Form("siteurl")) '网站地址
email=Replace_Text(Request.Form("email")) '联系邮箱
reason=Replace_Text(Request.Form("reason"))
intro=Replace_Text(Request.Form("intro"))
mmore=Replace_Text(Request.Form("mmore"))

IF m_type=1 Then
	Info=""
	IF sitename<>"" Then Info=Info&"网站名称:"&sitename&"<br>"
	IF siteurl<>"" Then Info=Info&"网站地址:"&siteurl&"<br>"
	IF reason<>"" Then Info=Info&"反馈原因:"&reason&"<br>"
	IF email<>"" Then Info=Info&"联系邮箱:"&email&"<br>"
	Info=Info&"具体说明:"&intro&"<br>"
ElseIF m_type=3 Then
	Info="具体说明:"&intro&"<br>"
End IF

datee=FormatDate(now,55)
ip=getIP()
gb_jiange=request.cookies("gbook")("add")
Dim temp_jg
temp_jg=DateDiff("s",gb_jiange,now())

IF trim(Info)<>"" Then
	IF temp_jg<30 Then
		response.Write "您的提交的太频繁，还有"&Cint(30-temp_jg)&"秒您才可以发布下一次谢谢！"
	Else
		Dim ss_sql
		ss_sql="select * from qingtiandy_gbook"
		Set ss_rs=server.CreateObject(G_RS)
		ss_rs.open ss_sql,conn,1,3
		ss_rs.addnew
		ss_rs("g_m_name")="网友"
		ss_rs("g_m_content")=Info
		ss_rs("g_ip")=ip
		ss_rs("g_m_date")=datee
		ss_rs("g_type")=m_type
		ss_rs.update
		Response.cookies("gbook")("add")=now()'留言间隔
	End IF
	IF mmore<>"" Then
		Response.Redirect "../../../../p_inc/turnto.asp?u="&m_turnurl
	Else
		Response.Redirect "../../../../p_inc/turnto.asp?u="&url_(Array("one",m_turnurl))
	End IF
End IF
%>