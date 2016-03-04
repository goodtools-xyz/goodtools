<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../../p_inc/openconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>友情链接 - <%=G_WEBNAME%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../css/qingtian_base.css" type=text/css rel=stylesheet>
<LINK href="http://panxinyou.com/css/qingtian_style.css" type=text/css rel=stylesheet>
</HEAD>
<BODY>
<DIV id=header>
	<DIV id=logo></DIV>
	<UL id=menu>
	  <LI><A href="../../">返回首页</A> </LI>
	  <LI><A href="../add">新站收录</A> </LI>
	   <LI><A href="../sk">挑错有礼</A> </LI>
	  <LI><A href="../about">关于我们</A> </LI>
	  <LI><A href="../map">网站地图</A> </LI>
	  <LI class=on><A href="http://panxinyou.com/links">友情链接</A> </LI>
	</UL>
</DIV>
<style>
.f-links h2 {  height:26px; overflow:hidden; line-height:26px; font-size:13px; color:#333333; padding:1px 11px 0 11px; }
.f-links2{margin:0px auto;  line-height:22px; border-top:0px; padding:0px; padding-bottom:10px;  overflow:hidden;}
.f-links2 ul{margin:0px; padding:0px; list-style-type:none;}
.f-links2 ul li{ height:22px; width:12%; list-style-type:none; overflow:hidden; float:left;  margin-top:10px; text-align:center; }
.f-links2 ul li a{ font-size:12px}
</style>
<DIV id=box>
	<DIV id=left><IMG src="http://panxinyou.com/images/img_about.jpg"> </DIV><!--left end-->
	<DIV id=right>
		<DIV class=content>
			<DIV class=title_h1><SPAN>05</SPAN> <STRONG><%=G_WEBURL_2%></STRONG>&nbsp;友情链接</DIV>
			<div class="f-links2">
			<ul>
			<%
			sql="select *  from qtcms_com_19 where n_look=1 And n_type1=28"
  
			
			Set oRs2=Server.CreateObject(G_RS)
			oRs2.open sql,conn,1,1 	
			Do While Not oRs2.Eof
				am_name=oRs2("n_title")
				am_url=oRs2("n_gotourl")
				Response.Write "<li><a href='"&am_url&"' target=_blank>"&am_name&"</a></li>"
				oRs2.MoveNext
			Loop
			%>
			</ul>
			</div>
		</DIV>
	</DIV>
</DIV>

<DIV id=bottom >
	<P><%=G_WEBNAME%> 版权所有 Copyright&copy; 2012-2015 <%=G_BEIAN%> </P>
</DIV>

</BODY></HTML>
