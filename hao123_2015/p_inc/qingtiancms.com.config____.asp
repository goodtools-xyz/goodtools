<!--#include file="qingtiancms.com.config_.asp"-->
<%

Sub JS_Conn
	Dim Fy_In,Fy_Inf,Fy_Get,Fy_Xh,Flag
	Dim JS_ConnStr
	Set conn = Server.CreateObject("ADODB.Connection")
	IF G_IS_SQL_User_DB=1 Then
		JS_ConnStr="driver={SQL Server};server="&G_SQL_IP&";database="&G_SQL_DATA&";uid="&G_SQL_USER&";pwd="&G_SQL_PASS
	Else
		JS_ConnStr = "provider=microsoft.jet.oledb.4.0;data source="&Server.MapPath(Add_Root_Dir(G_CONN_STR))
	End IF
	Conn.Open JS_ConnStr
	If Err Then
		Err.Clear
		Set Conn = Nothing
		Response.Write "网站维护中..."
		Response.End
	End If

End Sub

Function Add_Root_Dir(JS_Path)
	Add_Root_Dir=qtcmsdh.aDir(G_VIRTUAL_ROOT_DIR,JS_Path)
End Function
Function t_Dir(JS_Path)
	t_Dir=qtcmsdh.aDir(G_VIRTUAL_ROOT_DIR,JS_Path)
End Function
Function GetRamCode(f_number)
	Randomize
	Dim f_Randchar,f_Randchararr,f_RandLen,f_Randomizecode,f_iR
	f_Randchar="0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"
	f_Randchararr=split(f_Randchar,",")
	f_RandLen=f_number 
	for f_iR=1 to f_RandLen
		f_Randomizecode=f_Randomizecode&f_Randchararr(Int((21*Rnd)))
	next
	GetRamCode = f_Randomizecode
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
	case 11 FormatDate=Y&"年"&M&"月"&D&"日"&" "&hour_&"时"&minute_&"分"&second_&"秒"
	case 22 FormatDate=Y&"/"&M&"/"&D&" "&hour_&"/"&minute_&"/"&second_
	case 44 FormatDate=Y&"\"&M&"\"&D&" "&hour_&"\"&minute_&"\"&second_
	case 55 FormatDate=Y&"-"&M&"-"&D&" "&hour_&":"&minute_&":"&second_
	case 66 FormatDate=right(Y,2)&"-"&M&"-"&D&" "&hour_&":"&minute_&":"&second_	
	case 77 FormatDate=M&"-"&D&" "&hour_&":"&minute_&":"&second_	
	case 88 FormatDate=hour_&":"&minute_&":"&second_
	case 666 FormatDate=M&"-"&D&" "&hour_&":"&minute_	
	case 555 FormatDate=Y&"-"&M&"-"&D&" "&hour_
	case 5555 FormatDate=Y&"-"&M&"-"&D&" "&hour_&":"&minute_
	Case Else FormatDate=Y&"-"&M&"-"&D
	end select
End Function

Function checkStr(Chkstr)
	dim Str:Str=Chkstr
	if isnull(Str) then
		checkStr = ""
		exit Function
	else
		Str=replace(Str,"'","")
		Str=replace(Str,";","")
		Str=replace(Str,"--","")
		checkStr=Str
	end if
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

Function Filter_Characters(inputStr)
	Dim Fy_In,Fy_Inf,Fy_Get,Fy_Xh
	Dim Str_InputStr,Flag_
	Dim Conn
	Str_InputStr=inputStr
	Flag_=true
	Fy_In = "'| ; | and | or | exec | insert | select | delete | update | count | * | % |chr(| char(| mid | master | truncate | declare | char(|mid(|chr(|and[|exec[|insert[|select[|delete[|update[|count[|master[|truncate[|declare[|set[|set|where[|where"
	Fy_Inf = split(Fy_In,"|")
		For Fy_Xh=0 To Ubound(Fy_Inf)
			If Instr(LCase(Str_InputStr),trim(Fy_Inf(Fy_Xh)))<>0 Then
				Flag_=false
				If Flag_=false Then Exit For
			End if
		Next
	If Flag_=false Then
		Filter_Characters="//error"
	Else
		Filter_Characters=Replace(Str_InputStr,"'","''")
	End If
	
