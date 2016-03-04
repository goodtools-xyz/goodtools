<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%
if not isEmpty(request("typeid")) then
typeid=request("typeid")
else
Response.Redirect "type.asp"
Response.End
end if
%>
<script language="javascript">
function confirmdel(id,typeid){
if (confirm("你确定要删除次二级分类吗?")) 
window.location.href="class_ok2.asp?action=del_class_2&id="+id+"&typeid="+typeid+""
} 
</script>


<%
Set rstype= Server.CreateObject("ADODB.Recordset") 
typesql="select * from qingtiandh_type1 where typeid="&typeid&"" 
rstype.open typesql,conn,1,1
typename1=rstype("typename")
If rstype.eof and rstype.bof then 
response.write"<SCRIPT language=JavaScript>alert('对不起，参数有误!');"
response.write"this.location.href='javascript:history.back();'</SCRIPT>"
End if
rstype.close
set rstype=nothing
set rstype=server.createobject("adodb.recordset") 
typesql="select * from qingtiandh_type2 where typeid1="&typeid&" order by typeno asc,typeid asc" 
rstype.open typesql,conn,1,1 
%>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=98% class="tableBorder">
	<tr> 
	<th height="22" colspan="2">导航类别列表二级分类列表</th>
	</tr>
<TR> 
<TD width="86%" height=25 class=bodytitle>&nbsp;所属类别：<a href=type.asp>导航大类</a> > <a href=type_2.asp?typeid=<%=typeid%>><%=typename1%></a></td>
<TD width="14%" class=bodytitle><IMG src="../images_new/plus.gif" width="9" height="9">&nbsp;&nbsp;<a href="class_ok2.asp?action=add_class_2&typeid=<%=typeid%>"><font color=red><b>添加二级分类</b></font></a></td>
</tr>
<TR>
  <TD colspan="2" align=middle vAlign=top><TABLE width="100%" height="30" border="0" cellpadding="5" cellspacing="5"> 
<TR height=22>
<%
if rstype.eof then
response.Write"<br><br><div align='center'>暂无类别请<a href=class_ok2.asp?action=add_class_2&typeid="&typeid&">添加</a></div><br><br>"
else
j=1
do while not rstype.eof
ztypename=GetRp(rstype("typename"))
ztypename2=GetRp(rstype("typename2"))
otypecolor2=GetRp(rstype("typecolor"))
ztypecontent_19=GetRp(rstype("typecontent_19"))
ztypecontent_19_top=GetRp(rstype("typecontent_19_top"))
otypeno=GetRp(rstype("typeno"))
IF otypecolor2<>"" then ztypename="<font color='"&otypecolor2&"'>"&ztypename&"</font>"
%> 
<td width="33%" align="left" height=24 class="Forumrow">
〖编号：<%=otypeno%>〗
<%=rstype("typeid")%>
<IMG src="../images/indexpoint.gif" width="9" height="9"> 
 <a href="type_3.asp?typeid1=<%=typeid%>&typeid2=<%=rstype("typeid")%>"><%=ztypename%></a>（状态：<%IF rstype("typehide")=1 Then response.Write "显示" Else response.Write "<font color=red>隐藏</font>"%>） 〖<a href=class_ok2.asp?action=edit_class_2&id=<%=rstype("typeid")%>><font color=#ff0000>修改</font></a>│<a href='class_ok2.asp?action=del_class_2&id=<%=rstype("typeid")%>&typeid1=<%=rstype("typeid1")%>' onclick='{if (confirm("你确定要删除次信息吗？\n删除将不再恢复！")){return true;}return false;}'><font color=#ff0000>删除</font></a>〗<%IF ztypename2<>"" Then Response.Write "别名："&ztypename2%>
<%
IF ztypecontent_19_top<>"" Then
	Response.Write " 代码(上)"
End IF
IF ztypecontent_19<>"" Then
	Response.Write " 代码(下)"
End IF

%>
</td>
<%if j mod 1 = 0 then %></tr><tr ><%end if%>
<% rstype.movenext 
j=j+1 
loop 
rstype.close
set rstype=nothing 
end if
%> 
</tr>
</TABLE></TD>
</TR>
</TABLE>
