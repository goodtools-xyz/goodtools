<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->
<%
sId = Bint(Request.QueryString("id"))
%>
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
<title>发消息给管理员 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
pid=Bint(Request("id"))
%>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">发消息给管理员</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onSubmit="return checkForm(this);">
				<input type="hidden" name="uuu" value="0" />
				<input type="hidden" name="id" value="0" id="id" />
				<input type="hidden" name="uid" value="<%=Request.Cookies(G_u_Cookies)("soojs_id")%>" id="uid" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
					<tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>				
					<%End IF%>
                    <tr>
						<th>内容：</th>
						<td>
                            <textarea class="input-text" name="n_content" id="n_content" style="height:80px;" tabindex="5"></textarea>
                            <p>只允许140个字符</p>
                        </td>
						<td><em class="form-info" id="n_content_1"></em></td>
					</tr>				
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="xx_add"><input type="submit" class="button btn-blue" value="立即发布"  tabindex="7"/> <input type="button" class="button btn-gray" value="返回" onClick="window.location='./xx_list.asp'"  /></td>
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
</body>
</html>