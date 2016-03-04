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
<title>站长验证 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<script language="javascript">
<!--
function checkadd(){	
	if(bytes($_soojs("soojs_uu_name").value)<4||bytes($_soojs("soojs_uu_name").value)>8){
		alert("姓名为2-4个字的中文名")
		$_soojs("soojs_uu_name").focus()
		return false
	}
	if($_soojs("soojs_u_tel").value==""){
		alert("电话不能为空")
		$_soojs("soojs_u_tel").focus()
		return false
	}	
	if($_soojs("soojs_u_addr").value==""){
		alert("详细地址不能为空")
		$_soojs("soojs_u_addr").focus()
		return false
	}	
	var tel2=/^(\d{3,4}-\d{7,8}(-\d{1,6})*)(\s*\d{3,4}-\d{7,8}(-\d{1,6})*)*$/
	var tel3=/^\d{11}$/
	if (!tel2.test($_soojs("soojs_u_tel").value)&&!tel3.test($_soojs("soojs_u_tel").value)){   
		alert("联系电话格式错误，请使用区号-号码或手机");
		$_soojs("soojs_u_tel").focus();
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
					<h3 class="font-14 fl">站长验证</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onsubmit="return checkadd()">
				<input type="hidden" name="uuu" value="0" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<tr>
						<th><span class="red">*</span> 姓名：</th>
						<td><input type="text" name="soojs_uu_name" value="" class="input-text" id="soojs_uu_name" maxlength="20" /></td>
						<td><em class="form-info msg-info" id="site_soojs_uu_name-msg">2-4个字的中文名</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 电话：</th>
						<td><input type="text" name="soojs_u_tel" value="" class="input-text" id="soojs_u_tel" maxlength="20" /></td>
						<td><em class="form-info msg-info" id="site_soojs_u_tel-msg">固定电话(区号-号码)或手机</em></td>
					</tr>

					<tr>
						<th><span class="red">*</span> E_mail：</th>
						<td><input type="text" name="soojs_u_email" value="" class="input-text" id="soojs_u_email" maxlength="250" disabled="disabled" /></td>
						<td><em class="form-info msg-info" id="site_soojs_u_email-msg">正确邮箱地址</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 详细地址：</th>
						<td><input type="text" name="soojs_u_addr" value="" class="input-text" id="soojs_u_addr" maxlength="250" /></td>
						<td><em class="form-info msg-info" id="site_soojs_u_addr-msg">100个字符以内的内容</em></td>
					</tr>
					<tr>
						<th> QQ：</th>
						<td><input type="text" name="soojs_u_qq" value="" class="input-text" id="soojs_u_qq" maxlength="11" /></td>
						<td><em class="form-info" id="site_soojs_u_qq-msg"></em></td>
					</tr>
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="WebAdd"><input type="submit" class="button btn-blue" value="提交申请" /> <input type="button" class="button btn-gray" value="返回" onclick="window.location='./'"  /></td>
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
		WriteLn("		soojs_u_email.value='" & Str4Js(zsoojs_u_email) & "';")
		WriteLn("		soojs_u_qq.value='" & Str4Js(zsoojs_u_qq) & "';")
		WriteLn("		soojs_u_tel.value='" & Str4Js(zsoojs_u_tel) & "';")
		WriteLn("		soojs_uu_name.value='" & Str4Js(zsoojs_uu_name) & "';")
		WriteLn("		soojs_u_addr.value='" & Str4Js(zsoojs_u_addr) & "';")	
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")

	End Function
</SCRIPT>
<%
	If CLng(zsoojs_id)>0 Then
		ShowInfo zsoojs_id
	End If
%>
</body>
</html>