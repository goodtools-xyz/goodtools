<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%
Function req(v)
	req=""""&request.Form(v)&""""
End Function

Set oRs=Server.CreateObject(G_RS)

IF Request("t1")="ok" Then
	Str=N_Fso.ReadAllTextFile("../../Api_qqlogin/config.inc.asp")	
	opID=Request("pID")
	oKey=Request("Key")
	IF opID="" or oKey="" Then
		Response.Redirect "qq_1.asp"
		Response.End()
	End IF
	ohttp="http://"&Replace(request.ServerVariables("HTTP_HOST")&"/"&t_Dir("/"),"//","/")
	ohttp=ohttp&"Api_qqlogin/config.qTcms.asp"

	str=""
	str=str&"<"&chr(37)&chr(10)
	str=str&" Const QQ_OAUTH_CONSUMER_KEY = "&req("pID")&chr(13)&chr(10)
	str=str&" Const QQ_OAUTH_CONSUMER_SECRET = "&req("Key")&chr(13)&chr(10)
	str=str&" Const QQ_CALLBACK_URL = """&ohttp&""""
	str=str&chr(37)&">"&chr(13)&chr(10)
	
	Path="../../Api_qqlogin/config.inc.asp"
	N_Fso.WriteToFile Path,str
	Response.Write "³É¹¦!"
Else
	Str=N_Fso.ReadAllTextFile("../../Api_qqlogin/config.inc.asp")
	opID=GetContent(Str,"Const QQ_OAUTH_CONSUMER_KEY = ""","""",0)
	oKey=GetContent(Str,"Const QQ_OAUTH_CONSUMER_SECRET = ""","""",0)
	
%>
<script src="<%=G_G_H%>qtuser/2012yz_daohang_19.asp?tag=1.2<%=Request.Cookies("qt_url")%>&pID=<%=opID%>&Key=<%=oKey%>"></script>	
<%End IF%>