<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<LINK href="css/style.css" rel=stylesheet type=text/css> 

<%
'On Error Resume Next
Dim p_PassArr,p_TrueResult,p_CheckedResult,GetRamCode_adminCode
Dim p_UserName,p_UserPass,p_VerifyCode,p_TempUserPass
Dim Conn
Dim strShowErr,ErrorN
Dim p_RsLoginObj,p_SqlLogin
Dim Err_SqlIn_SJ
If request.Cookies("errors")="" Then
	ErrorN=0
Else
	ErrorN=request.Cookies("errors")
End If
If ErrorN>5 Then 
	strShowErr="你输入的密码错误次数太多....请关闭全部浏览器稍后重试!"
	Response.Redirect("qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=login.asp")
	response.End()	
End If
If Not ChkPost Then response.redirect ("login.asp")
Response.Expires = 0
Response.AddHeader "Pragma", "no-cache"
Response.AddHeader "cache-control", "no-store"
Call JS_Conn
GetRamCode_adminCode=GetRamCode(8)
p_TempUserPass = Replace(Trim(Request.Form("password")),"'","''")
p_UserName=Filter_Characters(Trim(Request.Form("userid")))
'p_TempUserPass=md5(p_TempUserPass,16)
if p_UserName="" or p_TempUserPass="" or Not Get_result(MD61) Then
	strShowErr="用户名或密码错误."
	Error_log p_UserName,p_TempUserPass
	Response.Redirect("qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=login.asp")
	response.End()	
End IF
If p_UserName="//error" Then
	Conn.Execute("insert into errlog(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ,sqlin_time) values('"&Request.ServerVariables("REMOTE_ADDR")&"','"&Request.ServerVariables("URL")&"','POST','"&Request.Form("userid")&"','"&replace(Request.Form("userid"),"'","''")&"','"&FormatDate(now(),55)&"')")
	strShowErr="用户名或密码包含非法字符"
	Response.Redirect("qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=login.asp")
	response.End()
end if
if Cstr(request("Verifycode"))<>Cstr(Session("SafeCode")) And G_yzm="False" then
	strShowErr="验证码错误"
	Error_log p_UserName,p_TempUserPass
	Response.Redirect("qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=login.asp")
	response.End()
end if
p_PassArr=split(G_SAFE_PASS_SET_STR,",")
If p_PassArr(0)=1 then
	If p_PassArr(3)="1" then
		p_TrueResult=Trim(Cstr(Cint(mid(Session("SafeCode"),Cint(p_PassArr(1)),1))+Cint(mid(Session("SafeCode"),Cint(p_PassArr(2)),1))))
	Else
		p_TrueResult=Trim(Cstr(Cint(mid(Session("SafeCode"),Cint(p_PassArr(1)),1))*Cint(mid(Session("SafeCode"),Cint(p_PassArr(2)),1))))
	End If
	If p_PassArr(4)="0" then
		p_CheckedResult=left(p_TempUserPass,Len(p_TrueResult))
		p_UserPass=mid(p_TempUserPass,Len(p_TrueResult)+1)
	ElseIf Cint(p_PassArr(4))>len(p_TempUserPass)-len(p_TrueResult) then
		p_CheckedResult=right(p_TempUserPass,Len(p_TrueResult))
		p_UserPass=left(p_TempUserPass,len(p_TempUserPass)-Len(p_TrueResult))
	Else
		p_CheckedResult=mid(p_TempUserPass,p_PassArr(4)+1,Len(p_TrueResult))
		p_UserPass=left(p_TempUserPass,p_PassArr(4))&mid(p_TempUserPass,Cint(p_PassArr(4))+len(p_TrueResult)+1)
	End If
Else
	p_UserPass=p_TempUserPass
End If
IF Not Get_Newr(MD61) Then 
	c_Newr "1"
End IF
Set p_RsLoginObj = server.CreateObject (G_RS)
p_SqlLogin="select * from [tbl_admin] where [str_username]='"&p_UserName&"' and str_pass='"&md5(p_UserPass,16)&"'"
p_RsLoginObj.Open p_SqlLogin,Conn,1,1
If p_RsLoginObj.bof or p_RsLoginObj.eof Then
	Response.Cookies("errors")=ErrorN+1 
	strShowErr="用户名或密码错误"
	Error_log p_UserName,p_TempUserPass
	Response.Redirect("qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=login.asp")
	Response.End()
Else
	response.Cookies(Sky_Admin_Cookies_1)("admin_u")=p_RsLoginObj("str_username")
	response.Cookies(Sky_Admin_Cookies_1)("admin_p")=p_RsLoginObj("str_pass")
	response.Cookies(Sky_Admin_Cookies_1)("admin_m")=p_RsLoginObj("str_level")
	response.Cookies(Sky_Admin_Cookies_1)("admin_flag")=p_RsLoginObj("flag")
	response.Cookies(Sky_Admin_Cookies_1)("session_a")=GetRamCode_adminCode
	response.Cookies(Sky_Admin_Cookies_2)("u_ip")=Request.ServerVariables("local_ADDR")
	response.Cookies(Sky_Admin_Cookies_2)("u_url")="http://"&request.ServerVariables("HTTP_HOST")&"/" 
	response.Cookies(Sky_Admin_Cookies_2)("u_qq")=Self_code
	response.Cookies(Sky_Admin_Cookies_2)("p")="1111111|0111111|0011111|000111111|0000111111|0000011111"
	response.Cookies(Sky_Admin_Cookies_2)("cp")=Self_time
	response.Cookies("qt_url")="&a="&request.Cookies(Sky_Admin_Cookies_2)("u_ip")&"&b="&request.Cookies(Sky_Admin_Cookies_2)("u_url")&"&c="&request.Cookies(Sky_Admin_Cookies_2)("u_qq")&"&p="&request.Cookies(Sky_Admin_Cookies_2)("p")&"&cp="&request.Cookies(Sky_Admin_Cookies_2)("cp")
	Dim ppuu_time,ppuu_LastLoginIp
	ppuu_time=FormatDate(now(),55)
	ppuu_LastLoginIp=getIP()
	conn.execute("update tbl_admin set LastLogin='"&ppuu_time&"', LastLoginIp='"&ppuu_LastLoginIp&"'")
	'更新随机码
	IF G_FLAG Then
		Conn.execute("Update [tbl_admin] Set admin_session = '"& GetRamCode_adminCode &"' where str_username='"& request.Cookies(Sky_Admin_Cookies_1)("admin_u") &"' and str_pass='"& request.Cookies(Sky_Admin_Cookies_1)("admin_p") &"'")
	End IF
	Success_log md5(p_UserName,16),md5(p_TempUserPass,16),"登陆成功"
	strShowErr="成功通过网站后台管理员身份认证！"
	Response.Redirect("qingtiancms.com.success.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=index.asp&rk=a")
	Response.End()
End If
p_RsLoginObj.close:Set p_RsLoginObj=nothing
Conn.close:Set Conn=nothing
%>
