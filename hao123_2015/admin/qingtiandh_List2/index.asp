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
<title>酷站网站管理</title>
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
	kSql_order="m_no Desc,m_time desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	zm_type1=Request("m_type1")
	zm_type1=Bint(zm_type1)
	IF zm_type1<>0 Then 
		kSql_where=kSql_where& " And m_type1="&zm_type1
	End IF
		
	zm_look=Request("m_look")
	zm_look=StayNub(zm_look)
	IF zm_look<>"" Then kSql_where=kSql_where&" And m_look="&zm_look
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (m_name like '%"&zm_name&"%' or m_url like '%"&zm_name&"%')"

	sql="Select  * from qingtiandh_List2 Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?m_type1="&zm_type1&"&desc="&server.URLEncode(sDesc)&"&m_name="&server.URLEncode(zm_name)&"&m_look="&zm_look
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>酷站网址管理</th>
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
						<Select name="m_look">
							<Option value="">状态</Option>
							<Option value="1">显示</Option>
							<Option value="0">隐藏</Option>
						</Select>
						<Select name="m_type1" id="m_type1">
							<Option value="0">一级类别</Option>
						<%
							Set oRs_t=Server.CreateObject(G_RS)
							oRs_t.open "Select * from qingtiandh_ltype1 order by typehide asc,typeno asc,typeid asc",conn,1,1
							Do While Not oRs_t.Eof 
								kTypeid=oRs_t("typeid")
								kTypename=oRs_t("typename")
								IF Cstr(zm_type1)=Cstr(kTypeid) Then
									kS1=" Selected"
								Else
									kS1=""
								End IF
								
						%>
								<Option value="<%=kTypeid%>"<%=kS1%>><%=kTypename%></Option>
						<%		
								oRs_t.MoveNext
							Loop
							oRs_t.close:Set oRs_t=Nothing
						%>
						</Select>						
						<select name="desc">
							<option value="" selected="selected">默认排序</option>
							<option value="m_time asc" selected="selected">添加时间升序</option>
							<option value="m_time desc" selected="selected">添加时间降序</option>
							<option value="m_name">类别名a~z排序</option>
							<option value="m_name desc">类别名z~a排序</option>
							<option value="id desc">ID降序</option>
							<option value="id asc">ID升序</option>
							<option value="m_no asc ,m_time desc">权重升序</option>
							<option value="m_no desc ,m_time desc">权重降序</option>
						</select>
						<input type="hidden" value="" name="tops">
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
	  [<a href="edit.asp?m_type1=<%=zm_type1%>&m_type2=<%=zm_type2%>&m_type3=<%=zm_type3%>">添加</a>]
	  [<a href="Pin.asp?m_type1=<%=zm_type1%>&m_type2=<%=zm_type2%>&m_type3=<%=zm_type3%>">批量添加</a>]
	  <%=pTitle%>
	  </td>
	</tr>	
	<tr> 
		<td width="12%" height=25 class="forumRowHighlight" align="right"><B>类别选择</B> >></td>
		<td width="88%" height=25 class="forumRowHighlight">		
		<%
			Set oRs_t=Server.CreateObject(G_RS)
			oRs_t.open "Select * from qingtiandh_ltype1 order by typehide asc,typeno asc,typeid asc",conn,1,1
			Do While Not oRs_t.Eof 
				kTypeid=oRs_t("typeid")
				kTypename=oRs_t("typename")
				IF Cstr(zm_type1)=Cstr(kTypeid) Then
					kS1=" style='color:red'"
				Else
					kS1=""
				End IF				
				Response.Write "<a href='?m_type1="&kTypeid&"'"&kS1&">"&kTypename&"</a> "
				oRs_t.MoveNext
			Loop
			oRs_t.close:Set oRs_t=Nothing
		%>
		</td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?tops=all'><font color="#FFFFFF">酷站网址管理</font></a></th>	
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
				<TD colspan="2"    class=bodytitle><font color="#CC3300"><b>网站名</b></font></TD>
				<TD width="25%"   class=bodytitle><font color="#CC3300"><b>所属类别</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>权重</b></font></TD>
				<TD width="17%"   class=bodytitle><font color="#CC3300"><b>添加时间</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>操作选项</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="{if(confirm('你确定要删除吗？\n删除将不再恢复！')){;this.form.Action.value='Del';this.form.action='edit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>	
						
