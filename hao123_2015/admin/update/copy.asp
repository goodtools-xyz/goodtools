<!--#include file="../../p_inc/config.asp"-->
<!--#include file="../../p_inc/ver.asp"-->
<%




Class Class_QingTian_FSO
	Private C_G_FSO


	Private Sub Class_Initialize()
		C_G_FSO="Scripting.FileSystemObject"
	End Sub
	
	Private Sub Class_Terminate()
	End Sub

	'文件夹-同时创建多级文件夹 C_N_CreateFolders Add_Root_Dir("/1/1/1/1")
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
	
	'文件-覆盖式写入-没有自动创建 WriteToFile Add_Root_Dir("/inc/"),"content" 
	Function WriteToFile(fil,wstr)
		Dim fso, f
		Set fso = Server.CreateObject(C_G_FSO)
		Set f = fso.CreateTextFile(Server.MapPath(fil),True)
		f.Write wstr
		Set f = nothing
		Set fso = nothing
	End function
	
	'文件-结尾写入-没有自动创建 WriteToFile Add_Root_Dir("/inc/"),"content"
	Function WriteToFileToEnd(fil,wstr)
		Dim fs,txt
		Set fs = CreateObject(C_G_FSO)
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
		C_N_CreateFolders a1
		WriteToFile fil,wstr
	End Function
	
	'复制文件--CopyFiles(Add_Root_Dir("/1/1/1/1.txt"),Add_Root_Dir("/1/1/1/1.txt"))
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
	
	
	Function CopyFolds(TempSource,TempEnd) 
		IF C_N_IsFolderExists(TempSource) Then
			C_N_CreateFolders Add_Root_Dir(TempEnd)
			Dim FsoObj
			Set FsoObj = Server.CreateObject(C_G_FSO)	
			Set FolderObj = FsoObj.GetFolder(server.MapPath(TempSource))	
			FsoObj.copyFolder Server.MapPath(TempSource),server.MapPath(TempEnd)		
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
	
	'文件-是否存在 C_N_IsExists Add_Root_Dir("/1/1.txt")
	Function C_N_IsExists(filespec) 
		Dim fso
		Set fso = CreateObject(C_G_FSO)
		If (fso.FileExists(server.MapPath(filespec))) Then
		C_N_IsExists = True
		Else
		C_N_IsExists = False
		End If
	End Function	
	'删除任意一个文件夹下的任意几个文件 DeleteFolderOneFile Add_Root_Dir("/1/1"),2
	Function DeleteFolderOneFile(fold,j)
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
	End Function
	'打开一个文本
	Function ReadAllTextFile(filespec)
		IF C_N_IsExists(filespec) Then
			Dim fso, f
			Set fso = CreateObject(C_G_FSO)
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
End Class

Function Add_Root_Dir(JS_Path)
	IF JS_Path="" Or isnull(JS_Path) Then
		Add_Root_Dir="/"&G_BIG_T&"/xxxx/xxxx/xxx.gif"
		Exit Function
	End IF
	Dim JS_All_Path
	If Left(JS_Path,1)="/" Then
		JS_All_Path = G_VIRTUAL_ROOT_DIR & JS_Path
	Else
		JS_All_Path = G_VIRTUAL_ROOT_DIR & "/" & JS_Path
	End If
	If Trim(G_VIRTUAL_ROOT_DIR) <> "" Then
		JS_All_Path = "/" & JS_All_Path
	End If
	Add_Root_Dir = JS_All_Path
	Add_Root_Dir=replace(Add_Root_Dir,"//","/")
End Function

