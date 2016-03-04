<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<title>后台管理LOG日志</title> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head> 

<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT language=javascript>
function unselectall(){
    if(document.myform.chkAll.checked){
 document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}
function CheckAll(form){
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.Name != 'chkAll'&&e.disabled==false)
       e.checked = form.chkAll.checked;
    }
  }

</SCRIPT>
<% 
'on error resume next
if not isempty(request("selAnnounce")) then
	idlist=request("selAnnounce")
	if instr(idlist,",")>0 then
		dim idarr
		idArr=split(idlist)
		dim log_id
		for i = 0 to ubound(idarr)
			log_id=clng(idarr(i))
			call deleteannounce(log_id)
		next
	else
		call deleteannounce(clng(idlist))
	end if
end if 

page3=request("pag") 
if page3="" then page3=session("contpag") '分页数，当前分页 
if page3="" then page3="1" 

pa=request("pa") 
if pa="" then pa=request("contpa") '每页显示数 
if pa="" then pa=50 '默认每页显示15条，可任意改 
session("contpag")=page3 
session("contpa")=pa 
pages=pa '每页显示数量***************以上一段程序用于实现分页功能 

SQL="SELECT * FROM errlog order by -id" 
dim rs 
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.Open sql,conn,1,1 
if rs.eof then
	response.Write "没记录"
	response.End()
end if
csi=0 
cs1=0 
cs100=0 
csdat1=0 

ZS=RS.RECORDCOUNT 
'*****************************************************以下一段程序用于分页显示 
%>
<body style="font-size: 9pt">
<table cellpadding=2 cellspacing=1 border=0 width=98% class=tableBorder align=center>
<TR>
<TH class=tableHeaderText colSpan=2 height=25>网站安全日志管理</TH>
<TR><tr><td valign=top class=bodytitle><table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>共有 
  <%Response.Write zs%>
  条记录，现在是第 
  <%Response.Write page3%>
  页 [<a href="dispcont_web.asp">刷新] </a></td>
    <td><table border="0" cellpadding="0" style="font-size: 9pt"> 
<tr><td>页码</td><%page2=1 
for i=1 to zs step pages 
if page3=cstr(page2) then 
%><td >[<%Response.Write page2%>]</td> 
<% else %> 
<td ><a href="?pag=<%Response.Write page2%>">[<%Response.Write page2%>]</a></td> 
<% end if 
page2=page2+1 
next 
sn=pages*(page3-1) '当前记录号=每页显示数*页数-每页显示数 
if sn>zs then sn=0 
rs.move sn,1 
'**********************************以上一段用于分页 
%> </tr></table></td>
  </tr>
</table></td>
</tr>
<tr align=center><td height=30>

<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
 <Form name="form" method="POST" action=""> 
 <tr>
    <td width="5%" class="forumRowHighlight">选中</td>
    <td width="8%" class="forumRowHighlight">编号</td>
    <td width="12%" class="forumRowHighlight">操作ＩＰ</td>
    <td width="15%" class="forumRowHighlight">操作时间</td>
    <td width="25%" class="forumRowHighlight">操作页面</td>
    <td width="10%" class="forumRowHighlight">提交方式</td>
    <td width="15%" class="forumRowHighlight">提交参数</td>
    <td width="15%" class="forumRowHighlight">提交数据</td>
 </tr><% 
for i=1 to pages 
Response.Write "</tr>"
Response.Write "<td class=forumRow><input name='selAnnounce' type='checkbox' value='"&cstr(rs("id"))&"'></td>" 
Response.Write "<td class=forumRow>"&rs("id")&"</td>" 
Response.Write "<td class=forumRow>"&rs("Sqlin_IP")&"</td>" 
Response.Write "<td class=forumRow>"&rs("Sqlin_TIME")&"</td>" 
Response.Write "<td class=forumRow>"&rs("SqlIn_Web")&"</td>" 
Response.Write "<td class=forumRow>"&rs("SqlIn_FS")&" </td>"
Response.Write "<td class=forumRow>"&rs("SqlIn_CS")&" </td>"
Response.Write "<td class=forumRow>"&rs("SqlIn_SJ")&" </td>"
Response.Write "</tr>" 
rs.movenext 
if rs.eof then exit for 
next 
rs.close 
%>
	<tr><td class=forumrowHighLight colspan=10>请选择要删除的事件，<input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form)' value='checkbox'>全选 <input type=submit name=act value=删除日志  onclick="{if(confirm('您确定执行的操作吗?')){this.form.submit();return true;}return false;}">
	</td>
	</tr>
	</form> 
</table>
</td>
</tr>
</table>
<% 
sub deleteannounce(log_id)
dim rs,sql
set rs=server.createobject("adodb.recordset")
sql="delete from [errlog] where id="&cstr(log_id)
conn.execute sql
End sub
%>
<br>