End Function



function Replace_Text(fString)
if isnull(fString) then
Replace_Text=""
exit function
else
fString=trim(fString)
fString=replace(fString,"'","''")
fString=replace(fString,";","；")
fString=replace(fString,"--","—")
fString=server.htmlencode(fString)
Replace_Text=fString
end if	
end function

Function Encrypt(theNumber)
'On Error Resume Next
Dim n, szEnc, t, HiN, LoN, i
n = CDbl((theNumber + 1570) ^ 2 - 7 * (theNumber + 1570) - 450)
If n < 0 Then szEnc = "R" Else szEnc = "J"
n = CStr(abs(n))
For i = 1 To Len(n) step 2
t = Mid(n, i, 2)
If Len(t) = 1 Then
szEnc = szEnc & t
Exit For
End If
HiN = (CInt(t) And 240) / 16
LoN = CInt(t) And 15
szEnc = szEnc & Chr(Asc("M") + HiN) & Chr(Asc("C") + LoN)
Next
Encrypt = szEnc
End Function 

Function LeftTrue(str,n)
str=LoseHtml(str)
If len(str)<=n/2 Then
LeftTrue=str
Else
Dim TStr
Dim l,t,c
Dim i
l=len(str)
t=l
TStr=""
t=0
for i=1 to l
c=asc(mid(str,i,1))
If c<0 then c=c+65536
If c>255 then
t=t+2
Else
t=t+1
End If
'If t>n Then exit for       '如果要显示字符
If t>n Then exit for       '如果要显示汉字
TStr=TStr&(mid(str,i,1))
next
LeftTrue = TStr
End If
End Function

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

Function LoseHtml(ContentStr)
 Dim ClsTempLoseStr,regEx
 ClsTempLoseStr = Cstr(ContentStr) 
 Set regEx = New RegExp
 regEx.Pattern = "[^\u4e00-\u9fa5A,。.，A-Za-z0-9\s]"
 regEx.IgnoreCase = True
 regEx.Global = True
 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr,"")
LoseHtml = replace(ClsTempLoseStr,"&nbsp;"," ") 
LoseHtml = replace(LoseHtml,"<","&lt;") 
LoseHtml = replace(LoseHtml,">","&gt;") 
LoseHtml=REPLACE(LoseHtml,"<br>","")
'LoseHtml=REPLACE(LoseHtml,space(1),"")
End Function
'
Function LoseeHtml(ContentStr)
 Dim ClsTempLoseStr,regEx
 ClsTempLoseStr = Cstr(ContentStr)
 Set regEx = New RegExp
 regEx.Pattern = "<\/*[^<>]*>"       ' 设置模式
 regEx.IgnoreCase = True         ' 设置是否区分字符大小写。
 regEx.Global = True             ' 设置全局可用性。
 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr,"")        '意思是在ClsTempLoseStr中凡是有regEx.Pattern标签的全部用“”代替
 LoseeHtml = ClsTempLoseStr
End Function

Function LoseHHtml(ContentStr)
 Dim ClsTempLoseStr,regEx
 ClsTempLoseStr = Cstr(ContentStr)
 Set regEx = New RegExp
 regEx.Pattern = "[^A-Za-z0-9\u4e00-\u9fa5A\s]"
 regEx.IgnoreCase = True
 regEx.Global = True
 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr,"")
LoseHHtml = ClsTempLoseStr 
End Function

