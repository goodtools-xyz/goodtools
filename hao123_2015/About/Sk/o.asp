<!--#include file="../../p_inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>挑错有礼 - <%=G_WEBNAME%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../css/qingtian_base.css" type=text/css rel=stylesheet>
<LINK href="../css/qingtian_style.css" type=text/css rel=stylesheet>
<LINK href="../css/sk.css" type=text/css rel=stylesheet>
</HEAD>
<BODY>
<DIV id=header>
	<DIV id=logo></DIV>
	<UL id=menu>
	  <LI><A href="../../">返回首页</A> </LI>
	  <LI><A href="../add">新站收录</A> </LI>
	  <LI class=on><A href="../sk">挑错有礼</A> </LI>
	  <LI><A href="../about">关于我们</A> </LI>
	  <LI><A href="../map">网站地图</A> </LI>
	  <LI><A href="http://panxinyou.com/links">友情链接</A> </LI>
	</UL>
</DIV>
<script>
function subForm() {
   if(userForm.intro.value=="") {
      alert('请您填写反馈意见！') ;
	  userForm.intro.focus() ;
	  return false ;
   }
   if(userForm.intro.value.length>=400) {
      alert('请您的描述控制早400字以内！') ;
	  userForm.intro.focus() ;
	  return false ;
   }   
   document.userForm.submit();
}
</script>
<DIV id=box>
	<DIV id=left><IMG src="http://panxinyou.com/images/img_about.jpg"> </DIV><!--left end-->
	<DIV id=right>
		<DIV class=content>
			<DIV class=title_h1><SPAN>02</SPAN> <STRONG><%=G_WEBURL_2%></STRONG>&nbsp;挑错有礼</DIV>
				<table width="480" border="0" cellspacing="0" cellpadding="0" class="fk_rt" style="margin-top:110px;">
				<tr>
				<td width="150" rowspan="2" align="left"><img src="../images/support/face.gif" width="128" height="132" /></td>
				<td height="30">我们已经收到您提交的信息，非常感谢您的反馈。 </td>
				</tr>
				<tr>
				<td valign="top"><div align="center" style="width:200px;"><a class="fk_anniu" href="./">继续挑错</a> <a class="fk_anniu" href="javascript:window.close()">关闭窗口</a></div></td>
				</tr>
				</table>

			<DIV class=clear></DIV>
		</DIV>
	</DIV>
</DIV>
<DIV id=bottom >
	<P><%=G_WEBNAME%> 版权所有 Copyright&copy; 2012-2015 <%=G_BEIAN%> </P>
</DIV>

</BODY></HTML>
