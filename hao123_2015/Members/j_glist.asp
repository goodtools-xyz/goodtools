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
<title><%=G_jifen_jifen_name%>兑换奖品 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">奖品列表</h3>
					<div class="hr"></div>
				</div>		
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
					<%
					sql="Select * From qingtiandy_jifen_goods Where  g_look=1  Order By g_xing Desc,g_time Desc, Id Desc"
					Set oRs2=conn.Execute(sql)
					su=1
					Do While Not oRs2.Eof
						zg_id=oRs2("id")
						zg_jifen=oRs2("g_jifen")
						zg_xing=oRs2("g_xing")
						zg_name=oRs2("g_name")
						zg_pic=Add_Root_Dir(oRs2("g_pic"))
						zg_time=oRs2("g_time")
						zg_content=oRs2("g_content")
						zg_numb=oRs2("g_numb")
						IF su Mod 4=1 Then Response.Write "<tr><tr><td colspan=""4"" height=""15""></td></tr>"
					%>
						<td width="25%" align="center">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
							  <tr><td align="center">
							  <table width="100" height="100" border="0" cellspacing="0" cellpadding="0">
							  <tr>
								<td><a class="blue" href="j_gdetail.asp?id=<%=zg_id%>"><img src="<%=zg_pic%>" border="0" onload='javascript:if(this.width>100)this.width=100' onerror="src='../p_inc/img/nopic2.gif'" /></a></td>
							  </tr>
							  <tr><td><a class="blue" href="<%=zg_pic%>" target="_blank">查看大图</a></td></tr>
							</table>

							  </td></tr>
							  <tr><td align="center"><a class="blue" href="j_gdetail.asp?id=<%=zg_id%>"><%=zg_name%></a></td></tr>
							  <tr><td align="center"><%=G_jifen_jifen_name%>要求：<span class="red"><%=zg_jifen%></span> <%=G_jifen_jifen_name%></td></tr>
							  <tr><td align="center">已经有 <span class="red"><%=zg_numb%></span> 个人兑奖</td></tr>
							  <tr><td align="center"><a class="blue" href="j_gdetail.asp?id=<%=zg_id%>"><img src="Uimg/jf2.gif" border="0" /></a></td></tr>
							</table>
						</td>					
					<%	
						IF su Mod 4=0 Then Response.Write "</tr>"
						su=su+1
						oRs2.MoveNext
					Loop
					ii=su mod 4
					For i=ii To 4
						Response.Write "<td width=""25%"" align=""center"">&nbsp;</td>"
					Next
					%>					
							
				</table>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>