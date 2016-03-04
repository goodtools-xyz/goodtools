<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
IF Bint(Request.Cookies(G_u_Cookies)("soojs_id"))<>0 Then
	Response.Write "对不起，您已经注册过了，无法再继续注册，<a href='../' target=_self>点击返回首页</a>"
	Response.End()
End IF
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
<script type="text/javascript" src="Ujs/checkUser.js"></script>

<title>创建用户 - <%=G_WEBNAME%></title>
</head>
<body>
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


		  <DIV id=msg_un_checking><SPAN class=item_desc>正在检查昵称是否可用，请稍候……</SPAN></DIV>
		  <DIV id=msg_un_ok><SPAN class=item_green>您输入的昵称可用，请继续。</SPAN></DIV>
		  <DIV id=msg_un_blank>请输入昵称</DIV>
		  <DIV id=msg_un_length_max>不得16个字节</DIV>
		  <DIV id=msg_un_length_min>不得少于4个字节</DIV>
		  <DIV id=msg_un_format>昵称仅可使用数字、字母和下划线</DIV>
		  <DIV id=msg_un_exists>此昵称已存在，请另换一个</DIV>


		  <DIV id=msg_pw_blank>请填写密码</DIV>
		  <DIV id=msg_pw_length>[4~14]数字和字符</DIV>
		  <DIV id=msg_pw_format>密码仅可由数字，字母和下划线组成</DIV>
		  <DIV id=msg_pw_seclow class=item_desc>您的密码结构过于简单，建议采用数字，字母组合的密码</DIV>
		  <DIV id=msg_pw_secmid class=item_green>您的密码具有一定安全性，最好使用数字，字母和下划线组合的密码</DIV>
		  <DIV id=msg_pw_sechigh class=item_green>您的密码相当安全，请记好</DIV>



		  
		  <DIV id=msg_email_checking><SPAN class=item_desc>正在检查邮件是否可用，请稍候……</SPAN></DIV>
		  <DIV id=msg_email_blank>请输入邮件地址</DIV>
		  <DIV id=msg_email>邮件格式不正确</DIV>
		  <DIV id=msg_email_exists>此邮件已存在，请另换一个</DIV>
		  <DIV id=msg_email_ok><SPAN class=item_green>您输入的邮件可用，请继续。</SPAN></DIV>


		  <DIV id=msg_vc_checking><SPAN class=item_desc>正在核对验证码，请稍候……</SPAN></DIV>
		  <DIV id=msg_vc_blank>请输入验证码</DIV>
		  <DIV id=msg_vc_format>验证码格式错误</DIV>
		  <DIV id=msg_vc_err>验证码错误</DIV>
		  <DIV id=msg_vc_ok><SPAN class=item_green>您输入的验证码正确。</SPAN></DIV>
		  
	  </DIV>
	  
	  
	  
	  
