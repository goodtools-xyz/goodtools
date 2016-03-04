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
<title>奖品详细信息 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">奖品详细信息</h3>
					<p><a href="j_glist.asp">返回奖品列表</a></p>
					<div class="hr"></div>
				</div>	
				<%
					zid=Bint(Request("id"))
					Set oRs_detail=Server.CreateObject(G_RS)
					oRs_detail.open "Select * From qingtiandy_jifen_goods Where id="&zid,conn,1,1
					IF Not oRs_detail.Eof Then 
						zg_pic=Add_Root_Dir(oRs_detail("g_pic"))
						zg_jifen=oRs_detail("g_jifen")
						zg_name=oRs_detail("g_name")
						zg_content=oRs_detail("g_content")
						zg_content=HTMLEncode5(zg_content)
				%>	
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
					<td width="37%" rowspan="2" align="center" valign="middle"><img src="<%=zg_pic%>" border="0" onload='javascript:if(this.width>100)this.width=100' /><br /><span class="red">所需<%=G_jifen_jifen_name%>：<%=zg_jifen%></span></td>
					<td width="63%" height="40" class="blue"><%=zg_name%></td>
				  </tr>
				  				  
				  <tr>
					<td style="line-height:25px">
					奖品简介：<br />
					<%=zg_content%>
					</td>
				  </tr>
				</table>
				<%Else
					Response.End()
				%>
				<%End IF%>
				<div class="title">
					<h3 class="font-14 fl">填写基本信息</h3>
					<div class="hr"></div>
				</div>				
				<form method="post" action="./regok.asp" id="info" name="info" onSubmit="return checkForm_jp(this);">
				<input type="hidden" name="jid" value="<%=zid%>" />
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
						<th></th>
						<td>您的总<%=G_jifen_jifen_name%>：<span class="red"><%=zsoojs_jifen%></span>分  奖品所需<%=G_jifen_jifen_name%>：<span class="red"><%=zg_jifen%></span>分 </td>
						<td></td>
					</tr>
					<%IF Clng(zsoojs_jifen)<Clng(zg_jifen) Then%>
					<tr>
						<th></th>
						<td class="red">小提示：您的<%=G_jifen_jifen_name%>不足，无法进行参与兑奖，先努力赚取<%=G_jifen_jifen_name%>哦</td>
						<td></td>
					</tr>	
					<tr>
						<th></th>
						<td><a href="j_glist.asp">返回奖品列表</a></td>
						<td></td>
					</tr>									
					<%Else%>
					<tr>
						<th><span class="red">*</span> 联系人：</th>
						<td>
							<input type="text" name="m_name" value="<%=zsoojs_uu_name%>" class="input-text" id="m_name" rel="text_flag"  tabindex="2" maxlength="10" />
						</td>
						<td><em class="form-info msg-info" id="m_name_1">2-4个字的中文名</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 联系电话：</th>
						<td>
							<input type="text" name="m_tel" value="<%=zsoojs_u_tel%>" class="input-text" id="m_tel" rel="text_flag"   tabindex="3" maxlength="20" />
						</td>
						<td><em class="form-info msg-info" id="m_tel_1">固定电话(区号-号码)或手机</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> E-mail：</th>
						<td>
							<input type="text" name="m_email" value="<%=zsoojs_u_email%>" class="input-text" id="m_email" rel="text_flag"   tabindex="3" maxlength="11" disabled="disabled" />
						</td>
						<td><em class="form-info msg-info" id="m_email_1">正确邮箱地址</em></td>
					</tr>					
					<tr>
						<th><span class="red">*</span> 联系地址：</th>
						<td>
							<input type="text" name="m_addr" value="<%=zsoojs_u_addr%>" class="input-text" id="m_addr" rel="text_flag"   tabindex="4" maxlength="250" />
						</td>
						<td><em class="form-info msg-info" id="m_addr_1">详细邮寄地址</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 联系邮编：</th>
						<td>
							<input type="text" name="m_code" value="<%=zsoojs_u_code%>" class="input-text" id="m_code" rel="text_flag"   tabindex="5" maxlength="10" />
						</td>
						<td><em class="form-info msg-info" id="m_code_1">6位数的邮编</em></td>
					</tr>	
					<tr>
						<th><span class="red">*</span> 联系QQ：</th>
						<td>
							<input type="text" name="m_qq" value="<%=zsoojs_u_qq%>" class="input-text" id="m_qq" rel="text_flag"   tabindex="5" maxlength="11" />
						</td>
						<td><em class="form-info msg-info" id="m_qq_1">5-11位QQ</em></td>
					</tr>	
					<tr>
						<th>充值账号：</th>
						<td>
							<input type="text" name="m_shouji" value="" class="input-text" id="m_shouji" rel="text_flag"   tabindex="5" maxlength="50" />
						</td>
						<td><em class="form-info msg-info" id="m_shouji_1">虚拟产品充值账号</em></td>
					</tr>													
                    <tr>
						<th>备注：</th>
						<td>
                            <textarea class="input-text" name="m_content" id="m_content" style="height:80px;" tabindex="6"></textarea>
                            <p>只允许1000个字符</p>
                        </td>
						<td><em class="form-info" id="m_content_1"></em></td>
					</tr>	
					<tr>
						<th><span class="red">*</span> 验证码：</th>
						<td>
							<input type="text" name="soojs_code" value="" class="input-text" id="soojs_code" rel="text_flag"   tabindex="5" maxlength="4" style="width:60px" />
							<IMG id=verifypic src="Ujs/code.asp" border=0 >
							<a href="javascript:newverifypic();" title="看不清左边的字符">看不清？</a>
						</td>
						<td><em class="form-info msg-info" id="soojs_code_1">输入图中的字符,不区分大小写</em></td>
					</tr>								
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="gdetail"><input type="submit" class="button btn-blue" value="确认参与兑奖"  tabindex="7"/> <input type="button" class="button btn-gray" value="返回奖品列表" onClick="window.location='./j_glist.asp'"  /></td>
						<td>&nbsp;</td>
					</tr>
					<%End IF%>
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