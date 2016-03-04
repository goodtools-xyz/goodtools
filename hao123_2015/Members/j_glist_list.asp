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
<title><%=G_jifen_jifen_name%>兑换奖品明细 - 用户中心 - <%=G_WEBNAME%></title>
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
				<style type="text/css">
				.sitetable td{ text-align:left; padding-left:5px}
				</style>
				<table class="sitetable select-all-none">
					<tr>
						<th nowrap="nowrap">奖品信息</th>
						<th>联系方式</th>
						<th nowrap="nowrap">兑奖时间</th>
						<th nowrap="nowrap">是否发货</th>
						<th>发货信息</th>
					</tr>
					<%
					a=Bint(Request("a"))
					sql="Select Top 100 * From qingtiandy_jifen_goodsman Where  uid="&zsoojs_id&"  Order By Id Desc"
					Set oRs2=conn.Execute(sql)
					su=0
					Do While Not oRs2.Eof

						m_name=oRs2("m_name")
						m_tel=oRs2("m_tel")
						m_email=oRs2("m_email")
						m_addr=oRs2("m_addr")
						m_code=oRs2("m_code")
						m_content=oRs2("m_content")
						m_time=oRs2("m_time")
						ojid=oRs2("jid")
						ojid=Bint(ojid)
						m_look=oRs2("m_look")
						m_shouji=oRs2("m_shouji")
						m_fahuo_time=GetRp(oRs2("m_fahuo_time"))
						m_fahuo_company=oRs2("m_fahuo_company")
						m_fahuo_chaxunaddress=oRs2("m_fahuo_chaxunaddress")
						m_fahuo_danhao=oRs2("m_fahuo_danhao")
						m_content=GetRp(oRs2("m_content"))
						
						Set oRs3=Conn.Execute("Select * From qingtiandy_jifen_goods Where id="&ojid)
						IF Not oRs2.Eof Then
							zg_pic=Add_Root_Dir(oRs3("g_pic"))
							zg_name=oRs3("g_name")
							zg_numb=oRs3("g_numb")
							zg_content=oRs3("g_content")
							zg_content=HTMLEncode5(zg_content)
						End IF
					%>
						<tr>
							<td><%=zg_name%></td>
							<td align="left">
								<%=IIf(m_tel<>"" ,"联系电话："&m_tel&"<p>","")%>
								<%=IIf(m_email<>"" ,"E_Mail："&m_email&"<p>","")%>
								<%=IIf(m_addr<>"" ,"联系地址："&m_addr&"<p>","")%>
								<%=IIf(m_code<>"" ,"邮政编码："&m_code&"<p>","")%>
							</td>
							<td><%=m_time%></td>
							<td><%=IIf(m_look="1" ,"<font color=red>已发货</font>","发货中")%></td>
							<td align="left">
								<%IF m_look="1" Then%>
								<%=IIf(m_fahuo_time<>"" ,"发货时间："&m_fahuo_time&"<p>","")%>
								<%=IIf(m_shouji<>"" ,"充值账号："&m_shouji&"<p>","")%>
								<%=IIf(m_fahuo_company<>"" ,"物流公司："&m_fahuo_company&"<p>","")%>
								<%=IIf(m_fahuo_chaxunaddress<>"" ,"查询地址："&m_fahuo_chaxunaddress&"<p>","")%>
								<%=IIf(m_fahuo_danhao<>"" ,"快递单号："&m_fahuo_danhao&"<p>","")%>
								<%=IIf(m_content<>"" ,"<font color=red>备注信息："&m_content&"</font><p>","")%>
								<%End IF%>
							</td>							
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