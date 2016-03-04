<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
qingtiandy=request.QueryString("qingtiandy.cn"):IF qingtiandy<>"" Then response.Cookies("qingtiandy.cn")=qingtiandy
G_moban_rq=request.Cookies("qingtiandy.cn")
IF G_moban_rq<>"" Then G_moban=G_moban_rq


oldurl=Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/index2.html")

Allcontent=Qingtiandy_getfilecontent(server.MapPath(oldurl))
Allcontent_top=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/top.html")))
Allcontent_buttom=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/button.html")))
Allcontent=replace(replace(replace(replace(replace(Allcontent,"{qt:template_top}",Allcontent_top),"{qt:template_button}",Allcontent_buttom),"../images/","../../template/"&G_moban&"/images/"),"../css/","../../template/"&G_moban&"/css/"),"../js/","../../template/"&G_moban&"/js/")
Allcontent=replace(Allcontent,"{qt:indexurl}",Add_Root_Dir("/"))
Allcontent=MakeHTML_CMS(Allcontent)
response.Write Allcontent
%>