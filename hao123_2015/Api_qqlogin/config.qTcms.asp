<!--#include file="../p_Inc/Include_func.asp"-->
<!--#include file="../p_Inc/openconn.asp"-->
<!--#include file="config.inc.asp"-->
<!--#include file="qingtiancms.com.config____.asp"-->
<%
Dim qc, result, token, qqid, nickname
SET qc = New QqConnet
%>
<script>
function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//获得数组
    var argc = setCookie.arguments.length;//获得数组的长度
    var expires = (argc > 2) ? argv[2] : 1;//可伸长变量
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //把传过来得变量变成天数
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
}
</script>

<%
'http://www.qingtiandy.cn/qqlogin/user.asp?oauth_token=9392907873823792846&openid=EE941814F40491B93DF393A90049CB47&oauth_signature=KcXJ%2FXlgtHcclMczuHXSvAr5v%2B0%3D&oauth_vericode=166546650&timestamp=1322123928


'{
'    "ret": 0,
'    "msg": "",
'    "nickname": "晴天",
'    "gender": "男",
'    "figureurl": "http:\/\/qzapp.qlogo.cn\/qzapp\/100405434\/27E5C0AF271A8CE1871F36E18266D0D3\/30",
'    "figureurl_1": "http:\/\/qzapp.qlogo.cn\/qzapp\/100405434\/27E5C0AF271A8CE1871F36E18266D0D3\/50",
'    "figureurl_2": "http:\/\/qzapp.qlogo.cn\/qzapp\/100405434\/27E5C0AF271A8CE1871F36E18266D0D3\/100",
'    "figureurl_qq_1": "http:\/\/q.qlogo.cn\/qqapp\/100405434\/27E5C0AF271A8CE1871F36E18266D0D3\/40",
'    "figureurl_qq_2": "http:\/\/q.qlogo.cn\/qqapp\/100405434\/27E5C0AF271A8CE1871F36E18266D0D3\/100",
'    "is_yellow_vip": "0",
'    "vip": "0",
'    "yellow_vip_level": "0",
'    "level": "0",
'    "is_yellow_year_vip": "0"
'}




CheckLogin=qc.CheckLogin()


result = qc.CheckLogin()
If result=False Then
   Response.Write("QQ登录失败！")
   Response.End()
End If

