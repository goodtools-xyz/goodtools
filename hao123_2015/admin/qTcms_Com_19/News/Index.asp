<!--#include file="../../../p_inc/Include_func.asp"-->
<!--#include file="../../inc/public.asp"-->
<!--#include file="../../inc/openconn.asp"-->
<!--#include file="Config.asp"-->
<%


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../../css/style.css" rel=stylesheet type=text/css>
<title><%=G_16_Title%></title>
<script src="../../js/mouse_on_title.js"></script>
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
m_name=Replace_Text(Trim(request("m_name"))):m_name2=m_name
m_type1=Replace_Text(Trim(request("m_type1"))):m_type12=m_type1:m_type13=m_type12
m_type2=Bint(Trim(request("m_type2"))):m_type22=Cstr(m_type2)
desc1=Replace_Text(Trim(request("desc1")))

IF desc1="" Then desc1="n_numb desc,id desc" 
desc12=desc1
m_look=Replace_Text(Trim(request("m_look"))):m_look2=m_look

sql=qtcmsdh.J1616_m("16","4",G_16_Table,m_name2,m_type12,m_look2,desc12,m_type22,"","")

a_G_16_Title=G_16_n_type1_a(Bint(m_type13))
a_G_16_Title_1=a_G_16_Title
IF Instr(a_G_16_Title,"||")>0 Then
	a_G_16_Title_a=Split(a_G_16_Title,"||")
	a_G_16_Title_1=a_G_16_Title_a(0)
End IF
G_16_Title=a_G_16_Title_1&""

'Response.Write sql

Set rs=server.CreateObject(G_RS)
rs.open sql,conn,1,1 
IF request.Cookies("page_n")="" then
	msg_per_page=15
else
	msg_per_page=Cint(request.Cookies("page_n"))
end if
'msg_per_page=20 '定义每页显示记录条数
%>
<!--#include file="../../inc/headpage.asp"-->

<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center>
	<tr>
		<td  class=forumRowHighlight align="center"><a href="../ad.asp"><b>返回首页模块图</b></a></td>
	</tr>	
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>


