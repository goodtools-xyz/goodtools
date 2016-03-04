<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%
ztypeid1=Bint(Request("typeid1"))
ztypeid2=Bint(Request("typeid2"))
IF ztypeid1=0 or ztypeid2=0 Then Response.Redirect  "type.asp":Response.End()
%>
<script language="javascript">
function confirmdel(id,typeid){
if (confirm("你确定要删除次二级分类吗?")) 
window.location.href="class_ok2.asp?action=del_class_2&id="+id+"&typeid="+typeid+""
} 
</script>


<%
set rstype=server.createobject("adodb.recordset") 
typesql="select * from qingtiandh_type3 where typeid1="&ztypeid1&" And typeid2="&ztypeid2&" order by typehide desc,typeno asc "
rstype.open typesql,conn,1,1 
%>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=98% class="tableBorder">
	<tr> 
	<th height="22" colspan="2">导航类别列表三级分类列表</th>
	</tr>
<TR> 
<TD width="86%" height=25 class=bodytitle>&nbsp;所属类别：<a href=type.asp>导航大类</a> > <a href=type_2.asp?typeid=<%=ztypeid1%>><%=Get_type1_name(ztypeid1)%></a> > <a href=type_3.asp?typeid1=<%=ztypeid1%>&typeid2=<%=ztypeid2%>><%=Get_type2_name(ztypeid2)%></a></td>
<TD width="14%" class=bodytitle><IMG src="../images_new/plus.gif" width="9" height="9">&nbsp;&nbsp;<a href="class_ok3.asp?typeid1=<%=ztypeid1%>&typeid2=<%=ztypeid2%>"><font color=red><b>添加三级分类</b></font></a></td>
</tr>
<TR>
  <TD colspan="2" align=middle vAlign=top><TABLE width="100%" height="30" border="0" cellpadding="5" cellspacing="5"> 
<TR height=22>
<%
if rstype.eof then
response.Write"<br><br><div align='center'>暂无类别请<a href=class_ok3.asp?typeid1="&ztypeid1&"&typeid2="&ztypeid2&">添加</a></div><br><br>"
else
j=1
do while not rstype.eof
ztypename=GetRp(rstype("typename"))
otypecolor3=GetRp(rstype("typecolor"))
IF otypecolor3<>"" then ztypename="<font color='"&otypecolor3&"'>"&ztypename&"</font>"
%> 
<td width="33%" align="left" height=24 class="Forumrow">
<%=rstype("typeid")%>
<IMG src="../images/indexpoint.gif" width="9" height="9"> 
 <%=ztypename%>（状态：<%IF rstype("typehide")=1 Then response.Write "显示" Else response.Write "<font color=red>隐藏</font>"%>,编号：<%=rstype("typeno")%>） 〖<a href=class_ok3.asp?typeid1=<%=ztypeid1%>&typeid2=<%=ztypeid2%>&id=<%=rstype("typeid")%>><font color=#ff0000>修改</font></a>│<a href='class_ok3.asp?action=Del&id=<%=rstype("typeid")%>' onclick='{if (confirm("你确定要删除次信息吗？\n删除将不再恢复！")){return true;}return false;}'><font color=#ff0000>删除</font></a>〗
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