<%
IF rs.eof Then
%>	
			<TR height=25>			
				<TD colspan="8"   class=forumRow><div style="text-align:center">暂无网址，点这里<a href="edit.asp?m_type1=<%=zm_type1%>&m_type2=<%=zm_type2%>&m_type3=<%=zm_type3%>"><font color="#FF0000">添加</font></a>或点这里<a href="Pin.asp?m_type1=<%=zm_type1%>&m_type2=<%=zm_type2%>&m_type3=<%=zm_type3%>"><font color="#FF0000">批量添加</font></a></div></TD>
			</TR>	
<%
End IF
do while not rs.eof and rowcount > 0
	nId=rs("id")
	nl_type1=rs("m_type1")	
	nl_name=rs("m_name")
	nl_look=rs("m_look")
	nl_addtime=rs("m_time")
	n_typename1=Get_qingtiandh_type_name_s(nl_type1,4)
	n_url=rs("m_url")
	n_no=rs("m_no")
	nl_color=Getrp(rs("m_color"))
	n_lianmengid=GetRp(rs("lianmengid"))
	IF n_lianmengid="1" Then
		n_lianmengid_txt="<img src=""../images/down_3.gif"" border=""0"" title=""该链接是推广链接"">"
	Else
		n_lianmengid_txt=""
	End IF
	m_pic=rs("m_pic")
	IF m_pic<>"" Then
		m_pic_txt="<img src=""../images/haveimg.gif"" border=""0"">"
	Else
		m_pic_txt=""
	End IF
%>	

			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=nId%></td>
			<td nowrap="nowrap" class="forumRow">
			<%=m_pic_txt%>
			<a href='../../p_inc/turnto.asp?u=<%=n_url%>' target="_blank">
			<%
			IF nl_color="" Then
				Response.Write Replace(left(nl_name,20),zm_name,"<font color=red>"&zm_name&"</font>")
			Else
				Response.Write "<font color="&nl_color&">"&Replace(left(nl_name,20),zm_name,"<font color=red>"&zm_name&"</font>")&"</font>"
			End IF
			%>
			</a>
			<%=n_lianmengid_txt%>			</td>
			<TD  class=forumRow>
			<%
				m_pic=Get_Admin_r_pic(m_pic)
				IF m_pic<>"" Then 
					Response.Write "<img src='"&t_Dir(m_pic)&"' border=0>"
				End IF							
			%>							
			</td>
			<td nowrap="nowrap" class="forumRow"><a href='?m_type1=<%=nl_type1%>'><%=n_typename1%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=n_no%></td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(nl_addtime,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(nl_addtime,55)&"</font>" Else response.Write ForMatDate(nl_addtime,55) %></td>
			<td class="forumRow">
			<%IF nl_look="1" Then%>
			<a href='edit.asp?id=<%=nId%>&Action=l_look&m_look=0'><img src="../images/down_0.gif" border="0" title="隐藏此网站"></a>
			<%Else%>
			<a href='edit.asp?id=<%=nId%>&Action=l_look&m_look=1'><img src="../images/down_1.gif" border="0" title="显示此网站"></a>
			<%End IF%>
			<a href='edit.asp?id=<%=nId%>&m_type1=<%=nl_type1%>&m_type2=<%=nl_type2%>&m_type3=<%=nl_type3%>'><img src="../images/admin_top_icon_5.gif" border="0" title="编辑"></a>
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
	ShowInfo sId

	rs.Close:Set rs = Nothing
	CloseConn()
%>
</body>
</html>