<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
	<tr> <th class="tableHeaderText" colspan=2 height=25>《<%=G_16_Title%>》管理</th></tr>
	<FORM name=form action="?" method=post>
	<tr>
		<td width="12%" height=25 class="forumRowHighlight" >
		<B>管理操作选项</B></td>
		<td width="88%" class=forumRowHighlight>
		关键字：<input name="m_name" type="text" value="<%=m_name%>">
		<select name="m_type1">
			<option value="">全部分类</option>
			<%
				For i=0 To Ubound(G_16_n_type1_a)
					k1_1=G_16_n_type1_a(i)
					k1=k1_1
					IF Instr(k1_1,"||")>0 Then
						k1_1_a=SPlit(k1_1,"||")
						k1=k1_1_a(0)
					End IF
					k2=""
					IF Cstr(m_type1)=Cstr(i) Then
						k2=" selected=""selected"""
						IF Instr(k1_1,"||")>0 Then
							k1_1_a=SPlit(k1_1,"||")
							k1_str="<tr>"
							k1_str=k1_str&"<td height=25 class=""forumRowHighlight"" align=""right""></td>"
							k1_str=k1_str&"<td height=25 class=""forumRowHighlight"">"
							k1_str=k1_str&"<a href='?m_type1="&m_type1&"'><B>"&k1&"</B></a> >>"
							For pi=1 To UBound(k1_1_a)
								IF Cstr(m_type2)=Cstr(pi) Then
									kS1=" style='color:red'"
								Else
									kS1=""
								End IF							
								k1_str=k1_str&"<a href='?m_type1="&m_type1&"&m_type2="&pi&"'"&kS1&">"&k1_1_a(pi)&"</a> "
							Next
							k1_str=k1_str&"</td>"
							k1_str=k1_str&"</tr>"
						End IF							
					Else
						k2=""
					End IF
					Response.Write "<option value="""&i&""" "&k2&">"&k1&"</option>"
				Next
			%>
		</select>
		<select name="desc1">
			<option value="">选择排序方式</option>
			<option value="id asc">ID递增</option>
			<option value="id desc">ID递减</option>
			<option value="n_hits asc">点击递增</option>
			<option value="n_hits desc">点击递减</option>
			<option value="n_numb asc">权重递增</option>
			<option value="n_numb desc">权重递减</option>	
			<option value="n_date Asc,n_date Asc">时间递增</option>	
			<option value="n_date Desc,id Desc">时间递减</option>
		</select>
		<input type="submit" value="立刻查找" id=submit name=submit>&nbsp;&nbsp;&nbsp;&nbsp;
		[<a href="javascript:location.reload()">刷新页面</a>]		
		[<a href="edit.asp?n_type1=<%=m_type1%>&n_type2=<%=m_type2%>">添加数据</a>]	
		</td>
	</tr>	
	<%=k1_str%>	
	</form>
</table>
<Form name="search" method="POST" action="admin_check.asp">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th height=25 class="tableHeaderText"><a href="?m_type1=<%=m_type1%>"><font color="#FFFFFF">《<%=G_16_Title%>》信息列表</font></a></th>	
        <th height=25 class="tableHeaderText">
		<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='index.asp'">
		<option value="">每页显示条数</option>
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
	</tr> 
				
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#111111" bordercolorlight="#D7EBFF" bordercolordark="#D7EBFF" style="border-collapse: collapse">
    			<TBODY>
				<%
				if rs.eof then
					response.Write"<br><br><div align='center'>暂无数据信息</div><br><br><div align='center'><a href='edit.asp?n_type1="&m_type1&"&n_type2="&m_type2&"'>点此添加</a></div>"
				else
				%>
					<TR height=25> 
					 	<TD height="20" class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
						<TD colspan="2" class=bodytitle><font color="#CC3300"><b>标题</b></font></TD>
						<TD class=bodytitle><font color="#CC3300"><b>权重</b></font></TD>
						<TD class=bodytitle><font color="#CC3300"><b>类别</b></font></TD>
					  	<TD class=bodytitle><font color="#CC3300"><b>发布时间</b></font></TD>
						<TD align=center class=bodytitle><font color="#CC3300"><b>操作选项</b></font></TD>
				      	<TD align="center" class=bodytitle><input type='submit' value='删除' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='func.asp?tag=News_del';this.form.submit();return true;}return false;}"></TD>
					</TR>
					<%do while not rs.eof and rowcount > 0%>
					<TR height="20"> 
					  <TD  class=forumRow nowrap="nowrap">
					  <%=rs("id")%>					  
					  </td>
					  <%
					  %>
						<TD  class=forumRow>	
						<%
							n_gotourl=GetUrl_httpAll(GetRp(rs("n_gotourl")))
						%>						
							<a href=<%=n_gotourl%> target="_blank"><%="<font color='"&rs("n_color")&"'>"&rs("n_title")&"</font>"%></a>	
							<%					
								n_lianmengid=GetRp(rs("lianmengid"))
								IF n_lianmengid="1" Then
									n_lianmengid_txt="<img src=""../../images/down_3.gif"" border=""0"" title=""该链接是推广链接"">"
								Else
									n_lianmengid_txt=""
								End IF							
							
								IF GetRp(rs("n_title2"))<>"" Then
									Response.Write " | <a href="""&rs("n_gotourl2")&""" target=""_blank"">"&GetRp(rs("n_title2"))&"</a>"
								End IF
							
								ouid=Bint(rs("uid"))
								IF ouid<>0 Then
									Response.Write "<font color=blue>Uid:"&ouid&"</font>"
								End IF
								Response.Write " "&n_lianmengid_txt
							%>
						</td>
						<TD  class=forumRow>
						<%
							on_pic=GetRp(Rs("n_pic"))
							on_pic=Get_Admin_r_pic(on_pic)
							IF on_pic<>"" Then 
								Response.Write "<img src='"&t_Dir(on_pic)&"' border=0>"
							End IF							
						%>							
						</td>
						<TD  class=forumRow><%=rs("n_numb")%></td>
						<TD  class=forumRow>
					  <%
					  	oom_type1=rs("n_type1")
						oom_type2=Bint(rs("n_type2"))
						For i=0 To Ubound(G_16_n_type1_a)
							k1_1=G_16_n_type1_a(i)
							k1=k1_1
							IF Instr(k1_1,"||")>0 Then
								k1_1_a=SPlit(k1_1,"||")
								k1=k1_1_a(0)
							End IF
							k2=""
							IF Cstr(oom_type1)=Cstr(i) Then
								response.Write "<a href=?m_type1="&oom_type1&">"&k1&"</a>"
								IF Instr(k1_1,"||")>0 Then
									k1_1_a=SPlit(k1_1,"||")
									For pi=1 To UBound(k1_1_a)
										IF Cstr(oom_type2)=Cstr(pi) Then
											response.Write " - <a href=?m_type1="&oom_type1&"&m_type2="&pi&">"&k1_1_a(pi)&"</a>"
										End IF
									Next
								End IF									
							End IF
						Next		
						
						%>					  </td>
					  <TD  class=forumRow><%IF ForMatDate(rs("n_date"),5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(rs("n_date"),55)&"</font>" Else response.Write ForMatDate(rs("n_date"),55) %></td>
						<TD align=center class=forumRow>
						<a href=edit.asp?id=<%=rs("id")%>&n_type1=<%=Rs("n_type1")%>&n_type2=<%=rs("n_type2")%>><img src="../../images/admin_top_icon_5.gif" border="0" title="修改"></a>
						<%
						IF rs("n_look")=0 Then
							response.Write "<a href='func.asp?tag=News_show&selAnnounce="&rs("id")&"'><img src='../../images/down_1.gif' border='0' title='显示此信息'></a>"
						Else
							response.Write "<a href='func.asp?tag=New_hide&selAnnounce="&rs("id")&"'><img src='../../images/down_0.gif' border='0' title='隐藏此信息'></a>"
						End IF
						
						%>
						<a href='func.asp?tag=News_del&selAnnounce=<%=rs("id")%>'><img src="../../images/cha.gif" border="0" title="删除"></a>
						<a href='func.asp?tag=News_datet&selAnnounce=<%=rs("id")%>'><img src="../../images/down_2.gif" border="0" title="更新发布时间"></a>						</td>
					  <TD  align="center" class=forumRow><input type=checkbox name=selAnnounce value="<%=cstr(rs("ID"))%>" id='c_<%=rs("id")%>'></td>
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
	<td width="91%" class=forumRow >
	<input type='submit' value='删除' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='func.asp?tag=News_del';this.form.submit();return true;}return false;}">&nbsp;
	<input type='submit' value='显示' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='func.asp?tag=News_show';this.form.submit();return true;}return false;}">&nbsp;
	<input type='submit' value='隐藏' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='func.asp?tag=New_hide';this.form.submit();return true;}return false;}">&nbsp;
	<input type='submit' value='更新发布时间' onClick="{if(confirm('您确定执行的操作吗?')){;this.form.action='func.asp?tag=News_datet';this.form.submit();return true;}return false;}">&nbsp;
	</td>
	<td width="9%" class=forumRow align="center" ><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall>全选</td>
	</tr>
	<tr>
	<td class=forumRow colspan="2">&nbsp;</td>
	</tr>
	<tr>
	<td colspan="2" align="center" class=forumrowHighLight><b><%=listPages("?m_name="&m_name&"&m_type1="&m_type1&"&m_type2="&m_type2&"&desc1="&server.URLEncode(desc1)&"&m_look="&m_look)%></b></td></tr>
</table>
</form>
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = form;")
		WriteLn("	with(oForm){")
		WriteLn("		desc1.value='" & Str4Js(desc1) & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>	
<%
	ShowInfo sId
%>
</body>
</html>