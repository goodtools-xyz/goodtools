<%
	'By  黄康平 QQ：270815568 Edit:2009.06
	'上传文件参数
	EnableUploadFile 	= 	"YES"
	MaxFileSize 		= 	"1000"
	UpFileType 			= 	"jpg|gif|jpeg|png|bmp|rar|swf"
%>

<%
	Class Class_QingTian_FSO
		Private C_G_FSO
		Private Sub Class_Initialize()
			C_G_FSO="Scripting.FileSystemObject"
		End Sub
		
		Private Sub Class_Terminate()
		End Sub
	
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
					If Not C_N_IsFolderExists(Tmp) then
						Set fso = CreateObject(C_G_FSO)
						Set f = fso.CreateFolder(Server.MapPath(Tmp))
					End if
				End if
			Next
			Set f=nothing
			Set fso=nothing
		End Function
		'文件夹-是否存在 IsFolderExists Add_Root_Dir("/1")
		Function C_N_IsFolderExists(spec) 
			Dim fso
			Set fso = CreateObject(C_G_FSO)
			If (fso.FolderExists(server.MapPath(spec))) Then
			C_N_IsFolderExists = True
			Else
			C_N_IsFolderExists = False
			End If
		End Function	
		'创建文件--覆盖式写入-没有自动创建 CreateFolderFile Add_Root_Dir("/1/1/1/1.txt"),"content"
		Function CreateFolderFile(fil,wstr)
			Dim a,a1,a2
			a=Instrrev(fil,"/")
			a1=left(fil,a-1)
			C_N_CreateFolders a1
			WriteToFile fil,wstr
		End Function	
		'文件-覆盖式写入-没有自动创建 WriteToFile Add_Root_Dir("/1/1/1/1.txt"),"content" 
		Function WriteToFile(fil,wstr)
			Dim fso, f
			Set fso = Server.CreateObject(G_FSO)
			Set f = fso.CreateTextFile(Server.MapPath(fil),True)
			f.Write wstr
			Set f = nothing
			Set fso = nothing
		End function	
		'文件-覆盖式复制-没有自动创建 CopyToFile 源Add_Root_Dir("/1/1/1/1.txt"),Add_Root_Dir("/1/1/1/1.txt")
		Function CopyToFile(s1,s2)
			Dim a,a1,a2
			a=Instrrev(s2,"/")
			a1=left(s2,a-1)
			C_N_CreateFolders a1		
			Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
			IF C_N_IsExists(s1) Then
				MyFileObject.CopyFile server.MapPath(s1),server.MapPath(s2)
			End IF
		End Function
		'文件-是否存在 C_N_IsExists Add_Root_Dir("/1/1.txt")
		Function C_N_IsExists(filespec) 
			IF filespec="" or Isnull(filespec) Then C_N_IsExists=False:Exit Function
			Dim fso
			Set fso = CreateObject(G_FSO)
			If (fso.FileExists(server.MapPath(filespec))) Then
			C_N_IsExists = True
			Else
			C_N_IsExists = False
			End If
		End Function	
		'
		Function makernddate2()
			Dim str
			str=year(now())&"-"&right("0"&month(now()),2)&"-"&right("0"&day(now()),2)
			makernddate2=str
		End Function		
	End Class	
	Set N_Fso=New Class_QingTian_FSO
%>