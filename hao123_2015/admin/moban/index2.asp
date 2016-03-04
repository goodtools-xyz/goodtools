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
<title>其他模板管理</title>
</head>
<body>

<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>其他模板管理</th>
	</tr>

	<FORM name=form action="index3.asp" method=post>
	<tr>
		<td width="13%" height=25 class="forumRowHighlight">
		<B>文件的路径：</B></td>
		<td width="87%" class=forumRowHighlight>
		  <input name="t1" type="text" value="/index.html" size="70">&nbsp;
		  <input type="checkbox" name="auto" value="1">自动创建不存在的文件
		<input type="submit" value="编辑" id=submit name=submit>&nbsp;&nbsp;<font color="#FF0000">以/开始</font>
	  </td>
	</tr>
	</form>
</table>

</body>
</html>