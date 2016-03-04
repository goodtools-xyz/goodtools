<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<html>
<head>
<title>html首页生成</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #E4EDF9;
}
body,td,th {
	font-size: 12px;
}
-->
</style>

</head>

<body>
<%
IF Request("skins")="" Then
	Session("Page_skins")=""
	Session("Page_skinsa")=""
Else	
	G_moban=Session("Page_skins")	
End IF
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
Server.ScriptTimeOut=9999999
IF G_moshi="" Then
	response.Write "<b>动态模式无需生成！</b>"
	N_Fso.CopyFiles Add_Root_Dir("/come/index.asp"),url_(Array("home",""))
	response.End()
End IF


saveurl=url_(Array("home",""))
oldurl=Add_Root_Dir(GetTemplateUrlIndex())
Allcontent=Qingtiandy_getfilecontent(server.MapPath(oldurl))
Allcontent=MakeHTML_CMS_Self(Allcontent):Get_TypeTotal2 ""
Allcontent_top=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/top.html")))
Allcontent_buttom=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/button.html")))
Allcontent=replace(replace(replace(replace(replace(replace(Allcontent,"{qt:template_top}",Allcontent_top),"{qt:template_button}",Allcontent_buttom),"../images/","template/"&G_moban&"/images/"),"../css/","template/"&G_moban&"/css/"),"../js/","template/"&G_moban&"/js/"),"../app/","template/"&G_moban&"/app/")
Allcontent=replace(Allcontent,"{qt:indexurl}","")
Allcontent=MakeHTML_CMS(Allcontent)
'**********************写入文件*****************************
Set fso=Server.CreateObject(G_FSO)
Set f=fso.CreateTextFile(Server.MapPath(saveurl),true)
'写入网页内容
f.WriteLine Allcontent
f.close
'************************************************************
response.write "<font color=red><b>生成网站首页完成！</b></font>"
%>
</body>

</html>