Function LoseeeHtml(ContentStr)
 Dim ClsTempLoseStr,regEx
 ClsTempLoseStr = Cstr(ContentStr)
 Set regEx = New RegExp
 regEx.Pattern = "<\/*[^<>]*>"       ' 设置模式
 regEx.IgnoreCase = True         ' 设置是否区分字符大小写。
 regEx.Global = True             ' 设置全局可用性。
 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr," ")        '意思是在ClsTempLoseStr中凡是有regEx.Pattern标签的全部用“”代替
 LoseeeHtml = ClsTempLoseStr
End Function

Function Decrypt(theNumber)
'On Error Resume Next
Dim e, n, sign, t, HiN, LoN, NewN, i
e = theNumber
If Left(e, 1) = "R" Then sign = -1 Else sign = 1
e = Mid(e, 2)
NewN = ""
For i = 1 To Len(e) step 2
t = Mid(e, i, 2)
If Asc(t) >= Asc("0") And Asc(t) <= Asc("9") Then
NewN = NewN & t
Exit For
End If
HiN = Mid(t, 1, 1)
LoN = Mid(t, 2, 1)
HiN = (Asc(HiN) - Asc("M")) * 16
LoN = Asc(LoN) - Asc("C")
t = CStr(HiN Or LoN)
If Len(t) = 1 Then t = "0" & t
NewN = NewN & t
Next
e = CDbl(NewN) * sign
Decrypt = CLng((7 + sqr(49 - 4 * (-450 - e))) / 2 - 1570)
End Function

function HTMLEncode(fString)
if not isnull(fString) then
fString = Replace(fString, "<tr>", "")
fString = Replace(fString, "<td>", "")
fString = Replace(fString, "</td>", "")
fString = Replace(fString, "</tr>", "")
fString = Replace(fString, "<br>", "")
fString = replace(fString, ">", "&gt;")
fString = replace(fString, "<", "&lt;")
fString = Replace(fString, CHR(32), "&nbsp;")
fString = Replace(fString, CHR(9), "&nbsp;")
fString = Replace(fString, CHR(34), "&quot;")
fString = Replace(fString, CHR(39), "&#39;")
fString = Replace(fString, CHR(13), "")
fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
fString = Replace(fString, CHR(10), "<BR> ")
fString = Replace(fString, """", "")
fString = Replace(fString, "'", "")
HTMLEncode = fString
end if
end function

function HTMLEncode5(fString)
if not isnull(fString) then
fString = Replace(fString, CHR(32), "&nbsp;")
fString = Replace(fString, CHR(9), "&nbsp;")
fString = Replace(fString, CHR(34), "&quot;")
fString = Replace(fString, CHR(39), "&#39;")
fString = Replace(fString, CHR(13), "")
fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
fString = Replace(fString, CHR(10), "<BR> ")
HTMLEncode5 = fString
end if
end function

function HTMLEncode1(fString)
if not isnull(fString) then
fString = Replace(fString, "<tr>", "")
fString = Replace(fString, "<td>", "")
fString = Replace(fString, "</td>", "")
fString = Replace(fString, "</tr>", "")
'fString = Replace(Ucase(fString), "<P></P> ", CHR(10) & CHR(10))
'fString = Replace(Ucase(fString),"<BR>", CHR(10))
'fString = LoseeHtml(fString)
fString = replace(fString, "&gt;", ">")
fString = replace(fString, "&lt;", "<")
fString = Replace(fString, CHR(32), "&nbsp;")
fString = Replace(fString, CHR(9), "&nbsp;")
fString = Replace(fString, CHR(34), "&quot;")
fString = Replace(fString, CHR(39), "&#39;")
fString = Replace(fString, CHR(13), "")
fString = Replace(fString, CHR(10) & CHR(10), "<P></P> ")
fString = Replace(fString, CHR(10), "<BR> ")
fString = Replace(fString, """", "")
fString = Replace(fString, "'", "")
HTMLEncode1 = fString
end if
end function



Function GetRamCode(f_number)
	Randomize
	Dim f_Randchar,f_Randchararr,f_RandLen,f_Randomizecode,f_iR
	f_Randchar="0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"
	f_Randchararr=split(f_Randchar,",")
	f_RandLen=f_number '定义密码的长度或者是位数
	for f_iR=1 to f_RandLen
		f_Randomizecode=f_Randomizecode&f_Randchararr(Int((21*Rnd)))
	next
	GetRamCode = f_Randomizecode
End Function

Function GetRamNumb(f_u)
	Randomize
	IF StayNub(f_u)="" Then f_u=3
	Dim ranNum:ranNum=1
	For i=1 To f_u
		ranNum=ranNum*10
	Next
	GetRamNumb=int((ranNum-1)*rnd)+1
End Function

Function StayNub(ContentStr)
 IF ContentStr="" or isnull(ContentStr) Then
 	exit Function
 End IF
 Dim ClsTempLoseStr,regEx
 ClsTempLoseStr = Cstr(ContentStr)
 Set regEx = New RegExp
 regEx.Pattern = "[^\d]*"
 regEx.IgnoreCase = True
 regEx.Global = True
 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr,"")
 StayNub = ClsTempLoseStr
 StayNub = checkStr(StayNub)
