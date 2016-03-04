<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>建议</title>
<script>
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//获得数组
    var argc = setCookie.arguments.length;//获得数组的长度
    var expires = (argc > 2) ? argv[2] : 1;//可伸长变量
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //把传过来得变量变成天数
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
}
function st(value){var obj=eval(document.getElementById(value));obj.style.display=(obj.style.display=='none')?'':'none';}
</script>
</head>
<body>
<%
g_type=request("g_type")
sql="select * from qingtiandy_gbook where id>0"
IF g_type<>"" Then sql=sql&" and g_type="&g_type
sql=sql&" order by g_m_date desc,id desc"

Set rs=server.CreateObject(G_RS)
rs.open sql,conn,1,1 
IF request.Cookies("page_n")="" then
	msg_per_page=15
else
	msg_per_page=Cint(request.Cookies("page_n"))
end if

IF g_type="1" Then
	zg_type="网址异常举报" 
ElseIF g_type="3" Then
	zg_type="给我们的建议" 
Else
	zg_type="网址异常举报"
End IF
'msg_per_page=20 '定义每页显示记录条数
%>
<!--#include file="../inc/headpage.asp"-->
<Form name="search" method="POST" action="admin_check.asp">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th height=25 colspan="2" class="tableHeaderText"><a href=?><font color="#FFFFFF"><%=zg_type%></font></a></th>	
    <tr> 
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#111111" bordercolorlight="#D7EBFF" bordercolordark="#D7EBFF" style="border-collapse: collapse">
    			<TBODY>
				<%
				if rs.eof then
					response.Write"<br><br><div align='center'>暂无数据信息</div><br><br>"
				else
				%>
					<TR height=25> 
					  <TD width="52" height="20" class=bodytitle><font color="#CC3300"><b>编号</b></font></TD>
						<TD width="508" class=bodytitle><font color="#CC3300"><b>说明</b></font></TD>
					    <TD width="109" class=bodytitle><font color="#CC3300"><b>类别</b></font></TD>
				      <TD width="141" class=bodytitle><font color="#CC3300"><b>报错时间</b></font></TD>
					  <TD width="88" align="center" class=bodytitle><input type='submit' value='删除' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='./func.asp?tag=del_err';this.form.submit();return true;}return false;}"></TD>
					</TR>
					<%do while not rs.eof and rowcount > 0%>
					
					<TR height="20"> 
					  <TD  class=forumRow>
					  <%=rs("id")%>
					  </td>
						<TD class=forumRow><a href=<%=url_(Array("d",rs("g_m_id"),url))%> target="_blank"><%=rs("g_m_name")%></a> <span style="color:#0000FF; cursor:pointer" onClick="st('error_<%=rs("id")%>')">详情</span></td>
					    <TD class=forumRow>
						<%
						IF rs("g_type")=1 Then
							response.Write "<a href='?g_type=1'>网址异常举报</a>"
						ElseIF rs("g_type")=2 Then
							response.Write "<a href='?g_type=2'>推荐网址收录</a>"
						ElseIF rs("g_type")=3 Then
							response.Write "<a href='?g_type=3'>给我们的建议</a>"
						End IF
						%>
						</td>
				      <TD class=forumRow><%IF ForMatDate(rs("g_m_date"),5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(rs("g_m_date"),55)&"</font>" Else response.Write ForMatDate(rs("g_m_date"),55) %></td>
					  <TD  align="center" class=forumRow><input type=checkbox name=selAnnounce value="<%=cstr(rs("ID"))%>"></td>
					</TR>
					
					<TR style="display:none" id="error_<%=rs("id")%>"> 
					  <TD colspan="5" class=forumRow>
					  <%=LoseScript(rs("g_m_content"))%>					  
					  </td>
				    </TR>
										
					<%
					icolor=icolor+1
					if icolor>1 then icolor=0
					rowcount=rowcount-1
					rs.movenext
					loop
					end if
					%>
			</TABLE>		</td>
	</tr>
	<tr>
	<td width="91%" class=forumRow >&nbsp;
	<input type='submit' value='删除' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='./func.asp?tag=del_err';this.form.submit();return true;}return false;}">&nbsp;
	每页显示
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='index.asp'">
	<option value="">请选择页数</option>
	<option value="10">10</option>
	<option value="15">15</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="100">100</option>
	<option value="200">200</option>
	<option value="300">300</option>
	<option value="500">500</option>
	</select>&nbsp;	</td>
	<td width="9%" class=forumRow align="center" ><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall>全选</td>
	</tr>
	<tr>
	<td class=forumRow colspan="2">&nbsp;</td>
	</tr>
	<tr>
	<td colspan="2" align="center" class=forumrowHighLight><b><%=listPages("?g_type="&g_type)%></b></td></tr>
</table>
</form>
</body>
</html>