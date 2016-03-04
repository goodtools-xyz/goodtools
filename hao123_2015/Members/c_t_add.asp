<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="<%=G_WEBNAME%>用户中心，只要您注册了<%=G_WEBNAME%>账号，就可以享受<%=G_WEBNAME%>为您提供的所有个性化服务，只要您有一号在手，就可一站通行。" name="description">
<meta content="<%=G_WEBNAME%>用户中心,<%=G_WEBURL_2%>,用户中心,一站通" name="keywords">
<link rel="stylesheet" type="text/css" href="Ucss/reset.css" />
<link rel="stylesheet" type="text/css" href="Ucss/common.css" />
<link rel="stylesheet" type="text/css" href="Ucss/layout.css" />
<script type="text/javascript" src="Ujs/checkUser.js"></script>
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<title>添加新分类 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
pid=Bint(Request("id"))
%>
<script language="javascript">
<!--
function checkadd(){
	var c_typename
	c_typename=$_soojs("c_typename").value.Trim()
	if(c_typename==""){
		alert("分类名称不能为空!")
		$_soojs("c_typename").focus()
		return false
	}
}
-->
</script>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">添加新分类</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onsubmit="return checkadd()">
				<input type="hidden" name="id" value="0" id="id" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
                    <tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>			
					<%End IF%>	
                    <tr>
						<th>分类名称：</th>
						<td><input type="text" class="input-text" name="c_typename" id="c_typename" value=""  /></td>
						<td><em class="form-info" id="c_typename_1"></em></td>
					</tr>					
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="c_t_add"><input type="submit" class="button btn-blue" value="确定提交" /> <input type="button" class="button btn-gray" value="返回" onclick="window.location='./c_t_list.asp'"  /></td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = info;")
		WriteLn("	with(oForm){")
		Set rsObj = Conn.Execute( "SELECT * FROM qingtiandy_curl WHERE Id=" & sId )
		If not rsObj.Eof Then 
			WriteLn("		id.value='" & Str4Js(sId) & "';")
			WriteLn("		c_typename.value='" & Str4Js(rsObj.Fields.Item("c_typename").Value) & "';")
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>
<%
	If CLng(pid)>0 Then
		ShowInfo pid
	End If
%>
</body>
</html>