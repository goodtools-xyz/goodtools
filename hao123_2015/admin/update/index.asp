<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.dates{margin:10px 0 0 0px;border:1px solid #1a1aa3;height:27px;width:700px;padding:1px;}
.dates .cos{float:left;background:#1a1aa3;height:25px;color:red;}
-->
</style>

<%

Sub DeleteFolder(filespec)
  Dim fso
  Set fso = CreateObject("Scripting.FileSystemObject")
  IF IsFolderExists(filespec) Then
  	fso.DeleteFolder(Server.MapPath(filespec))
  End IF
  Set fso = nothing
End Sub
Function IsFolderExists(spec) 
	Dim fso
	Set fso = CreateObject("Scripting.FileSystemObject")
	If (fso.FolderExists(server.MapPath(spec))) Then
	IsFolderExists = True
	Else
	IsFolderExists = False
	End If
End Function

str=ReadAllTextFile(Add_Root_Dir("/p_inc/ver.asp"))
IF instr(str,"{sql}")>0 Then
	response.Redirect Add_Root_Dir("/sql.asp?t="&server.URLEncode("http://"&Request.ServerVariables("HTTP_HOST")&request.ServerVariables("URL")&"?"&Request.ServerVariables("QUERY_STRING")))	
	response.End()
End IF

qingtian_date_v=request("ver")
IF qingtian_date_v="" Then qingtian_date_v=qingtian_date

tag=Request("tag")
IF tag<>"" Then 
	DeleteFolder "../../backup/晴天备份文件"
	DeleteFolder "../../backup/晴天升级文件"
	Response.Write "<script src='"&G_G_H&"qtuser/2013daohang_19/vipupdate.asp?ver="&qingtian_date_v&"' language='JavaScript' charset='gb2312'></script>"
	Response.End()
End IF
s1=Request("s1") '更新到第几个文件
p1=Request("p1") '状态
's2="1,2,3,4,5,6,,7,8,9,9,0,1,2,3,4,5,6,,7,8,9,9,0,1,2,3,4,5,6,,7,8,9,9,0,1,2,3,4,5,6,,7,8,9,9,0"
s2=Request("s2") '总的文件路径


IF s1<>"" Then	

	
	IF s2<>"" Then
		local_fold="/backup/晴天升级文件/"&qingtian_date_v+1
		N_Fso.DeleteFolder Add_Root_Dir(local_fold)
		N_Fso.C_N_CreateFolders Add_Root_Dir(local_fold)
		allUpFIle=qtcmsdh.Qingtiandy_getHTTPPage(G_G_H&s2)
		allUpFIle_1=GetContent(allUpFIle,"<晴天提供技术支持:升级文件>","</晴天提供技术支持:升级文件>",0)
		allUpFIle_2=GetContent(allUpFIle,"<功能说明>","</功能说明>",0)
		session("gongnengdes")=allUpFIle_2
		N_Fso.CreateFolderFile Add_Root_Dir(local_fold&"/"&qingtian_date_v+1&".txt"),allUpFIle
		p_a=split(allUpFIle_1,chr(13))	
		k_s2=""	
		For i=0 To Ubound(p_a)
			p_1=p_a(i)
			p_1=replace(p_1,CHR(10),"")
			IF p_1<>"" And Not isnull(p_1) And Instr(p_1,"/")>0 Then
				k_s2=k_s2&p_1&","
			End IF	
		Next		
		k_s2=PrintArray(k_s2,",")&"{next}"&qingtian_date_v+1
		'session("gengxin_qt") = k_s2
		N_fso.WriteToFile "update.txt",k_s2
	End IF
	
	'v1=split(session("gengxin_qt"),"{next}")
	kkp_s1=N_Fso.ReadAllTextFile("update.txt")
	v1=split(kkp_s1,"{next}")
	
	sv1=v1(0)'
	sv2=v1(1)'next版本
	
	s2_arr=split(sv1,",")
	s2_length=Ubound(s2_arr)+1
	IF s2_length<1 Then
		Call f1()
		Response.End()
	ElseIF Clng(s2_length)<=Clng(s1) Then
		Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=copy.asp?tag=true&s1=0&ver="&sv2&""">"
		Response.End()
		p_str="====================升级至版本号："&qingtian_date_v+1&"--"&ForMatDate(now(),55)&"===================="&vbcrlf
		N_Fso.WriteToFileToEnd Add_Root_Dir("/"&G_ADMIN&"/update/log.txt"),p_str
		IF sv2<>"0" Then
			Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=index.asp?tag=true&s1=0&ver="&sv2&""">"
			Response.End()
		End IF
		Call f2()
		Response.End()		
	Else
		IF Clng(s1)=0 Then
			p_str="====================升级至版本号："&qingtian_date_v+1&"--"&ForMatDate(now(),55)&"===================="&vbcrlf
			'N_Fso.WriteToFileToEnd Add_Root_Dir("/"&G_ADMIN&"/update/log.txt"),p_str
		End IF
	End IF
	numb=s2_length
	s3=100/numb
	oldurl = Replace(s2_arr(s1), ".rar", "") '正在更新文件
	IF oldurl<>"" Then
		file_s1=s2_arr(s1) '---远程文件
		file_s2=replace(oldurl,"admin",G_ADMIN)'----本地文件		
		'获取到远程文本
		ustr=qtcmsdh.Qingtiandy_getHTTPPage(G_G_H&"qtuser/2013daohang_19/soft/"&(qingtian_date_v+1)&s2_arr(s1)) 
		
		'备份原先文件	
		N_Fso.C_N_CreateFolders Add_Root_Dir(replace("/backup/晴天备份文件/"&qingtian_date_v&"/"&left(oldurl,Instrrev(oldurl,"/")-1),"//","/"))
		N_Fso.CopyFiles Add_Root_Dir(file_s2),Add_Root_Dir("/backup/晴天备份文件/"&qingtian_date_v&oldurl)
		'创建文件
		N_Fso.CreateFolderFile Add_Root_Dir("/backup/晴天升级文件/"&qingtian_date_v+1&""&oldurl),""
		SaveFile_2 Add_Root_Dir("/backup/晴天升级文件/"&qingtian_date_v+1&""&oldurl),G_G_H&"qtuser/2013daohang_19/soft/"&(qingtian_date_v+1)&s2_arr(s1)
		p_str="-----"&ForMatDate(now(),55)&"："&oldurl&vbcrlf
	End IF
%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">晴天智能升级界面</th> 
  </tr> 
  <tr> 
    <td class="forumRow">
	<b>正在从晴天官网下载升级文件...从<%=qingtian_date_v%>到<%=qingtian_date_v+1%></b>	
	</td> 
  </tr>   
  <tr> 
    <td class="forumRow">
	<div class="dates"><div class ="cos" style="width: <%=Int(s3*s1)%>%;"></div></div>	
	</td> 
  </tr> 
   <tr> 
    <td class="forumRow">
	下载剩余时间：<font color="#FF0000"><%=Int(numb-s1)%></font> 秒  &nbsp;&nbsp;下载进度：<%=Int(s3*s1)%> % &nbsp;&nbsp;下载文件：<%=file_s2%>
	</td> 
  </tr> 
  <%IF session("gongnengdes")<>"" Then%>
   <tr> 
    <td class="forumRow" style="line-height:25px; color:#0000FF">
	<span style="color:#FF0000">升级包<%=qingtian_date_v+1%>功能描述：</span><br />
	<%=HTMLEncode6(session("gongnengdes"))%>
	</td> 
  </tr>   
  <%End IF%>  
</table>
<%
	IF clng(numb) > clng(s1) Then
		Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=index.asp?s1="&s1+1&"&ver="&qingtian_date_v&""">"
	Else
		Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=index.asp?p1=a"">"
	End IF
Else
	IF p1="a" Then
		Call f2()
		Response.End()
	Else
	
	End IF
End IF
%>

<%Sub f1()%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">晴天智能升级界面</th> 
  </tr> 
   <tr> 
    <td class="forumRow">
		<font color="#FF0000">您当前是最新版本，或您没有权限升级</font>	
	</td> 
  </tr> 
</table>
<%End Sub%>

<%Sub f2()%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">晴天智能升级界面</th> 
  </tr> 
   <tr> 
    <td class="forumRow">
		<font color="#FF0000">恭喜你，您的系统已经更新到最新版本</font>	
	</td> 
  </tr> 
</table>
<%End Sub%>


<%

	function SaveFile_2(LocalFileName,RemoteFileUrl) 
		Dim Ads, Retrieval, GetRemoteData 
		On Error Resume Next 
		Set Retrieval = Server.CreateObject("Microso" & "ft.XM" & "LHTTP") 
		With Retrieval 
			.Open "Get", RemoteFileUrl, False, "", "" 
			.Send 
			GetRemoteData = .ResponseBody 
		End With 
		Set Retrieval = Nothing 
		Set Ads = Server.CreateObject("Ado" & "db.Str" & "eam") 
		With Ads 
			.Type = 1 
			.Open 
			.Write GetRemoteData 
			.SaveToFile Server.MapPath(LocalFileName), 2 
			.Cancel() 
			.Close() 
		End With 
		Set Ads=nothing 
		if err <> 0 then 
			SaveFile_2 = false 
			err.clear 
			else 
			SaveFile_2 = true 
		end if 
	End function
	
	function HTMLEncode6(fString)
		if not isnull(fString) then
			fString = Replace(fString, CHR(32), "&nbsp;")
			fString = Replace(fString, CHR(9), "&nbsp;")
			fString = Replace(fString, CHR(34), "&quot;")
			fString = Replace(fString, CHR(39), "&#39;")
			fString = Replace(fString, CHR(13), "")
			fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
			fString = Replace(fString, CHR(10), "<BR> ")
			HTMLEncode6 = fString
		end if
	end function	
%>