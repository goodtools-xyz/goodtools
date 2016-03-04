<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<title>html分类页生成</title>
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
<script>
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){clearTimeout(sett)}
document.ondblclick=scrollWindow2;
</script>
<%
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
Server.ScriptTimeOut=9999999
IF Request("skins")="" Then
	Session("Page_skins")=""
	Session("Page_skinsa")=""
Else	
	G_moban=Session("Page_skins")	
End IF
IF Not ChkPost() Then
	'response.Redirect G_error_page_1
	'response.End()
End IF
IF G_moshi="" Then
	response.Write "<b>动态模式无需生成！</b>"
	response.End()
End IF

ty1=Bint(Request("ty1"))

sql="Select  * From qingtiandh_type1 Where typeid>0"

IF ty1<>0 Then sql=sql&" And typeid="&ty1

Set oRs2=Server.CreateObject(G_RS)
oRs2.open sql,conn,1,1
IF  oRs2.Eof Then
	Response.Write "<b>没有需要生成的一级分类页</b>"
	Response.End()
Else

	Do While Not oRs2.Eof
		ztypename=oRs2("typename")
		ztypeid=oRs2("typeid")
		ztypeurl=Getrp(oRs2("typeurl"))
		IF ztypeurl<>"" Then
			oldurl=Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/"&ztypeurl)
		Else
			oldurl=Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/biglist.html")
		End IF	
		Response.Write "<p>正在生成一级类别(<font color=red>"&ztypename&"</font>  "
		Response.Flush()
		IF G_jingtai_wenjian_mulu<>"" Then
			o_jingtai_wenjian_mulu_s="../"
			IF G_List_yemian="3" Then o_jingtai_wenjian_mulu_s="../../"
		Else
			o_jingtai_wenjian_mulu_s=""
			IF G_List_yemian="3" Then o_jingtai_wenjian_mulu_s="../"
		End IF		
		Allcontent_top=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/top.html")))
		Allcontent_buttom=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/button.html")))		
		Allcontent=Qingtiandy_getfilecontent(server.MapPath(oldurl))
		Allcontent=MakeHTML_CMS_Self(Allcontent)
		Allcontent=replace(replace(replace(replace(replace(Allcontent,"{qt:template_top}",Allcontent_top),"{qt:template_button}",Allcontent_buttom),"../images/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/images/"),"../css/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/css/"),"../js/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/js/")
		Response.Write ztypeid
		Allcontent=replace(Allcontent,"{qt:big_type1}",ztypeid)
		Allcontent=replace(Allcontent,"{qt:indexurl}",Add_Root_Dir(o_jingtai_wenjian_mulu_s))
		
		Allcontent_t=MakeHTML_CMS(Allcontent)
		saveurl=url_(Array("l1",ztypeid,""))	
		N_Fso.WriteToFile saveurl,Allcontent_t
		Response.Write "完成)</p>"
		Response.Flush()
		cii=cii+1
		oRs2.MoveNext
	Loop
	Response.Write "<p><font color=red><b>生成一级类别完毕</b></font></p>"
End IF

%>
</body>
</html>