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
<title>全部收藏列表</title>
<script src="../js/mouse_on_title.js"></script>
<script src="../js/p_js.js"></script>
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
	kSql_order="list_date desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	
	zlist_uid=Request("list_uid")
	zlist_uid=StayNub(zlist_uid)
	IF zlist_uid<>"" Then kSql_where=kSql_where&" And list_uid="&zlist_uid	
		
	zlist_gx=Request("list_gx")
	zlist_gx=StayNub(zlist_gx)
	IF zlist_gx<>"" Then kSql_where=kSql_where&" And list_gx="&zlist_gx
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (list_name like '%"&zm_name&"%' or list_url like '%"&zm_name&"%')"

	sql="Select * from qingtiandy_listurl Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?soojs_status="&zsoojs_status&"&desc="&server.URLEncode(desc)&"&m_name="&server.URLEncode(m_name)&"&list_uid="&zlist_uid
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>网址收藏管理选项</th>
	</tr>
	<FORM name=form action="index.asp" method=get>
	<tr>
		<td width="12%" height=25 class="forumRowHighlight">
		<B>管理操作选项</B></td>
		<td width="88%" class=forumRowHighlight>
		<DIV id="showTemplet">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="templet">
				<tr>
					<td>
						<Select name="list_gx">
							<Option value="">是否共享</Option>
							<Option value="1">共享</Option>
							<Option value="0">不共享</Option>
						</Select>					
						<select name="desc">
							<option value="" selected="selected">默认排序</option>
							<option value="soojs_date asc" selected="selected">收藏时间升序</option>
							<option value="soojs_date desc" selected="selected">收藏时间降序</option>
							<option value="id desc">ID降序</option>
							<option value="id asc">ID升序</option>
						</select>
						用户名/E-mail：
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
	  [<a href="javascript:location.reload()">刷新页面</a>]	  </td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">全部网址收藏列表</font></a></th>	
        <th width="12%" height=25 class="tableHeaderText" align="right">
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
	</select>		
	  </th>
	<tr> 
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" cellpadding="0" cellspacing="1">
			<TR height=25>			
				<TD width="5%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
				<TD width="26%"    class=bodytitle><font color="#CC3300"><b>网址</b></font></TD>
				<TD width="14%"   class=bodytitle><font color="#CC3300"><b>标题</b></font></TD>
				<TD width="14%"   class=bodytitle><font color="#CC3300"><b>所属用户</b></font></TD>
				<TD width="13%"   class=bodytitle><font color="#CC3300"><b>是否共享</b></font></TD>
				<TD width="13%"   class=bodytitle><font color="#CC3300"><b>收藏时间</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>操作</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="{if(confirm('你确定要删除吗？\n删除将不再恢复！')){;this.form.Action.value='Del';this.form.action='edit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%
do while not rs.eof and rowcount > 0
	nId=rs("id")
	nlist_url=rs("list_url")	
	nlist_name=rs("list_name")
	nlist_gx=rs("list_gx")
	nlist_uid=rs("list_uid")
	onlist_gx=IIf(nlist_gx="0","不共享","<font color=blue>共享</font>")
	nlist_date=rs("list_date")
	oplist_url=IIf(Instr(nlist_url,"http://")>0,nlist_url,"http://"&nlist_url)
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=nId%></td>
			<td nowrap="nowrap" class="forumRow"><a href="../../p_inc/Turnto.asp?u=<%=oplist_url%>" target="_blank"><%=Replace(left(nlist_url,50),zm_name,"<font color=red>"&zm_name&"</font>")%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=Replace(left(nlist_name,50),zm_name,"<font color=red>"&zm_name&"</font>")%></td>
			<td nowrap="nowrap" class="forumRow"><a href="index.asp?list_uid=<%=nlist_uid%>"><%=Get_soojs_un_soojs_u_name(nlist_uid)%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=onlist_gx%></td>
			<td nowrap="nowrap" class="forumRow">
			  <%IF ForMatDate(nlist_date,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(nlist_date,55)&"</font>" Else response.Write ForMatDate(nlist_date,55) %></td>
			<td class="forumRow">
			<a href='edit.asp?Id=<%=nId%>&Action=Del' onclick='{if (confirm("你确定要删除吗？\n删除将不再恢复！")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="删除此网站"></a>			</td>
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
		WriteLn("		list_gx.value='" & Str4Js(zlist_gx) & "';")
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