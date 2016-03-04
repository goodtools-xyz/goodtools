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

<title><%=G_jifen_jifen_name%>提款 - 用户中心 - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
Max_1=zsoojs_jifen\G_jifen_jifen_zhifubao_bili
%>
<script language="javascript">
<!--
function checkadd(){
	var soojs_u_alipay_numb,soojs_u_email
	soojs_u_alipay_numb=$_soojs("soojs_u_alipay_numb").value.Trim()
	soojs_u_alipay=$_soojs("soojs_u_alipay").value.Trim()
	soojs_u_alipay_name=$_soojs("soojs_u_alipay_name").value.Trim()
	var max_1=<%=Max_1*G_jifen_jifen_zhifubao_bili%>
	var max_2=<%=G_jifen_jifen_zhifubao_bili%>
	var re = /^[1-9]+[0-9]*]*$/ ; 
	if(!re.test(soojs_u_alipay_numb)){
		alert("提款数要是正整数!")
		$_soojs("soojs_u_alipay_numb").focus()
		return false
	}
	if(parseInt(soojs_u_alipay_numb)>max_1||parseInt(soojs_u_alipay_numb)==0){
		alert("您最多只能提款"+max_1+"!")
		$_soojs("soojs_u_alipay_numb").focus()
		return false		
	}
	var s1=soojs_u_alipay_numb/max_2
	if(!re.test(s1)){
		alert("提款数一定要是"+max_2+"的正整数倍!")
		$_soojs("soojs_u_alipay_numb").focus()
		return false		
	}
	if(soojs_u_alipay==""){
		alert("支付宝帐号不能为空!")
		$_soojs("soojs_u_alipay").focus()
		return false
	}	
	if(soojs_u_alipay_name==""){
		alert("支付宝姓名不能为空")
		$_soojs("soojs_u_alipay_name").focus()
		return false
	}	
	
}

-->
</script>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl"><%=G_jifen_jifen_name%>提款</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onsubmit="return checkadd()">
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
                    <tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>			
					<%End IF%>	
                    <tr>
						<th></th>
						<td><font color="#FF0000">提款最小金额：<%=G_tikuan_smail%>元</font></td>
						<td></td>
					</tr>					
                    <tr>
						<th></th>
						<td><font color="#0000FF">您目前拥有<%=G_jifen_jifen_name%>：<%=zsoojs_jifen%>，1元=<%=G_jifen_jifen_zhifubao_bili%><%=G_jifen_jifen_name%></font></td>
						<td></td>
					</tr>		
					<%
					pFlag=False
					IF zsoojs_u_alipay<>"" Then
						Set oRsp=Server.CreateObject(G_RS)
						oRsp.open "Select * From qingtiandh_zhifubaopb Where soojs_u_alipay='"&zsoojs_u_alipay&"'",conn,1,1
						IF Not oRsp.Eof Then
							pFlag=True
						End IF
						oRsp.close
					End IF
					IF Not pFlag Then
					%>			
					<tr>
						<th>提款<%=G_jifen_jifen_name%>数：</th>
						<td><input type="text" class="input-text" name="soojs_u_alipay_numb" id="soojs_u_alipay_numb" value="" /> </td>
						<td><em class="form-info" id="soojs_u_alipay_numb-msg">请填写<%=G_jifen_jifen_zhifubao_bili%>的倍数</em></td>
					</tr>
					<tr>
                      <th></th>
                      <td><span style="color:#FF0000">填写要提款的<%=G_jifen_jifen_name%>数量，最多可提<b><%=Max_1*G_jifen_jifen_zhifubao_bili%></b></span></td>
                      <td></td>
					</tr>	
					<tr>
						<th>支付宝帐号：</th>
						<td><input type="text" class="input-text" name="soojs_u_alipay" id="soojs_u_alipay" value="<%=zsoojs_u_alipay%>" /></td>
						<td><em class="form-info" id="soojs_u_alipay-msg"></em></td>
					</tr>
					<tr>
                      <th></th>
                      <td><span>请正确填写此项，填写错误将无法收到款!</span></td>
                      <td></td>
					</tr>					
					<tr>
						<th>支付宝姓名：</th>
						<td><input type="text" class="input-text" name="soojs_u_alipay_name" id="soojs_u_alipay_name" value="<%=zsoojs_u_alipay_name%>" /></td>
						<td><em class="form-info" id="soojs_u_alipay_name-msg"></em></td>
					</tr>					
					<tr>
                      <th></th>
                      <td><span>请正确填写此项，填写错误将无法收到款!</span></td>
                      <td></td>
					</tr>						
					<tr>
                      <th></th>
                      <td></td>
					</tr>									
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="utikuan"><input type="submit" class="button btn-blue" value="确认" /> <input type="button" class="button btn-gray" value="返回" onclick="window.location='./'"  /></td>
						<td>&nbsp;</td>
					</tr>
					<%Else%>
					<tr>
                      <th></th>
                      <td><span style="color:#FF0000"><b>对不起，您的支付宝帐号已被锁定！无法提款</b></span></td>
                      <td></td>
					</tr>					
					<%End IF%>
				</table>
				</form>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
<DIV id=check_username_script style="DISPLAY: none"></DIV>
</body>
</html>