<div class="wrap">
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> 用户中心</a></h1>
		<p class="gray text-right pv10">
			<a href="../">返回首页</a> |  
		</p>
		<div class="guide">				
			<h2 class="font-14">注册/登陆用户</h2>
		</div>
	</div>
	<div class="main-content">
		<div class="leftbar" style="float:left; width:600px">
			<div class="box1">
				<div class="box-head">
					<h3 class="inline">注册</h3>
					<span  class="pw10">您是新用户？请您注册</span>
				</div>
				<form class="mv15 pv10 leftform" id="userreg"  method="post" action="regok.asp" autocomplete="off" onSubmit="return checkForm(this);" name="form1_s">
				<input type="hidden" name="action" value="reg" />
				<input name="Back_url2" type="hidden" value="<%=server.HTMLEncode(LoseeeHtml(request.ServerVariables("HTTP_REFERER")))%>">
					<fieldset>
						<legend>用户注册</legend>
						<div>
							<label for="reg-email">
								<span class="form-caption">您的Email地址：</span>
								<input type="text" class="input-text" id="soojs_u_email" name="soojs_u_email" value="" maxlength="50"  rel="text_flag"  onchange=checkOnChange(this); tabindex="1" /><span class="form-tips" id="soojs_u_email_1">例如 abc@qq.com，用于验证您的帐户或登录</span>
							</label>
						</div>
						<div>
							<label for="reg-name">
								<span class="form-caption">昵称：</span>
								<input  type="text" class="input-text" id="soojs_u_name" name="soojs_u_name" value="" maxlength="16" rel="text_flag"  onchange=checkOnChange(this); tabindex="2" /><span class="form-tips" id="soojs_u_name_1">最少4个字符,不超过16个字符(数字，字母和下划线)</span>
							</label>
						</div>
						<div>
							<label for="reg-pw"> <span class="form-caption">设置密码：</span>
								<input type="password" class="input-text" id="soojs_u_pass" name="soojs_u_pass" value="" maxlength="14" rel="text_flag" onchange=checkOnChange(this); tabindex="3" />
								<span class="form-tips" id="soojs_u_pass_1">由4-14个英文字母、数字、下划线组成。</span>
							</label>				
						</div>
						<div>
							<label for="reg-vpw">
								<span class="form-caption">重复密码：</span>
								<input type="password" class="input-text" id="soojs_u_pass2" name="soojs_u_pass2" rel="text_flag" value="" maxlength="14" onchange=checkOnChange(this); tabindex="4" /><span class="form-tips" id="soojs_u_pass2_1">输入相同密码</span>
							</label>
						</div>
						<div>
							<label for="reg-code">
								<span class="form-caption">验证码：</span>
							<input type="text" class="input-text valicode" id="soojs_code" value="" name="soojs_code" maxlength="4" onchange=checkOnChange(this); rel="text_flag" tabindex="5"  />
								<IMG id=verifypic src="Ujs/code.asp" border=0 >
								<a href="javascript:newverifypic();" title="看不清左边的字符">看不清？</a>
								<em class="form-info" id="reg-code_msg"></em>								<span class="form-tips" id="soojs_code_1">输入图中的字符,不区分大小写</span>
							</label>
						</div>
                        
						<div>
							<span class="form-caption">&nbsp;</span><input type="submit"  class="button btn-green" value="信息填好了，立即注册" tabindex="6" />
						</div>
                        <input name="referer" type="hidden" id="referer" value="http://fav.115.com/" />
					</fieldset>
				</form>
			</div>
		</div>
		<div class="rightbar" style="float:right; width:300px">
			<div class="box2">
				<div class="box-head">
						<h3 class="inline">登录</h3>
						<span class="pw10">已经注册过了？从这里登录</span>
				</div>
				<form class="pv3 rightform" id="userlogin" method="post" action="regok.asp" name="form1_s2">
				<input name="action" type="hidden" value="login" />
				<input name="Back_url2" type="hidden" value="<%=server.HTMLEncode(LoseeeHtml(request.ServerVariables("HTTP_REFERER")))%>">
					<fieldset>
						<legend>用户登录</legend>
						<div>
							<em id="message"></em></div>
                        <div>
							<label for="log-email">
								<p class="form-caption">昵称/Email地址：</p>
								<input type="text" class="input-text" id="soojs_u_email" name="soojs_u_email" value="" maxlength="60"/>
							</label>
						</div>
						<div>
							<label for="log-pw">
								<p class="form-caption">密码：</p>
								<input type="password" class="input-text" id="soojs_u_pass" name="soojs_u_pass" value="" maxlength="20"/>
							</label>
						</div>
                       <div>
							<a class="fr" href="./ugetpass.asp">找回密码</a>
							<!--
							<label for="log-time">
								<input type="checkbox" id="remember" name="remember" />
								<span>下次自动登录</span>
							</label>
							-->
						</div>
						<!--
						<div id="log-time-msg">
				             <span class="red">选择此项后，下次将自动登录（本机一周内有效）。为了您的信息安全，请不要在网吧或公用电脑上使用。</span>
			            </div>
						-->
						<div>
							<input type="submit" class="button btn-blue" value="登录" name="soojs_su" id="soojs_su" />
						<a href="http://www.panxinyou.com/Api_qqlogin/redirect.asp"><img src="http://www.panxinyou.com/template/skin19_4_20100527/images/other/qq_login.png"></a>
						</div>
					</fieldset>
				</form>
								
			</div>
		</div>
	</div>
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>