Function FormatDate(DT,tp)
	dim Y,M,D,hour_,minute_,second_
	Y=Year(DT)
	M=month(DT)
	D=Day(DT)
	hour_=hour(DT)
	minute_=minute(DT)
	second_=second(DT)
	if M<10 then M="0"&M
	if D<10 then D="0"&D
	if hour_<10 then hour_="0"&hour_
	if minute_<10 then minute_="0"&minute_
	if second_<10 then second_="0"&second_
	select case tp
	case 1 FormatDate=Y&"年"&M&"月"&D&"日"
	case 2 FormatDate=Y&"/"&M&"/"&D
	case 3 FormatDate=M&"/"&D
    case 4 FormatDate=Y&"\"&M&"\"&D
    case 5 FormatDate=Y&"-"&M&"-"&D
	case 6 FormatDate=M&"-"&D
	case 7 FormatDate=M&"月"&D&"日"
	case 11 FormatDate=Y&"年"&M&"月"&D&"日"&" "&hour_&"时"&minute_&"分"&second_&"秒"
	case 22 FormatDate=Y&"/"&M&"/"&D&" "&hour_&"/"&minute_&"/"&second_
	case 44 FormatDate=Y&"\"&M&"\"&D&" "&hour_&"\"&minute_&"\"&second_
	case 55 FormatDate=Y&"-"&M&"-"&D&" "&hour_&":"&minute_&":"&second_
	case 66 FormatDate=right(Y,2)&"-"&M&"-"&D&" "&hour_&":"&minute_&":"&second_	
	case 77 FormatDate=M&"-"&D&" "&hour_&":"&minute_	
	Case Else FormatDate=Y&"-"&M&"-"&D
	end select
End Function

Set N_Fso=New Class_QingTian_FSO




'------------------
Function ShowAllFile(Path,Path_1,Tstr)
	Dim a_fold,a_fold_ser,a_str,a_fold_old
	Dim FSO,f,fc2,fc
	Dim old_file,old_templateurl1
	a_fold_old=Path
	a_fold=Add_Root_Dir(Path) '扫描路径
	a_fold_ser=Server.MapPath(a_fold)
	If Not Response.IsClientConnected Then Response.End()
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if not fso.FolderExists(a_fold_ser) then exit Function
	Set f = FSO.GetFolder(a_fold_ser)
	Set fc2 = f.files
	For Each myfile in fc2
		IF myfile.name<>"Thumbs.db"  And myfile.name<>qingtian_date_v&".txt" Then
			old_file=a_fold_old&"/"&myfile.name
			new_file=Replace(old_file,upDir,"")
			new_file=Replace(new_file,"/admin/","/"&G_ADMIN&"/")
			'Response.Write "覆盖路径：<font color=red>"&new_file&"</font><br>"
			Response.Write "<script>document.getElementById('old_file').innerHTML='"&new_file&"'</script>"
			Response.Flush()		
			'=========以下判断是否要覆盖模板=======================
			N_Fso.CreateFolderFile Add_Root_Dir(new_file),""
			N_Fso.CopyFiles Add_Root_Dir(old_file),Add_Root_Dir(new_file)
			a_numb=a_numb+1
		End IF
	Next
	Tstr=Replace(Tstr,Path_1,"")
	'N_Fso.WriteToFileToEnd Add_Root_Dir(upFoldDir),a_str
	Set fc = f.SubFolders
	For Each f1 in fc
		ShowAllFile a_fold_old&"/"&f1.name,Path_1,Tstr
    Next
	Set FSO = Nothing
	ShowAllFile=Tstr
End Function

