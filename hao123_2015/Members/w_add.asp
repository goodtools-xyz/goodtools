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
<script type="text/javascript" src="Ujs/WaddcheckUser.js"></script>
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<title>添加网站 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")

%>
<div class="wrap">
		<style type="text/css">
		.item_desc {
			MARGIN-TOP: 1px; COLOR: #666
		}
		.item_green {
			COLOR: #008000
		}		
		</style>		
	  <DIV id=check_username_script style="DISPLAY: none"></DIV>
      <DIV id=err_msg style="DISPLAY: none" class="err_child" >
		  <DIV id=msg_pw_verify>确认密码与密码不一致</DIV>	  
		  <DIV id=msg_if_format>请正确填写URL</DIV>
		  <DIV id=msg_ik_blank>请填写关键词</DIV>
		  <DIV id=msg_ik_format>关键词仅可使用汉字、数字、空格、字母和下划线</DIV>	  	  	  

		  <DIV id=msg_cn_ok>请输入详细信息</SPAN></DIV>
		  <DIV id=msg_format>注册数据格式错误：</DIV>
		  <DIV id=msg_unknow>注册时发生未知错误</DIV>


		  <DIV id=msg_url_checking><SPAN class=item_desc>正在检查域名是否请稍候……</SPAN></DIV>
		  <DIV id=msg_url_ok><SPAN class=item_green>网站域名可用，请继续。</SPAN></DIV>
		  <DIV id=msg_url_blank>请输入网站域名</DIV>
		  <DIV id=msg_url_format>网站域名格式不对</DIV>
		  <DIV id=msg_url_exists>此域名已存在，请另换一个</DIV>


		  <DIV id=msg_n_blank>请填写网站名称</DIV>
		  <DIV id=msg_n_length>2-40个字符以内的内容</DIV>
		  <DIV id=msg_n_ok><SPAN class=item_green>成功</SPAN></DIV>

		  <DIV id=msg_ty1_blank>请选择类别</DIV>
		  <DIV id=msg_ty1_ok><SPAN class=item_green>成功</SPAN></DIV>
		  
	  </DIV>
	  
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">添加网站</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onSubmit="return checkForm(this);">
				<input type="hidden" name="uuu" value="0" />
				<input type="hidden" name="id" value="0" id="id" />
				<input type="hidden" name="uid" value="<%=Request.Cookies(G_u_Cookies)("soojs_id")%>" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
					<tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>				
					<%End IF%>
					<tr>
						<th><span class="red">*</span> 网站域名：</th>
						<td>http:// <input type="text" name="w_url" value="" class="input-text" style="width: 200px;"  id="w_url"  rel="text_flag"  onchange=checkOnChange(this); tabindex="1" maxlength="250" />
                         </td>
						<td><em class="form-info msg-info" id="w_url_1">不包含http://的网址</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 网站名称：</th>
						<td>
							<input type="text" name="w_name" value="" class="input-text" id="w_name" rel="text_flag"  onchange=checkOnChange(this); tabindex="2" maxlength="40" />
						</td>
						<td><em class="form-info msg-info" id="w_name_1">40个字符以内的内容</em></td>
					</tr>

					<tr>
						<th> 网站类别：</th>
						<td>
							<select name="w_type1" id="w_type1" tabindex="3">
								<%
								For ii=0 To Ubound(G_u_w_type1)
									t1=G_u_w_type1(ii)
									t1_a=split(t1,"|")
									p1=t1_a(0) 'ID
									p2=t1_a(1) 'name
									Response.Write "<option value='"&p1&"'>"&p2&"</option>"&vbcrlf
								Next
								%>
                          	</select>
						</td>
						<td><em class="form-info" id="w_type1_1"></em></td>
					</tr>
                    <tr>
						<th> 网站访问量：</th>
						<td>
							<select name="w_number"  id="w_number" tabindex="4">
								<%
								For ii=0 To Ubound(G_u_w_number)
									t1=G_u_w_number(ii)
									t1_a=split(t1,"|")
									p1=t1_a(0) 'ID
									p2=t1_a(1) 'name
									Response.Write "<option value='"&p1&"'>"&p2&"</option>"&vbcrlf
								Next
								%>
                          	</select>
						</td>
						<td><em class="form-info" id="pv_grade-msg"></em></td>
					</tr>
                    <tr>
						<th>网站描述：</th>
						<td>
                            <textarea class="input-text" name="w_content" id="w_content" style="height:80px;" tabindex="5"></textarea>
                            <p>只允许110个字符</p>
                        </td>
						<td><em class="form-info" id="w_content_1"></em></td>
					</tr>
                    <tr>
						<th>备案信息：</th>
						<td><input type="text" name="w_beian" class="input-text" id="w_beian" maxlength="30" tabindex="6" /></td>
						<td><em class="form-info" id="w_beian_1"></em></td>
					</tr>
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="w_a"><input type="submit" class="button btn-blue" value="提交申请"  tabindex="7" id="submit_f"/> <input type="button" class="button btn-gray" value="返回" onClick="window.location='./w_list.asp'"  /></td>
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
		Set rsObj = Conn.Execute( "SELECT * FROM qingtiandy_url WHERE Id=" & sId )
		If not rsObj.Eof Then 
			WriteLn("		id.value='" & Str4Js(sId) & "';")
			WriteLn("		uid.value='" & Str4Js(rsObj.Fields.Item("w_uid").Value) & "';")
			WriteLn("		w_url.value='" & Str4Js(rsObj.Fields.Item("w_url").Value) & "';")
			WriteLn("		w_name.value='" & Str4Js(rsObj.Fields.Item("w_name").Value) & "';")
			WriteLn("		w_type1.value='" & Str4Js(rsObj.Fields.Item("w_type1").Value) & "';")
			WriteLn("		w_number.value='" & Str4Js(rsObj.Fields.Item("w_number").Value) & "';")
			WriteLn("		w_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("w_content").Value))) & "';")
			WriteLn("		w_beian.value='" & Str4Js(rsObj.Fields.Item("w_beian").Value) & "';")
			WriteLn("		submit_f.value='提交修改';")
			ow_status=		Str4Js(rsObj.Fields.Item("w_status").Value)
			IF ow_status="1" Then
				WriteLn("		uuu.value='1';")
				WriteLn("		w_url.disabled=true;")
			End IF
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>
<%
	If CLng(sId)>0 Then
		ShowInfo sId
	End If
%>
</body>
</html>