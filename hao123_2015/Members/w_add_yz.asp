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
<script type="text/javascript" src="Ujs/ajaxrequest.js"></script>

<title>网站验证 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
u1=Request("u1")
id=Request("id")
%>
<div class="wrap">  
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
		    
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">网站验证</h3>
					<div class="hr"></div>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<tr>
						<th>网站域名：</th>
						<td><%=u1%></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>验证文件：</th>
						<td>
							<a href="./regok.asp?id=<%=id%>&action=w_add_yz" target="_blank">下载验证文件</a>
						</td>
						<td>&nbsp;</td>
					</tr>
                    <tr>
                        <th>验证方法：</th>
                        <td>
                            <ul>
                                <li>1. 请点击 “下载验证文件” 获取验证文件</li>
                                <li>2. 将验证文件上传到需要验证域名的站点根目录下(验证完成后请勿删除）</li>
                                <li>3. 点击“开始验证”按钮</li>
                            </ul>
                        </td>
                    </tr>
					<tr>
						<th> </th>
						<td><input type="submit" id="auth_site" class="button btn-blue" value="开始验证" onclick="c2()" /> <img id="auth_site_loading_img" src="Uimg/loading.gif" alt="验证中……" style="vertical-align:middle; display:none"/></td>
						<td>&nbsp;</td>
					</tr>
                    <tr>
                        <th> </th>
                        <td id="auth_msg"></td>
                        <td></td>
                    </tr>
				</table>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
<script>
function mycallback_d2(obj) {
	document.getElementById("auth_site_loading_img").style.display="none"
	var s=obj.responseText;
	if(s=="1")
		document.getElementById("auth_msg").innerHTML='<span style="color:green;">验证成功</span>, <a href="./w_list.asp">返回我的站点</a>'
	else
		document.getElementById("auth_msg").innerHTML='<span style="color:red;">验证失败</span>'
}
function c2(){
	setTimeout('mycallback_d2(0)',10000)
	document.getElementById("auth_site_loading_img").style.display=""
	var ajax_d2=new AJAXRequest({
	url: "Ujs/check.asp?tag=checkw_ser&u1=<%=u1%>&id=<%=sId%>",
	method: "GET",
	oncomplete: mycallback_d2,
	charset: "GB2312"
	});
	ajax_d2.get();
}
</script>
</body>
</html>