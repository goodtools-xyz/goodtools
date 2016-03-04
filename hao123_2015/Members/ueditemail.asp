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

<title>修改邮箱 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
%>
<script language="javascript">
<!--
function checkadd(){
	var soojs_u_p,soojs_u_email
	soojs_u_p=$_soojs("soojs_u_p").value.Trim()
	soojs_u_email=$_soojs("soojs_u_email").value.Trim()
	if(soojs_u_p==""){
		alert("密码不能为空")
		$_soojs("soojs_u_p").focus()
		return false
	}	
	if(soojs_u_email==""){
		alert("新邮箱不能为空")
		$_soojs("soojs_u_email").focus()
		return false
	}	
	if(!soojs_u_email.match(/^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig)){
		alert("新邮箱格式不对")
		$_soojs("soojs_u_email").focus()
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
					<h3 class="font-14 fl">修改邮箱</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onsubmit="return checkadd()">
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
                    <tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>			
					<%End IF%>	
					<tr>
                      <th width="110">邮箱：</th>
                      <td width="267"><%=zsoojs_u_email%></td>
                      <td width="223"><em class="form-info" id="email-msg"></em></td>
					</tr>
					<tr>
						<th>密码：</th>
						<td><input type="password" class="input-text" name="soojs_u_p" id="soojs_u_p" value="" /></td>
						<td><em class="form-info" id="passwd-msg"></em></td>
					</tr>
					<tr>
                      <th></th>
                      <td><span>请输入登录密码！</span></td>
                      <td></td>
					</tr>	
					<tr>
						<th>新邮箱：</th>
						<td><input type="text" class="input-text" name="soojs_u_email" id="soojs_u_email" value="" onchange="checkemail_f()" /></td>
						<td><em class="form-info" id="new_email-msg"></em></td>
					</tr>
					<tr>
                      <th></th>
                      <td></td>
					</tr>									
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="editemail"><input type="submit" class="button btn-blue" value="确认" /> <input type="button" class="button btn-gray" value="返回" onclick="window.location='./'"  /></td>
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
<DIV id=check_username_script style="DISPLAY: none"></DIV>
</body>
</html>