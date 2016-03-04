
<%
Class qingtiandy_cn_qq_314048526
	Public BaseUrl,myip,OldID,ClickID
	Public SysVersion
	Private Sub Class_Initialize()
		SysVersion="2000"
		BaseUrl = LCase(Replace(Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL"),Split(request.ServerVariables("SCRIPT_NAME"),"/")(ubound(Split(request.ServerVariables("SCRIPT_NAME"),"/"))),"")) 'localhost/2/
		myip=getIP()
		OldID=getCookiesID()
		Call FormatToDay
		Call CheckLinkIn
	End Sub	

	REM 结束
	Private Sub class_terminate()
		SaveOldID
		If IsObject(conn) Then 
			conn.Close
			Set conn = Nothing
		End If 
	End Sub

	Private Sub SaveOldID()
		dim CookiesName
		CookiesName="CookiesName"
		Response.Cookies(CookiesName)("ids")=OldID
		Response.Cookies(CookiesName)("date")=date()
		Response.Cookies(CookiesName).Expires=date()+1
	End Sub

	Private Function getCookiesID()
		dim CookiesDate,tmpIDs,i,s,t,CookiesName
		CookiesName="CookiesName"
		
		CookiesDate=Request.Cookies(CookiesName)("date")
		if not isDate(CookiesDate) then
			Response.Cookies(CookiesName)("ids")="0"
			Response.Cookies(CookiesName)("date")=date()
			Response.Cookies(CookiesName).Expires=date()+1
			getCookiesID="0"
			Exit Function
		end if
		
		if DateDiff("d",CookiesDate,now())>0 then
			Response.Cookies(CookiesName)("ids")="0"
			Response.Cookies(CookiesName)("date")=date()
			Response.Cookies(CookiesName).Expires=date()+1
			getCookiesID="0"
			Exit Function
		end if
		
		tmpIDs=Request.Cookies(CookiesName)("ids")
		if isnull(tmpIDs) then tmpIDs="0"
		if tmpIDs="" then tmpIDs="0"
		tmpIDs=replace(tmpIDs,",0,",",")
		'exit function
		
		s=split(tmpIDs,",")
		t="0"
		for i=0 to ubound(s)
			if IsNumeric(s(i)) then
			'if ubound(split(tmpIDs,","& s(i) &","))=0 then 
			t=t &","& s(i)
			end if
		next
		getCookiesID=replace(t,",0,",",")
		getCookiesID=FormatNumSerial(getCookiesID)
	End Function


	REM 初始化当天数据
	Public Sub FormatToDay
		'2010.09.08更新，采用数据库调用方式初始化
		Dim oRs
		Dim rs,d
		Set oRs=Server.CreateObject(G_RS)
		oRs.open "Select Top 1 * From qingtiandh_app ",Conn,1,3
		IF Not oRs.Eof Then
			oapp_time=GetRp(oRs("app_time"))
			IF oapp_time="" Then oapp_time="2000-01-01"
			oapp_time=ForMatDate(oapp_time,5)			
			IF DateDiff("d",oapp_time,ForMatDate(now(),5))>1 Then
				
				Set rs=conn.Execute("select top 1 w_date from qingtiandy_url order by w_date desc")
				conn.execute("update qingtiandy_url set inj=0,outj=0")
				IF rs.Eof Then Exit Sub
				d=rs(0)
				rs.close
				application.lock
				application(hxCacheName &"_Date")=day(date())
				application(hxCacheName &"_IN")=0
				application(hxCacheName &"_NO")=0
				application(hxCacheName &"_NOREG")=0
				application(hxCacheName &"_OUT")=0
				application(hxCacheName &"_OLD")=0
				application(hxCacheName &"_InOutDate")=now()
				application.unlock				
				oRs("app_time")=ForMatDate(now(),55)
				oRs.Update()
			End IF				
		End IF
		'oRs.close
		
		Exit Sub
		
		IF application(hxCacheName &"_Date")="" Then
			Set rs=conn.Execute("select top 1 w_date from qingtiandy_url order by w_date desc")
			conn.execute("update qingtiandy_url set inj=0,outj=0")
			IF rs.Eof Then Exit Sub
			d=rs(0)
			rs.close
			application.lock
			application(hxCacheName &"_Date")=day(date())
			application(hxCacheName &"_IN")=0
			application(hxCacheName &"_NO")=0
			application(hxCacheName &"_NOREG")=0
			application(hxCacheName &"_OUT")=0
			application(hxCacheName &"_OLD")=0
			application(hxCacheName &"_InOutDate")=now()
			application.unlock
		end if
		if application(hxCacheName &"_Date")=day(Date()) then exit sub
		'execute("update CL_Link set inj=0,inp=0,outj=0,outp=0")
		conn.execute("update qingtiandy_url set inj=0,outj=0")
		application.lock
		application(hxCacheName &"_Date")=day(date())
		application(hxCacheName &"_IN")=0
		application(hxCacheName &"_NO")=0
		application(hxCacheName &"_NOREG")=0
		application(hxCacheName &"_OUT")=0
		application(hxCacheName &"_OLD")=0
		application(hxCacheName &"_InOutDate")=now()
		application.unlock
	End Sub
	
	REM 统一进出站计数器,
	Sub InOutApplication(InOut)
		if application(hxCacheName &"_InOutDate")="" then
			application.lock
			application(hxCacheName &"_"& InOut)=0
			application(hxCacheName &"_InOutDate")=date()
			application.unlock
		end if
		if datediff("d",application(hxCacheName &"_InOutDate"),now())>0 then
			application.lock
			application(hxCacheName &"_"& InOut)=0
			application(hxCacheName &"_InOutDate")=date()
			application.unlock
		end if
		
		application.lock
		application(hxCacheName &"_"& InOut)=application(hxCacheName &"_"& InOut)+1
		application.unlock
	End Sub	
	
	REM 入站接口,记录详细点击,InOrOut:0入站,1出站
	REM 只需要判断指定时间内，相同IP、相同域名是否有记录，无论是出还是入
	Public Sub CheckLinkIn()
		dim rs,re,sql,siteUrl,Domain,ServerDomain,refid,DomainName,l_id,w_look
		ref=checkStr(Request("ref"))
		refid=Bint(Request("sId"))
		siteUrl=Request.ServerVariables("HTTP_REFERER")	
		IF IsValidUrl(ref) Then 
			siteUrl=ref	
		Else
			Call InOutApplication("NO")
			exit sub			
		End IF
'		if siteUrl="" then
'			Call InOutApplication("NO")
'			exit sub
'		Else
'			siteUrl=checkStr(siteUrl)
'		end if
		
		Domain=lcase(split(siteUrl,"/")(2))
		
		' 若是本站内连接,直接跳出
		ServerDomain=lcase(Request.ServerVariables("SERVER_NAME"))
		
		if Domain=ServerDomain then exit sub
		
		
		Domain=replace(Domain,"www.","")
		
		' 入站时，先检查这个站有没有注册
		set rs=conn.execute("select top 1 id,inc,inj,inp,indate,fromdate,w_domain,w_look,w_uid from qingtiandy_url where w_domain='"& Domain &"' order by id desc")
		if rs.eof then
			IF G_All_InAuto="1" Then
				IF G_All_dhList_f="1" Then
					Set rs=conn.execute("Select Top 1 m_name,id From qingtiandh_List Where m_url='http://"&Domain&"/' or m_url='http://www."&Domain&"/' Order by id desc")
					IF Not rs.Eof Then
						DomainName=rs("m_name")
						l_id=rs("id")
						w_look=1
					Else
						DomainName=Domain
						l_id=0
						w_look=0
					End IF
				Else
					DomainName=Domain
					l_id=0
					w_look=0					
				End IF
				set rs=conn.Execute("insert into qingtiandy_url (w_url,w_name,w_type1,w_number,w_uid,w_date,w_editdate,w_status,w_no,inc,outc,inj,outj,indate,fromdate,dateandtime,w_domain,inp,outp,w_look,l_id) values('"& Domain &"','"& DomainName &"',0,0,0,'"&ForMatDate(now(),55)&"','"&ForMatDate(now(),55)&"',1,0,0,0,0,0,'"&ForMatDate(now(),55)&"','"&ForMatDate(now(),55)&"','"&ForMatDate(now(),55)&"','"&Domain&"',0,0,"&w_look&","&l_id&")")
				set rs=conn.execute("select top 1 id,inc,inj,inp,indate,fromdate,w_domain,w_uid from qingtiandy_url where w_domain='"& Domain &"' order by id desc")
				pw_uid=Bint(rs("w_uid"))
			Else
				Call InOutApplication("NOREG")
				rs.close:exit sub
			End IF
		Else
			IF Clng(rs("inc"))>=Clng(G_all_InNumb) And rs("w_look")=0 Then
				conn.Execute("update qingtiandy_url set w_look=1 where w_domain='"& Domain &"' And w_look=0")
			End IF		
			pw_uid=Bint(rs("w_uid"))
		end if		
		
		OldID=OldID &","& rs("id")
	
		REM 指定时间内活动检查,若指定时间有活动,就退出
		IF G_IS_SQL_User_DB="1" Then
			set re=conn.execute("select top 1 dateandtime from qingtiandy_urllog where datediff(day,dateandtime,getdate())=0 and ip='"& myip &"' and w_domain='"& Domain &"' order by id desc")
		Else
			set re=conn.execute("select top 1 dateandtime from qingtiandy_urllog where datediff('d',dateandtime,'"&now()&"')=0 and ip='"& myip &"' and w_domain='"& Domain &"' order by id desc")
		End IF
		if not re.eof then
			Call InOutApplication("OLD")
			rs.close:re.close:exit sub
		end if
		re.close
		
		conn.Execute("insert into qingtiandy_urllog (w_domain,ip,come,inout,dateandtime) values('"& Domain &"','"& myip &"','"& siteUrl &"',0,'"&ForMatDate(now(),55)&"')")
		Get_qingtiandy_jifen_ip pw_uid,6,0
		
		dim fromdate,inj,inc,indate,inp
		' 若本月入站数为0,则后面要把日期改为今天
		If rs("inc")=0 then
			inc=0
		End If
		
		If DateDiff("d",rs("indate"),Date())=0 then
			inj=rs("inj")+1
		else
			inj=1
		End If
		rs.close
		
		Call InOutApplication("IN")
	
		if inc=0 then
			IF G_IS_SQL_User_DB="1" Then
				conn.Execute("update qingtiandy_url set fromdate=getdate(),indate=getdate(),inj="& inj &",inc=inc+1,inp=(inc/(DateDIff(day,fromdate,getDate())+1)) where w_domain='"& Domain &"'")
			Else
				conn.Execute("update qingtiandy_url set fromdate='"&ForMatDate(now(),55)&"',indate='"&ForMatDate(now(),55)&"',inj="& inj &",inc=inc+1,inp=(inc/(datediff('d',dateandtime,'"&now()&"')+1)) where w_domain='"& Domain &"'")
			End IF
		else
			IF G_IS_SQL_User_DB="1" Then
				conn.Execute("update qingtiandy_url set indate=getdate(),inj="& inj &",inc=inc+1,inp=(inc/(DateDIff(day,fromdate,getDate())+1)) where w_domain='"& Domain &"'")
			Else
				conn.Execute("update qingtiandy_url set indate='"&ForMatDate(now(),55)&"',inj="& inj &",inc=inc+1,inp=(inc/(datediff('d',dateandtime,'"&now()&"')+1)) where w_domain='"& Domain &"'")
			End IF
		end if
	End Sub	

	Sub cneWriteInfo(t)
		if myip=cneip then
			Response.Write timer &":"& t &"<br />"
		end if
	End Sub

	REM 循环找出需要的ID
	Public Function getMinID(ByVal id)
		dim rs,re,OutID,sitedomain
		REM 正常的情况,但同时检查入站大于出站
		if id>0 then ClickID=id
		
		if id>0 then
			cneWriteInfo("<font color=red>开始检查,同时直接跳过返还已超"& maxReBack &"倍的网</font>,ID="& id)
			set rs=conn.execute("select top 1 id,w_domain,inj,outj from qingtiandy_url where w_status=1 and inj*"& maxReBack &">outj and id="& id)
			if not rs.eof then
				cneWriteInfo(rs("w_domain") &"今日入:"& rs("inj") &",今日出:"& rs("outj") &",差为:"& rs("inj")-rs("outj"))
		
				REM 检索入出差最小的站
				if rs("inj")-rs("outj")<0 then
					cneWriteInfo(rs("w_domain") &"站当前为逆差,不需要点过去,开始查找顺差最小的站,不含ID="& OldID)
					set rs=conn.execute("select top 1 id,w_domain from qingtiandy_url where w_status=1 and inj>0 and inj-outj>0 and inj*"& maxReBack &">outj and (id not in ("& OldID &")) order by inj-outj asc,id desc")
				else
					cneWriteInfo(rs("w_domain") &"当前为顺差或等差,可以点击,等待后面的有效检测.")
				end if
		
			else
				cneWriteInfo("不存在刚才检索的网站,ID="& id &",现在开始查找顺差最小的站,不含ID="& OldID)
				set rs=conn.execute("select top 1 id,w_domain from qingtiandy_url where w_status=1 and inj>0 and inj-outj>0 and inj*"& maxReBack &">outj and (id not in ("& OldID &")) order by inj-outj asc,id desc")
			end if
		else
			cneWriteInfo("现在开始查找顺差最小的站,不含ID="& OldID)
			set rs=conn.execute("select top 1 id,w_domain from qingtiandy_url where w_status=1 and inj>0 and inj-outj>0 and inj*"& maxReBack &">outj and (id not in ("& OldID &")) order by inj-outj asc,id desc")
		
			if rs.eof then
				cneWriteInfo("无顺差网站，先查一下原始点击是不是有效")
				'set rs=execute("select top 1 id,sitedomain,inj,outj from CL_Link where id="& ClickID)
			end if
		
		
		end if
		
		
		if rs.eof then
			cneWriteInfo("当前无顺差网站,开始查找近今日顺差(含逆差)最小,且当前IP("& myip &")未经过的网站.")
			set rs=conn.execute("select top 1 id,w_domain from qingtiandy_url where w_status=1 and inj>0 and inj*"& maxReBack &">outj and (id not in ("& OldID &")) order by abs(inj-outj) asc,inj-outj asc")
		end if
		
		if rs.eof then
			cneWriteInfo("<font color=blue>今日已没有未点击过的网站.</font>,返回原始数据ID="& ClickID)
			getMinID=ClickID
			exit function
		end if
		
		sitedomain=rs("w_domain")
		OutID=rs("id")
		
		REM 指定时间内活动检查
		IF G_IS_SQL_User_DB="1" Then
			set re=conn.execute("select top 1 dateandtime from qingtiandy_urllog where datediff(day,dateandtime,getdate())=0 and ip='"& myip &"' and w_domain='"& sitedomain &"' order by id desc")
		Else
			set re=conn.execute("select top 1 dateandtime from qingtiandy_urllog where datediff('d',dateandtime,'"&now()&"')=0 and ip='"& myip &"' and w_domain='"& sitedomain &"' order by id desc")
		End IF
		if not re.eof then
			OldID=OldID &","& OutID
			cneWriteInfo(sitedomain &"为无效点击,重新循环查找可以点击的网站,当前OldID="& OldID)
			OutID=getMinID(0)
		else
			cneWriteInfo(sitedomain &"是有效点击,ID="& OutID)
		end if
		rs.close
		re.close
		
		getMinID=OutID
	End Function


	REM 出站接口
	Public Sub LinkOut()
		dim sitedomain,siteurl,id,iSQL,sid
		dim rs,re,chkSave,outj,HeadHtml,rs2
		dim sitename,keywords,description
		dim q_id,qm_name,qm_url,q_Domain
		Call ChkReferer		
		chkSave=true
		id=request.querystring("to")	
		ppppid=id	
		'+++++++++++++++以下验证是否来自本地的网址库+++++++++++++++++++++++++
		sid=request.querystring("sid")
		sid=Bint(sid)
		
		
		IF sid<>0 And G_All_dhList_f="1" Then
			
			set rs=conn.execute("Select top 1 id From qingtiandy_url where l_id="&sid)
			IF Not rs.Eof Then
				id=rs("id")
			Else
				'先把本地的网址库导入到点入点出库
				Set rs=conn.execute("Select Top 1 id,m_name,m_url From qingtiandh_List Where id="&sid)
				IF Not rs.Eof Then
					q_id=rs("id")
					qm_name=rs("m_name")
					qm_url=rs("m_url")
					IF Not  IsValidUrl(qm_url) Then
						id=0
					Else
						qm_url=lcase(split(qm_url,"/")(2))
						qm_url=replace(qm_url,"www.","")
						set rs=conn.Execute("insert into qingtiandy_url (w_url,w_name,w_type1,w_number,w_uid,w_date,w_editdate,w_status,w_no,inc,outc,inj,outj,indate,fromdate,dateandtime,w_domain,inp,outp,w_look,l_id) values('"&qm_url&"','"& qm_name &"',0,0,0,'"&ForMatDate(now(),55)&"','"&ForMatDate(now(),55)&"',1,0,0,0,0,0,'"&ForMatDate(now(),55)&"','"&ForMatDate(now(),55)&"','"&ForMatDate(now(),55)&"','"&qm_url&"',0,0,1,"&q_id&")")
						set rs=conn.execute("select top 1 id,inc,inj,inp,indate,fromdate,w_domain from qingtiandy_url where w_domain='"&qm_url&"' order by id desc")
						id=rs("id")
					End IF
				Else
					id=0
				End IF
			End IF
		End IF
		
		'---------------以下验证是否来自本地的网址库-------------------------
		id=Bint(id)
		id=getMinID(id)	
		
		IF id="" Then
			set rs=conn.execute("select top 1 w_url,inc,outc,outj,outp,outdate,fromdate,w_domain,w_name,id from qingtiandy_url where w_status=1 order by outj asc,id desc")
			IF rs.Eof Then Response.Redirect "http://qingtiandy.cn"
			id=rs("id")
		Else
			set rs=conn.execute("select top 1 w_url,inc,outc,outj,outp,outdate,fromdate,w_domain,w_name from qingtiandy_url where id="&id&"")
			IF rs.Eof Then
				Response.Redirect "goto.asp"
				Response.End()
			End IF
		End IF
		sitedomain=rs("w_domain")
		siteurl=rs("w_url")
		sitename=rs("w_name")
		keywords=sitename
		description=sitename
		
		
		if left(siteurl,7)<>"http://" then siteurl="http://" & siteurl
		
		Get_qingtiandy_jifen_ip Bint(Request.Cookies(G_u_Cookies)("soojs_id")),61,ppppid
		
		
		if DateDiff("d",rs("outdate"),Date())=0 then
			outj=rs("outj")+1
		else
			outj=1
		end if
		rs.close
	
		REM 指定时间内活动检查
		IF G_IS_SQL_User_DB="1" Then
			set re=conn.execute("select top 1 dateandtime from qingtiandy_urllog where datediff(day,dateandtime,getdate())=0 and ip='"& myip &"' and w_domain='"& sitedomain &"' order by id desc")
		Else
			set re=conn.execute("select top 1 dateandtime from qingtiandy_urllog where datediff('d',dateandtime,'"&now()&"')=0 and ip='"& myip &"' and w_domain='"& sitedomain &"' order by id desc")
		End IF
		if not re.eof then
			cneWriteInfo("最后一次查,仍为无效数据:"& sitedomain )
			chkSave=false
		end if
		re.close
		
		if chkSave=true then
			IF G_IS_SQL_User_DB="1" Then
				conn.Execute("update qingtiandy_url set outc=outc+1,outdate=getdate(),outj="& outj &",outp=(outc/(DateDIff(day,outdate,getDate())+1)) where w_domain='"& sitedomain &"'")
			Else
				conn.Execute("update qingtiandy_url set outc=outc+1,outdate='"&ForMatDate(now(),55)&"',outj="& outj &",outp=(outc/(datediff('d',dateandtime,'"&now()&"')+1)) where w_domain='"& sitedomain &"'")
			End IF
			conn.Execute("insert into qingtiandy_urllog (w_domain,ip,come,inout,dateandtime) values('"& sitedomain &"','"& myip &"','"& siteUrl &"',1,'"&ForMatDate(now(),55)&"')")
			cneWriteInfo("写入记录")
		end if
		Call InOutApplication("OUT")
		
		IF Request.QueryString("tof")="a" Then Response.End()
		HeadHtml="<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"" />"& vbcrlf
		HeadHtml=HeadHtml &"<html xmlns=""http://www.w3.org/1999/xhtml"">"& vbcrlf 
		HeadHtml=HeadHtml &"<head>"& vbcrlf
		HeadHtml=HeadHtml &"<title>"& sitename &"</title>"& vbcrlf
		HeadHtml=HeadHtml &"<meta http-equiv=""Content-Language"" content=""zh-cn"" />"& vbCrLf
		HeadHtml=HeadHtml &"<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"" />"& vbCrLf
		HeadHtml=HeadHtml &"<meta name=""keywords"" content="""& keywords &""" />"& vbcrlf
		HeadHtml=HeadHtml &"<meta name=""description"" content="""& description &""" />"& vbcrlf
		HeadHtml=HeadHtml &"</head>"& vbcrlf &"<body>"& vbcrlf
		Response.Write HeadHtml
		

		if myip=cneip then
			cneWriteInfo("<a href='"& siteurl &"'>"& siteurl &"</a>")
			Response.Write "<iframe name=""I1"" width=""100%"" height=""200"" src="""& siteurl &"""></iframe>"
		else
			'Response.redirect siteurl
			Response.Write "<script>document.write(""<a id='myLink' href='"& siteurl &"'><img src='../Members/Uimg/go.gif' border='0'></a>"");myLink.click();</script>"
		end if
			Response.Write "<script language=""javascript"" src="""& tongji &"""></script>"
			Response.Write "</body></html>"
	End Sub	
		
	REM 来源页检查
	Public Sub ChkReferer()	
		dim HTTPREFERER,SERVERNAME
		HTTPREFERER=Request.ServerVariables("HTTP_REFERER")
		SERVERNAME=Request.ServerVariables("SERVER_NAME")			
		if not mid(HTTPREFERER,8,len(SERVERNAME))=SERVERNAME then
		Response.Redirect "/"
		Response.End
		end if
	End Sub
	
	
	
	
End Class

set qt=new qingtiandy_cn_qq_314048526
%>