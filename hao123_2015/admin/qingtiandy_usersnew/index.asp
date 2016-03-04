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
<title>全部用户管理</title>
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
	kSql_order="soojs_date desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	ssoojs_u_xiaxian=Request("soojs_u_xiaxian")
		
	zsoojs_status=Request("soojs_status")
	zsoojs_status=StayNub(zsoojs_status)
	IF zsoojs_status<>"" Then kSql_where=kSql_where&" And soojs_status="&zsoojs_status
	IF ssoojs_u_xiaxian<>"" Then kSql_where=kSql_where&" And soojs_u_xiaxian='"&ssoojs_u_xiaxian&"'"
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF left(zm_name,2)="id" Then
		zm_name2=StayNub(zm_name)
		IF zm_name<>"" Then kSql_where=kSql_where&" And id="&zm_name2
	Else
		IF zm_name<>"" Then kSql_where=kSql_where&" And (soojs_u_name like '%"&zm_name&"%' or soojs_u_email like '%"&zm_name&"%')"
	End IF

	sql="Select * from soojs_un Where "&kSql_where&" Order by "&kSql_order
	
	'Response.Write sql
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?soojs_status="&zsoojs_status&"&desc="&server.URLEncode(desc)&"&m_name="&server.URLEncode(m_name)&"&soojs_u_xiaxian="&ssoojs_u_xiaxian
%>