Function GetContent(str,start,last,n)
	If Instr(lcase(str),lcase(start))>0 and Instr(lcase(str),lcase(last))>0 then
		select case n
		case 0	'左右都截取（都取前面）（去处关键字）
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))-Len(start)+1)
		GetContent=Left(GetContent,Instr(lcase(GetContent),lcase(last))-1)
		case 1	'左右都截取（都取前面）（保留关键字）
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))+1)
		GetContent=Left(GetContent,Instr(lcase(GetContent),lcase(last))+Len(last)-1)
		case 2	'只往右截取（取前面的）（去除关键字）
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))-Len(start)+1)
		case 3	'只往右截取（取前面的）（包含关键字）
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))+1)
		case 4	'只往左截取（取后面的）（包含关键字）
		GetContent=Left(str,InstrRev(lcase(str),lcase(start))+Len(start)-1)
		case 5	'只往左截取（取后面的）（去除关键字）
		GetContent=Left(str,InstrRev(lcase(str),lcase(start))-1)
		case 6	'只往左截取（取前面的）（包含关键字）
		GetContent=Left(str,Instr(lcase(str),lcase(start))+Len(start)-1)
		case 7	'只往右截取（取后面的）（包含关键字）
		GetContent=Right(str,Len(str)-InstrRev(lcase(str),lcase(start))+1)
		case 8	'只往左截取（取前面的）（去除关键字）
		GetContent=Left(str,Instr(lcase(str),lcase(start))-1)
		case 9	'只往右截取（取后面的）（包含关键字）
		GetContent=Right(str,Len(str)-InstrRev(lcase(str),lcase(start)))
		end select
	Else
		GetContent=""
	End if
End function

%>
<%
qingtian_date_v=request("ver") '升级至版本
ps1=request.ServerVariables("URL")
ps1=Mid(ps1,2,len(ps1))
ps1=Replace(ps1,"/update/copy.asp","")
ps1_a=Split(ps1,"/")
G_ADMIN=ps1_a(Ubound(ps1_a))
ps2_a=Split(ps1,G_ADMIN)
G_VIRTUAL_ROOT_DIR=ps2_a(0)
G_VIRTUAL_ROOT_DIR=replace(G_VIRTUAL_ROOT_DIR,"/","")
old_templateurl="/template/"&G_moban&"/js/qingtiandy_cn.config"
old_templateContent=N_fso.ReadAllTextFile(Add_Root_Dir(old_templateurl))
old_templateurl_name=GetContent(old_templateContent,"<模板编号>","</模板编号>",0)
'++++++++++++++++++
upVerDir=qingtian_date_v
upDir="/backup/晴天升级文件/"&upVerDir
upFoldDir="/"&G_ADMIN&"/update/log.txt"
s=""
a_numb=1
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.dates{margin:10px 0 0 0px;border:1px solid #1a1aa3;height:27px;width:700px;padding:1px; line-height:27px;}
.dates .cos{float:left;background:#1a1aa3;height:25px;color:red;}
-->
</style>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">晴天智能升级界面</th> 
  </tr> 
  <tr> 
    <td class="forumRow">
	<b>正在更新...从<%=qingtian_date%>到<%=qingtian_date_v%></b>	
	</td> 
  </tr>   
  <tr> 
    <td class="forumRow">
	<div class="dates"> 正在覆盖原文件：<span  id="old_file" style="color:#FF0000"></span></div>	
	</td> 
  </tr> 
</table>
<%


IF N_Fso.C_N_IsFolderExists(Add_Root_Dir(upDir)) Then
	N_Fso.WriteToFileToEnd Add_Root_Dir(upFoldDir),""
	ShowAllFile upDir,upDir,""
	N_Fso.DeleteFolder Add_Root_Dir("/backup/晴天升级文件/")
	N_Fso.DeleteFolder Add_Root_Dir("/backup/晴天备份文件/")
	s=ForMatDate(now(),55)&"  "&qingtian_date&"--"&qingtian_date_v&vbcrlf
	N_Fso.WriteToFileToEnd Add_Root_Dir(upFoldDir),s
	Response.Write "<script>document.getElementById('old_file').innerHTML='<b>更新完毕</b>'</script>"
	Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=index.asp?tag=true&s1=0&ver="&qingtian_date_v&""">"
Else
	Response.Write "<script>document.getElementById('old_file').innerHTML='<font color=red>升级失败，您的空间不足或您所在的网站没有写入权限！</font>'</script>"
End IF
%>
