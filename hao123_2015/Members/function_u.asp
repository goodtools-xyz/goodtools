<%
'判断用户名
Function L_checkusername(str)
L_checkusername=true
   for i = 1 to Len(str)
     c = Lcase(Mid(str, i, 1))
	 if InStr("0123456789_abcdefghijklmnopqrstuvwxyz.", c) <= 0  then
	   L_checkusername = false
	   exit function
	 end if
   next
End Function
'判断密码
Function L_checkpassword(str)
L_checkpassword=true
   for i = 1 to Len(str)
     c = Lcase(Mid(str, i, 1))
		 if InStr("0123456789_abcdefghijklmnopqrstuvwxyz.", c) <= 0  then
		   L_checkpassword = false
		   exit function
		 end if
   next
End Function
'得到长度
Function L_length(str)
	L_length=str
	Dim TStr
	Dim l,t,c
	Dim i
	l=len(str)
	t=l
	t=0
	for i=1 to l
	c=asc(mid(str,i,1))
	If c<0 then c=c+65536
	If c>255 then
		t=t+2
	Else
		t=t+1
	End If
	next
	L_length = t
End Function
'Email检测
function IsValidEmail(email)
dim names, name, i, c
IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
   IsValidEmail = false
   exit function
end if
for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit function
   end if
next
if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit function
end if
if InStr(email, "..") > 0 then
   IsValidEmail = false
end if
end function
'获取IP地址
Function getIP()
    Dim strIPAddr
    If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then
        strIPAddr = Request.ServerVariables("REMOTE_ADDR")
    ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then
        strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)
    ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then
        strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)
    Else
        strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    End If
    getIP = Trim(Mid(strIPAddr, 1, 30))
End Function
Function ChkPost()
    dim HTTP_REFERER,SERVER_NAME
	dim server_v1,server_v2
	chkpost=false
    SERVER_NAME=CheckStr(Request.ServerVariables("SERVER_NAME"))
	HTTP_REFERER=CheckStr(Request.ServerVariables("HTTP_REFERER"))
	server_v1=Cstr(HTTP_REFERER)
	server_v2=Cstr(SERVER_NAME)
	if mid(server_v1,8,len(server_v2))<>server_v2 then
		chkpost=false
	else
		chkpost=true
	end if
End Function
function UTF2GB(UTFStr) 

for Dig=1 to len(UTFStr) 
  '如果UTF8编码文字以%开头则进行转换
  if mid(UTFStr,Dig,1)="%" then 
     'UTF8编码文字大于8则转换为汉字
    if len(UTFStr) >= Dig+8 then 
       GBStr=GBStr & ConvChinese(mid(UTFStr,Dig,9)) 
       Dig=Dig+8 
    else 
      GBStr=GBStr & mid(UTFStr,Dig,1) 
    end if 
  else 
     GBStr=GBStr & mid(UTFStr,Dig,1) 
  end if 
next 
UTF2GB=GBStr 
end function 

'Server.HTMLEncode()编码
function ReplaceText(fString)
	if isnull(fString) then
	ReplaceText=""
	exit function
	else
	fString=trim(fString)
	fString=replace(fString,"'","''")
	fString=replace(fString,"--","—")
	fString=Server.HTMLEncode(fString)
	ReplaceText=fString
	end if	
end function

Function CheckBoxScript2(ByVal FormElement , ByVal ElementValue)
	  CheckBoxScript2 = "<s"&"cript language=""JavaScript"">" & vbCrlf
	  CheckBoxScript2 = CheckBoxScript2 & "    var ss = """ & ElementValue & """" & vbCrlf
	  CheckBoxScript2 = CheckBoxScript2 & "    for(i=0;i<"&FormElement&".length;i++){ " & vbCrlf
	  CheckBoxScript2 = CheckBoxScript2 & "            "&FormElement&"[i].disabled = true " & vbCrlf
	  CheckBoxScript2 = CheckBoxScript2 & " 	}	</"&"script>"
End function
%>