If result=True Then
	on error resume next
	Session("Access_Token")=qc.GetAccess_Token()

	qqid = qc.Getopenid()
	Session("Openid")=qqid
	'Response.Write qqid
	'Response.End()	
	UserInfo=qc.GetUserInfo()
	

	
	nickname=GetContent(UserInfo,"""nickname"": """,""",",0)
	

	
	'zsoojs_uu_name=nickname
	IF nickname="" Then
		nickname="QQ用户"
	End IF

	IF qqid<>"" Then
		
		Set oRs=Server.CreateObject(G_RS)
		oRs.open "Select * From soojs_un Where soojs_api_qquid='"&qqid&"'",Conn,1,3
		IF oRs.Eof Then
			zsoojs_temp=GetRamCode(9)
			zsoojs_u_pass=zsoojs_temp
			zsoojs_uu_name=nickname
			zsoojs_u_name=zsoojs_temp
			IF zsoojs_uu_name<>"" Then
				zsoojs_u_name=zsoojs_uu_name&"_"&zsoojs_temp
			End IF
			zsoojs_u_email=zsoojs_temp&"@qq.com"
			oRs.AddNew()
			oRs("soojs_u_name")=zsoojs_u_name
			oRs("soojs_u_pass")=zsoojs_u_pass
			oRs("soojs_uu_name")=zsoojs_uu_name
			oRs("soojs_u_ask")=""
			oRs("soojs_u_ok")=""
			oRs("soojs_u_tel")=""
			oRs("soojs_u_qq")=""
			oRs("soojs_u_email")=zsoojs_u_email
			oRs("soojs_u_addr")=""			
			oRs("soojs_u_content")=""									
			oRs("soojs_date")=FormatDate(now,55)'注册时间
			oRs("soojs_thisdate")=FormatDate(now,55)'注册时间	
			oRs("soojs_lastdate")=FormatDate(now,55)'注册时间					
			oRs("soojs_ip")=getIP()
			oRs("soojs_thisip")=getIP()	
			oRs("soojs_lastip")=getIP()	
			oRs("soojs_level")=0	
			IF G_zhuce_j2="" Then
				oRs("soojs_jifen")=0	
			Else
				oRs("soojs_jifen")=G_zhuce_j2
			End IF		
			oRs("soojs_sex")=0
			oRs("soojs_u_card")=""
			oRs("soojs_u_msn")=""
			oRs("soojs_u_birth")="1980-01-01"
			oRs("soojs_u_Province")=""
			oRs("soojs_u_City")=""
			oRs("soojs_status")=0
			oRs("soojs_u_code")=""
			oRs("soojs_u_tuiguang")=""
			oRs("soojs_1616_manager")="3,8,9,10,11,12,13,14,16,18"
			oRs("soojs_1616_manager")=""
			oRs("soojs_jifen_G_jifen_s_f_1")=""
			oRs("soojs_jifen_G_jifen_s_f_today")=0	
			oRs("soojs_u_f1")=0	
			oRs("soojs_yz_str")=GetRamCode(20)
			IF G_xiaxian_1="1" Then
				oRs("soojs_u_xiaxian")=Bint(Request.Cookies(G_u_Cookies+"xiaxian"))
				AddTG Bint(Request.Cookies(G_u_Cookies+"xiaxian")),1
			End IF			
			oRs("soojs_api_qquid")=qqid
			oRs.Update()
			'Get_qingtiandy_jifen_ip oRs("id"),1,0
			
			If Err Then
				Err.Clear
				Set Conn = Nothing
				Response.Write "登陆失败!"
				response.Redirect "../members/reg.asp"
				response.End()
			Else
				IF G_Uc_tongbu="1" Then
					wuser=zsoojs_u_name
					wpass=zsoojs_u_pass
					'on error resume next
					str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=reg&u="&wuser&"&p="&wpass&"&m="&zsoojs_u_email))
		'			str=Bint(str)	
		'			IF str>0 Then
		'				str2=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_synlogin&uid="&str&"&p="&wpass))
		'			End IF			
				End IF			
				response.Cookies(G_u_Cookies)("soojs_u")=zsoojs_uu_name
				response.Cookies(G_u_Cookies)("soojs_jifen")=oRs("soojs_jifen")
				response.Cookies(G_u_Cookies)("soojs_id")=oRs("id")
				response.Cookies(G_u_Cookies)("soojs_lastdate")=oRs("soojs_lastdate")
				response.Cookies(G_u_Cookies)("soojs_lastip")=oRs("soojs_lastip")
				response.Cookies(G_u_Cookies)("soojs_level")=G_jifen_jifen_name&"用户"
				Response.Cookies(G_u_Cookies).expires=now()+100
				response.Cookies("soojsjj")="0"
				Response.Write "<script>setCookie('soojsu2','"&oRs("soojs_uu_name")&"')</script>"
				response.Cookies("qtcmsuser")=vbsE(oRs("soojs_uu_name"))
				'response.Redirect "../members/Default.asp"
				oRs.close
				Set oRs=nothing
				Conn.close
				Set Conn=nothing
				Back_url=request("Back_url")
				IF Back_url="" Then
					Back_url=t_Dir("/")
				Else
					Back_url=request("Back_url")
				End IF		
				response.Redirect Back_url
			End IF
		Else
			IF Bint(oRs("soojs_u_f1"))="1" Then
				response.Redirect "../members/login.asp?p="&server.URLEncode("对不起，您的帐号已经被锁定！")
				Response.End()
			End IF
			conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_api_qquid='"&qqid&"'")
			Get_qingtiandy_jifen_ip oRs("id"),3,0
			response.Cookies(G_u_Cookies)("soojs_u")=oRs("soojs_uu_name")
			response.Cookies(G_u_Cookies)("soojs_jifen")=oRs("soojs_jifen")
			response.Cookies(G_u_Cookies)("soojs_id")=oRs("id")
			response.Cookies(G_u_Cookies)("soojs_lastdate")=oRs("soojs_lastdate")
			response.Cookies(G_u_Cookies)("soojs_lastip")=oRs("soojs_lastip")
			response.Cookies(G_u_Cookies)("soojs_u_email")=oRs("soojs_u_email")		
			Back_url=request("Back_url")
			'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
			'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
			Response.Cookies(G_u_Cookies).expires=now()+100
			response.Cookies("soojsjj")="0"
			
			IF Back_url="" Then
				Back_url=t_Dir("/")
			Else
				Back_url=request("Back_url")
			End IF				
			response.Cookies("soojsu2")=oRs("soojs_uu_name")
			Response.Write "<script>setCookie('soojsu2','"&oRs("soojs_uu_name")&"')</sc"&"ript>"
			response.Cookies("qtcmsuser")=vbsE(oRs("soojs_uu_name"))

			
			
					
			response.Redirect Back_url				
		End IF
		

		Response.End()		
		Response.Write "你的用户名称:" & nickname & "<br/><br/><br/>"
		Response.Write "QQID:" & qqid & "<br/><br/><br/>"
		Response.Write "头像:<img src='http://qzapp.qlogo.cn/qzapp/" & QQ_OAUTH_CONSUMER_KEY & "/" & qqid & "/100' width='100'/>"
	End IF
Else
	Response.Write("登录失败<br><a href='"&t_Dir("/")&"'>返回首页</a>")
End If
%>
