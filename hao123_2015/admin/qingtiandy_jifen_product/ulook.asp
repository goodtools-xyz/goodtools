<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"兑奖用户资料" '标题
	GG_Table				=	"qingtiandy_jifen_goodsman"

	p_ac=Request("ac")
	oid=Bint(Request("id"))
	
	IF p_ac="1" Then
		Set oRs=server.CreateObject(G_RS)
		oRs.open "Select * From "&GG_Table&" Where id="&oid,conn,1,3		
		IF Not oRs.Eof Then
			oRs("m_shouji")=Replace_Text_2008(Request.Form("m_shouji"))
			oRs("m_fahuo_time")=Replace_Text_2008(Request.Form("m_fahuo_time"))
			oRs("m_fahuo_company")=Replace_Text_2008(Request.Form("m_fahuo_company"))
			oRs("m_fahuo_chaxunaddress")=Replace_Text_2008(Request.Form("m_fahuo_chaxunaddress"))
			oRs("m_fahuo_danhao")=Replace_Text_2008(Request.Form("m_fahuo_danhao"))
			oRs("m_content")=Replace_Text_2008(Request.Form("m_content"))
			oRs.Update()
		End IF
		oRs.close
		doAlert "","ulook.asp?id="&oid
		Response.End()
	End IF


	
	Set oRs=server.CreateObject(G_RS)
	oRs.open "Select * From "&GG_Table&" Where id="&oid,conn,1,1
	IF Not oRs.Eof Then
		m_name=oRs("m_name")
		m_tel=oRs("m_tel")
		m_email=oRs("m_email")
		m_addr=oRs("m_addr")
		m_code=oRs("m_code")
		m_content=oRs("m_content")
		m_time=oRs("m_time")
		ojid=oRs("jid")
		ojid=Bint(ojid)
		m_look=oRs("m_look")
		m_shouji=oRs("m_shouji")
		m_fahuo_time=GetRp(oRs("m_fahuo_time")):IF m_fahuo_time="" Then m_fahuo_time=ForMatDate(now(),55)
		m_fahuo_company=oRs("m_fahuo_company")
		m_fahuo_chaxunaddress=oRs("m_fahuo_chaxunaddress")
		m_fahuo_danhao=oRs("m_fahuo_danhao")
		Set oRs2=Conn.Execute("Select * From qingtiandy_jifen_goods Where id="&ojid)
		IF Not oRs2.Eof Then
			zg_pic=Add_Root_Dir(oRs2("g_pic"))
			zg_name=oRs2("g_name")
			zg_numb=oRs2("g_numb")
			zg_content=oRs2("g_content")
			zg_content=HTMLEncode5(zg_content)
		End IF
	End IF
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title><%=GG_Title%></title>
</head>
<body>
<TABLE  border="0" align=center cellpadding="0" cellspacing="0" class="tableBorder" style="width:100%"> 
	<TR> 
		<TD align="left" class="Forumrow" width="120"><img src="<%=zg_pic%>" border="0" onload='javascript:if(this.width>100)this.width=100'></TD> 
		<TD class="Forumrow" style="line-height:25px">
		奖品名称：<%=zg_name%><br>
		已兑换数：<%=zg_numb%><br>
		奖品简介：<%=zg_content%><br>
		</TD>
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" colspan="2" height="10"><hr></TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow"><b>兑奖用户：</b></TD> 
		<TD class="Forumrow"><%=m_name%></TD>
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>联系电话：</b></TD> 
		<TD class="Forumrow"><%=m_tel%></TD>
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>联系E-mail：</b></TD> 
		<TD class="Forumrow"><%=m_email%></TD>
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>联系地址：</b></TD> 
		<TD class="Forumrow"><%=m_addr%></TD>
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>邮政编码：</b></TD> 
		<TD class="Forumrow"><%=m_code%></TD>
	</TR>
	<%IF m_content<>"" Then%>
	<TR> 
		<TD align="left" class="Forumrow"><b>其他说明：</b></TD> 
		<TD class="Forumrow"><%=m_content%></TD>
	</TR>		
	<%End IF%>		
	<TR> 
		<TD align="left" class="Forumrow"><b>兑奖时间：</b></TD> 
		<TD class="Forumrow"><%=m_time%></TD>
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" colspan="2" height="10"><hr></TD> 
	</TR>
	<form method="POST" action="" name="myform">	
	<input name="ac" value="1" type="hidden">
	<input name="id" value="<%=oid%>" type="hidden">
	<TR> 
		<TD align="left" class="Forumrow"><b>充值账号：</b></TD> 
		<TD class="Forumrow"><input type="text" name="m_shouji" class="smallInput" size="40"  id="m_shouji" value="<%=m_shouji%>"></TD>
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow"><b>奖品发货时间：</b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_fahuo_time" class="smallInput" size="40"  id="m_fahuo_time" value="<%=m_fahuo_time%>">
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow"><b>物流公司：</b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_fahuo_company" class="smallInput" size="40"  id="m_fahuo_company" value="<%=m_fahuo_company%>">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>查询地址：</b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_fahuo_chaxunaddress" class="smallInput" size="40"  id="m_fahuo_chaxunaddress" value="<%=m_fahuo_chaxunaddress%>">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>快递单号：</b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_fahuo_danhao" class="smallInput" size="40"  id="m_fahuo_danhao" value="<%=m_fahuo_danhao%>">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>备注信息：</b></TD> 
		<TD class="Forumrow">
			<textarea class="input-text" name="m_content" id="m_content" style="height:80px;" cols="40"><%=m_content%></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="提交" name="submit_b" id="submit_b">
		</TD> 
	</TR>				
	</form>
	<%IF m_look="1" Then%>
	<TR> 
		<TD align="left" class="Forumrow"></TD> 
		<TD class="Forumrow"><font color="#0000FF">奖品已经发放</font></TD>
	</TR>	
	<%Else%>
	<TR> 
		<TD align="left" class="Forumrow"></TD> 
		<TD class="Forumrow"><a href="uedit.asp?id=<%=oid%>&Action=l_look&m_look=1&f=uindex.asp"><font color="#FF000">奖品已经发放后，点这里确认</font></a></TD>
	</TR>		
	<%End IF%>
</TABLE>
</body>
</html>