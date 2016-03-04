<%
Function Error_log(p_UserName,p_TempUserPass)
	Dim Err_SqlIn_SJ
	Err_SqlIn_SJ="用户名:"&p_UserName&" 密码:"&p_TempUserPass
	Conn.Execute("insert into errlog(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ,sqlin_time) values('"&Request.ServerVariables("REMOTE_ADDR")&"','"&Request.ServerVariables("URL")&"','尝试登陆','','"&Err_SqlIn_SJ&"','"&FormatDate(now(),55)&"')")
End Function

Function Success_log(p_UserName,p_TempUserPass,info)
	Dim Err_SqlIn_SJ
	Err_SqlIn_SJ="用户名:"&p_UserName&" 密码:"&p_TempUserPass
	Conn.Execute("insert into errlog(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ,sqlin_time) values('"&Request.ServerVariables("REMOTE_ADDR")&"','"&Request.ServerVariables("URL")&"','"&info&"','','"&Err_SqlIn_SJ&"','"&FormatDate(now(),55)&"')")
End Function

Function Error_js(info,Err_SqlIn_SJ)
	Conn.Execute("insert into errlog(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ,sqlin_time) values('"&Request.ServerVariables("REMOTE_ADDR")&"','"&Request.ServerVariables("URL")&"','"&info&"','','"&Err_SqlIn_SJ&"','"&FormatDate(now(),55)&"')")
End Function

Function cookies_YN()
	IF request.Cookies(Sky_Admin_Cookies_1)("admin_flag")<>0 Then
		Dim tttt_
		tttt_=Add_Root_Dir("/"&G_ADMIN&"/qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode("对不起，您的帐号已经被封!")&"&ErrorUrl="&Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
		Response.Redirect(tttt_)
		response.End()
	End IF
	Dim session_,session_rs,session_sql,denglu_rs,denglu_sql
	session_=true
	If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" Then
		session_=false
	Else
		IF G_FLAG="1" Then
			Set session_rs=server.CreateObject(G_RS)
			session_sql="select admin_session from [tbl_admin] where [str_username]='"&request.Cookies(Sky_Admin_Cookies_1)("admin_u")&"' and str_pass='"&request.Cookies(Sky_Admin_Cookies_1)("admin_p")&"'"
			session_rs.open session_sql,Conn,1,3
			IF session_rs.bof or session_rs.eof Then
				session_=false
			Else
				If session_rs("admin_session")<>request.Cookies(Sky_Admin_Cookies_1)("session_a") Then
					session_="false_"
				End IF
			End IF	
			session_rs.close:set session_rs=nothing
		End IF
			Set denglu_rs=server.CreateObject(G_RS)
			denglu_sql="select id from [tbl_admin] where [str_username]='"&request.Cookies(Sky_Admin_Cookies_1)("admin_u")&"' and str_pass='"&request.Cookies(Sky_Admin_Cookies_1)("admin_p")&"'"
			denglu_rs.open denglu_sql,Conn,1,3
			IF denglu_rs.bof or denglu_rs.eof Then
				session_=false
			End IF	
			denglu_rs.close:set denglu_rs=nothing				
	End IF
	IF Not Get_result(MD61) Then session_=false
	IF session_=false or session_="false_" Then
		IF session_=false Then 
			response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
			response.End()
		End IF
		IF session_="false_" Then
			response.write "<script>"
			response.write "alert('对不起，有别的用户登陆此帐号！');"
			response.write"this.location.href='"&Add_Root_Dir("/"&G_ADMIN&"/"&"login.asp")&"';</SCRIPT>"
			response.End()
		End IF
	End IF
	
	IF kp_2 Then
		set D_fs=server.createObject(G_FSO)	
		TDrive=Server.MapPath(Add_Root_Dir("/p_inc/config.asp"))
		TDrive=left(TDrive,3)
		set D_f=D_fs.getdrive(TDrive)
		D_FSER=trim(D_f.serialnumber)
		Set rs_drive=conn.execute("select top 1 * from qingtiandh_drive where id=1")
		IF rs_drive.EOf Then 
			session_=false
			response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
			response.End()	
		Else
			drive_seri=rs_drive("seri")
			drive_flag=rs_drive("flag")
			drive_url=rs_drive("url2")
			IF drive_flag=0 Then
				conn.execute("update qingtiandh_drive set seri='"&MD5(D_FSER,16)&"', flag=1 where id=1")
			Else
				IF MD5(D_FSER,16)<>drive_seri Then
					session_=false
					response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
					response.End()	
				End IF						
			End IF
		End IF	
	End IF	
	IF kp_3 Then
		drive_seri=""
		drive_flag=""
		drive_url=""
		Set rs_drive=conn.execute("select top 1 * from qingtiandh_drive where id=1")
		IF rs_drive.EOf Then 
			session_=false
			response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
			response.End()	
		Else
			drive_url=rs_drive("url2")
			drive_url_1=replace(request.ServerVariables("HTTP_HOST"),"www.","")
			IF drive_url="a" Then
				conn.execute("update qingtiandh_drive set url2='"&MD5(drive_url_1,16)&"' where id=1")
			Else
				IF drive_url="" or isnull(drive_url) Then
					response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
					response.End()	
				Else				
					IF MD5(drive_url_1,16)<>drive_url Then
						session_=false
						response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
						response.End()	
					End IF	
				End IF					
			End IF
			
		End IF	
		
	End IF		
	cookies_YN=true
End Function


%>