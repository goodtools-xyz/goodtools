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
<title>修改基本资料 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
%>
<script language="javascript">
<!--
function checkadd(){
	if($_soojs("soojs_u_card").value!=""){
		if(!isIdCardNo($_soojs("soojs_u_card").value)){
			$_soojs("soojs_u_card").focus()
			return false
		}
	}
	var qq1=/^\d{5,9}$/
	if($_soojs("soojs_u_qq").value!=""){
		if (!qq1.test($_soojs("soojs_u_qq").value)){
			alert("qq有误！！");
			$_soojs("soojs_u_qq").focus()
			return false
		}
	}
	var msn1=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
	if($_soojs("soojs_u_msn").value!=""){
		if (!msn1.test($_soojs("soojs_u_msn").value)){
			alert("msn有误！！");
			$_soojs("soojs_u_msn").focus()
			return false
		}
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
					<h3 class="font-14 fl">修改基本资料</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onsubmit="return checkadd()">
				<input type="hidden" name="uuu" value="0" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
 					<tr>
						<th width="110"></th>
						<td width="247"><font color="#FF0000"><%=p%></font></td>
						<td width="243"></td>
					</tr>		
					<%End IF%>		
 					<tr>
						<th width="110">UID：</th>
						<td width="247"><%=zsoojs_id%></td>
						<td width="243">&nbsp;</td>
					</tr>
					<tr>
						<th>昵称：</th>                         
						<td><%=zsoojs_u%></td>
                        <td><em class="form-info" id="user_name-msg"></em></td>
					</tr>
					<tr>
						<th>性别：</th>
						<td>
						<input id="man" name="soojs_sex" type="radio" value="0" /> 保密
						<input id="man" name="soojs_sex" type="radio" value="1" /> 男
						<input type="radio" id="woman" name="soojs_sex" value="2" /> 女
						</td>
						<td><em class="form-info" id="gender-msg"></em></td>
					</tr>
					<tr>
						<th>生日：</th>
                        <td>
						<select name="yyyy" id="yyyy">
						<%
						For ii=Clng(year(now))-70 to Clng(year(now))-10
							IF ii=Clng(year(now))-29 Then
								Response.Write "<option value='"&ii&"' Selected>"&ii&"</option>"
							Else
								Response.Write "<option value='"&ii&"'>"&ii&"</option>"		
							End IF				
						Next
						%>
						</select> 年<select name="mm" id="mm">
						<%
						For ii=1 to 12
							pi=right("0"&ii,2)
							IF pi="01" Then
								Response.Write "<option value='"&pi&"' Selected>"&pi&"</option>"
							Else
								Response.Write "<option value='"&pi&"'>"&pi&"</option>"		
							End IF				
						Next
						%>						
						</select> 月<select name="dd" id="dd">
						<%
						For ii=1 to 31
							pi=right("0"&ii,2)
							IF pi="01" Then
								Response.Write "<option value='"&pi&"' Selected>"&pi&"</option>"
							Else
								Response.Write "<option value='"&pi&"'>"&pi&"</option>"		
							End IF				
						Next
						%>							
						</select> 日</td>
                        <td><em class="form-info" id="birthday-msg"></em></td>
					</tr>
					<tr>
						<th>所在地：</th>
						<td>
                        <select name="Province" id="Province" onChange="Get_Company_where_2(this.value,'','Province','City')">
							<script>Get_Company_where()</script>
						</select>
						<select name="City" id="City" >
						  <option value="">选择市</option>
						</select>						
                		</td>
						<td><em class="form-info" id="location-msg"></em></td>
					</tr>
					<tr>
						<th>身份证号码：</th>
                        <td>
						<input type="text" class="input-text" name="soojs_u_card" id="soojs_u_card" value="" maxlength="20"/>
						</td>
                        <td><em class="form-info" id="idcard-msg"></em></td>
					</tr>
					<tr id="status" >
						<th style="padding:0"> </th>
                       
						<td colspan="2"  style="vertical-align:top;font-size:12px; padding:0; color:#666;" >
							身份证一旦确认,性别和出生日期将自动调整且不可修改！
						</td>
					</tr>
                    <tr>
						<th>QQ：</th>
						<td><input type="text" class="input-text" name="soojs_u_qq" id="soojs_u_qq" value="" maxlength="11"  /></td>
						<td><em class="form-info" id="qq-msg"></em></td>
					</tr>
					<tr>
						<th>MSN：</th>
						<td><input type="text" class="input-text" name="soojs_u_msn" id="soojs_u_msn" value="" maxlength="250"  /></td>
						<td><em class="form-info" id="msn-msg"></em></td>
					</tr>
					<tr>
						<th>支付宝账号：</th>
						<td><input type="text" class="input-text" name="soojs_u_alipay" id="soojs_u_alipay" value="" maxlength="250"  /></td>
						<td><em class="form-info" id="msn-msg">填写错误将无法收到款</em></td>
					</tr>	
					<tr>
						<th>支付宝姓名：</th>
						<td><input type="text" class="input-text" name="soojs_u_alipay_name" id="soojs_u_alipay_name" value="" maxlength="250"  /></td>
						<td><em class="form-info" id="msn-msg">填写错误将无法收到款</em></td>
					</tr>									
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="editf"><input type="submit" class="button btn-blue" value="确定修改" /> <input type="button" class="button btn-gray" value="返回" onclick="window.location='./'"  /></td>
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
		WriteLn("		soojs_sex.value='" & Str4Js(zsoojs_sex) & "';")
		ozsoojs_u_birth=Str4Js(zsoojs_u_birth)
		ozsoojs_u_birth_a=Split(ozsoojs_u_birth,"-")
		oyyyy=ozsoojs_u_birth_a(0)
		omm=ozsoojs_u_birth_a(1)
		odd=ozsoojs_u_birth_a(2)
		WriteLn("		yyyy.value='" & Str4Js(oyyyy) & "';")
		WriteLn("		mm.value='" & Str4Js(omm) & "';")
		WriteLn("		dd.value='" & Str4Js(odd) & "';")
		WriteLn("		Province.value='" & Str4Js(zsoojs_u_Province) & "';")
		WriteLn("		Get_Company_where_2('"&Str4Js(zsoojs_u_Province)&"','"&Str4Js(zsoojs_u_City)&"','Province','City');")
		WriteLn("		soojs_u_card.value='" & Str4Js(zsoojs_u_card) & "';")
		WriteLn("		soojs_u_qq.value='" & Str4Js(zsoojs_u_qq) & "';")
		WriteLn("		soojs_u_msn.value='" & Str4Js(zsoojs_u_msn) & "';")
		WriteLn("		soojs_u_alipay.value='" & Str4Js(zsoojs_u_alipay) & "';")
		WriteLn("		soojs_u_alipay_name.value='" & Str4Js(zsoojs_u_alipay_name) & "';")
		osoojs_status=zsoojs_status
		IF osoojs_status="1" Then
			WriteLn("		yyyy.disabled=true;")
			WriteLn("		mm.disabled=true;")
			WriteLn("		dd.disabled=true;")
			WriteLn("		soojs_u_card.disabled=true;")	
			WriteLn("		uuu.value=1;")	
		End IF
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		WriteLn(CheckBoxScript("info.soojs_sex",zsoojs_sex))
		IF osoojs_status="1" Then
			WriteLn(CheckBoxScript2("info.soojs_sex",zsoojs_sex))
		End IF
	End Function
</SCRIPT>
<%
	If CLng(zsoojs_id)>0 Then
		ShowInfo zsoojs_id
	End If
%>
</body>
</html>