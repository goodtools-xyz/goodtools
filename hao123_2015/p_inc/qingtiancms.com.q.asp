<%
Function Qingtian_WriteToFile(fil,wstr)
	Dim fso, f
	Set fso = Server.CreateObject(G_FSO)
	Set f = fso.CreateTextFile(Server.MapPath(fil),True)
	f.Write wstr
	Set f = nothing
	Set fso = nothing
End function

Function IsFolderExists(spec) 
	Dim fso
	Set fso = CreateObject(G_FSO)
	If (fso.FolderExists(server.MapPath(spec))) Then
	IsFolderExists = True
	Else
	IsFolderExists = False
	End If
End Function

'文件夹-FSO删除文件夹
Sub DeleteFolder(filespec)
  Dim fso
  Set fso = CreateObject(G_FSO)
  IF IsFolderExists(filespec) Then
  	fso.DeleteFolder(Server.MapPath(filespec))
  End IF
  Set fso = nothing
End Sub

Function ReadAllTextFile(filespec)
	IF Not N_Fso.IsFileExists(filespec) Then
		ReadAllTextFile=""
		Exit Function
	End IF
	Dim fso, f
	Set fso = CreateObject(G_FSO)
	Set f = fso.OpenTextFile(server.MapPath(filespec), 1)	
	if Not f.AtEndOfStream then
		ReadAllTextFile = f.ReadAll
	else
		ReadAllTextFile = ""
	end if
	Set f=nothing
	Set fso=nothing
End Function
Function WriteToFile(fil,wstr)
	Dim fso, f
	Set fso = Server.CreateObject(G_FSO)
	Set f = fso.CreateTextFile(Server.MapPath(fil),True)
	f.Write wstr
	Set f = nothing
	Set fso = nothing
End function


'功能:只取数字
Function Bint(Str)
	Str = Trim(Str)
	If Str = "" Or IsNull(Str) Or Not IsNumeric(Str) Then Str = "0"
	Str=Replace(Str,"'","")
	Bint = Round(Str, 0)
End Function

Function Replace_Text_2008(str)
	IF str="" or isnull(str) Then
		Replace_Text_2008=""
		Exit Function
	End IF
	str=Trim(str)
	str=replace(str,"'","")
	Replace_Text_2008=str
End Function 

Function ReplaceText(str)
	IF str="" or isnull(str) Then
		ReplaceText=""
		Exit Function
	End IF
	str=Trim(str)
	str=replace(str,"'","")
	ReplaceText=str
End Function 

Function ReplaceTextArea(fString)
	fString = Replace(fString, CHR(13),"")
	fString = Replace(fString, CHR(10)&CHR(10), "</P><P>")
	fString = Replace(fString, CHR(10), "<BR>")
	ReplaceTextArea=fString
End Function

Function Replace_Text_Html(str)
	IF str="" or isnull(str) Then
		Replace_Text_Html=""
		Exit Function
	End IF
	str=Trim(str)
	str=server.HTMLEncode(str)
	Replace_Text_Html=str
End Function 

Function isPostBack()
	isPostBack = False
	If Request.ServerVariables("REQUEST_METHOD")="POST" Then isPostBack = True
End Function

Function doAlert(sInfo,sUrl)
	WriteLn( "</scrip" & "t>" )	'//为了防止错误
	WriteLn( "<s" & "cript language='Javascript'>" )
	If Len(sInfo&"")>0 Then WriteLn( "	alert('" & Str4Js(sInfo) & "');" )
	If Len(sUrl&"")>0 Then WriteLn( "	window.location.href='" & Str4Js(sUrl) & "';" )
	WriteLn( "</scrip" & "t>" )
	If Len(sUrl&"")>0 Then CloseConn() : Response.End()
End Function

Function WriteLn(sInfo)
	Response.Write( sInfo & vbCrLf )
