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
<title><%=G_jifen_jifen_name%>明细 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">前100条明细</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">
					<a href="./j_list.asp">全部明细</a>&nbsp;&nbsp;
					<a href="./j_list.asp?a=1">注册明细</a>&nbsp;&nbsp;
					<a href="./j_list.asp?a=3">登陆明细</a>&nbsp;&nbsp;
					<a href="./j_list.asp?a=2">推广明细</a>&nbsp;&nbsp;
					<a href="./j_list.asp?a=4">兑奖明细</a>&nbsp;&nbsp;
					<a href="./j_list.asp?a=7">提款明细</a>&nbsp;&nbsp;
					<a href="./j_list.asp?a=5">冲值明细</a>&nbsp;&nbsp;
					<%IF bint(G_jifen_lailu)<>0 Then%>
					<a href="./j_list.asp?a=6">点入明细</a>&nbsp;&nbsp;
					<%End IF%>
					<%IF bint(G_jifen_lailu_out)<>0 Then%>
					<a href="./j_list.asp?a=61">点出明细</a>&nbsp;&nbsp;
					<%End IF%>					

					<a href="./j_list.asp?a=8">设为主页</a>&nbsp;&nbsp;

					<br />

	
					<%IF G_xiaxian_1<>"" And G_xiaxian_1_zhuye="1" And G_xiaxian_zhuye_1a="1" Then%>
					<a href="./j_list.asp?a=13">下线设为主页</a>&nbsp;&nbsp;
					<%End IF%>
					<%IF G_xiaxian_1<>"" And G_xiaxian_1_zhuye="1" And G_xiaxian_zhuye_2a="1" Then%>
					<a href="./j_list.asp?a=14">下线登陆明细</a>&nbsp;&nbsp;
					<%End IF%>	
					<%IF G_xiaxian_2<>"" Then%>
					<a href="./j_list.asp?a=15">下线提款明细</a>&nbsp;&nbsp;
					<%End IF%>																	
				</div>			
				<%
				tFlag=False
				IF G_mingxi_look_Flag Then
					tFlag=True
				Else
					IF Bint(Request("a"))=5 Then
						tFlag=True
					End IF
				End IF
				IF tFlag Then
				
				%>
				<table class="sitetable select-all-none">
					<tr><th><%=G_jifen_jifen_name%>活动名称</th>
						<th>ip</th>
						<th>时间</th>
						<th>地址</th>
						<th width="13%"><%=G_jifen_jifen_name%></th>
					</tr>
					<%
					a=Bint(Request("a"))
					IF a<>0 Then
						sql="Select Top 100 * From qingtiandy_jifen_ip Where utype="&a&" And uid="&zsoojs_id&" Order By Id Desc"
					Else
						sql="Select Top 100 * From qingtiandy_jifen_ip Where  uid="&zsoojs_id&"  Order By Id Desc"
					End IF
					Set oRs2=conn.Execute(sql)
					su=0
					Do While Not oRs2.Eof
						ouip=oRs2("uip")
						outime=ForMatDate(oRs2("utime"),66)
						outype=oRs2("utype")
						oujifen=oRs2("ujifen")
						oujifen_name=Get_qingtiandy_jifen_ip_Name(zsoojs_id,outype)
						su=su+oujifen
						oipCounty=Disp_IPAddressData(ouip,2)
					%>
						<tr>
							<td width="22%"><a href="./j_list.asp?a=<%=outype%>"><%=oujifen_name%></a></td>
							<td width="21%"><%=ouip%></td>
							<td width="21%"><%=outime%></td>
							<td width="23%"><%=oipCounty%></td>
							<td><%=oujifen%></td>
						</tr>								
					<%	
						oRs2.MoveNext
					Loop
					%>	
				</table>
				<%Else%>
				<table class="sitetable select-all-none">
					<tr><td colspan="3"><font color="#FF0000">暂时不开放明细查看,返回<a href="./"><font color="#0000FF">管理首页</font></a></font></td></tr>
				</table>
				<%End IF%>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>