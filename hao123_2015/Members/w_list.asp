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
<title>站长验证 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">我的网站</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">
					<a href="./w_add.asp">添加网站</a>
				</div>			
				<table class="sitetable select-all-none">
					<tr><th>域名</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<%
					Set oRs2=conn.Execute("Select * From qingtiandy_url Where w_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" Order by id Desc")
					Do While Not oRs2.Eof
						ow_url=oRs2("w_url")
						ow_status=oRs2("w_status")
						oid=oRs2("id")
						ow_status=oRs2("w_status")
						ow_look=oRs2("w_look")
						ow_status_str=IIf(ow_status="1","<font color=blue>已验证</font>","<font color=red>未验证</font>")
						ow_look_str=IIf(ow_look="1","<font color=blue>通过审核</font>","<font color=red>等待审核</font>")
						opw_url=IIf(Instr(ow_url,"http://")>0,ow_url,"http://"&ow_url)
						
					%>
						<tr>
							<td width="50%" class="url"><a href="../p_inc/turnto.asp?u=<%=opw_url%>" target="_blank"><%=ow_url%></a></td>
							<td width="10%"><%=ow_status_str%></td>
							<td>
								<a href="./w_add.asp?id=<%=oid%>">修改</a> - 
								<a href="./regok.asp?id=<%=oid%>&action=delweb" onclick="return confirm('确认删除吗？');">删除</a>
								 - 
								 <%IF Instr(ow_status_str,"已验证")=0 Then%>
								<a href="./w_add_yz.asp?u1=<%=ow_url%>&id=<%=oid%>">重新验证</a>
								<%Else%>
								<font color="#0000FF">验证成功</font>
								<%End IF%>
								<%=ow_look_str%>
							</td>
						</tr>								
					<%	
						oRs2.MoveNext
					Loop
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