<LINK href="css/style.css" rel=stylesheet type=text/css>
<%
dim p_ErrorUrl,p_ErrCodes
p_ErrorUrl = Replace(Request.QueryString("ErrorUrl"),"''","")
p_ErrorUrl=replace(p_ErrorUrl,"***","&")
p_ErrCodes = Request.QueryString("ErrCodes")
if trim(p_ErrorUrl) = "" then
	p_ErrorUrl = "javascript:history.back();"
Else
	p_ErrorUrl = p_ErrorUrl
End if
%>
	<table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>
	<TR>
	<TH class=tableHeaderText colSpan=2 height=25>错误的参数</TH>
	<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br><%=p_ErrCodes%></div></td></tr>
	<%
	IF p_ErrorUrl<>"#" Then
	%>
	<tr align=center><td height=30 class=forumRowHighlight><a href='<%=p_ErrorUrl%>'>&lt;&lt; 返回上一页</a></td>
	</tr>
	<%End IF%>
	</table>
