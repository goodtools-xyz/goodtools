<%
'跳转页面，错误类型如果没有的话，需要自己分开，换行用|||标识
Dim t,str1,str2,str3,i,r,n,rr,tt
t=Trim(request("t")) '输入字符串
r=Trim(request("r")) '跳转的URL地址
n=Trim(request("n")) '跳转的名字，默认是 上一页
tt=StayNub(Trim(request("tt"))) '自动跳转到上一页的时间，默认为2秒
Select Case t
	Case "1"
		str1="<font color=red>对不起，你的帐号已经被锁定</font>"
	Case "2"
		str1="<font color=red>对不起，你无权查看或操作该模块</font>"
	Case "3"
		str1="<font color=red>对不起，你没有选择要操作的主题，返回修改。</font>"	
	Case "4"
		str1="保存成功，跳转到 <a href='qingtiandh_type1/index.asp'><font color=blue>导航类别列表</font></a> ||| <a href='qingtiandh_type1/edit.asp'>添加新类别</a>"
	Case "4_error"
		str1="<font color=red>该类别已经存在!</font>，跳转到 <a href='qingtiandh_type1/index.asp'><font color=blue>导航类别列表</font></a>"	
	Case "5"
		str1="保存成功，跳转到 <a href='qingtiandh_type2/index.asp'><font color=blue>二级导航类别列表</font></a> ||| <a href='qingtiandh_type2/edit.asp'>添加新类别</a>"
	Case "5_error"
		str1="<font color=red>该类别已经存在!</font>，跳转到 <a href='qingtiandh_type2/index.asp'><font color=blue>二级导航类别列表</font></a>"
	Case "7"
		str1="保存成功，跳转到 <a href='qingtiandh_List/index.asp'><font color=blue>网站列表</font></a> ||| <a href='qingtiandh_List/edit.asp'>添加新网站</a>"
	Case "7_error"
		str1="<font color=red>该网站已经存在!</font>，跳转到 <a href='qingtiandh_List/index.asp'><font color=blue>网站列表</font></a>"		
	Case Else
		str1="未知错误"
End Select
str2=split(str1,"|||")
For i=0 To Ubound(str2)
	IF Trim(str2(i))<>"" Then
		str3=str3&"<tr class='forumRow' height='25'><td>※ "&str2(i)&"</td></tr>"&vbcrlf
	End IF	
Next
IF r<>"" Then
	rr=r
Else
	rr=request.ServerVariables("HTTP_REFERER")
End IF

IF rr<>"" Then
	IF n="" Then
		str3=str3&"<tr class='forumRow' height='25'><td>※ <a href='"&rr&"'><font color=blue>上一页</font></td></tr></a>"
	Else
		str3=str3&"<tr class='forumRow' height='25'><td>※ <a href='"&rr&"'><font color=blue>"&n&"</font></td></tr></a>"
	End IF
	IF tt<>"" Then
		str3=str3&"<meta http-equiv=""Refresh"" content="""&tt&";URL="&rr&""">"
	End IF
End IF
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=G_WebName%> - 管理员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="98%"  class="tableBorder"cellpadding="2" cellspacing="1" border="0">
	<tr>
	<th align="center" class="tableHeaderText" height=25>操作提示 </th>
	</tr>
	
	<%=str3%>
	<!--<tr class="forumRow"  height="25"><td nowrap>※ <a href='javascript:window.opener=null;window.close()'>关闭窗口</a></td></tr>-->
</table>
<%
	Function StayNub(ContentStr)
	 IF ContentStr="" or isNUll(ContentStr) Then
		StayNub=""
		Exit Function
	 End IF
	 Dim ClsTempLoseStr,regEx
	 ClsTempLoseStr = Cstr(ContentStr)
	 Set regEx = New RegExp
	 regEx.Pattern = "[^\d]*"
	 regEx.IgnoreCase = True
	 regEx.Global = True
	 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr,"")
	 StayNub = ClsTempLoseStr
	End Function
%>
</body>
</html>