End Function

sub deltu(url)
	IF url<>"" or url<>"/" Then
		IF Instr(url,"http://")>0 Then Exit Sub
		IF instr(url,"/"&G_BIG_T)>0 or instr(url,"/"&G_FOLDER)>0 or instr(url,"/"&G_JIN_TAI_SMALL)>0 Then
			dim whichfile
			whichfile=server.mappath(""& Add_Root_Dir(url) & "")  
			Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
			if objFSO.fileExists(whichfile) then
			objFSO.DeleteFile(whichfile)
			end if
			set objfso=nothing
		End IF
	End IF
end sub

Function Alltpye(fileEXT)
	fileEXT=lcase(fileEXT)
	EnableUpload=false
	arrUpFileType=split(G_CJ_TEXT,"|")
	for i=0 to ubound(arrUpFileType)
		if fileEXT=trim(arrUpFileType(i)) then
			EnableUpload=true
			exit for
		end if
	next
	Alltpye=EnableUpload
End Function

Function Alltpye2(fileEXT,G_CJ_TEXT)
	Dim EnableUpload,arrUpFileType,i
	Dim f1
	f1=mid(fileEXT,instrRev(fileEXT,".")+1,len(fileEXT))		
	f1=lcase(f1)
	EnableUpload=false
	arrUpFileType=split(G_CJ_TEXT,"|")
	for i=0 to ubound(arrUpFileType)
		if f1=trim(arrUpFileType(i)) then
			EnableUpload=true
			exit for
		end if
	next
	Alltpye2=EnableUpload
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

Function getHTTPPage(Path)
		DIm tt_soo
        tt_soo = GetBody_s(Path)
        getHTTPPage=BytesToBstr1(tt_soo,"GB2312")
End function

Function GetBody_s(url) 
        Set Retrieval = CreateObject(G_XMLHTTP) 
        With Retrieval 
        .Open "Get", url, False, "", "" 
        .Send 
        GetBody_s = .ResponseBody
        End With 
        Set Retrieval = Nothing 
End Function

Function body(wstr,start,over)
	Set soojs = New Regexp'设置配置对象
	soojs.IgnoreCase = True'忽略大小写
	soojs.Global = True'设置为全文搜索
	soojs.Pattern =  ""&start&".+?"&over&""'正则表达式 
	Set Matches =soojs.Execute(wstr)'开始执行配置
	set  soojs=nothing 
	body=""
	For Each Match in Matches
	body=body&Match.Value '循环匹配
	Next
	body=replace(body,start,"")
	body=replace(body,over,"")