<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>用户管理选项</th>
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
						<Select name="soojs_status">
							<Option value="">身份认证</Option>
							<Option value="1">已认证</Option>
							<Option value="0">未认证</Option>
						</Select>					
						<select name="desc">
							<option value="" selected="selected">默认排序</option>
							<option value="soojs_date asc" selected="selected">注册时间升序</option>
							<option value="soojs_date desc" selected="selected">注册时间降序</option>
							<option value="soojs_lastdate asc" selected="selected">最后登陆时间升序</option>
							<option value="soojs_lastdate desc" selected="selected">最后登陆时间降序</option>							
							<option value="id desc">ID降序</option>
							<option value="id asc">ID升序</option>
							<option value="soojs_jifen asc,Id ASc">总积分升序</option>
							<option value="soojs_jifen Desc,Id ASc">总积分降序</option>
							<%IF G_xiaxian_1="1" Then%>
							<option value="soojs_u_tuiguang_numb asc,Id Desc">推广有效用户升序</option>
							<option value="soojs_u_tuiguang_numb desc,ID Desc">推广有效用户降序</option>
							<%End IF%>
						</select>
						用户名/E-mail：
						<input type = "Text" name = "m_name" style="width:200px;" id="m_name"> 
						</td>
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
	  [<a href="edit.asp">添加</a>]
	  提示：按id查询格式(id20)
	  [<a href="editindex.asp">按日期积分明细</a>]
	  [<a href="editindex2.asp">按用户积分排序</a>]
	  [<a href="editindex3.asp">总的积分明细</a>]
	  [<a href="editindex4.asp">同IP积分明细</a>]
	  </td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">全部用户管理</font></a></th>	
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
				<TD width="30%"    class=bodytitle><font color="#CC3300"><b>用户名-密码/Email</b></font></TD>
				<TD width="10%"   class=bodytitle><font color="#CC3300"><b>用户状态</b></font></TD>
				<TD   class=bodytitle><font color="#CC3300"><b>注册/登陆IP</b></font></TD>
				<TD width="13%"   class=bodytitle><font color="#CC3300"><b>注册/登陆时间</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>操作选项</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="{if(confirm('你确定要删除吗？\n删除将不再恢复！')){;this.form.Action.value='Del';this.form.action='edit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
			<%
			do while not rs.eof and rowcount > 0
				nId=rs("id")
				nsoojs_u_name=rs("soojs_u_name")	
				nsoojs_u_pass=rs("soojs_u_pass")
				nsoojs_date=rs("soojs_date")
				nsoojs_u_Webf=rs("soojs_u_Webf")
				onsoojs_u_Webf=IIf(nsoojs_u_Webf="0","未开通","<font color=blue>已开通</font>")
				nsoojs_status=rs("soojs_status")
				nsoojs_u_email=rs("soojs_u_email")
				nsoojs_jifen=rs("soojs_jifen")
				nsoojs_u_f1=rs("soojs_u_f1")
				nsoojs_lastdate=rs("soojs_lastdate")
				nsoojs_thisip=rs("soojs_thisip")
				nsoojs_lastip=rs("soojs_lastip")
				nsoojs_u_tuiguang=Bint(rs("soojs_u_tuiguang"))
				nsoojs_u_tuiguang_numb=Bint(rs("soojs_u_tuiguang_numb"))
				nsoojs_u_xiaxian=Bint(rs("soojs_u_xiaxian"))
				IF nsoojs_u_f1="1" Then
					nsoojs_u_f1_str="<a href='edit.asp?id="&nId&"&Action=soojs_u_f1&soojs_u_f1=0'><font color=red>被锁定</font></a>"
				Else
					nsoojs_u_f1_str="<a href='edit.asp?id="&nId&"&Action=soojs_u_f1&soojs_u_f1=1'><font color=blue>正常</font></a>"
				End IF
				
			%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><a href="../qingtiandy_jifen_product/uindexzhifu_form.asp?id=<%=nId%>" target="_blank"><%=nId%></a></td>
			<td nowrap="nowrap" class="forumRow">
			<%=Replace(left(nsoojs_u_name,50),zm_name,"<font color=red>"&zm_name&"</font>")%>/<%=nsoojs_u_pass%>
			<span style="color:#0000FF; cursor:pointer" onClick='DvWnd.open("增加积分-当前：<%=nsoojs_jifen%>","输入积分：<input name=\"add_j_<%=nId%>\" id=\"add_j_<%=nId%>\" size=6> <input type=button value=增加 onclick=\"add_jifen_u(<%=nId%>)\">",200,100,"0","",360)'>增加积分(<%=nsoojs_jifen%>)</span><br>
			<%=Replace(left(nsoojs_u_email,50),zm_name,"<font color=red>"&zm_name&"</font>")%>			
			<%
			IF G_xiaxian_1="1" or G_xiaxian_2="1" Then
				IF nsoojs_u_xiaxian<>0 Then
					Response.Write "&nbsp;&nbsp;<font color=blue>上线ID：<a href='?soojs_u_xiaxian="&nsoojs_u_xiaxian&"'><font color=red>"&nsoojs_u_xiaxian&"</font></a></font>"
				End IF
				IF nsoojs_u_tuiguang_numb<>0 Then
					Response.Write "&nbsp;&nbsp;<font color=blue>已推广：<a href='?soojs_u_xiaxian="&nId&"'><font color=red>"&nsoojs_u_tuiguang_numb&"</font></a></font>"
				End IF
			End IF
			%>
			</td>
			<td nowrap="nowrap" class="forumRow"><%=nsoojs_u_f1_str%></td>
			<td nowrap="nowrap" class="forumRow">
			  <%=nsoojs_thisip%><br>
			  <%=nsoojs_lastip%>		
			</td>
			
			<td nowrap="nowrap" class="forumRow">
			  <%IF ForMatDate(nsoojs_date,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(nsoojs_date,55)&"</font>" Else response.Write ForMatDate(nsoojs_date,55) %><br>
			  <%IF ForMatDate(nsoojs_lastdate,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(nsoojs_lastdate,55)&"</font>" Else response.Write ForMatDate(nsoojs_lastdate,55) %>			  </td>
			<td class="forumRow">
			<a href='editindex.asp?id=<%=nId%>' target="_blank"><img src="../images/down_3.gif" border="0" title="详情"></a>
			<%IF nsoojs_status="1" Then%>
			<a href='edit.asp?id=<%=nId%>&Action=soojs_status&soojs_status=0'><img src="../images/down_0.gif" border="0" title="取消身份认证"></a>
			<%Else%>
			<a href='edit.asp?id=<%=nId%>&Action=soojs_status&soojs_status=1'><img src="../images/down_1.gif" border="0" title="通过身份认证"></a>
			<%End IF%>
			<a href='edit.asp?id=<%=nId%>'><img src="../images/admin_top_icon_5.gif" border="0" title="编辑"></a>
			<a href='edit.asp?Id=<%=nId%>&Action=Del' onclick='{if (confirm("你确定要删除吗？\n删除将不再恢复！")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="删除此用户"></a>			</td>
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
		WriteLn("		soojs_status.value='" & Str4Js(zsoojs_status) & "';")
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