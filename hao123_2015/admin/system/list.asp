
<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<%
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
%>
<html>
<head>
<title>管理员管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/style.css">
<SCRIPT language=javaScript src="../js/mouse_on_title.js" type=text/javascript></SCRIPT>

</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="24%"><img src="../images/admin.gif" width="200" height="66"></td>
    <td width="76%" valign="bottom"><div align="right"><%=G_WEBURL_2%></div></td>
  </tr>
  <tr bgcolor="#F6F6F6"> 
    <td height="20" class="forumRowHighlight"><font color="#333333">&nbsp;管理员控制面板 --&gt; 用户列表</font></td>
    <td height="20" valign="bottom" class="forumRowHighlight"> <table width="431" border="0" cellpadding="0" cellspacing="0">
        <form name="form1" method="post" action="">
          <tr> 
            <td width="151"><div align="right"><strong>[用户搜索]：</strong></div></td>
            <td width="144"> <div align="center"> 
                <input name="keyword" type="text" id="keyword">
              </div></td>
            <td width="84"><select name="act" id="act">
                <option value="zh" selected>登陆帐号</option>
                <option value="xm">用户姓名</option>
              </select></td>
            <td width="52"><input type="submit" name="Submit" value=" 搜 索 "></td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FF9900"> 
    <td height="1" colspan="2"></td>
  </tr>
</table>
<br>
<table width="97%" border="1" align="center" cellpadding="0" cellspacing="1" class="tableBorder">
  <tr> 
    <th width="13%" height="23" class="tableHeaderText"><div align="center">登陆帐号</div></th>
    <th width="12%"><div align="center" class="tableHeaderText">用户姓名</div></th>
    <th width="7%" class="tableHeaderText"><div align="center">性 别</div></th>
    <th class="tableHeaderText"><div align="center">联系电话</div></th>
    <th width="11%" class="tableHeaderText"><div align="center">帐号状态</div></th>
    <th width="28%" class="tableHeaderText"><div align="center">操 作</div></th>
  </tr>
  <%  keyword=replace(trim(request("keyword")),"'","")
      act=request("act")
	  if act="" then act="zh"
	  set rs=server.CreateObject("adodb.recordset")
	if session("login_level")=4 then   '系统管理员，管理全部
	  if act="zh" then 
	  sql="select * from tbl_admin where str_username like '%"&keyword&"%' order by id desc"
	  else 
	  sql="select * from tbl_admin where str_name like '%"&keyword&"%' order by id desc"
	  end if
	else
		'超级管理员，不能管理系统管理员
		com_id=session("login_comid")
		if act="zh" then
			'sql="select * from tbl_admin where str_username like '%"&keyword&"%' and str_level<>4 and com_id="&com_id&" order by id desc"
			sql="select * from tbl_admin where str_username like '%"&keyword&"%' and str_level<>4  order by id desc"
		else
			sql="select * from tbl_admin where str_name like '%"&keyword&"%' and str_level<>4 order by id desc"
		end if
	end if
	  rs.open sql,conn,1,3
	  if rs.eof then
	%>
  <tr bgcolor="#F6F6F6"> 
    <td height="24" colspan="6"> &nbsp;&nbsp;没有用户信息...</td>
  </tr>
  <%else
rs.pagesize =15  '设置每页显示记录条数
if request("page")=""or not IsNumeric(request("page")) or isempty(request("page")) then
page = 1
else
page=int(request("page"))
end if
if page>rs.pagecount then
page=rs.pagecount
end if
if not rs.BOF then
rs.Move rs.PageSize*(page-1)
end if
i=1
while not rs.eof and i<=rs.pagesize
		%>
  <tr  onMouseOut="this.style.backgroundColor='#F6F6F6'" onMouseOver="this.style.backgroundColor='#EEEEEE'"> 
    <td height="24"><div align="center"><font color="#666666"><%=rs("str_username")%> 
        </font></div></td>
    <td><div align="center"><font color="#666666"> 
        <%if trim(rs("str_name"))="" or isnull(rs("str_name"))=true then response.Write("<a href='#' title=' ===个人资料=== "&vbcrlf&"职务："&rs("str_job")&vbcrlf&"电话："&rs("str_tel")&vbcrlf&"E-mail："&rs("str_mail")&"'>无名氏</a>") else response.Write("<a href='#' title=' &nbsp;&nbsp;&nbsp;&nbsp;=== <b>个人资料</b> ===&nbsp;&nbsp;&nbsp;&nbsp; <br>职务："&rs("str_job")&"<br>电话："&rs("str_tel")&"<br>E-mail："&rs("str_mail")&"'>"&rs("str_name")&"</a>")%>
        </font></div></td>
    <td><div align="center">&nbsp;<%=rs("str_sex")%>&nbsp;</div></td>
    <td><div align="center">&nbsp;<%=rs("str_tel")%>&nbsp;</div></td>
    <td><div align="center"><font color="#666666"> 
        <%if rs("flag")=0 then response.Write("正常状态") else response.Write("<font color='#ff0000'>锁定状态</font>")%>
        </font></div></td>
    <td> <div align="center">[<a href="modify.asp?id=<%=rs("id")%>">修改</a>] 
        <%if rs("str_username")<>session("login_username") then%>
        [<a href="delete.asp?id=<%=rs("id")%>&page=<%=request("page")%>&act=<%=request("act")%>&keyword=<%=request("keyword")%>" onClick="return confirm('确定删除吗？')">删除</a>] 
        <%end if%>
        [ 
        <%if rs("flag")=0 then%>
        <a href="lock.asp?id=<%=rs("id")%>&page=<%=request("page")%>&act=<%=request("act")%>&keyword=<%=request("keyword")%>&flag=1" onClick="return confirm('确定进行帐号的封存吗？')">封存帐号</a> 
        <%else%>
        <a href="lock.asp?id=<%=rs("id")%>&page=<%=request("page")%>&act=<%=request("act")%>&keyword=<%=request("keyword")%>&flag=0" onClick="return confirm('确定进行帐号的解封吗？')">解封帐号</a> 
        <%end if%>
        ] </div></td>
  </tr>
  <%
i=i+1
 rs.MoveNext                                              
 wend 
%>
  <tr bgcolor="#F6F6F6"> 
    <td height="24" colspan="6"> <div align="center"><br>
        <%'********分页代码*******				
if rs.recordcount<>0 then
if page-1 mod 10=0 then
		p=(page-1) \ 10
	else
		p=(page-1) \ 10
	end if

	response.write "<form name=form method=post action=>页次："& page &"/"& rs.pagecount &"页 每页"& rs.pagesize &" 共"& rs.recordcount &"条记录"&_
					" 分页："

	if p*10>0 then response.write "<a href='?page="&p*10&"' title=上十页>[&lt;&lt;]</a>   "
    uming_i=1
	for ii=p*10+1 to P*10+10
		   if ii=page then
	          response.write "<font color=#ff0000>["+Cstr(ii)+"]</font> "
		   else
		      response.write "<a href='?page="&ii&"'>["+Cstr(ii)+"]</a>   "
		   end if
		if ii=rs.pagecount then exit for
		 uming_i=uming_i+1
	next
	if ii<=rs.pagecount and uming_i=11 then response.write "<a href='?page="&ii&"' title=下十页>[&gt;&gt;]</a>   "
response.write(" 　跳页：<input type=text name=page size=3 maxlength=10 class=button> <input type=submit name=Submit2 value=Go class=button></form>")
end if
'********分页代码******%>
      </div></td>
  </tr>
  <%end if
rs.close
set rs=nothing	
%>
</table>
<div align="center"></div>
</body>
</html>


