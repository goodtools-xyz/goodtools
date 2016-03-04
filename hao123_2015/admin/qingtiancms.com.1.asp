<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->
<LINK href="css/style.css" rel=stylesheet type=text/css>
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
response.Buffer=true
Server.ScriptTimeOut=9999999
IF request("Clear_leso")="" Then
	Response.Write "<a href='?Clear_leso=a'><font color=blue><b>开始清理</b></font></a>"
	Response.End()
End IF
response.Write "正在清理垃圾文字，如果不清理直接影响搜索，请稍后... <br>"
response.Flush()
'功能，查询时带有日文字符会出错，这里去除他
IF request("Clear_leso")<>"" Then
	Response.Write "------开始清理导航表，请梢后.....<br>"
	sql="select * from qingtiandh_List"
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,3
	Do WHile Not rs.Eof 
		IF  not Arr_s(rs("m_name")) Then
			rs("m_name")=Arr_ss(rs("m_name"))
			rs.update
		End IF
		IF  not Arr_s(rs("m_content")) Then
			rs("m_content")=Arr_ss(rs("m_content"))
			rs.update
		End IF		
		rs.movenext
	Loop
	rs.close
		
		
	response.Write " 垃圾文字清理完毕<br>"
	Response.Write "<script language=javascript>location.href='qingtiandh_List/index.asp';</script>"
End IF
%>