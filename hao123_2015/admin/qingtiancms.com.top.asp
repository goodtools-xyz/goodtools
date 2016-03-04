<html>
<head>
<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->

<title><%=G_WEBNAME & "--后台管理页面"%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="css/style.css" rel=stylesheet type=text/css>
<base target="main">
<script language="JavaScript" type="text/JavaScript">
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("Image/admin_top_open.gif");

var displayBar=true;
function switchBar(obj)
{
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.src="Images/admin_top_open.gif";
		obj.title="打开左边管理导航菜单";
	}
	else{
		parent.frame.cols="180,*";
		displayBar=true;
		obj.src="Images/admin_top_close.gif";
		obj.title="关闭左边管理导航菜单";
	}
}
</script>
</head>

<body background="Images/admin_top_bg.gif" leftmargin="0" topmargin="0">
<table width="100%" height="25" border=0 cellpadding=0 cellspacing=0 background="images/admin_bg_2.gif">
<tr valign=middle>
	<td >&nbsp;<img src="images/i_home.gif" width="16" height="18" align="top">	</td>
	<td ><a href=<%=Add_Root_Dir("/")%> target="_blank">返回网站首页</a></td>
	<td >&nbsp;<img src="Images/admin_top_close.gif" width="70" height="13" style="cursor:hand" title="关闭左边管理导航菜单" onClick="switchBar(this)"></td>
	<td >
		<img src="Images/admin_top_icon_1.gif" width="13" height="13" align="absmiddle">	</td>
	<td >
	<a href="system/admin.asp" target="main">修改管理员密码</a>	</td>
	<td >
	<img src="images/i_home.gif" width="16" height="18" align="top"> <a href='http://www.go569.com/' target="_blank">官方首页</a>&nbsp;
	<img src="images/i_home.gif" width="16" height="18" align="top"> <a href='http://www.go590.com' target="_blank">官方博客</a>	
	</td>
	
	<td align="right"></td>
</tr>
</table>

</body>
</html>
