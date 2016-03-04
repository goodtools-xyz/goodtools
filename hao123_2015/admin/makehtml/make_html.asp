<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #E4EDF9;
}
body,td,th,p {
	font-size: 12px;
}
-->
</style>
<script>
 var sett;
 var i=1;
function $(id){return document.getElementById(id)}
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){
if (i%2==1)
	clearTimeout(sett)
else
	scrollWindow();
	i++;
}
document.ondblclick=scrollWindow2;
</script>
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"
response.contenttype="text/html;charset=gb2312"
Server.ScriptTimeOut=9999999
IF Request("skins")="" Then
	Session("Page_skins")=""
	Session("Page_skinsa")=""
Else	
	G_moban=Session("Page_skins")	
End IF

sG_pageone_g=G_pageone_g
sG_pageone_g=StayNub(sG_pageone_g)
IF sG_pageone_g="" Then 
	sG_pageone_g=50
Else
	sG_pageone_g=Clng(sG_pageone_g)
End IF

f=request.QueryString("f")
g=request.QueryString("g")
all=request.QueryString("all") '是否一键生成所有单页
r=Request.QueryString("r") '是否跳转，空为跳转
tag=Request.QueryString("tag")'是否一开始就生成
IF tag="" And all="all" Then
	Response.Write "<a href='?tag=yes"&GetQueryString()&"'><b>点此继续生成</b></a>"
	Response.End()
End IF

IF all="" Then
	str_1_1=g'原始路径
	str_1_1_utf=""
	str_1_1_a=str_1_1
	IF Instr(str_1_1_a,"$$")>0 Then
		str_1_1_a_a=Split(str_1_1_a,"$$")
		str_1_1=str_1_1_a_a(0)
		str_1_1_utf=str_1_1_a_a(1)
	End IF
	
	str_1_1_2=replace(str_1_1,".asp",".html")
	oldurl=Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/"&str_1_1)
	IF G_jingtai_wenjian_mulu<>"" Then
		o_jingtai_wenjian_mulu_s="../"
	Else
		o_jingtai_wenjian_mulu_s=""
	End IF
	Allcontent=Qingtiandy_getfilecontent(server.MapPath(oldurl))
	Allcontent_top=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/top.html")))
	Allcontent_buttom=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/button.html")))
	Allcontent=MakeHTML_CMS_Self(Allcontent)
	Allcontent=replace(replace(replace(replace(replace(replace(Allcontent,"{qt:template_top}",Allcontent_top),"{qt:template_button}",Allcontent_buttom),"../images/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/images/"),"../css/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/css/"),"../js/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/js/"),"../app/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/app/")
	Allcontent=replace(Allcontent,"{qt:indexurl}",Add_Root_Dir(o_jingtai_wenjian_mulu_s))	
	Allcontent=MakeHTML_CMS(Allcontent)
	
	f1=Allcontent
	Response.Write url_(Array("one",str_1_1_2))
	N_Fso.sWriteToFileU url_(Array("one",str_1_1_2)),f1,str_1_1_utf
	response.Write "<script language=javascript>alert('生成完毕!!');window.opener=null;window.close();</script>"			
Else
	p_flag=false
	p=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/js/jingtaiguize.txt")))
	str_p1=body2s(p,"{#","#}","@@@@@",true)
	str_p1_arr=split(str_p1,"@@@@@")
	For ii_kii=0 To Ubound(str_p1_arr)
		str_1=str_p1_arr(ii_kii)
		str_1=replace(str_1,chr(13),"")
		str_1=replace(str_1,chr(10),"")
		IF str_1<>"" And Instr(str_1,"||")>0 And Instr(str_1,".")>0 Then
			str_1_a=split(str_1,"||")
			str_1_1=str_1_a(0)'原始路径
			str_1_1_utf=""
			str_1_1_a=str_1_1
			IF Instr(str_1_1_a,"$$")>0 Then
				str_1_1_a_a=Split(str_1_1_a,"$$")
				str_1_1=str_1_1_a_a(0)
				str_1_1_utf=str_1_1_a_a(1)
			End IF			
			str_1_1_2=replace(str_1_1,".asp",".html")
			str_1_2=str_1_a(1)'原始路径说明
			
			oldurl=Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/"&str_1_1)
			Allcontent=Qingtiandy_getfilecontent(server.MapPath(oldurl))
			Allcontent=MakeHTML_CMS_Self(Allcontent)
			'生成不需要分页
			str_1_3="make_html.asp?f="&server.URLEncode("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir(str_1_a(2))&"?sindex="&str_1_1)&"&g="&str_1_1_2'调用路径

			f="http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir(str_1_a(2))&"?sindex="&str_1_1
			g=str_1_1_2
			
			IF G_jingtai_wenjian_mulu<>"" Then
				o_jingtai_wenjian_mulu_s="../"
			Else
				o_jingtai_wenjian_mulu_s=""
			End IF			
			Allcontent_top=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/top.html")))
			Allcontent_buttom=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/"&G_moban_html&"/button.html")))
			
			Allcontent=replace(replace(replace(replace(replace(replace(Allcontent,"{qt:template_top}",Allcontent_top),"{qt:template_button}",Allcontent_buttom),"../images/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/images/"),"../css/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/css/"),"../js/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/js/"),"../app/",o_jingtai_wenjian_mulu_s&"template/"&G_moban&"/app/")
			Allcontent=replace(Allcontent,"{qt:indexurl}",Add_Root_Dir(o_jingtai_wenjian_mulu_s))	
			Allcontent=MakeHTML_CMS(Allcontent)
			
			f1=Allcontent
			N_Fso.sWriteToFileU url_(Array("one",str_1_1_2)),f1,str_1_1_utf
			Response.Write "生成 <font color=red>"&str_1_2&"</font> 完成！<p>"	
			Response.Flush()					

			p_flag=true	
		End IF
	Next
	IF p_flag Then
		Response.Write "<font color=red><b>全部单页生成完毕！</b></font><p>"
	Else
		Response.Write "<p><font color=red><b>没有单页需要生成</b></font>"
		IF r="" Then
			response.Write "<meta http-equiv=""Refresh"" content=""2;URL="&Request.ServerVariables("HTTP_REFERER")&""">"
		End IF
	End IF
End IF
%>