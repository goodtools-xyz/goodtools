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
<title>添加新收藏 - 用户中心 - <%=G_WEBNAME%></title>
<script src="Ujs/c_l_add.js"></script>
</head>
<body>
<%
p=Request("p")
pid=Bint(Request("id"))
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

		  <DIV id=msg_cn_ok>请输入详细信息</SPAN></DIV>
		  <DIV id=msg_format>注册数据格式错误：</DIV>
		  <DIV id=msg_unknow>注册时发生未知错误</DIV>


		  <DIV id=msg_url_checking><SPAN class=item_desc>正在检查网址是否请稍候……</SPAN></DIV>
		  <DIV id=msg_url_ok><SPAN class=item_green>网址可用，请继续。</SPAN></DIV>
		  <DIV id=msg_url_blank>请输入网址</DIV>
		  <DIV id=msg_url_format>网址格式不对</DIV>
		  <DIV id=msg_url_exists>此网址已存在，请另换一个</DIV>


		  <DIV id=msg_n_blank>请填写标题</DIV>
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
					<h3 class="font-14 fl">添加新收藏</h3>
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
						<th><span class="red">*</span> 网页地址：</th>
						<td>http:// <input type="text" name="list_url" value="" class="input-text" style="width: 200px;"  id="list_url"  rel="text_flag"  onchange=checkOnChange(this); tabindex="1" maxlength="250" />
                         </td>
						<td><em class="form-info msg-info" id="list_url_1">不包含http://的网址</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 标题：</th>
						<td>
							<input type="text" name="list_name" value="" class="input-text" id="list_name" rel="text_flag"  onchange=checkOnChange(this); tabindex="2" maxlength="50" />
						</td>
						<td><em class="form-info msg-info" id="list_name_1">40个字符以内的内容</em></td>
					</tr>
					<tr>
						<th> 标签：</th>
						<td>
							<input type="text" name="list_biaoqian" value="" class="input-text" id="list_biaoqian" rel="text_flag"  onchange=checkOnChange(this); tabindex="3" maxlength="50" />
						</td>
						<td><em class="form-info msg-info" id="list_biaoqian_1">不同标签用空格分开</em></td>
					</tr>
					<tr>
						<th> 存放目录：</th>
						<td>
							<span  id="w_type1_td">
							<select name="list_type1" id="list_type1" tabindex="4">
								<%
								Set oRst=conn.Execute("Select * From qingtiandy_curl Where c_uid="&Request.Cookies(G_u_Cookies)("soojs_id"))
								IF Not oRst.Eof Then
									Do While Not oRst.Eof
										zc_typename=oRst("c_typename")
										zid=oRst("id")
										Response.Write "<option value='"&zid&"'>"&zc_typename&"</option>"
										oRst.MoveNext
									Loop
								Else
									Response.Write "<option value='0'>我的收藏夹</option>"
								End IF
								%>
                          	</select>
							</span>
							<span style="cursor:pointer;" onclick="act(2)" id="a1_c1">添加新分类</span>
							<span id="a1_c2" style="display:none">
							<input type="text" name="w_type1_a" value="" class="input-text" id="w_type1_a" maxlength="20" style="width:50px" />
							<input type="button" class="button btn-blue" value="添加" onclick="act_in()"/>
							<input type="button" class="button btn-gray" value="取消" onClick="act(1)"  />
							</span>
						</td>
						<td><em class="form-info" id="list_type1_1"></em></td>
					</tr>
                    <tr>
						<th>描述：</th>
						<td>
                            <textarea class="input-text" name="list_content" id="list_content" style="height:80px;" tabindex="5"></textarea>
                            <p>只允许110个字符</p>
                        </td>
						<td><em class="form-info" id="list_content_1"></em></td>
					</tr>
                    <tr>
						<th>是否共享：</th>
						<td>
							<select name="list_gx" id="list_gx" tabindex="6">
								<option value="0" selected="selected">不共享</option>
								<option value="1">共享</option>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<th> 权重：</th>
						<td>
							<input type="text" name="list_no" value="0" class="input-text" id="list_no" rel="text_flag"  onchange=checkOnChange(this); tabindex="2" maxlength="2" />
						</td>
						<td><em class="form-info msg-info" id="list_no_1">权重越大,显示越前面,最大99</em></td>
					</tr>					
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="c_l_add"><input type="submit" class="button btn-blue" value="提交申请"  tabindex="7"/> <input type="button" class="button btn-gray" value="返回" onClick="window.location='./w_list.asp'"  /></td>
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
		Set rsObj = Conn.Execute( "SELECT * FROM qingtiandy_listurl WHERE Id=" & sId &" And list_uid="&Request.Cookies(G_u_Cookies)("soojs_id"))
		If not rsObj.Eof Then 
			WriteLn("		id.value='" & Str4Js(sId) & "';")
			WriteLn("		list_url.value='" & Str4Js(rsObj.Fields.Item("list_url").Value) & "';")
			WriteLn("		list_name.value='" & Str4Js(rsObj.Fields.Item("list_name").Value) & "';")
			WriteLn("		list_biaoqian.value='" & Str4Js(rsObj.Fields.Item("list_biaoqian").Value) & "';")
			WriteLn("		list_type1.value='" & Str4Js(rsObj.Fields.Item("list_type1").Value) & "';")
			WriteLn("		list_gx.value='" & Str4Js(rsObj.Fields.Item("list_gx").Value) & "';")
			WriteLn("		list_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("list_content").Value))) & "';")
			WriteLn("		list_no.value='" & Str4Js(rsObj.Fields.Item("list_no").Value) & "';")
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