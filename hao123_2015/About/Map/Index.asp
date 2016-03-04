<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../../p_inc/openconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>新站收录 - <%=G_WEBNAME%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="http://panxinyou.com/css/qingtian_base.css" type=text/css rel=stylesheet>
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
	  <LI class=on><A href="../map">网站地图</A> </LI>
	  <LI><A href="http://panxinyou.com/links">友情链接</A> </LI>
	</UL>
</DIV>
<DIV id=box>
	<DIV id=left><IMG src="../images/img_about.jpg"> </DIV><!--left end-->
	<DIV id=right>
<DIV class=content>
<DIV class=title_h1><SPAN>04</SPAN> <STRONG><%=G_WEBURL_2%></STRONG>&nbsp;站点地图</DIV>
<DL class=map>
  <DT>  
  <DD>
  <%
   	Set oRs2=Server.CreateObject(G_RS)
	oRs2.open "select top 50 * from qingtiandh_type1  where typehide=1 order by typeno asc,typeid desc",conn,1,1 	
	Do While Not oRs2.Eof
		typeid1=oRs2("typeid")
		typename1=oRs2("typename")
		Response.Write "<STRONG>"&typename1&"</STRONG>"
		Set oRs3=Server.CreateObject(G_RS)
		oRs3.open "select top 50 * from qingtiandh_type2 where typeid1="&typeid1&" order by typeno asc,typeid desc",conn,1,1
		Do While Not oRs3.Eof 
			t_typeid=oRs3("typeid")
			m_type_url=url_(array("l2",Trim(t_typeid),""))
			t_typename=oRs3("typename")
			Response.Write "<a href='"&m_type_url&"' target=_blank>"&t_typename&"</a>"
			oRs3.MoveNext
		Loop
		oRs3.close:Set oRs3=Nothing
		oRs2.MoveNext
	Loop
  %>
  </DL>
</DIV></DIV>
</DIV>
<DIV id=bottom >
	<P><%=G_WEBNAME%> 版权所有 Copyright&copy; 2012-2015 <%=G_BEIAN%> </P>
</DIV>

</BODY></HTML>
