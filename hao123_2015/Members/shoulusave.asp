<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<%
IF Not ChkPost() Then
	response.Redirect "../"
	response.End()
End IF
Sub echor(v)
	Dim str
	str="<script>"&vbcrlf
	str=str&"alert('"&v&"');"&vbcrlf
	str=str&"history.back(-1)"&vbcrlf
	str=str&"</script>"&vbcrlf
	Response.Write str
	Response.End()
End Sub


om_name=checkStr(Request.Form("m_name"))
om_url=checkStr(Request.Form("m_url"))
om_content=checkStr(Request.Form("m_content"))
om_total=checkStr(Request.Form("m_total"))
om_type1=Bint(Request.Form("m_type1"))
om_type2=Bint(Request.Form("m_type2"))
om_type3=Bint(Request.Form("m_type3"))
om_jtime=checkStr(Request.Form("m_jtime"))
om_contactname=checkStr(Request.Form("m_contactname"))
om_tel=checkStr(Request.Form("m_tel"))
om_qq=checkStr(Request.Form("m_qq"))
om_youqing=Bint(Request.Form("m_youqing"))
om_status=0
oauthCode=checkStr(Request.Form("authCode"))
mmore=Replace_Text(Request.Form("mmore"))
m_turnurl=Replace_Text(Request.Form("m_turnurl"))


gb_jiange=request.cookies("gbook")("add2")
temp_jg=DateDiff("s",gb_jiange,now())


IF om_name="" Then Call echor("网站名称不能为空")
IF len(om_name)>40 Then Call echor("网站名称长度太长")
IF om_url="" Then Call echor("网站网址不能为空")
IF len(m_content)>200 Then Call echor("网站简介长度太长")
IF om_type1=0 Then Call echor("请选择网站一级分类")
IF om_type2=0 Then Call echor("请选择网站二级分类")
IF om_type3=0 Then Call echor("请选择网站三级分类")

IF Lcase(session("SooJs_gbook"))<>Lcase(oauthCode) Then Call echor("验证码不正确")

IF temp_jg<60 Then
	Call echor("请间隔60秒后再重新提交网址")
End IF

Set oRs=Server.CreateObject(G_RS)
oRs.open "Select * From qingtiandy_shouluurl Where 1<>1",conn,1,3
IF oRs.Eof Then
	oRs.AddNew()
	oRs("m_name")		=om_name
	oRs("m_url")		=om_url
	oRs("m_content")	=om_content
	oRs("m_total")		=om_total
	oRs("m_type1")		=om_type1
	oRs("m_type2")		=om_type2
	oRs("m_type3")		=om_type3
	oRs("m_jtime")		=om_jtime
	oRs("m_contactname")=om_contactname
	oRs("m_tel")		=om_tel
	oRs("m_qq")			=om_qq
	oRs("m_youqing")	=om_youqing
	oRs("m_status")		=om_status
	oRs("m_time")		=ForMatDate(now(),55)
	oRs.Update()
	Response.cookies("gbook")("add2")=now()'留言间隔
	

	
	IF mmore<>"" Then
		m_turnurl_2= "../p_inc/turnto.asp?u="&m_turnurl
	Else
		m_turnurl_2= "../p_inc/turnto.asp?u="&url_(Array("one",m_turnurl))
	End IF	
	
	
	v="您好，您的网址已经成功提交，我们会在两个工作日内对您的站点进行审核，谢谢支持"
	str="<script>"&vbcrlf
	str=str&"alert('"&v&"');"&vbcrlf
	str=str&"window.location='"&m_turnurl_2&"'"&vbcrlf
	str=str&"</script>"&vbcrlf
	Response.Write str
	Response.End()	
End IF
%>