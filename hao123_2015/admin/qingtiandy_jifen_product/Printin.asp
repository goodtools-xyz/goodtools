<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
body{font-family: Georgia, "Times New Roman", Times, serif;}
-->
</style>
<script>
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){clearTimeout(sett)}
document.ondblclick=scrollWindow2;
</script>
<%
t3=Request("t3")
'Set oRs=conn.Execute("Select * From qingtiandy_url Order By Id Asc")
'Response.Write "<qingtiandy_url>"
'Do While Not oRs.Eof
'	zw_url=oRs("w_url")
'	zw_name=oRs("w_name")
'	Response.Write zw_url&"|||"&zw_name&"{###}"
'	oRs.MoveNext
'Loop


%>

<%IF t3="" Then%>
<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
<form action="?t3=ok" method="post" name="form1">
	<tr> 
		<th class="tableHeaderText" height=25 colspan="2">初始产品导入</th>
	</tr>
	<tr>
		<td width="81%" class=forumRowHighlight>
	  	<input type="submit" value="数据导入" id=submit name=submit> 
		</td>
	</tr>
</form>	
</table>
<%

Else
	
	str=ReadAllTextFile("data.txt")
	qingtiandy_url=GetContent(str,"<qingtiandy_url>","</qingtiandy_url>",0)	
	qingtiandy_url_a=Split(qingtiandy_url,"####")
	For ii=0 To Ubound(qingtiandy_url_a)-1
		s1=qingtiandy_url_a(ii)
		s1_a=Split(s1,"|||")
		sg_jifen=s1_a(0)
		sg_name=s1_a(1)
		sg_pic=s1_a(2)
		sg_content=s1_a(3)

		
		Set oRss=Server.CreateObject(G_RS)
		oRss.open "Select * From qingtiandy_jifen_goods Where g_name='"&sg_name&"'",conn,1,3
		IF oRss.Eof Then
			oRss.Addnew()
			oRss("g_jifen")=sg_jifen
			oRss("g_name")=sg_name
			oRss("g_pic")=sg_pic
			oRss("g_content")=sg_content
			oRss("g_xing")=0
			oRss("g_time")=ForMatDate(now(),55)
			oRss("g_look")=1
			oRss("g_numb")=0
			oRss.Update()
			Response.Write sg_name&"---<font color=blue>导入成功</font><br>"
			Response.Flush()
		Else
			Response.Write sg_name&"---<font color=red>已经存在</font><br>"
			Response.Flush()			
		End IF
	Next
	Response.Write "<font color=red><b>全部操作完成</b></font><br>"
End IF
%>