End Function
'//---- 定义转换为Javascript字符串的函数 ----//
'//---- (约定Javascript中，用单引号引用字符串) ----//
Function Str4Js(sInfo)
	Str4Js = sInfo
	If isEmpty(sInfo) Then Str4Js = "" : Exit Function
	If isNull(sInfo) Then Str4Js = "" : Exit Function
	Str4Js = Replace(Str4Js,"\","\\")
	Str4Js = Replace(Str4Js,"'","\'")
	Str4Js = Replace(Str4Js,"""","\""")
	Str4Js = Replace(Str4Js,vbCrLf,"\n")
	Str4Js = Replace(Str4Js,vbCr,"\n")
	Str4Js = Replace(Str4Js,vbLf,"\n")
	Str4Js = Replace(Str4Js,vbTab,"\t")
	Str4Js = Replace(Str4Js,"script>","scrip'+'t>",1)
	Str4Js = Replace(Str4Js,"SCRIPT>","SCRIP'+'T>",1)
End Function

Function CloseConn()
	On Error Resume Next
	Conn.Close()
	Set Conn = Nothing
End Function

Function HTMLDecode(sText)
	If isEmpty(sText) Then HTMLDecode = "" : Exit Function
	If isNull(sText) Then HTMLDecode = "" : Exit Function	
	Dim I
	sText = Replace(sText, "&amp;" , Chr(38))
	sText = Replace(sText, "&quot;", Chr(34))
	sText = Replace(sText, "&lt;" , Chr(60))
	sText = Replace(sText, "&gt;" , Chr(62))
	sText = Replace(sText, "&nbsp;", Chr(32))
	sText = Replace(sText, "&#183;", "·")
	'For I = 1 To 255
'			sText = Replace(sText, "&#" & I & ";", Chr(I))
'		Next
	HTMLDecode = sText
End Function


Function HTMLDecodeTextArea(fString)
	fString = Replace(fString,"",CHR(13))
	fString = Replace(fString, "</P><P>",CHR(10)&CHR(10))
	fString = Replace(fString, "<BR>",CHR(10))
	HTMLDecodeTextArea=fString
End Function

Function FormatNumSerial(s)
	Dim a, i
	s = Replace(s," ","")
	If Len(s)<1 Then FormatNumSerial=0 : Exit Function
	a = Split(s,",")
	For i=0 To UBound(a)
		If Not isNumeric(a(i)) Then a(i)=0
	Next
	FormatNumSerial = Join(a,",")
End Function

Function CheckBoxScript(ByVal FormElement , ByVal ElementValue)
	  CheckBoxScript = "<s"&"cript language=""JavaScript"">" & vbCrlf
	  CheckBoxScript = CheckBoxScript & "    var ss = """ & ElementValue & """" & vbCrlf
	  CheckBoxScript = CheckBoxScript & "    for(i=0;i<"&FormElement&".length;i++){ " & vbCrlf
	  CheckBoxScript = CheckBoxScript & "        if(ss.indexOf("&FormElement&"[i].value)>=0){ " & vbCrlf
	  CheckBoxScript = CheckBoxScript & "            "&FormElement&"[i].checked = true " & vbCrlf
	  CheckBoxScript = CheckBoxScript & " 	}	}	</"&"script>"
End function

Function Qingtiandy_getfilecontent(EditFile)
	Dim FsoObj,FileObj,FileStreamObj
	Set FsoObj = Server.CreateObject(G_FSO)
	IF FsoObj.fileExists(EditFile) Then	
		Set FileObj = FsoObj.GetFile(EditFile)
		Set FileStreamObj = FileObj.OpenAsTextStream(1)
		if Not FileStreamObj.AtEndOfStream then
			Qingtiandy_getfilecontent = FileStreamObj.ReadAll
		else
			Qingtiandy_getfilecontent = ""
		end if
	Else
		Qingtiandy_getfilecontent = ""
	End IF
End Function


'独立模板提示功能：
Function Tip_skin()
	Dim old,str,Tstr,Tstr2,Tstr3
	str=""
	Tstr=""
	Tstr2=""
	Tstr3=""
	old=Add_Root_Dir("/template/"&G_moban&"/js/qingtiandy_cn.config")
	IF N_Fso.IsFileExists (old) Then
		str=Qingtiandy_getfilecontent(server.MapPath(old))
		Tstr=GetContent(str,"<模板编号>","</模板编号>",0)
		Tstr2=GetContent(str,"<模板版本>","</模板版本>",0)
		Tstr3=GetContent(str,"<模板版本号>","</模板版本号>",0)
	End IF
	Tip_skin=array(Tstr,Tstr2,Tstr3)
End Function


'用流下载的方式下载文件
'路径，输出流处理方式，下载名字
Function TransferFile(path, mimeType, filename)
	Dim ForReading:ForReading=1
	Dim TristateTrue:TristateTrue=-1 
	Dim FILE_TRANSFER_SIZE:FILE_TRANSFER_SIZE=16384000 	
	Dim objFileSystem, objFile, objStream
	Dim char
	Dim sent
	send=0
	TransferFile = True
	Set objFileSystem = Server.CreateObject("Scripting.FileSystemObject")
	Set objFile = objFileSystem.GetFile(server.MapPath(Path))
	Set objStream = objFile.OpenAsTextStream(ForReading, TristateTrue)
	Response.AddHeader "content-type", mimeType
	response.AddHeader "Content-Disposition","attachment;filename=" & filename 
	Response.AddHeader "content-length", objFile.Size
	Do While Not objStream.AtEndOfStream
		char = objStream.Read(1)
		Response.BinaryWrite(char)
		sent = sent + 1
		If (sent MOD FILE_TRANSFER_SIZE) = 0 Then
			Response.Flush
			If Not Response.IsClientConnected Then
				TransferFile = False
			Exit Do
			End If
		End If
	Loop
	Response.Flush
	If Not Response.IsClientConnected Then TransferFile = False
	objStream.Close
	Set objStream = Nothing
	Set objFileSystem = Nothing
End Function

Function GetUrl_httpAll(v)
	Dim v2,v5,v41,v6
	v2=left(v,1)
	IF v2="$" Then
		GetUrl_httpAll=Add_Root_Dir(mid(v,2,len(v)))	
		Exit Function
	End IF
	IF v2="#" Then
		v6=""
		v5=mid(v,2,len(v))
		IF Instr(v5,"#")>0 Then 
			v5=Left(v5,Instr(v5,"#")-1)
			v41=v
			v6=mid(v41,InstrRev(v41,"#"),len(v41))
		End IF
		GetUrl_httpAll=Get_type2_id(v5)
		GetUrl_httpAll=url_(array("l2",Trim(GetUrl_httpAll),"1"))&v6
		Exit Function		
	End IF
	IF Instr(left(v,7),"http://")>0 or Instr(left(v,8),"https://")>0 or Instr(left(v,10),"tencent://")>0 Then
		v=v
	ElseIF Instr(left(v,8),"httpp://")>0 Then
		v=Replace(v,"httpp://","http://")
		v=Replace(v,"http://",Add_Root_Dir("/p/t/?u=http://"))
	ElseIF Instr(left(v,8),"httpsp://")>0 Then
		v=Replace(v,"https://","https://")	
		v=Replace(v,"https://",Add_Root_Dir("/p/t/?u=https://"))
	Else
		IF Left(v,1)="/" Then 
			v=Add_Root_Dir(v)
		Else
			IF Instr(v,".")>0 Then
				v="http://"&v
			End IF
		End IF
	End IF

	v=Str4Null(v)
	v=Replace(v,"{qt:G_lm_baidu}",G_lm_baidu)
	v=Replace(v,"{qt:G_lm_taobao}",G_lm_taobao)
	v=Replace(v,"{qt:G_lm_xunlei}",G_lm_xunlei)
	v=Replace(v,"{qt:G_lm_sogou_s}",G_lm_sogou_s)
	v=Replace(v,"{qt:G_lm_dangdang_s}",G_lm_dangdang_s)
	v=Replace(v,"{qt:G_redbaby_s}",G_redbaby_s)
	v=Replace(v,"{qt:G_lm_amazon_s}",G_lm_amazon_s)
	v=Replace(v,"{qt:G_lm_taobao2}",G_lm_taobao)
	v=Replace(v,"{qt:G_lm_gouwuke_s}",G_lm_gouwuke_s)

	GetUrl_httpAll=v
End Function


Function GetUrl_TextUrl(v)
	Dim v2
	v2=left(v,1)
	IF v2="$" Then
		GetUrl_TextUrl=Add_Root_Dir(mid(v,2,len(v)))	
		Exit Function
	End IF
	v=Replace(v,"{qt:G_lm_baidu}",G_lm_baidu)
	v=Replace(v,"{qt:G_lm_taobao}",G_lm_taobao)
	v=Replace(v,"{qt:G_lm_xunlei}",G_lm_xunlei)
	v=Replace(v,"{qt:G_lm_sogou_s}",G_lm_sogou_s)
	v=Replace(v,"{qt:G_lm_dangdang_s}",G_lm_dangdang_s)
	v=Replace(v,"{qt:G_redbaby_s}",G_redbaby_s)
	v=Replace(v,"{qt:G_lm_amazon_s}",G_lm_amazon_s)
	v=Replace(v,"{qt:G_lm_taobao2}",G_lm_taobao)
	v=Replace(v,"{qt:G_lm_gouwuke_s}",G_lm_gouwuke_s)
	v=replace(replace(replace(replace(replace(replace(v,"{qt:template_top}",v),"{qt:template_button}",v),"../images/","template/"&G_moban&"/images/"),"../css/",Add_Root_Dir("template/"&G_moban&"/css/")),"../js/",Add_Root_Dir("template/"&G_moban&"/js/")),"../app/",Add_Root_Dir("template/"&G_moban&"/app/"))
	v=replace(v,"{qt:indexurl}",Add_Root_Dir("/"))	
	GetUrl_TextUrl=v
End Function


'得到真实首页模板路径
Function GetTemplateUrlIndex()
	Dim p1,p2,p3,v1,v2
	v1="index.html"
	v2="index.htm"
	p1="/template/"&G_moban&"/"&G_moban_html&"/"&v1
	p2="/template/"&G_moban&"/"&G_moban_html&"/"&v2
	IF G_All_moshi="1" Then
		IF p2="" Then
			p3=p1
		Else
			IF N_Fso.IsFileExists(Add_Root_Dir(p2)) Then
				p3=p2
			Else
				p3=p1
			End IF
		End IF 
	Else
		p3=p1
	End IF
	GetTemplateUrlIndex=p3
End  Function

'网址匹配
Function IsValidUrl(str) 
	Dim regEx 
	Set regEx = New RegExp 
	regEx.Pattern = "http(s)?://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?" 
	IsValidUrl = regEx.Test(str) 
End Function

Function IsGadmin()
	IF N_Fso.C_N_IsFolderExists(Add_Root_Dir("/"&G_ADMIN)) Then
		IsGadmin=True
	Else
		IsGadmin=False
		Response.Write "你的后台管理文件夹和你的[常规管理--可视模式--后台文件夹的目录]的变量不一致，请修改"
		Response.End()
	End IF
End Function

'获取类别======晴天2009.12.11更新~
Function GetDhType1(v,n,n2)
	Dim s1,s2,n_name,n2_name,nstr,v1
	s1=Split(v,"||")
	nstr=""
	For i=0 To Ubound(s1)
		s2=s1(i) '名字
		IF s2<>"" Then
			IF Clng(i)=Clng(n) Then
				n_name=s2
				v1=" Selected"
			Else
				v1=""
			End IF
			nstr=nstr&"<option value='"&i&"'"&v1&">"&s2&"</option>"
		End IF
	Next
	IF n2="1" Then
		GetDhType1=nstr
	ElseIF n2="2" Then
		GetDhType1=n_name
	End IF
End Function

'把今日的积分归为0
Function In_zero_today()
	IF application("qTTuiguanDate")="" Then
		conn.execute("update soojs_un set soojs_jifen_G_jifen_s_f_today=0")
		application.lock
		application("qTTuiguanDate")=day(date())
		application.unlock
	End IF
	IF application("qTTuiguanDate")=day(Date()) Then
	
	Else
		conn.execute("update soojs_un set soojs_jifen_G_jifen_s_f_today=0")
		application.lock
		application("qTTuiguanDate")=day(date())
		application.unlock				
	End IF
End Function

'积分表插入
Function Get_qingtiandy_jifen_ip(uid,utype,jifen)
	uid=Bint(uid)
	IF uid=0 Then Exit Function
	'用户ID,用户类型,多少积分
	Dim oRs_re,oRs_f,k_uip,sql,ttFlag
	ttFlag=False
	k_uip=GetIp()
	IF utype="1" Then '注册送积分
		Set oRs_re=Server.CreateObject(G_RS)
		oRs_re.open "Select * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		
		oRs_re.AddNew()
		oRs_re("uid")=uid
		oRs_re("uip")=k_uip
		oRs_re("utime")=ForMatDate(now(),55)
		oRs_re("utype")=1
		oRs_re("ujifen")=G_zhuce_j2
		oRs_re("jid")=0
		oRs_re.Update
		
		oRs_re.AddNew()
		oRs_re("uid")=uid
		oRs_re("uip")=k_uip
		oRs_re("utime")=ForMatDate(now(),55)
		oRs_re("utype")=3
		oRs_re("ujifen")=0
		oRs_re("jid")=0
		oRs_re.Update		
		oRs_re.close:Set oRs_re=Nothing
		
		conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_zhuce_j2&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+"&G_zhuce_j2&" Where id="&uid&"")		
		
	ElseIF utype="2" Then '推广获取积分
		'In_zero_today
		
		uid=Bint(uid)
		Set oRskp1=Conn.Execute("Select soojs_jifen_G_jifen_home,soojs_jifen_G_jifen_tuijian,soojs_jifen_G_jifen_tuiguang_s,soojs_jifen_G_jifen_timer,soojs_jifen_G_jifen_jifen_bili,soojs_jifen_G_jifen_tuiguang_if,soojs_jifen_G_jifen_s_f_today,soojs_jifen_G_jifen_s_f_1 from soojs_un Where id="&uid)
		IF Not oRskp1.Eof Then	
			'是否基本设置优先 0:基本设置优先 1:自己优先
			G_soojs_jifen_G_jifen_tuiguang_if=Bint(oRskp1("soojs_jifen_G_jifen_tuiguang_if"))
			
			'先判断是否超过一天的推广积分数
			IF G_soojs_jifen_G_jifen_tuiguang_if=1 Then
				osoojs_jifen_G_jifen_s_f_1=Bint(oRskp1("soojs_jifen_G_jifen_s_f_1"))
				'IF osoojs_jifen_G_jifen_s_f_1=0 Then
					'osoojs_jifen_G_jifen_s_f_1=Bint(G_jifen_s_f_1)
				'End IF
			Else
				osoojs_jifen_G_jifen_s_f_1=Bint(G_jifen_s_f_1)
			End IF
			km_osoojs_jifen_G_jifen_s_f_1=osoojs_jifen_G_jifen_s_f_1
			'如果有设置积分上限的，那么判断是否超过积分上限了
			IF km_osoojs_jifen_G_jifen_s_f_1>0 Then
				'osoojs_jifen_G_jifen_s_f_today=Bint(oRskp1("soojs_jifen_G_jifen_s_f_today"))
				tSql="Select Count(*) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=2"
				IF G_IS_SQL_User_DB="1" Then
					tSql=tSql&" and datediff(day,utime,getdate())=0"
				Else
					tSql=tSql&" and datediff('d',utime,'"&now()&"')=0"
				End IF					
				Set oRstot=Conn.Execute(tSql)
				IF Not oRstot.Eof Then
					osoojs_jifen_G_jifen_s_f_today=Bint(oRstot(0))
				Else
					osoojs_jifen_G_jifen_s_f_today=0
				End IF
				IF osoojs_jifen_G_jifen_s_f_today>=km_osoojs_jifen_G_jifen_s_f_1 Then
					Exit Function
				End IF
			End IF
			
			
			
			IF G_soojs_jifen_G_jifen_tuiguang_if=1 Then
				'积分操作--多少时间内只记一次积分
				G_jifen_timer=Bint(G_jifen_timer)
				G_jifen_timer_fk1=Bint(oRskp1("soojs_jifen_G_jifen_timer")):IF G_jifen_timer_fk1<>0 Then G_jifen_timer=G_jifen_timer_fk1
				'扣掉百分的比例
				G_jifen_jifen_bili=Bint(G_jifen_jifen_bili)
				G_jifen_jifen_bili_fk1=Bint(oRskp1("soojs_jifen_G_jifen_jifen_bili")):IF G_jifen_jifen_bili_fk1<>0 Then G_jifen_jifen_bili=G_jifen_jifen_bili_fk1
				'积分--用户推广一个链接送多少积分
				G_jifen_tuijian=Bint(oRskp1("soojs_jifen_G_jifen_tuijian"))
				'推广积分模式
				G_jifen_tuiguang_s=GetRp(oRskp1("soojs_jifen_G_jifen_tuiguang_s"))
			Else
				G_jifen_timer=Bint(G_jifen_timer)
				G_jifen_jifen_bili=Bint(G_jifen_jifen_bili)				
			End IF
			
			Set oRs_f=Server.CreateObject(G_RS)
			
			'最新防作弊程序
			IF G_jifen_tuiguang_s="3" Then
				IF G_IS_SQL_User_DB="1" Then
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=2 order By Id Desc"
				Else
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=2 order By Id Desc"
				End IF				
				oG_jifen_jifen_bili=GetRamNumb(2)
				oRs_f.open sql,conn,1,3
				'ip存在
				IF Not oRs_f.Eof Then
					'如果ip存在 那么对比时间
					oG_jifen_timer=datediff("s",oRs_f("utime"),now())
					IF oG_jifen_timer>G_jifen_timer And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
						'如果时间已过间隔，那么对比cookies
						IF Request.Cookies("a1202c")="" Then
							oRs_f.Addnew()
							oRs_f("uid")=uid
							oRs_f("uip")=k_uip
							oRs_f("utime")=ForMatDate(now(),55)
							oRs_f("utype")=2
							oRs_f("ujifen")=G_jifen_tuijian
							oRs_f("jid")=0
							oRs_f.Update()
							conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_tuijian&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+1 Where id="&uid&"")	
							Response.Cookies("a1202c")="1"
							Response.Cookies("a1202c").Expires= (now()+1) 	
							Exit Function						
						End IF
					End IF
				End IF 
				'如果ip不存在
				IF G_IS_SQL_User_DB="1" Then
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=2 order By Id Desc"
				Else
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=2 order By Id Desc"
				End IF				
				oG_jifen_jifen_bili=GetRamNumb(2)
				oRs_f.open sql,conn,1,3	
				IF Not oRs_f.Eof Then
					'如果ip不存在 那么对比时间
					oG_jifen_timer=datediff("s",oRs_f("utime"),now())
					IF oG_jifen_timer>G_jifen_timer And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
						'如果时间已过间隔，那么对比cookies
						IF Request.Cookies("a1202c")="" Then
							oRs_f.Addnew()
							oRs_f("uid")=uid
							oRs_f("uip")=k_uip
							oRs_f("utime")=ForMatDate(now(),55)
							oRs_f("utype")=2
							oRs_f("ujifen")=G_jifen_tuijian
							oRs_f("jid")=0
							oRs_f.Update()
							conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_tuijian&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+1 Where id="&uid&"")	
							Response.Cookies("a1202c")="1"
							Response.Cookies("a1202c").Expires= (now()+1) 	
							Exit Function						
						End IF
					End IF					
				Else
					oRs_f.Addnew()
					oRs_f("uid")=uid
					oRs_f("uip")=k_uip
					oRs_f("utime")=ForMatDate(now(),55)
					oRs_f("utype")=2
					oRs_f("ujifen")=G_jifen_tuijian
					oRs_f("jid")=0
					oRs_f.Update()
					conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_tuijian&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+1 Where id="&uid&"")	
					Response.Cookies("a1202c")="1"
					Response.Cookies("a1202c").Expires= (now()+1) 	
					Exit Function					
				End IF						
			Else
				'按时间记积分
	
				IF G_jifen_timer=0 Then
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=2 order By Id Desc"
				Else
					IF G_IS_SQL_User_DB="1" Then
						sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=2 order By Id Desc"
					Else
						sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=2 order By Id Desc"
					End IF 
				End IF
				
				oG_jifen_jifen_bili=GetRamNumb(2)
				oRs_f.open sql,conn,1,3
				
				IF G_jifen_tuiguang_s="1" Then
					IF Not oRs_f.Eof Then
						oG_jifen_timer=datediff("s",oRs_f("utime"),now())
					Else
						oG_jifen_timer=36000000
					End IF		
					
					IF oG_jifen_timer>G_jifen_timer And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
						oRs_f.Addnew()
						oRs_f("uid")=uid
						oRs_f("uip")=k_uip
						oRs_f("utime")=ForMatDate(now(),55)
						oRs_f("utype")=2
						oRs_f("ujifen")=G_jifen_tuijian
						oRs_f("jid")=0
						oRs_f.Update()
						conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_tuijian&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+1 Where id="&uid&"")					
					End IF
				ElseIF G_jifen_tuiguang_s="2" Then
					IF  oG_jifen_jifen_bili>G_jifen_jifen_bili Then
						oRs_f.Addnew()
						oRs_f("uid")=uid
						oRs_f("uip")=k_uip
						oRs_f("utime")=ForMatDate(now(),55)
						oRs_f("utype")=2
						oRs_f("ujifen")=G_jifen_tuijian
						oRs_f("jid")=0
						oRs_f.Update()
						conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_tuijian&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+1 Where id="&uid&"")					
					End IF			
				Else
					IF oRs_f.Eof And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
						oRs_f.Addnew()
						oRs_f("uid")=uid
						oRs_f("uip")=k_uip
						oRs_f("utime")=ForMatDate(now(),55)
						oRs_f("utype")=2
						oRs_f("ujifen")=G_jifen_tuijian
						oRs_f("jid")=0
						oRs_f.Update()
						conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_tuijian&",soojs_jifen_G_jifen_s_f_today=soojs_jifen_G_jifen_s_f_today+1 Where id="&uid&"")
					End IF
					oRs_f.close:Set oRs_f=Nothing	
				End IF	
			End IF
		End IF
		oRskp1.close:Set oRskp1=Nothing
	ElseIF utype="3" Then '登陆获取积分
		Set oRs_f=Server.CreateObject(G_RS)
		IF G_IS_SQL_User_DB="1" Then
			sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=3 Order By Id Desc"
		Else
			sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=3 Order By Id Desc"
		End IF			
		oRs_f.open sql,conn,1,3		
		IF  oRs_f.Eof Then
			ttFlag=True
		Else
			IF datediff("d",oRs_f("utime"),now())>0 Then
				ttFlag=True
			End IF
			
		End IF
		IF ttFlag Then
		
			Set oRs_fh=Server.CreateObject(G_RS)
			oRs_fh.open "Select * From soojs_un Where id="&uid&"",Conn,1,3
			IF Not oRs_fh.EOf Then
				k_soojs_jifen_G_jifen_denglu=Bint(oRs_fh("soojs_jifen_G_jifen_denglu"))
				IF k_soojs_jifen_G_jifen_denglu=0 Then k_soojs_jifen_G_jifen_denglu=G_jifen_denglu
				oRs_fh("soojs_jifen")=oRs_fh("soojs_jifen")+k_soojs_jifen_G_jifen_denglu
				oRs_fh("soojs_lastdate")=FormatDate(now(),55)
				oRs_fh("soojs_lastip")=getIP()
				oRs_fh.Update()
			Else
				Exit Function	
			End IF
			oRs_fh.close
					
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=3
			oRs_f("ujifen")=k_soojs_jifen_G_jifen_denglu
			oRs_f("jid")=0
			oRs_f.Update()			


			
			'conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_denglu&",soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' Where id="&uid&"")
			Response.Cookies("logintime")=ForMatDate(now(),55)
			'下线功能+++++++++++++
			IF G_xiaxian_1_zhuye="1" Then
				Set oRs_k=Conn.Execute("Select soojs_u_xiaxian,soojs_jifen_G_jifen_xiaxian_denglu from soojs_un Where id="&uid)
				IF Not oRs_k.Eof Then
					IF G_xiaxian_zhuye_2a="1" Then
						x_1=Bint(oRs_k(0))
						x_2=Bint(oRs_k(1))
						IF x_1<>0 Then
							Set oRs6=Conn.Execute("Select soojs_jifen_G_jifen_xiaxian_denglu From soojs_un Where id="&x_1)
							IF Not oRs6.Eof Then
								x_2=Bint(oRs6(0))
							Else
								x_2=0
							End IF
							oRs6.close()
						End IF						
						IF x_2<>0 Then 
							x_G_xiaxian_zhuye_1_bili=x_2/100
						Else
							x_G_xiaxian_zhuye_1_bili=G_xiaxian_zhuye_1_bili
						End IF
						IF x_1<>0 Then
							Get_qingtiandy_jifen_ip x_1,14,Bint(k_soojs_jifen_G_jifen_denglu*x_G_xiaxian_zhuye_1_bili)
						End IF
					End IF						
				End IF
			End IF			
		End IF
		oRs_f.close:Set oRs_f=Nothing
	ElseIF utype="4" Then '兑换奖品扣积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=4
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
		End IF
		oRs_f.close:Set oRs_f=Nothing	
	ElseIF utype="5" Then '冲值积分
		IF jifen<>0 Then
			Set oRs_f=Server.CreateObject(G_RS)
			oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where uid="&uid,conn,1,3
			IF Not oRs_f.Eof Then
				oRs_f.Addnew()
				oRs_f("uid")=uid
				oRs_f("uip")=k_uip
				oRs_f("utime")=ForMatDate(now(),55)
				oRs_f("utype")=utype
				oRs_f("ujifen")=jifen
				oRs_f("jid")=0
				oRs_f.Update()
				'conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")
			End IF
			oRs_f.close:Set oRs_f=Nothing	
		End IF	
	ElseIF utype="6" Then '来路统计积分
		ppG_jifen_lailu=Bint(G_jifen_lailu)
		IF ppG_jifen_lailu=0 Then Exit Function
		Set oRs_f=Server.CreateObject(G_RS)
		G_jifen_timer=Bint(G_jifen_timer)
		G_jifen_jifen_bili=Bint(G_jifen_jifen_bili)
		IF G_jifen_timer=0 Then
			sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=6 order By Id Desc"
		Else
			IF G_IS_SQL_User_DB="1" Then
				sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=6 order By Id Desc"
			Else
				sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&" And uip='"&k_uip&"' And utype=6 order By Id Desc"
			End IF 
		End IF
		oG_jifen_jifen_bili=GetRamNumb(2)
		oRs_f.open sql,conn,1,3
		IF G_jifen_tuiguang_s="1" Then
			IF Not oRs_f.Eof Then
				oG_jifen_timer=datediff("s",oRs_f("utime"),now())
			Else
				oG_jifen_timer=36000
			End IF		
			IF oG_jifen_timer>G_jifen_timer And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
				oRs_f.Addnew()
				oRs_f("uid")=uid
				oRs_f("uip")=k_uip
				oRs_f("utime")=ForMatDate(now(),55)
				oRs_f("utype")=6
				oRs_f("ujifen")=G_jifen_lailu
				oRs_f("jid")=0
				oRs_f.Update()
				conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_lailu&" Where id="&uid&"")					
			End IF
		ElseIF G_jifen_tuiguang_s="2" Then
			IF  oG_jifen_jifen_bili>G_jifen_jifen_bili Then
				oRs_f.Addnew()
				oRs_f("uid")=uid
				oRs_f("uip")=k_uip
				oRs_f("utime")=ForMatDate(now(),55)
				oRs_f("utype")=6
				oRs_f("ujifen")=G_jifen_lailu
				oRs_f("jid")=0
				oRs_f.Update()
				conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_lailu&" Where id="&uid&"")					
			End IF			
		Else
			IF oRs_f.Eof And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
				oRs_f.Addnew()
				oRs_f("uid")=uid
				oRs_f("uip")=k_uip
				oRs_f("utime")=ForMatDate(now(),55)
				oRs_f("utype")=6
				oRs_f("ujifen")=G_jifen_lailu
				oRs_f("jid")=0
				oRs_f.Update()
				conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_lailu&" Where id="&uid&"")
			End IF
			oRs_f.close:Set oRs_f=Nothing	
		End IF	
	ElseIF utype="61" Then '点出统计积分
		jifen=Bint(jifen)
		IF G_jifen_dianchu_a="1" And jifen>0 Then
			ppG_jifen_lailu_out=Bint(G_jifen_lailu_out)
			IF ppG_jifen_lailu_out=0 Then Exit Function
			Set oRs_f=Server.CreateObject(G_RS)
			G_jifen_timer=Bint(G_jifen_timer_lailu)
			G_jifen_jifen_bili=Bint(G_jifen_jifen_bili_lailu)
			IF G_jifen_timer=0 Then
				sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61 order By Id Desc"
			Else
				IF G_IS_SQL_User_DB="1" Then
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61 order By Id Desc"
				Else
					sql="Select top 1 * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61 order By Id Desc"
				End IF 
			End IF
			
			oG_jifen_jifen_bili=GetRamNumb(2)
			oRs_f.open sql,conn,1,3
			IF Not oRs_f.Eof Then
				oG_jifen_timer=datediff("s",oRs_f("utime"),now())
			Else
				oG_jifen_timer=36000
			End IF		
			IF oG_jifen_timer>G_jifen_timer And oG_jifen_jifen_bili>G_jifen_jifen_bili Then
			
				IF G_IS_SQL_User_DB="1" Then
					sql="Select Count(*) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61  and datediff(day,utime,getdate())=0"
				Else
					sql="Select Count(*) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61 and datediff('d',utime,'"&now()&"')=0"
				End IF			
			
				Set oRs_knn=Conn.Execute(sql)
				IF Not oRs_knn.Eof Then
					oG_jifen_jifen_numbs_lailu=Bint(oRs_knn(0))
				Else
					oG_jifen_jifen_numbs_lailu=0
				End IF
				IF oG_jifen_jifen_numbs_lailu<Bint(G_jifen_jifen_numbs_lailu) Then
					IF G_IS_SQL_User_DB="1" Then
						sql="Select * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61 And jid="&jifen&" "
					Else
						sql="Select * From qingtiandy_jifen_ip Where uid="&uid&"  And utype=61 And jid="&jifen&" "
					End IF	
					Set oRs_fg=Conn.Execute(sql)
					IF Not oRs_fg.Eof Then
						oG_jifen_timer=datediff("s",oRs_fg("utime"),now())
					Else
						oG_jifen_timer=60*60*25
					End IF	
					IF oG_jifen_timer>60*60*24	Then							
						oRs_f.Addnew()
						oRs_f("uid")=uid
						oRs_f("uip")=k_uip
						oRs_f("utime")=ForMatDate(now(),55)
						oRs_f("utype")=61
						oRs_f("ujifen")=G_jifen_lailu_out
						oRs_f("jid")=jifen
						oRs_f.Update()
						conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_lailu_out&" Where id="&uid&"")	
					End IF
				End IF				
			End IF			
		End IF	
	ElseIF utype="7" Then '支付宝支付
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=7
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
		End IF
		oRs_f.close:Set oRs_f=Nothing	
	ElseIF utype="8" Then '设为主页获得积分
		
		IF G_jinbi_kaifang="1" Then
			Response.End()
		End IF
		Set oRs_f=Server.CreateObject(G_RS)
		sql="Select top 1 * From qingtiandh_userip where uip='"&k_uip&"' order By Id Desc"
		sG_jifen_timer=24*60*60
		oG_jifen_jifen_bili=GetRamNumb(2)
		oRs_f.open sql,conn,1,1
		
		IF Not oRs_f.Eof Then
			oG_jifen_timer=datediff("s",oRs_f("uedittime"),now())
			ouid=oRs_f("uid")
			Set oRsxf=Conn.Execute("Select soojs_jifen_G_jifen_home,soojs_jifen_G_jifen_shouyejifen_bili From soojs_un Where id="&ouid)
			IF Not oRsxf.Eof Then
				G_jifen_home_g1=Bint(oRsxf("soojs_jifen_G_jifen_home"))
				sG_soojs_jifen_G_jifen_shouyejifen_bili=Bint(oRsxf("soojs_jifen_G_jifen_shouyejifen_bili"))
				IF G_jifen_home_g1<>0 Then G_jifen_home=G_jifen_home_g1
				oG_jifen_jifen_bili=GetRamNumb(2)
				IF oG_jifen_timer>sG_jifen_timer And oG_jifen_jifen_bili>sG_soojs_jifen_G_jifen_shouyejifen_bili Then
					sql="Select top 1 * From qingtiandy_jifen_ip where 1<>1"
					Set oRs_f2=Server.CreateObject(G_RS)
					oRs_f2.open sql,conn,1,3	
					oRs_f2.Addnew()
					oRs_f2("uid")=ouid
					oRs_f2("uip")=k_uip
					oRs_f2("utime")=ForMatDate(now(),55)
					oRs_f2("utype")=utype
					oRs_f2("ujifen")=G_jifen_home
					oRs_f2("jid")=0
					oRs_f2.Update()
					conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&G_jifen_home&" Where id="&uid&"")	
					conn.Execute("Update qingtiandh_userip set uedittime='"&FormatDate(Now(),55)&"' Where uip='"&k_uip&"'")	
					'下线功能+++++++++++++
					IF G_xiaxian_1_zhuye="1" Then
						Set oRs_k=Conn.Execute("Select soojs_u_xiaxian,soojs_jifen_G_jifen_xiaxian_zhuye from soojs_un Where id="&uid)
						IF Not oRs_k.Eof Then
							IF G_xiaxian_zhuye_1a="1" Then
								x_1=Bint(oRs_k(0))
								x_2=Bint(oRs_k(1))
								IF x_1<>0 Then
									Set oRs6=Conn.Execute("Select soojs_jifen_G_jifen_xiaxian_zhuye From soojs_un Where id="&x_1)
									IF Not oRs6.Eof Then
										x_2=Bint(oRs6(0))
									Else
										x_2=0
									End IF
									oRs6.close()
								End IF
								IF x_2<>0 Then 
									x_G_xiaxian_zhuye_1_bili=x_2/100
								Else
									x_G_xiaxian_zhuye_1_bili=G_xiaxian_zhuye_1_bili
								End IF							
								
								IF x_1<>0 Then
									Get_qingtiandy_jifen_ip x_1,13,Bint(G_jifen_home*x_G_xiaxian_zhuye_1_bili)
								End IF
							End IF						
						End IF
					End IF			
				End IF	
			End IF		
		Else
			'这里判断该用户是否是特殊用户
			k_uid=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
			IF k_uid<>0 Then
				Set oRs_f2=Server.CreateObject(G_RS)
				oRs_f2.open "Select top 1 * From soojs_un Where id="&k_uid&"",conn,1,1
				IF oRs_f2.Eof Then
						
				Else	
					psoojs_jifen_zhuye=Bint(oRs_f2("soojs_jifen_zhuye"))
					IF psoojs_jifen_zhuye=1 Then
						Set oRs2=Server.CreateObject(G_RS)
						oRs2.open "Select * From qingtiandh_userip Where 1<>1",conn,1,3
						oRs2.AddNew()
						oRs2("uip")=k_uip
						oRs2("uid")=k_uid
						oRs2("utime")=ForMatDate(now(),55)
						oRs2("uedittime")=ForMatDate(now()-1,55)
						oRs2.Update()						
						oRs2.close						
					End IF
				End IF
				oRs_f2.close
			End IF			
			oG_jifen_timer=24*60*60-1
		End IF		
		oRs_f.close
	ElseIF utype="13" Then '下线设为主页积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")
		End IF
		oRs_f.close:Set oRs_f=Nothing	
	ElseIF utype="14" Then '下线登陆获得积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")
		End IF
		oRs_f.close:Set oRs_f=Nothing			
	ElseIF utype="9" Then '310彩票扣积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=9
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")
			
		End IF
		oRs_f.close:Set oRs_f=Nothing	
	ElseIF utype="19" Then '28彩票扣积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=19
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")
			
		End IF
		oRs_f.close:Set oRs_f=Nothing		
	ElseIF utype="10" Then '任务获得积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")			
		End IF
		oRs_f.close:Set oRs_f=Nothing	
	ElseIF utype="11" Then '下线冲值积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")			
		End IF
		oRs_f.close:Set oRs_f=Nothing	
	ElseIF utype="12" Then '下线任务积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")			
		End IF
		oRs_f.close:Set oRs_f=Nothing
	ElseIF utype="15" Then '下线提款积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")			
		End IF
		oRs_f.close:Set oRs_f=Nothing		
	ElseIF utype="21" Then '发布文章获取积分
		Set oRs_f=Server.CreateObject(G_RS)
		oRs_f.open "Select top 1 * From qingtiandy_jifen_ip Where 1<>1",conn,1,3
		IF oRs_f.Eof Then
			oRs_f.Addnew()
			oRs_f("uid")=uid
			oRs_f("uip")=k_uip
			oRs_f("utime")=ForMatDate(now(),55)
			oRs_f("utype")=utype
			oRs_f("ujifen")=jifen
			oRs_f("jid")=0
			oRs_f.Update()
			conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&jifen&" Where id="&uid&"")			
		End IF
		oRs_f.close:Set oRs_f=Nothing									
	End IF	
End Function
'获取积分
Function Get_qingtiandy_jifen_ip_count(uid,utype)
	Dim oRs_f,c
	c=0
	
	Set oRs_f=Conn.Execute("Select Sum(ujifen) From qingtiandy_jifen_ip Where uid="&uid&"  And utype="&utype)
	IF Not oRs_f.Eof Then
		c=oRs_f(0)
	End IF	
	
'	IF utype="1" Then '注册获取积分
'		Set oRs_f=Conn.Execute("Select Sum(ujifen) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=1")
'		IF Not oRs_f.Eof Then
'			c=oRs_f(0)
'		End IF	
'	ElseIF utype="2" Then '推广获取积分
'		Set oRs_f=Conn.Execute("Select Sum(ujifen) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=2")
'		IF Not oRs_f.Eof Then
'			c=oRs_f(0)
'		End IF
'	ElseIF utype="3" Then '登陆获取积分
'		Set oRs_f=Conn.Execute("Select Sum(ujifen) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=3")
'		IF Not oRs_f.Eof Then
'			c=oRs_f(0)
'		End IF	
'	ElseIF utype="4" Then '兑奖扣取积分
'		Set oRs_f=Conn.Execute("Select Sum(ujifen) From qingtiandy_jifen_ip Where uid="&uid&"  And utype=4")
'		IF Not oRs_f.Eof Then
'			c=oRs_f(0)
'		End IF				
'	End IF
	Get_qingtiandy_jifen_ip_count=Bint(c)
End Function

'积分活动名称
Function Get_qingtiandy_jifen_ip_Name(uid,utype)
	Dim c
	IF utype="1" Then '注册获取积分
		c="注册积分"	
	ElseIF utype="2" Then '推广获取积分
		c="推广积分"
	ElseIF utype="3" Then '登陆获取积分
		c="登陆积分"	
	ElseIF utype="4" Then '兑奖扣取积分
		c="兑奖积分"
	ElseIF utype="5" Then '冲值获得积分
		c="冲值积分"
	ElseIF utype="6" Then '点入获得积分
		c="点入积分"
	ElseIF utype="61" Then '点出统计积分
		c="点出统计积分"		
	ElseIF utype="7" Then '提款扣取积分
		c="提款积分"	
	ElseIF utype="8" Then '设为主页获得积分
		c="设为主页获得积分"
	ElseIF utype="9" Then '彩票310扣取积分
		c="彩票310扣取积分"
	ElseIF utype="10" Then '任务获得积分
		c="任务积分"	
	ElseIF utype="11" Then '下线冲值积分
		c="下线冲值积分"
	ElseIF utype="12" Then '下线任务积分
		c="下线任务积分"
	ElseIF utype="13" Then '下线设为主页积分
		c="下线设为主页积分"	
	ElseIF utype="14" Then '下线登陆获得积分
		c="下线登陆获得积分"	
	ElseIF utype="15" Then '下线提款获得积分
		c="下线提款获得积分"				
	ElseIF utype="19" Then '彩票28扣取积分
		c="彩票28扣取积分"
	ElseIF utype="21" Then '发布文章获取积分
		c="发布文章获取积分"																						
	Else
		c="其他积分"	
	End IF
	Get_qingtiandy_jifen_ip_Name=c
End Function

'获取网址类型名称
Function Get_qingtiandh_type_name_s(v,v2)
	Dim oRs_tps,str
	str=""
	IF v2="1" Then
		Set oRs_tps=conn.Execute("Select typename From qingtiandh_type1 Where typeid="&v)
		IF Not oRs_tps.Eof Then
			str=oRs_tps(0)
		End IF
	ElseIF v2="2" Then
		Set oRs_tps=conn.Execute("Select typename From qingtiandh_type2 Where typeid="&v)
		IF Not oRs_tps.Eof Then
			str=oRs_tps(0)
		End IF	
		
	ElseIF v2="3" Then
		Set oRs_tps=conn.Execute("Select typename From qingtiandh_type3 Where typeid="&v)
		IF Not oRs_tps.Eof Then
			str=oRs_tps(0)
		End IF	
	ElseIF v2="4" Then
		Set oRs_tps=conn.Execute("Select typename From qingtiandh_ltype1 Where typeid="&v)
		IF Not oRs_tps.Eof Then
			str=oRs_tps(0)
		End IF	
	ElseIF v2="5" Then
		Set oRs_tps=conn.Execute("Select typename From qingtiandh_ptype2 Where typeid="&v)
		IF Not oRs_tps.Eof Then
			str=oRs_tps(0)
		End IF			
	Else
	
	End IF
	Get_qingtiandh_type_name_s=str	
End Function

'获取网址扫描
Function qt_Url_Biaoti(inpStr,strjiange)    
	on error resume next
	Dim objRegExp, Matches, i , zong
	Set objRegExp = New RegExp
	objRegExp.IgnoreCase = True
	objRegExp.Global = True     
	objRegExp.Pattern = "<a.+?href=['""]?([^'"">]+?)['""]?(>| [^>]*?>)(.{1,}?)</a>"
	Set Matches = objRegExp.Execute(inpStr)    
	zong=""
	if strjiange="" then strjiange="$jiange$"    
	For Each Match in Matches
		ss=int(trim(Match.SubMatches.count))        
		if ss>=2 then
			zong=zong + strjiange + Match.SubMatches(0) + "{##}" + Match.SubMatches(2)
		end if
	Next    
	if zong<>"" then
		zong=right(zong,len(zong)-len(strjiange))
	end if    
	jiequ2 = zong	
	qt_Url_Biaoti = zong	
End Function

'按皮肤获取哪个前缀
Function Get_pifu_q(v)
	Dim p,p_a,i,p_1,p_1_a,p_2_a,p_2_1,p_2
	Dim k_1,k_2,j,k_3
	p=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/p_inc/Tag/muban.txt")))	
	p_a=split(p,chr(13))
	For i=0 To Ubound(p_a)
		p_1=p_a(i)
		p_1=replace(p_1,CHR(10),"")
		IF p_1<>"" And Not isnull(p_1) And Instr(p_1,"$")>0 Then
			p_1_a=split(p_1,"$")
			k_1=Qingtiandy_cj_fiter(p_1_a(0))'原始
			p_2=p_1_a(1)
			IF k_1=v Then
				Get_pifu_q=p_2
				Exit Function
			End IF
		End IF	
	Next
	Get_pifu_q=v
End Function
'冲值记录--下线提成
'积分数量,类型
Function Get_cz(jifen,v)
	IF G_xiaxian_1="" Then Exit Function
	Dim oRs
	Dim uid,a2,a3
	IF v="1" Then '冲值所的
		jifen=Bint(jifen)
		Set oRs=Conn.Execute("Select soojs_u_xiaxian From soojs_un Where Id="&Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" And soojs_u_tuiguang='1'")
		IF Not oRs.Eof Then
			uid=Bint(oRs(0)) '获取下线用户
			IF uid<>0 Then  Get_qingtiandy_jifen_ip uid,11,jifen*G_xiaxian_c_1
		End IF
		oRs.close()
	ElseIF v="2" Then '任务所的
		jifen=Bint(jifen)
		Set oRs=Conn.Execute("Select soojs_u_xiaxian From soojs_un Where Id="&Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" And  soojs_u_tuiguang='1'")
		IF Not oRs.Eof Then
			uid=Bint(oRs(0)) '获取下线用户
			IF uid<>0 Then  Get_qingtiandy_jifen_ip uid,12,jifen*G_xiaxian_c_2
		End IF
		oRs.close()		
	End IF
End Function
Function Get_cz2(jifen,v,sid)
	IF G_xiaxian_1="" Then Exit Function
	Dim oRs
	Dim uid,a2,a3
	IF v="1" Then '冲值所的
		jifen=Bint(jifen)
		Set oRs=Conn.Execute("Select soojs_u_xiaxian From soojs_un Where Id="&Bint(sid)&" And soojs_u_tuiguang='1'")
		IF Not oRs.Eof Then
			uid=Bint(oRs(0)) '获取下线用户
			IF uid<>0 Then  Get_qingtiandy_jifen_ip uid,11,jifen*G_xiaxian_c_1
		End IF
		oRs.close()
	ElseIF v="2" Then '任务所的
		jifen=Bint(jifen)
		Set oRs=Conn.Execute("Select soojs_u_xiaxian From soojs_un Where Id="&Bint(sid)&" And  soojs_u_tuiguang='1'")
		IF Not oRs.Eof Then
			uid=Bint(oRs(0)) '获取下线用户
			IF uid<>0 Then  Get_qingtiandy_jifen_ip uid,12,jifen*G_xiaxian_c_2
		End IF
		oRs.close()		
	End IF
End Function

'推广数加1
'当前uid,父Uid
Function Get_tuiguang_numb_add(id)
	Dim oRs,soojs_u_tuiguang
	Set oRs=Conn.Execute("Select soojs_u_tuiguang,soojs_u_xiaxian From soojs_un Where Id="&id)
	IF Not oRs.Eof Then
		soojs_u_tuiguang=GetRp(oRs("soojs_u_tuiguang"))
		ParentId=Bint(oRs("soojs_u_xiaxian"))
		IF soojs_u_tuiguang="1" then
			'已经推广过了
		Else
			Conn.Execute("Update soojs_un Set soojs_u_tuiguang='1' Where Id="&id)
			Conn.Execute("Update soojs_un Set soojs_u_tuiguang_numb=soojs_u_tuiguang_numb+1 Where Id="&ParentId)
		End IF
		
	End IF
End Function
'开始310彩票排行
Function Get_paihang_dis(v,times)
	Dim sql_1,sql,oRs
	sql="Select Sum(ujifen),Uid From qingtiandy_jifen_ip Where id>0 "
	IF v="310" Then
		IF G_IS_SQL_User_DB="1" Then
			sql_1=sql_1&" And utype=9 and datediff(d,utime,getdate())>="&times
		Else
			sql_1=sql_1&" And utype=9 and datediff('d',utime,'"&now()&"')>="&times
		End IF	
		sql=sql&sql_1
		sql=sql&" Group By Uid order by 1 desc"	
	End IF
	Set oRs=Conn.Execute(sql)
	Do While Not oRs.Eof
		Response.Write oRs(1)&"=="&oRs(0)&"<br>"
		oRs.MoveNext
	Loop
	oRs.close()
End Function 
Function Get_x_x_x(v)
	Dim i,str
	str=""
	For i=1 To v
		str=str&"*"
	Next
	Get_x_x_x=str
End Function
'用户名变为8号
Function Get_x_user_x(v)
	Dim a,a1,a2,a3
	Dim str
	a=len(v)
	IF a>=4 Then
		a1=left(v,1)
		a2=right(v,1)
		str=a1&Get_x_x_x(a-2)&a2
	Else
		str="***"
	End IF
	Get_x_user_x=str
End Function
Function Timerx(v1,v2)
	Dim cc
	IF G_jiexi_c<>"" Then
		cc=FormatNumber((Timer-CountStartTime) * 1000,3,true)
		IF cc>500 Then 
			cc="<font color=red>"&cc&"</font>"
		End IF
		'Response.Write v1&"-："&cc&"<br>"
		CountStartTime=Timer
		'Response.Flush()			
	End IF
End Function
'把session转化为文本
'名字 数字，分割符
Function SessionToTxt(sname,snumb,stxt)
	
'SessionToTxt "selAnnounce","","0"  session("selAnnounce")=""           归0
	
'SessionToTxt("selAnnounce2","","00") 输出
	
'	session("selAnnounce")=PrintArray2(session("selAnnounce"),",")
'	axc_1=SessionToTxt("selAnnounce","","00")
'	axc_1=PrintArray2(axc_1,",")
'	SessionToTxt "selAnnounce",axc_1,"000"	


'SessionToTxt "selAnnounce",movieid,","
'session("selAnnounce")=session("selAnnounce")&movieid&","
	
	Dim os
	IF G_SessionT="" Then	
		IF stxt="0" Then '归0
			Session(sname)=""
		ElseIF stxt="00" Then '查询
			SessionToTxt=Session(sname)
		ElseIF stxt="000" Then  '插入
			Session(sname)=snumb
		Else  '添加
			Session(sname)=Session(sname)&snumb&stxt
		End IF		
	Else
		IF stxt="0" Then '归0
			Conn.Execute("Update qingtiandy_session Set a"&sname&"='' where id=1")
		ElseIF stxt="00" Then '查询
			Set os=Conn.Execute("Select * From qingtiandy_session Where id=1")
			IF Not os.Eof Then
				SessionToTxt=os("a"&sname)
			End IF
			os.close
		ElseIF stxt="000" Then  '插入
			Conn.Execute("Update qingtiandy_session Set a"&sname&"='"&snumb&"' where id=1")	
		Else  '添加
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * From qingtiandy_session Where id=1",Conn,1,3
			IF Not oRs.Eof Then
				oRs("a"&sname)=oRs("a"&sname)&snumb&stxt
				oRs.Update()
			End IF
			'Conn.Execute("Update qingtiandy_session Set a"&sname&"=a"&sname&"+'"&snumb&stxt&"' where id=1")
		End IF		
	End IF
End Function

'获取小消息数目
Function Get_xx_xiaoxi_u()
	Dim oRs,str,oRs2,str2
	str=0
	IF Bint(Request.Cookies(G_u_Cookies)("soojs_id"))=0 Then 
		Get_xx_xiaoxi_u=0
		Exit Function
	End IF
	Set oRs=Conn.Execute("Select Count(*) from qingtiandy_xxiaoxi2 Where Uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" And n_read=0")
	IF Not oRs.Eof Then
		str=Bint(oRs(0))
	Else
	End IF
	Get_xx_xiaoxi_u=str
End Function
'推广数增加1
Function AddTG(uid,n)
	IF uid<>0 Then
		Conn.Execute("Update soojs_un Set soojs_u_tuiguang_numb=soojs_u_tuiguang_numb+"&n&" Where id="&uid)
	End IF
End Function
'发送邮件 找回密码
Function qTcms_SendEmail(uname,pname,uemail)
	IF Not IsObjInstalled("JMail.SMTPMail") Then
		Response.Write "对不起，您所在的服务器不支持邮件发送"
		Response.End()
	End IF
	kPstr=N_Fso.ReadAllTextFile(Add_Root_Dir("p_inc/tag/email.config"))
	
	pmailserver=GetContent(kPstr,"<mailserver>","</mailserver>",0)
	pmailserverloginname=GetContent(kPstr,"<mailserverloginname>","</mailserverloginname>",0)
	pmailserverloginpass=GetContent(kPstr,"<mailserverloginpass>","</mailserverloginpass>",0)
	pmailuserdomain=GetContent(kPstr,"<mailuserdomain>","</mailuserdomain>",0)
	pfrommail=GetContent(kPstr,"<frommail>","</frommail>",0)
	pfromname=GetContent(kPstr,"<fromname>","</fromname>",0)
	pPSubject=GetContent(kPstr,"<PSubject>","</PSubject>",0)
	pPAddRecipient=GetContent(kPstr,"<PAddRecipient>","</PAddRecipient>",0)
	pPBody=GetContent(kPstr,"<PBody>","</PBody>",0)
	
	

	
	'=============== 发 信 ================
	mailserver=		pmailserver
	mailserverloginname=	pmailserverloginname
	mailserverloginpass=	pmailserverloginpass
	mailuserdomain=			pmailuserdomain
		
	fromname=			pfromname
	frommail=			pfrommail
	toname=			uname
	tomail=			uemail
	mailTopic=      pPSubject
	mailbody=       pPBody
	
	mailbody=Replace(mailbody,"{u}",uname)
	mailbody=Replace(mailbody,"{p}",pname)
	
	
	dim JMail
	set JMail=server.CreateObject("Jmail.message")
	
	JMail.Silent=true
	JMail.Charset = "gb2312"
	JMail.FromName = fromname
	JMail.from = frommail
	JMail.AddRecipient tomail,toname
	JMail.Subject = mailTopic
	jmail.Body=mailbody
	
	JMail.MailServerUserName = mailserverloginname
	JMail.MailServerPassWord = mailserverloginpass
	JMail.MailDomain = mailuserdomain
	sendok=JMail.send(mailserver)
	IF sendok then
		qTcms_SendEmail="ok"
	Else
		qTcms_SendEmail="error"
	End IF	
End Function

'发送邮件 账号激活
Function qTcms_SendEmailZc(uname,pname,uemail,uhref)
	IF Not IsObjInstalled("JMail.SMTPMail") Then
		Response.Write "对不起，您所在的服务器不支持邮件发送"
		Response.End()
	End IF
	kPstr=N_Fso.ReadAllTextFile(Add_Root_Dir("p_inc/tag/email.config"))
	
	pmailserver=GetContent(kPstr,"<mailserver>","</mailserver>",0)
	pmailserverloginname=GetContent(kPstr,"<mailserverloginname>","</mailserverloginname>",0)
	pmailserverloginpass=GetContent(kPstr,"<mailserverloginpass>","</mailserverloginpass>",0)
	pmailuserdomain=GetContent(kPstr,"<mailuserdomain>","</mailuserdomain>",0)
	pfrommail=GetContent(kPstr,"<frommail>","</frommail>",0)
	pfromname=GetContent(kPstr,"<fromname>","</fromname>",0)
	PSubjectZc=GetContent(kPstr,"<PSubjectZc>","</PSubjectZc>",0)
	pPAddRecipient=GetContent(kPstr,"<PAddRecipient>","</PAddRecipient>",0)
	PBodyZc=GetContent(kPstr,"<PBodyZc>","</PBodyZc>",0)
	
	uuhref="http://"&Request.ServerVariables("HTTP_HOST")&Add_Root_Dir("/")&"members/uemailyz.asp?u="&uname&"&e="&MD5(uhref,32)

	
	'=============== 发 信 ================
	mailserver=		pmailserver
	mailserverloginname=	pmailserverloginname
	mailserverloginpass=	pmailserverloginpass
	mailuserdomain=			pmailuserdomain
		
	fromname=			pfromname
	frommail=			pfrommail
	toname=			uname
	tomail=			uemail
	mailTopic=      PSubjectZc
	mailbody=       PBodyZc
	
	mailbody=Replace(mailbody,"{u}",uname)
	mailbody=Replace(mailbody,"{p}",pname)
	mailbody=Replace(mailbody,"{href}",uuhref)
	
	dim JMail
	set JMail=server.CreateObject("Jmail.message")
	
	JMail.Silent=true
	JMail.Charset = "gb2312"
	JMail.FromName = fromname
	JMail.from = frommail
	JMail.AddRecipient tomail,toname
	JMail.Subject = mailTopic
	jmail.Body=mailbody
	
	JMail.MailServerUserName = mailserverloginname
	JMail.MailServerPassWord = mailserverloginpass
	JMail.MailDomain = mailuserdomain
	sendok=JMail.send(mailserver)
	IF sendok then
		qTcms_SendEmailZc="ok"
	Else
		qTcms_SendEmailZc="error"
	End IF	
End Function

Function vbsEscape(str) 
	Dim ss
	ss=str
	ss=GetRp(ss)
	IF ss="" Then vbsEscape="":Exit Function
	dim i,s,c,a 
	s="" 
	For i=1 to Len(ss) 
		c=Mid(ss,i,1) 
		a=ASCW(c) 
		If (a>=48 and a<=57) or (a>=65 and a<=90) or (a>=97 and a<=122) Then 
			s = s & c 
		ElseIf InStr("@*_+-./",c)>0 Then 
			s = s & c 
		ElseIf a>0 and a<16 Then 
			s = s & "%0" & Hex(a) 
		ElseIf a>=16 and a<256 Then 
			s = s & "%" & Hex(a) 
		Else 
			s = s & "%u" & Hex(a) 
		End If 
	Next 
	vbsEscape = s 
End Function	
%>
<%
IF G_union_my="" Then G_union_my="unionzhuyeba"
IF G_all_InNumb="" Then G_all_InNumb="5"
IF G_u_Cookies="" Then G_u_Cookies="zhuyebahao123"
IF G_zhuce_j2="" THen G_zhuce_j2=5
IF G_jifen_denglu="" Then  G_jifen_denglu=1
IF G_jifen_tuijian="" Then G_jifen_tuijian=1
IF G_lm_baidu="" Then G_lm_baidu="hanziyue_pg"
IF G_lm_taobao="" Then G_lm_taobao="mm_17185721_0_0"
IF G_lm_xunlei="" Then G_lm_xunlei="20116"
IF G_lm_google_s="" Then G_lm_google_s="partner-pub-0520467129961361:mibs8b9cu7d"
IF G_lm_dangdang_s="" Then G_lm_dangdang_s="P-276318"
IF G_lm_amazon_s="" Then G_lm_amazon_s="wjlhkp-23"
IF G_jifen_lailu="" Then G_jifen_lailu=2
IF G_redbaby_s="" Then G_redbaby_s="57357"
IF G_jifen_jifen_name="" Then G_jifen_jifen_name="积分"
IF G_jifen_jifen_zhifubao_bili="" Then G_jifen_jifen_zhifubao_bili="200"
IF G_lm_360buy="" Then G_lm_360buy="0"
G_moban_2=G_moban
IF G_jifen_home="" Then G_jifen_home=1
IF G_jifen_home_time="" Then G_jifen_home_time=10
IF G_xiaxian_c_1="" Then G_xiaxian_c_1=0.2
IF G_xiaxian_c_2="" Then G_xiaxian_c_2=0.1
IF G_xiaxian_renwu_1="" Then G_xiaxian_renwu_1=3 '做几个任务自动开通是否推广
IF G_tikuan_smail="" Then G_tikuan_smail=10
IF G_JIN_TAI_Detailnews="" Then G_JIN_TAI_Detailnews="c_newsdetail" '新闻详细页路径
IF G_JIN_TAI_Listnews="" Then G_JIN_TAI_Listnews="c_newslist" '新闻列表页路径
IF G_xiaxian_2_jiangli="" Then G_xiaxian_2_jiangli=0.1 '下线提款，上线获取积分
IF G_xiaxian_zhuye_1_bili="" Then G_xiaxian_zhuye_1_bili=1 '上线获取的比例
IF G_WEBTITLE="" Then G_WEBTITLE=G_WEBNAME&" - "&G_WEBURL
IF G_jifen_lailu_out="" Then G_jifen_lailu_out=0 '任何1个网站后增加积分奖励
IF G_jifen_timer_lailu="" Then G_jifen_timer_lailu=30 '一个站与一个站点出之间的间隔多少才算有效积分
IF G_jifen_jifen_bili_lailu="" Then G_jifen_jifen_bili_lailu=0 '点出积分扣除的比例
IF G_jifen_jifen_numbs_lailu="" Then G_jifen_jifen_numbs_lailu=5 '一天最多点出多少个
'IF G_email_f_1="" Then G_email_f_1="1" '是否采用Email认证方式
IF G_lm_500wan_s="" Then G_lm_500wan_s="2650"
IF G_lm_gouwuke_s="" Then G_lm_gouwuke_s="haoku6"
IF G_jifen_tuiguang_time="" Then G_jifen_tuiguang_time=10
IF G_qTcms_Com_16_sosuo_q="" Then G_qTcms_Com_16_sosuo_q="baidu"
IF G_qTcms_Com_16_mkuai="" Then G_qTcms_Com_16_mkuai = "*"
IF MaxFileSize="" Then MaxFileSize="500"
IF UpFileType="" Then UpFileType="jpg,gif,jpeg,png,bmp"
IF G_BIG_T="" Then G_BIG_T = "upload"
IF G_qTcms_Com_16_right_mz="" Then G_qTcms_Com_16_right_mz="48"
IF G_qTcms_Com_16_qingtiancms_b_b1="" Then G_qTcms_Com_16_qingtiancms_b_b1="2"
IF G_qTcms_Com_16_qingtiancms_b_b2="" Then G_qTcms_Com_16_qingtiancms_b_b2="2"
IF G_qTcms_Com_16_qingtiancms_b_b3="" Then G_qTcms_Com_16_qingtiancms_b_b3="2"
IF G_qTcms_Com_16_qingtiancms_b_c1="" Then G_qTcms_Com_16_qingtiancms_b_c1="网购更优惠"
IF G_qTcms_Com_16_qingtiancms_b_c2="" Then G_qTcms_Com_16_qingtiancms_b_c2="休闲娱乐吧"
IF G_qTcms_Com_16_qingtiancms_b_c3="" Then G_qTcms_Com_16_qingtiancms_b_c3="最常用工具"
%>