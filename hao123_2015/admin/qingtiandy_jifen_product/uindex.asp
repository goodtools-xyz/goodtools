<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>兑奖用户管理</title>
<script src="../js/mouse_on_title.js"></script>
<script src="../js/p_js.js"></script>
<link id="css" href="../inc/moni/dv_wnd.css" type="text/css" rel="stylesheet">
<script language="javascript" src="../inc/moni/dv_wnd.js" type="text/javascript"></script>
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

</script>
</head>
<body>
<%
	s_page=""
	IF request.Cookies("page_n")="" then
		msg_per_page=10
	else
		msg_per_page=Cint(request.Cookies("page_n"))
	end if
	kSql_where="id>0"
	kSql_order="m_time desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	zjid=StayNub(Request("jid"))
	IF zjid<>"" Then 
		kSql_where=kSql_where& " And jid="&zjid
	End IF

	zuid=StayNub(Request("uid"))
	IF zuid<>"" Then 
		kSql_where=kSql_where& " And uid="&zuid
	End IF

	zm_look=StayNub(Request("m_look"))
	IF zm_look<>"" Then 
		kSql_where=kSql_where& " And m_look="&zm_look
	End IF
		
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (m_name like '%"&zm_name&"%')"

	sql="Select * from qingtiandy_jifen_goodsman Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?desc="&server.URLEncode(sDesc)&"&m_name="&server.URLEncode(zm_name)&"&m_look="&zm_look&"&uid="&zuid
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>兑奖用户管理</th>
	</tr>
	<FORM name=form action="?" method=get>
	<tr>
		<td width="12%" height=25 class="forumRowHighlight">
		<B>管理操作选项</B></td>
		<td width="88%" class=forumRowHighlight>
		<DIV id="showTemplet">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="templet">
				<tr>
					<td>
						<Select name="m_look">
							<Option value="">状态</Option>
							<Option value="1">显示</Option>
							<Option value="0">隐藏</Option>
						</Select>				
						<select name="desc">
							<option value="" selected="selected">默认排序</option>
							<option value="g_time asc" selected="selected">添加时间升序</option>
							<option value="g_time desc">添加时间降序</option>
							<option value="m_name">类别名a~z排序</option>
							<option value="m_name desc">类别名z~a排序</option>
							<option value="id desc">ID降序</option>
							<option value="id asc">ID升序</option>
						</select>
						网站名：
						<input type = "Text" name = "m_name" style="width:200px;"> </td>
				</tr>
			</table>
		</DIV>
	  </td>
	</tr>	
	
	<tr> 
		<td width="12%" height=25 class="forumRowHighlight"></td>
	  <td width="88%" height=25 class="forumRowHighlight">
	  <input type="submit" value="立刻查找" id="submit" name="submit" style="cursor:hand;">　　
	  [<a href="javascript:location.reload()">刷新页面</a>]
	  </td>
	</tr>	
	</form>
</table>
<Form name="search" method="post" action="?">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">兑奖用户列表</font></a></th>	
        <th width="12%" height=25 class="tableHeaderText" align="right">
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='?'">
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
	</select>		
	  </th>
	<tr> 
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" cellpadding="0" cellspacing="1">
			<TR height=25>			
				<TD width="7%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
				<TD width="7%"    class=bodytitle><font color="#CC3300"><b>联系人</b></font></TD>
				<TD width="5%"    class=bodytitle><font color="#CC3300"><b>用户ID</b></font></TD>
				<TD width="10%"    class=bodytitle><font color="#CC3300"><b>联系电话</b></font></TD>
				<TD width="20%"    class=bodytitle><font color="#CC3300"><b>联系E-mail</b></font></TD>
				<TD width="26%"    class=bodytitle><font color="#CC3300"><b>联系地址</b></font></TD>
				<TD width="10%"   class=bodytitle><font color="#CC3300"><b>兑奖时间</b></font></TD>
				<TD width="10%"   class=bodytitle><font color="#CC3300"><b>操作选项</b></font></TD>
			  <TD width="5%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="{if(confirm('你确定要删除吗？\n删除将不再恢复！')){;this.form.Action.value='Del';this.form.action='uedit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%
IF rs.Eof Then
	Response.Write "<TR height=25><td colspan='8' align='center'><br><br><div align='center'>暂无数据信息</div><br><br></td></tr>"
End IF
do while not rs.eof and rowcount > 0
	nId=rs("id")
	nuid=rs("uid")
	nm_name=rs("m_name")	
	nm_tel=rs("m_tel")
	nm_email=rs("m_email")
	nm_addr=rs("m_addr")
	nm_code=rs("m_code")
	nm_content=rs("m_content")
	nm_time=rs("m_time")
	nm_look=rs("m_look")
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=nId%> <%=IIf(nm_look="1"," <font color=blue>已兑奖</font>","")%></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_name%></td>
			<td nowrap="nowrap" class="forumRow"><a href="?uid=<%=nuid%>"><%=nuid%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_tel%></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_email%></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_addr%></td>
			<td nowrap="nowrap" class="forumRow"><%=ForMatDate(nm_time,5)%></td>
			<td class="forumRow">
			<%IF nm_look="1" Then%>
			<a href='uedit.asp?id=<%=nId%>&Action=l_look&m_look=0'><img src="../images/down_0.gif" border="0" title="设置为未兑奖"></a>
			<%Else%>
			<a href='uedit.asp?id=<%=nId%>&Action=l_look&m_look=1'><img src="../images/down_1.gif" border="0" title="设置为已兑奖"></a>
			<%End IF%>
			<a href='uedit.asp?Id=<%=nId%>&Action=Del' onclick='{if (confirm("你确定要删除吗？\n删除将不再恢复！")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="删除此用户"></a>			
			<span style="color:#0000FF; cursor:pointer" onClick='DvWnd.open("<%=nm_name%> 的详细资料","ulook.asp?id=<%=nId%>",500,400)'>详细</span>			</td>
			<TD  align="center" class=forumRow><input type=checkbox name=id value="<%=nId%>"></td>
			</tr>		
<%
	icolor=icolor+1
	if icolor>1 then icolor=0
	rowcount=rowcount-1
	rs.moveNext()
	Loop
	
%>						
			</TABLE>	
		</td>
	</tr>
	<tr align="center">
		<td class="forumrowHighLight" colspan="2"><%=listPages(s_page)%></td>
	</tr>	
</table>
</Form>


<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = form;")
		WriteLn("	with(oForm){")
		WriteLn("		m_look.value='" & Str4Js(zm_look) & "';")
		WriteLn("		m_name.value='" & Str4Js(zm_name) & "';")
		WriteLn("		desc.value='" & Str4Js(sDesc) & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>	
<%
	ShowInfo sId

	rs.Close:Set rs = Nothing
	CloseConn()
%>
</body>
</html>