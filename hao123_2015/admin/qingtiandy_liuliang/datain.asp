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
'Response.Write "</qingtiandy_url>"
%>

<%IF t3="" Then%>
<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
<form action="?t3=ok" method="post" name="form1">
	<tr> 
		<th class="tableHeaderText" height=25 colspan="2">数据导入</th>
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
	soojs_u_name=GetContent(str,"<soojs_un:soojs_u_name>","</soojs_un:soojs_u_name>",0)
	soojs_u_pass=GetContent(str,"<soojs_un:soojs_u_pass>","</soojs_un:soojs_u_pass>",0)
	soojs_uu_name=GetContent(str,"<soojs_un:soojs_uu_name>","</soojs_un:soojs_uu_name>",0)
	soojs_u_tel=GetContent(str,"<soojs_un:soojs_u_tel>","</soojs_un:soojs_u_tel>",0)
	soojs_u_email=GetContent(str,"<soojs_un:soojs_u_email>","</soojs_un:soojs_u_email>",0)
	soojs_u_addr=GetContent(str,"<soojs_un:soojs_u_addr>","</soojs_un:soojs_u_addr>",0)
	qingtiandy_url=GetContent(str,"<qingtiandy_url>","</qingtiandy_url>",0)
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select * From soojs_un Where soojs_u_name='"&soojs_u_name&"'",conn,1,3
	IF oRs.Eof Then
		oRs.AddNew()
		oRs("soojs_u_name")=soojs_u_name
		oRs("soojs_u_pass")=GetRamCode(8)
		oRs("soojs_uu_name")=soojs_uu_name
		oRs("soojs_u_tel")=soojs_u_tel
		oRs("soojs_u_email")=soojs_u_email
		oRs("soojs_u_addr")=soojs_u_addr
		oRs("soojs_date")=ForMatDate(now(),55)
		oRs("soojs_lastdate")=ForMatDate(now(),55)
		oRs("soojs_thisdate")=ForMatDate(now(),55)
		oRs("soojs_ip")=getIP()
		oRs("soojs_thisip")=getIP()
		oRs("soojs_lastip")=getIP()
		oRs("soojs_u_birth")="1980-01-01"
		oRs("soojs_status")=1
		oRs("soojs_u_Webf")=1
		oRs("soojs_u_Province")="2386"
		oRs.Update()
		pid=oRs("id")
	Else
		pid=oRs("id")
	End IF
	qingtiandy_url_a=Split(qingtiandy_url,"{###}")
	For ii=0 To Ubound(qingtiandy_url_a)
		s1=qingtiandy_url_a(ii)
		s1_a=Split(s1,"|||")
		k1=s1_a(0) '地址
		k2=s1_a(1) '名字
		k3=Replace(split(k1,"/")(0),"www.","")
		Set oRss=Server.CreateObject(G_RS)
		oRss.open "Select * From qingtiandy_url Where w_url='"&k1&"'",conn,1,3
		IF oRss.Eof Then
			oRss.Addnew()
			oRss("w_url")=k1
			oRss("w_name")=k2
			oRss("w_uid")=pid
			oRss("w_date")=ForMatDate(now(),55)
			oRss("w_editdate")=ForMatDate(now(),55)
			oRss("dateandtime")=ForMatDate(now(),55)
			oRss("w_domain")=k3
			oRss("w_status")=1
			oRss("w_look")=1
			oRss("w_ser")=GetRamCode(40)
			oRss.Update()
			Response.Write k1&"---"&k2&"---<font color=blue>导入成功</font><br>"
			Response.Flush()
		Else
			Response.Write k1&"---"&k2&"---<font color=red>已经存在</font><br>"
			Response.Flush()			
		End IF
	Next
	Response.Write "<font color=red><b>全部操作完成</b></font><br>"
End IF
%>


