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
<title>点入点出记录</title>
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
function st(value){var obj=eval(document.getElementById(value));obj.style.display=(obj.style.display=='none')?'':'none';}
</script>
</head>
<body>
<%
	s_page=""
	IF request.Cookies("page_n")="" then
		msg_per_page=5
	else
		msg_per_page=Cint(request.Cookies("page_n"))
	end if
	kSql_where="id>0"
	kSql_order="id Desc"
	
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then kSql_order=sDesc
		
	sinout=Trim(Request("inout"))
	IF sinout<>"" Then kSql_where=kSql_where&" And inout="&sinout
			
			
	zw_status=Request("w_status")
	zw_status=StayNub(zw_status)
	IF zw_status<>"" Then kSql_where=kSql_where&" And w_status="&zw_status
	
	sdomain=Replace_Text_2008(Request("domain"))
	IF sdomain<>"" Then kSql_where=kSql_where&" And (w_domain like '%"&sdomain&"%')"	
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (w_domain like '%"&zm_name&"%' or ip like '%"&zm_name&"%' or come like '%"&zm_name&"%')"

	sql="Select * from qingtiandy_urllog Where "&kSql_where&" Order by "&kSql_order
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?inout="&sinout&"&desc="&server.URLEncode(sdesc)&"&m_name="&server.URLEncode(zm_name)&"&w_status="&zw_status&"&domain="&sdomain
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>点入点出记录</th>
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
						<Select name="inout">
							<Option value="">全部记录</Option>
							<Option value="1">点出记录</Option>
							<Option value="0">点入记录</Option>
						</Select>
						关键词：
						<input type = "Text" name = "m_name" style="width:200px;"> 
						<input type="submit" value="立刻查找" id="submit" name="submit" style="cursor:hand;">
						</td>
				</tr>
			</table>
		</DIV>
	  </td>
	</tr>	
	<tr>
		<td width="12%" height=25 class="forumRowHighlight">
		<B>管理操作选项</B></td>
		<td width="88%" class=forumRowHighlight>
		  [<a href="index.asp">全部记录</a>]
		  [<a href="index.asp?inout=0">点入记录</a>] 
		  [<a href="index.asp?inout=1">点出记录</a>]
		  [<a href="javascript:location.reload()">刷新页面</a>]
	  </td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">点入点出记录</font></a></th>	
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
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
				<TD width="29%"    class=bodytitle><font color="#CC3300"><b>网站地址</b></font></TD>
				<TD width="7%"   class=bodytitle><font color="#CC3300"><b>状态</b></font></TD>
				<TD width="11%"   class=bodytitle><font color="#CC3300"><b>时间</b></font></TD>
				<TD width="15%"   class=bodytitle><font color="#CC3300"><b>IP地址</b></font></TD>
				<TD width="15%"   class=bodytitle><font color="#CC3300"><b>来源页面</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>选项</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="{if(confirm('你确定要删除吗？\n删除将不再恢复！')){;this.form.Action.value='Del';this.form.action='edit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%
do while not rs.eof and rowcount > 0
	oId=rs("id")
	ow_domain=rs("w_domain")
	oip=rs("ip")
	ocome=rs("come")
	oinout=rs("inout")
	odateandtime=rs("dateandtime")
	oinout=rs("inout")
	ooinout=IIF(oinout=0,"<font color=#FF0000>点入</font>","<font color=#0000FF>点出</font>")
	oocome=IIf(trim(ocome)="","无","<a href=""../../p_inc/turnto.asp?u="&ocome&""" target=""_blank"">"&left(ocome,30)&"</a>")
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=oId%></td>
			<td nowrap="nowrap" class="forumRow">
			<%
			Response.Write Replace(ow_domain,zm_name,"<font color=red>"&zm_name&"</font>")
			%>
			</td>
			<td nowrap="nowrap" class="forumRow"><%=ooinout%></td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(odateandtime,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(odateandtime,77)&"</font>" Else response.Write ForMatDate(odateandtime,77) %></td>
			<td nowrap="nowrap" class="forumRow"><%="<a href='../../p_inc/turnto.asp?u=http://www.ip138.com/ips.asp?ip="&rs("ip")&"' title='查询此IP地址所在区域' target='_blank'>"&rs("ip")&"</a>"%></td>
			<td nowrap="nowrap" class="forumRow"><%=oocome%></td>
			<td class="forumRow">
			<a href='edit.asp?Id=<%=oId%>&Action=Del' onclick='{if (confirm("你确定要删除吗？\n删除将不再恢复！")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="删除此记录"></a>			</td>
			<TD  align="center" class=forumRow><input type=checkbox name=id value="<%=oId%>"></td>
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
		WriteLn("		inout.value='" & Str4Js(sinout) & "';")
		WriteLn("		m_name.value='" & Str4Js(zm_name) & "';")
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