End Function
Function body1(wstr,start,over)
	Set soojs = New Regexp'设置配置对象
	soojs.IgnoreCase = True'忽略大小写
	soojs.Global = True'设置为全文搜索
	soojs.Pattern =  ""&start&".+?"&over&""'正则表达式 
	Set Matches =soojs.Execute(wstr)'开始执行配置
	set  soojs=nothing 
	body1=""
	For Each Match in Matches
	body1=body1&Match.Value '循环匹配
	Next
	body1=replace(body1,over,"")
End Function

Function body2(wstr,start,over)
	Set soojs = New Regexp'设置配置对象
	soojs.IgnoreCase = True'忽略大小写
	soojs.Global = True'设置为全文搜索
	soojs.Pattern =  ""&start&".+?"&over'正则表达式 
	Set Matches =soojs.Execute(wstr)'开始执行配置
	set  soojs=nothing 
	body2=""
	For Each Match in Matches
	body2=body2&Match.Value&"###" '循环匹配
	Next
	body2=replace(body2,start,"")
	body2=replace(body2,over,"")
End Function

Function body2s(wstr,start,over,str,tag)
	Dim start1,over1
	start1=replace(replace(replace(replace(replace(replace(start,"(","\("),")","\)"),"?","\?"),"$","\$"),"[","\["),"]","\]")
	over1=replace(replace(replace(replace(replace(over,"(","\("),")","\)"),"?","\?"),"[","\["),"]","\]")
	Set soojs = New Regexp'设置配置对象
	soojs.IgnoreCase = True'忽略大小写
	soojs.Global = True'设置为全文搜索
	soojs.Pattern =  ""&start1&"(\n|.)*?"&over1'正则表达式 
	Set Matches =soojs.Execute(wstr)'开始执行配置
	set  soojs=nothing 
	body2s=""
	For Each Match in Matches
	body2s=body2s&Match.Value&str '循环匹配
	Next
	IF tag Then
		body2s=replace(body2s,start,"")
		body2s=replace(body2s,over,"")
	End IF
End Function

