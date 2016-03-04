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
<title>个人赢利排行榜 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">个人赢利排行</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">
					<a href="./p_paihang.asp?v=310&amp;times=30">310竞猜月排行</a>&nbsp;
					<a href="./p_paihang.asp?v=310&amp;times=7">310竞猜周排行</a>&nbsp;
					<a href="./p_paihang.asp?v=310&amp;times=1">310竞猜日排行</a>&nbsp;
					<a href="./p_paihang.asp?v=28&amp;times=30">幸运28月排行</a>&nbsp;
					<a href="./p_paihang.asp?v=28&amp;times=7">幸运28周排行</a>&nbsp;
					<a href="./p_paihang.asp?v=28&amp;times=1">幸运28日排行</a>&nbsp;	
					<a href="./p_paihang_all.asp"><%=G_jifen_jifen_name%>总排行</a>&nbsp;
				</div>			
				<%
				k_v=Request("v")
				
				IF k_v="310" Then 
					k_v_str="310竞猜"
				ElseIF k_v="28" Then
					k_v_str="幸运28"
				Else
					k_v="310"
					k_v_str="310竞猜"
				End IF
				
				k_times=Replace(Request("times"),"'","")
				k_times=Bint(k_times)
				IF k_times=1 Then
					k_times_str="本日"&G_jifen_jifen_name&"排行"
				ElseIF k_times=7 Then
					k_times_str="本周"&G_jifen_jifen_name&"排行"
				ElseIF k_times=30 Then
					k_times_str="本月"&G_jifen_jifen_name&"排行"
				Else
					k_times=1
					k_times_str="本日"&G_jifen_jifen_name&"排行"
				End IF
				
				
				tFlag=True
				IF tFlag Then
				%>
				<table class="sitetable select-all-none">
					<tr>
						<th width="20%">序号</th>
						<th width="20%">用户名</th>
						<th width="30%"><%=k_v_str%> - <%=k_times_str%></th>
						<th width="30%">总<%=G_jifen_jifen_name%></th>
					</tr>
					<%
					a=Bint(Request("a"))
					sql="Select top 50 Sum(ujifen),Uid From qingtiandy_jifen_ip Where id>0"
					IF k_v="310" Then
						IF G_IS_SQL_User_DB="1" Then
							sql_1=sql_1&" And utype=9 and datediff(d,utime,getdate())<="&k_times
						Else
							sql_1=sql_1&" And utype=9 and datediff('d',utime,'"&now()&"')<="&k_times
						End IF	
						sql=sql&sql_1
						sql=sql&" Group By Uid having Sum(ujifen)>0  order by 1 desc"	
					Else
						IF G_IS_SQL_User_DB="1" Then
							sql_1=sql_1&" And utype=19 and datediff(d,utime,getdate())<="&k_times
						Else
							sql_1=sql_1&" And utype=19 and datediff('d',utime,'"&now()&"')<="&k_times
						End IF	
						sql=sql&sql_1
						sql=sql&" Group By Uid having Sum(ujifen)>0  order by 1 desc"						
					End IF				
					Set oRs2=conn.Execute(sql)
					si=1
					Do While Not oRs2.Eof
						oujifen_sum=oRs2(0)
						oUid=oRs2(1)
						Set oRs3=Conn.Execute("Select soojs_u_name,soojs_jifen From soojs_un Where id="&oUid)
						IF Not oRs3.Eof Then
							osoojs_u_name=Get_x_user_x(oRs3(0))
							osoojs_jifen=oRs3(1)
						Else
							osoojs_u_name=Get_x_user_x(oUid)
							osoojs_jifen="-"
						End IF
						oRs3.close
					%>
						<tr>
							<td><%=si%></td>
							<td><%=osoojs_u_name%></td>
							<td><%=oujifen_sum%></td>
							<td><%=osoojs_jifen%></td>
						</tr>								
					<%	
						si=si+1
						oRs2.MoveNext
					Loop
					oRs2.close()
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