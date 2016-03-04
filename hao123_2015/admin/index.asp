<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=G_WEBNAME%>_后台管理</title>
</head>
<%
If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" then
	response.write "<script language='javascript'>"
	response.write"this.location.href='./login.asp';</SCRIPT>" 
response.end
end if
str=ReadAllTextFile(Add_Root_Dir("/p_inc/ver.asp"))
IF instr(str,"{sql}")>0 Then
	response.Redirect Add_Root_Dir("/sql.asp?t="&server.URLEncode("http://"&Request.ServerVariables("HTTP_HOST")&request.ServerVariables("URL")&"?"&Request.ServerVariables("QUERY_STRING")))	
	response.End()
End IF



%>



<frameset rows="*" cols="180,*" framespacing="0" frameborder="1" border="false" id="frame" scrolling="yes">
  <frame name="left" scrolling="auto" marginwidth="0" marginheight="0" src="qingtiancms.com.l.asp">
  <frameset framespacing="0" border="false" rows="25,*" frameborder="0" framespacing="0" scrolling="yes">
    <frame name="top" scrolling="no" src="qingtiancms.com.top.asp">
    <frame name="main"  NORESIZE frameborder="0" marginwidth="0" marginheight="10" border="no"src="qingtiancms.com.main.asp" align="center">
  </frameset>
</frameset>
<noframes>
  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <p>你的浏览器版本过低！！！本系统要求IE5及以上版本才能使用本系统。</p>
  </body>
</noframes>
</html>
