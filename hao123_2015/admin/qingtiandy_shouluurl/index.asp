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
<title>全部网站管理</title>
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
	kSql_order="m_status Asc ,m_time desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	zm_type1=Request("m_type1")
	zm_type1=Bint(zm_type1)
	IF zm_type1<>0 Then 
		kSql_where=kSql_where& " And m_type1="&zm_type1
	End IF

	zm_type2=Request("m_type2")
	zm_type2=Bint(zm_type2)
	IF zm_type2<>0 Then 
		kSql_where=kSql_where& " And m_type2="&zm_type2
	End IF
	
	zm_type3=Request("m_type3")
	zm_type3=Bint(zm_type3)
	IF zm_type3<>0 Then 
		kSql_where=kSql_where& " And m_type3="&zm_type3
	End IF
		
	zm_status=Request("m_status")
	zm_status=StayNub(zm_status)
	IF zm_status<>"" Then kSql_where=kSql_where&" And m_status="&zm_status
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (m_name like '%"&zm_name&"%' or m_url like '%"&zm_name&"%')"

	sql="Select * from qingtiandy_shouluurl  Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?m_type1="&zm_type1&"&desc="&server.URLEncode(sDesc)&"&m_name="&server.URLEncode(zm_name)&"&m_look="&zm_look&"&m_type3="&zm_type3&"&m_type2="&zm_type2
%>
<!--#include file="../inc/headpage.asp"-->

<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">收录申请管理</font></a></th>	
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
				<TD width="26%"    class=bodytitle><font color="#CC3300"><b>网站名</b></font></TD>
				<TD width="4%"    class=bodytitle><font color="#CC3300"><b>友情</b></font></TD>
				<TD width="25%"   class=bodytitle><font color="#CC3300"><b>所属类别</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>查看</b></font></TD>
				<TD width="17%"   class=bodytitle><font color="#CC3300"><b>申请时间</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>操作选项</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="{if(confirm('你确定要删除吗？\n删除将不再恢复！')){;this.form.Action.value='Del';this.form.action='edit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%

do while not rs.eof and rowcount > 0
	nId=rs("id")
	nl_type1=rs("m_type1")	
	nl_type2=rs("m_type2")
	nl_type3=rs("m_type3")
	nl_name=rs("m_name")
	nm_status=rs("m_status")
	nl_addtime=rs("m_time")
	n_typename1=Get_qingtiandh_type_name_s(nl_type1,1)
	n_typename2=Get_qingtiandh_type_name_s(nl_type2,2)
	n_typename3=Get_qingtiandh_type_name_s(nl_type3,3)
	n_url=rs("m_url")
	n_m_youqing=rs("m_youqing")
	IF n_m_youqing="0" Then 
		on_m_youqing="否"
	Else
		on_m_youqing="<font color=red>是</font>"
	End IF
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=nId%></td>
			<td nowrap="nowrap" class="forumRow"><a href='../../p_inc/turnto.asp?u=<%=n_url%>' target="_blank">
			<%
			IF nl_color="" Then
				Response.Write Replace(left(nl_name,20),zm_name,"<font color=red>"&zm_name&"</font>")
			Else
				Response.Write "<font color="&nl_color&">"&Replace(left(nl_name,20),zm_name,"<font color=red>"&zm_name&"</font>")&"</font>"
			End IF
			%>
			</a></td>
			<td nowrap="nowrap" class="forumRow"><%=on_m_youqing%></td>
			<td nowrap="nowrap" class="forumRow"><a href='?m_type1=<%=nl_type1%>'><%=n_typename1%></a>/<a href='?m_type1=<%=nl_type1%>&m_type2=<%=nl_type2%>'><%=n_typename2%></a>/<a href='?m_type1=<%=nl_type1%>&m_type2=<%=nl_type2%>&m_type3=<%=nl_type3%>'><%=n_typename3%></a></td>
			<td nowrap="nowrap" class="forumRow"><a href='edit.asp?id=<%=nId%>&m_type1=<%=nl_type1%>&m_type2=<%=nl_type2%>&m_type3=<%=nl_type3%>'>查看详情</a></td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(nl_addtime,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(nl_addtime,55)&"</font>" Else response.Write ForMatDate(nl_addtime,55) %></td>
			<td class="forumRow">
			<%IF nm_status="1" Then%>
			<img src="../images/down_0.gif" border="0" title="已入库">
			<%Else%>
			<a href='edit.asp?id=<%=nId%>&Action=l_look&m_look=1'><img src="../images/down_1.gif" border="0" title="快速审核此网站"></a>
			<%End IF%>

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
		WriteLn("		m_look.value='" & Str4Js(zm_look) & "';")
		WriteLn("		m_name.value='" & Str4Js(zm_name) & "';")
		WriteLn("		desc.value='" & Str4Js(sDesc) & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>	
<%
	'ShowInfo sId

	rs.Close:Set rs = Nothing
	CloseConn()
%>
</body>
</html>