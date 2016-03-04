<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%

	IF request.QueryString("action")="editsave" Then
		call editsave()
	Else 
		call main()
	End IF

%>
<%Sub main()%>
<script LANGUAGE="JavaScript">
function check()
{
if (document.Form1.username.value=="")
{
alert("请输入登陆名！")
document.Form1.username.focus()
document.Form1.username.select()
return
}
if (document.Form1.password.value=="")
{
alert("请输入密码！")
document.Form1.password.focus()
document.Form1.password.select() 
return
}
document.Form1.submit()
}
</SCRIPT>
<LINK href="../css/style.css" rel=stylesheet type=text/css> 
<body marginheight=0 marginwidth=0 leftmargin=0>

<center>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
<TR>
<TD align="center">
<FORM action="admin.asp?action=editsave" method="post" name="Form1">
<TABLE width=100% border="0" cellPadding=2 cellSpacing=1 class="tableBorder">
  <tr> 
     <th height=25 colspan="2" class="tableHeaderText">管理员管理－－修改管理员 </th> 
  </tr>
<TR> 
<TD width="17%" height="28" align="right" class=forumRow>用&nbsp;户&nbsp;名：</td>
<TD width="83%"><font color="#FFFFFF">&nbsp;&nbsp;<input type=text name=username size="40" class="smallInput" value="<%=request.Cookies(Sky_Admin_Cookies_1)("admin_u")%>" readonly=""></font></TD>
</TR>
<TR>
<TD align="right" height="28" class=forumRow>密&nbsp;&nbsp;&nbsp;&nbsp;码：</TD>
<TD><font color="#FFFFFF">&nbsp;&nbsp;<input type=password name=password size="40" class="smallInput" value="">
</font></TD>
</TR>

<TR>
<TD colspan=2 height="28" align="center" class="forumRowHighlight"> 
  <input type="button" value="修 改" class="smallInput" onclick=check()>&nbsp;&nbsp;&nbsp;</TD>
</TR>
</TABLE>
</FORM>
</TD>
</TR>
</TABLE>
<%End Sub%>
<%
Sub editsave()
	Dim rs_admin_save,rs_admin_sql,admin_u,admin_p
	admin_u=request.Form("username")
	admin_p=Replace(Trim(Request.Form("Password")),"'","''")
	Set rs_admin_save=server.CreateObject(G_RS)
	rs_admin_sql="select * from [tbl_admin] where [str_username]='"&request.Cookies(Sky_Admin_Cookies_1)("admin_u")&"'"
	rs_admin_save.open rs_admin_sql,Conn,1,3
	rs_admin_save("str_username")=admin_u
	rs_admin_save("str_pass")=md5(admin_p,16)
	rs_admin_save.update
	If Err Then
		Err.Clear
		Set Conn = Nothing
		strShowErr="用户名或密码错误不合法"
		Response.Redirect("../qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=admin.asp")
		response.End()
	Else
		response.Cookies(Sky_Admin_Cookies_1)("admin_u")=rs_admin_save("str_username")
		response.Cookies(Sky_Admin_Cookies_1)("admin_p")=rs_admin_save("str_pass")
		strShowErr="成功修改管理员密码！"
		Response.Redirect("../qin"&"gtianc"&"ms.co"&"m.s"&"ucce"&"ss.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=system/admin.asp&c=1")
		Response.End()
	End If
End Sub
%>