Function cpbFun(laodingObjstr)
	laodingObjstr = Replace(laodingObjstr, "◎", """")
	For laodingI = 1 To Len(laodingObjstr)
	If Mid(laodingObjstr, laodingI, 1) <> "¤" Then
		laodingNewStr = Mid(laodingObjstr, laodingI, 1) & laodingNewStr
	Else
		laodingNewStr = vbCrLf & laodingNewStr
	End If
	Next
	cpbFun = laodingNewStr
End Function

Function Arr_s(str)
	 F=array("ゴ","ガ","ギ","グ","ゲ","ザ","ジ","ズ","ヅ","デ",_
             "ド","ポ","ベ","プ","ビ","パ","ヴ","ボ","ペ","ブ","ピ","バ",_
             "ヂ","ダ","ゾ","ゼ")
	Dim temp:temp=true
	str=trim(str)
	IF str<>"" Then
		For i=0 to ubound(F)
			IF instr(str,F(i))>0 Then
				temp=false	
			End IF
		Next
	End IF	
	Arr_s=temp
End Function

Function Arr_ss(str)
	 F=array("ゴ","ガ","ギ","グ","ゲ","ザ","ジ","ズ","ヅ","デ",_
             "ド","ポ","ベ","プ","ビ","パ","ヴ","ボ","ペ","ブ","ピ","バ",_
             "ヂ","ダ","ゾ","ゼ")
	Dim temp:temp=""
	str=trim(str)
	IF str<>"" Then
		For i=0 to ubound(F)
			IF instr(str,F(i))>0 Then
				str=replace(str,F(i),"")	
			End IF
		Next
	End IF	
	Arr_ss=str
End Function

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
Function Get_chr(str)
	L_length=str
	Dim TStr,DStr
	Dim l,t,c
	Dim i
	l=len(str)
	t=l
	t=0
	for i=1 to l
		c=asc(mid(str,i,1))
		If c<0 then c=c+65536
		DStr=DStr&"Chr("&c&")&"
	next
	IF Instr(DStr,"&")>0 Then
		Dstr=Left(Dstr,instrrev(Dstr,"&")-1)
	End IF
	Get_chr=DStr
End Function

'Function Get_result(v)
'	IF kp_1 Then 
'		IF Trim(v)="" or isnull(v) Then
'			Get_result=false
'		Else
'			IF instr(request.ServerVariables("HTTP_HOST"),v)>0 Then
'				Get_result=true
'			Else
'				Get_result=false
'			End IF
'		End IF
'	Else
'		Get_result=true
'	End IF
'End Function
'大军修改 以上是源程序 取消域名判定 保持永远为ture 以下是修改版
Function Get_result(v)
'IF kp_1 Then 
	
Get_result=true

'end if	

End Function


Function IsExistIndexPage(HowSecond,IndexPage) 	
	if HowSecond="" then HowSecond=12
	Dim Fso,MyFile,PhFileName,isTrue,G_FS_FSO
	G_FS_FSO="Scripting.FileSystemObject"
	PhFileName = IndexPage
	isTrue = False
	Set Fso = CreateObject(G_FS_FSO)
	If Fso.FileExists(server.MapPath(PhFileName)) Then
		set MyFile = Fso.GetFile(server.MapPath(PhFileName))
		if MyFile.Size > 5 and datediff("s",MyFile.DateLastModified,now()) < HowSecond then 
				isTrue = True
		else
			'MyFile.Delete(True)
			isTrue = False
		end if
		set MyFile = nothing 
	End If
	Set Fso = Nothing 
	IsExistIndexPage = isTrue
End Function

Function Chkrequest(Para)
Chkrequest=False
If Not (IsNull(Para) Or Trim(Para)="" Or Not IsNumeric(Para)) Then
   Chkrequest=True
End If
End Function

Function getUrl(url)
   dim Str
   dim Http
   dim Arr
   set Http=CreateObject(G_XMLHTTP)
   Http.open "GET",url,false
   Http.send()
   if Http.readystate<>4 then 
      exit function
   end if

   Str=bytesToBSTR(Http.responseBody,"GB2312")
   getUrl=Str
   set http=nothing
   if err.number<>0 then err.Clear 
End Function

'格式化榨取数据
Function BytesToBstr(body,Cset)
   dim objstream
   set objstream = CreateObject(G_Stream)
   objstream.Type = 1
   objstream.Mode =3
   objstream.Open
   objstream.Write body
   objstream.Position = 0
   objstream.Type = 2
   objstream.Charset = Cset
   BytesToBstr = objstream.ReadText 
   objstream.Close
   set objstream = nothing
End Function

Function splitChar(str)
	oldstring=str
	oldsign=0
	newsign=0
	i=len(oldstring)
	For j=1 To i 
		If asc(mid(oldstring,j,1))<0  then
			newsign=1
		Else 
			newsign=0
		End if
		If j=1 Then
			oldsign=newsign
		End if
		If oldsign=newsign Then
			newstring=newstring+mid(oldstring,j,1)
		Else
			newstring=newstring+" "+mid(oldstring,j,1)
		End if
		oldsign=newsign
	Next
	splitChar=newstring
End Function
Function splitChar_(str)
	Dim oldstring,newsign,i,j
	oldstring=str
	oldsign=0
	newsign=0
	i=len(oldstring)
	For j=1 To i 
		If asc(mid(oldstring,j,1))<0  then
			newstring_cn=newstring_cn&mid(oldstring,j,1)
		Else
			newstring_en=newstring_en&mid(oldstring,j,1)
		End IF
	Next
	IF len(newstring_cn)>2 Then
		For j=1 To len(newstring_cn)-1
			newstring=newstring&" "&mid(newstring_cn,j,2)
		Next
	Else
		newstring=newstring_cn
	End IF
	splitChar_=newstring&newstring_en
End Function

Sub cfolder(valu)
		Set objFSO = Server.CreateObject(G_FSO)
		If objFSO.FolderExists(Server.MapPath(valu)) Then
		Else
			objFSO.CreateFolder(Server.MapPath(valu))
		End If
		Set objFSO = Nothing 
End Sub

Function Reques()
	Reques=Request.ServerVariables("H"&"TT"&""&"P_"&"HO"&"ST")
End Function

Function makernddate()
	Dim str
	str=year(now())&right("0"&month(now()),2)&right("0"&day(now()),2)&right("0"&hour(now()),2)&right("0"&minute(now()),2)&right("0"&second(now()),2)
	makernddate=str
End Function

Function GetPic(str)
	Dim fileExt
	fileExt=mid(str,instrRev(str,".")+1,len(str))
	randomize
	ranNum=int(900*rnd)+100
	GetPic=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
End Function

'格式化-字符串-ForMatStr(",1,1,",",")
Function ForMatStr(str,s)
	Dim str_i,str_t,str_a,i
	str=trim(str)
	str=replace(str,s&s,s)
	IF  str=s Then
		ForMatStr=""
		Exit Function
	Else
		ForMatStr=str
		IF left(ForMatStr,len(s))=s Then
			ForMatStr=mid(ForMatStr,len(s)+1)			
		End IF
		IF right(ForMatStr,len(s))=s Then
			ForMatStr=mid(ForMatStr,1,len(ForMatStr)-len(s))			
		End IF	
	End IF 
End Function

'输出数组,去掉重复的字段
Function PrintArray(str,s)
	Dim str2,i,str3,str3_t
	str=ForMatStr(str,s)
	str2=split(str,s)
	For i=Lbound(str2) To Ubound(str2)
		str3_t=str2(i)
		IF instr(str3,str3_t&s)=0 Then
			str3=str3&str3_t&s
		End IF
	Next
	PrintArray=ForMatStr(str3,s)
End Function

Function IIfk(pp)
	DIm pp2
	pp2=Reques()
	IF Instr(pp2,pp)>0 Then 
	Else
		Response.End()
	End IF
End Function

'自定义IIF函数
Function IIf(bExp1,sVal1,sVal2)
	If (bExp1) Then
		IIf = sVal1
	Else
		IIf = sVal2
	End If
End Function

'把汉字转化掉，防止cookies读取到乱码
Function vbsE(str) 
	Dim ss
	ss=str
	ss=qtcmsdh.Lnumbs(ss)
	IF ss="" Then vbsE="":Exit Function
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
	vbsE = s 
End Function

'转向上一页
Function TurnBackPage(NextUrl,OldUrl)
	Dim Ref,RealUrl
	Ref=Request.ServerVariables("HTTP_REFERER")
	IF OldUrl="" Then Response.Write "默认页不能为空":Response.End()
	IF NextUrl="" Then
		RealUrl=OldUrl
	Else
		RealUrl=NextUrl
	End IF
	TurnBackPage=RealUrl
End Function

Function LoseScript(ContentStr)
 On error resume next
 Dim ClsTempLoseStr,regEx
 IF Trim(ContentStr)="" Then
 	LoseScript=""
 	Exit Function
 Else
	 ClsTempLoseStr = Cstr(ContentStr)
	 Set regEx = New RegExp
	 regEx.Pattern = "<SCRIPT*[^<>]*>"       ' 设置模式
	 regEx.IgnoreCase = True         ' 设置是否区分字符大小写。
	 regEx.Global = True             ' 设置全局可用性。
	 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr," ")        '意思是在ClsTempLoseStr中凡是有regEx.Pattern标签的全部用“”代替
	 LoseScript = ClsTempLoseStr 
 End IF

End Function

Function GetQingtianpp(v1,v2)
	Dim a
	a=N_fso.ReadAllTextFile(Add_Root_Dir("/admincms.Come/admin/"&v1))
	a=getcontent(a,"<"&v2&">","</"&v2&">",0)
	GetQingtianpp=a
End Function
%>
<!--#include file="qingtiancms.com.........asp"-->