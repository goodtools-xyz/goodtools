
<%








Function Qingtiandy_newstring(wstr,strng)
         Qingtiandy_newstring=Instr(lcase(wstr),lcase(strng))
         if Qingtiandy_newstring<=0 then Qingtiandy_newstring=Len(wstr)
End Function 
function Qingtiandy_check(message,a1,a2)
	len_a1=len(a1)
	len_a2=len(a2)
	start=Qingtiandy_newstring(message,a1)
	over=Qingtiandy_newstring(message,a2)
	Qingtiandy_check=mid(message,start,over-start)
	Qingtiandy_check=replace(Qingtiandy_check,a1,"")
end function

sub Qingtiandy_SaveRemoteFile(LocalFileName,RemoteFileUrl)
	dim Ads,Retrieval,GetRemoteData
	Set Retrieval = Server.CreateObject(G_XMLHTTP)
	With Retrieval
	  .Open "Get", RemoteFileUrl, False, "", ""
	  .Send	  
	  GetRemoteData = .ResponseBody
	End With
	IF Retrieval.status<>200 then
	   '释放对象
	   Set Retrieval = Nothing 
	   Exit sub
	End if	   	
	Set Retrieval = Nothing
	
	IF formatnumber(len(GetRemoteData)/1024*2,2)>1 then
		Set Ads = Server.CreateObject(G_Stream)
		With Ads
		  .Type = 1
		  .Open
		  .Write GetRemoteData
		  '判断时候有此文件存在
		  .SaveToFile server.MapPath(LocalFileName),2
		  .Cancel()
		  .Close()
		End With
		Set Ads=nothing
		IF Lcase(G_SHUIYIN)="yes" Then			
			IF G_SHUIYIN_TYPE Then '图片水印
				IF G_S_PicUrl="" Then G_S_PicUrl="/p_inc/img/shuiyin.gif"
				'AddAllMark LocalFileName,G_S_MarkFontColor,t_Dir(G_S_PicUrl),G_S_MarkText,G_S_MarkFontName,G_S_MarkFontBond,G_S_MarkFontSize
				AddPicMark LocalFileName,t_Dir(G_S_PicUrl)
			Else
				AddTextMark G_S_MarkText,G_S_MarkFontColor,G_S_MarkFontName,G_S_MarkFontBond,G_S_MarkFontSize,G_S_MarkPosition,LocalFileName
			End IF
		End IF
	Else
		Response.Write "保存失败：<font color=red>文件大小"&formatnumber(len(imgs)/1024*2,2)&"Kb，小于1K</font><br>"
		picsize=false
	End IF
end sub

Function Qingtiandy_cj_fiter(str)
	str=REPLACE(str,space(1),"")
	str=REPLACE(str,CHR(32),"")
	str=REPLACE(str,vbcrlf,"")
	str=REPLACE(str,chr(13),"")
	str=REPLACE(str,chr(10),"")	
	str=REPLACE(str,"'","")
	Qingtiandy_cj_fiter=str
End Function



'水印功能--
Function AddTextMark(MarkText,MarkFontColor,MarkFontName,MarkFontBond,MarkFontSize,MarkPosition,FileName)
	Dim objImage,X,Y,Text,TextWidth,FontColor,FontName,FondBond,FontSize,OriginalWidth,OriginalHeight
	Dim objFSO
	If InStr(FileName,":") = 0 Then																'把文件名转换为实际路径
		Set objFSO = Server.CreateObject(G_FSO)
		FileName = Server.Mappath(FileName)
		if objFSO.fileExists(FileName) then
			Text = Trim(MarkText)
			If Text = "" Then
				Exit Function
			End if
			'FontColor = Replace(MarkFontColor,"#","&H")
			FontColor="&H"&MarkFontColor
			FontName = MarkFontName
			If MarkFontBond = "1" Then
				FondBond = True
			Else
				FondBond = False
			End if
			FontSize = Cint(MarkFontSize)
			If Not IsObjInstalled("Persits.Jpeg") Then
				Exit Function
			End if
			Set objImage = Server.CreateObject("Persits.Jpeg")
			objImage.Open FileName
			objImage.Canvas.Font.Color =FontColor
			objImage.Canvas.Font.Family = FontName
			objImage.Canvas.Font.Bold = FondBond
			objImage.Canvas.Font.Size = FontSize
			TextWidth = objImage.Canvas.GetTextExtent(Text)										'计算GB2313编码的字符串所占宽度
			
			If objImage.OriginalWidth < TextWidth Or objImage.OriginalHeight < FontSize Then	'如果图片高度小于字体大小或宽度小于字符串宽度则退出
				Exit Function
			End if
			GetPostion Cint(MarkPosition),X,Y,objImage.OriginalWidth,objImage.OriginalHeight,TextWidth,FontSize '计算坐标
			objImage.Canvas.Print X, Y, Text
			objImage.Save FileName
			Set objImage = nothing		
		End IF
	End if
End Function
Function GetPostion(MarkPosition,X,Y,ImageWidth,ImageHeight,MarkWidth,MarkHeight)
	Select Case Cint(MarkPosition)
		Case 1
			X = 1
			Y = 1
		Case 2
			X = 1
			Y = Int(ImageHeight - MarkHeight - 1)
		Case 3
			X = Int((ImageWidth - MarkWidth)/2)
			Y = Int((ImageHeight - MarkHeight)/2)
		Case 4
			X = Int(ImageWidth - MarkWidth - 1)
			Y = 1
		Case 5
			X = Int(ImageWidth - MarkWidth - 1)
			Y = Int(ImageHeight - MarkHeight - 1)
	End Select						
End Function

Function AddAllMark(FileName,MarkTranspColor,MarkPicture,G_S_MarkText,G_S_MarkFontName,G_S_MarkFontBond,G_S_MarkFontSize)
'	Dim TextWidth
'	'目标图片，水印文字颜色,水印图片,文字字体,是否粗体,文字大小
'	If InStr(FileName,":") = 0 Then				
'		FileName = Server.Mappath(FileName)
'	End if
'	If MarkTranspColor <> "" Then			
'		MarkTranspColor = "&H"&MarkTranspColor
'	End if
'	Set objImage = Server.CreateObject("Persits.Jpeg")
'	objImage.Open FileName
'	Set objMark = Server.CreateObject("Persits.Jpeg")
'	objMark.Open Server.Mappath(MarkPicture)
'	
'
'	objImage.Canvas.Font.Color =MarkTranspColor
'	objImage.Canvas.Font.Family = G_S_MarkFontName
'	objImage.Canvas.Font.Bold = G_S_MarkFontBond
'	objImage.Canvas.Font.Size = G_S_MarkFontSize	
'	TextWidth = objImage.Canvas.GetTextExtent(G_S_MarkText)
'	
'	If Cint(objImage.OriginalWidth) < Cint(TextWidth) Or Cint(objImage.OriginalHeight) < Cint(G_S_MarkFontSize) Then	
'		Exit Function
'	End if	
'
'	objImage.DrawImage 0,objImage.OriginalHeight-25,objMark,0.5
'	'GetPostion 5,X,Y,objImage.OriginalWidth,objImage.OriginalHeight,TextWidth,G_S_MarkFontSize
'	objImage.Canvas.Print objImage.OriginalWidth/2-TextWidth/2, objImage.OriginalHeight-18, G_S_MarkText
'	objImage.Save FileName
'	Set objImage = nothing	
	
	'=======新加入=======
	Set Photo = Server.CreateObject("Persits.Jpeg")
	PhotoPath = Server.MapPath( FileName )
	Photo.Open PhotoPath
	PhotoWidth = Photo.Width
	PhotoHeight = Photo.Height
	If PhotoWidth > 500 Then
		Photo.Width = 500
		Photo.Height = PhotoHeight / PhotoWidth * 500
'				Photo.Save Server.mappath( sUploadDir & s_LocalFileName )
	End If
	PhotoWidth = Photo.Width
	PhotoHeight = Photo.Height
	If PhotoWidth >=250 And PhotoHeight >=200 Then
			Mark = MarkPicture '
			Set Logo = Server.CreateObject("Persits.Jpeg")
			LogoPath = Server.MapPath(Mark)
			Logo.Quality = 100
			Logo.Open LogoPath
			Logo.Width = 220
			Logo.Height = 80
			iLeft = PhotoWidth - Logo.Width - 10
			iTop = PhotoHeight - Logo.Height - 20
			'Photo.Canvas.DrawPNG iLeft , iTop , LogoPath
			Photo.DrawImage iLeft,iTop,Logo,0.5
	End If
	Photo.Save Server.mappath( FileName )
	Photo.Close()	
End Function

Function AddPicMark(FileName,MarkPicture)
		Set Photo = Server.CreateObject("Persits.Jpeg")
		PhotoPath = Server.MapPath( FileName )
		Photo.Open PhotoPath
		PhotoWidth = Photo.Width
		PhotoHeight = Photo.Height
		If PhotoWidth > 500 Then
			Photo.Width = 500
			Photo.Height = PhotoHeight / PhotoWidth * 500
'				Photo.Save Server.mappath( sUploadDir & s_LocalFileName )
		End If
		PhotoWidth = Photo.Width
		PhotoHeight = Photo.Height
		If PhotoWidth >=250 And PhotoHeight >=200 Then
				Mark = MarkPicture '
				Set Logo = Server.CreateObject("Persits.Jpeg")
				LogoPath = Server.MapPath(Mark)
				Logo.Quality = 100
				Logo.Open LogoPath
				Logo.Width = 225
				Logo.Height = 71
				iLeft = PhotoWidth - Logo.Width - 10
				iTop = PhotoHeight - Logo.Height - 20
				'Photo.Canvas.DrawPNG iLeft , iTop , LogoPath
				Photo.DrawImage iLeft,iTop,Logo,0.5
		End If
		Photo.Save Server.mappath( FileName )
		Photo.Close()
End Function

Function url_(arr)
	Dim t,id,t1,w,h,r,y
	Dim typeid2,typeid1
	IF ubound(arr)=2 Then
		t=arr(0):id=arr(1):t1=arr(2)
	ElseIF 	ubound(arr)=1 Then
		t=arr(0):id=arr(1)
	End IF
	IF ubound(arr)=3 Then
		t=arr(0):id=arr(1):t1=arr(2):t2=arr(3)	
	End IF	
	IF ubound(arr)=4 Then
		t=arr(0):id=arr(1):t1=arr(2):t2=arr(3):t3=arr(4)
	End IF		
	IF ubound(arr)=5 Then
		t=arr(0):id=arr(1):t1=arr(2):w=arr(3):h=arr(4):r=arr(5)
	End IF
	IF ubound(arr)=6 Then
		t=arr(0):id=arr(1):t1=arr(2):w=arr(3):h=arr(4):r=arr(5):y=arr(6)
	End IF	
	IF t="l2" Then
		typeid2=Bint(id)
		type_ff=true
		IF G_moshi="1" Then
			Set oRs=Conn.Execute("Select top 1 typename, typehttpurl,typehttpurl2,(Select typename From qingtiandh_type1 as b Where b.typeid=a.typeid1) as typename1 From qingtiandh_type2 as a Where typeid="&typeid2)
			IF Not oRs.Eof Then
				ztypehttpurl2=GetRp(oRs("typehttpurl2"))
				ztypehttpurl=GetRp(oRs("typehttpurl"))
				ztypename=GetRp(oRs("typename"))
				ztypename1=GetRp(oRs("typename1"))
				IF ztypehttpurl="" Then
					IF G_List_yemian="" Then
						ztypehttpurl=pingyin_c(ztypename&typeid2)
					ElseIF G_List_yemian="1" Then
						ztypehttpurl=pingyin_c(ztypename)
					ElseIF G_List_yemian="2" Then
						ztypehttpurl=pingyin_c(ztypename1&ztypename)
					ElseIF G_List_yemian="3" Then	
						ztypehttpurl=pingyin_c(ztypename)
					Else
						ztypehttpurl=pingyin_c(ztypename&typeid2)
					End IF
				End IF

			Else
				type_ff=False
				ztypehttpurl=typeid2&"_"&typeid2
			End IF
			
			IF type_ff Then
				IF G_jingtai_wenjian_mulu<>"" Then
					N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
				End IF
				IF Instr(ztypehttpurl2,"http://")>0 Then
					url_=ztypehttpurl2
				Else
					IF G_List_yemian="3" Then
						N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl)
						IF t1="1" Then
							url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl&"/")
						Else
							url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl&"/"&"index"&G_HTML)
						End IF
					Else
						url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl&G_HTML)	
					End IF
				End IF
			End IF
		Else
			url_=t_Dir("/come/list.asp?ty2="&typeid2)
		End IF	
	ElseIF t="l1" Then
		typeid1=Bint(id)
		IF G_moshi="1" Then
			Set oRs=Conn.Execute("Select top 1 typename,typehttpurl,typehttpurl2 From qingtiandh_type1 as a Where typeid="&typeid1)
			IF Not oRs.Eof Then
				ztypehttpurl2=GetRp(oRs("typehttpurl2"))	
				ztypehttpurl=GetRp(oRs("typehttpurl"))
				ztypename=GetRp(oRs("typename"))
				
				IF ztypehttpurl="" Then
					IF G_List_yemian="" Then
						ztypehttpurl=pingyin_c(ztypename&typeid1)
					ElseIF G_List_yemian="1" Then
						ztypehttpurl=pingyin_c(ztypename)
					ElseIF G_List_yemian="2" Then
						ztypehttpurl=pingyin_c(ztypename1&ztypename)
					ElseIF G_List_yemian="3" Then	
						ztypehttpurl=pingyin_c(ztypename)						
					Else
						ztypehttpurl=pingyin_c(ztypename&typeid1)
					End IF
				End IF
			Else
				ztypehttpurl=typeid1&"_"&typeid1
			End IF
			'oRs.close:Set oRs=Nothing
			IF G_jingtai_wenjian_mulu<>"" Then
				N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
			End IF
			IF Instr(ztypehttpurl2,"http://")>0 Then
				url_=ztypehttpurl2
			Else
				IF G_List_yemian="3" Then
					N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl)
					IF t1="1" Then
						url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl&"/")
					Else
						url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl&"/"&"index"&G_HTML)
					End IF
				Else
					url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&ztypehttpurl&G_HTML)	
				End IF
			End IF
		Else
			url_=t_Dir("/come/biglist.asp?ty1="&typeid1)
		End IF					
	ElseIF t="one" Then
		id=Trim(replace(id,".asp",".html"))
		IF G_JIN_TAI_PageOne="" Then G_JIN_TAI_PageOne=G_moban
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF		
		'url_("dd",100,"../",1)
		IF G_JING_TAI Then
			url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_"&id)
		Else
			url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_"&id)
		End IF	
	ElseIF t="pages" Then
		id=Trim(replace(id,".asp",".html"))
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF		
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&id)
	ElseIF t="province" Then
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF	
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_"&id&".js")	
	ElseIF t="provinces" Then
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF	
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_s_"&id&".js")	
	ElseIF t="provinces1" Then
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF	
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_pp_a.js")	
	ElseIF t="provinces2" Then
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF	
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_pp_a_"&id&".js")	
	ElseIF t="provinces3" Then
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF	
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&G_JIN_TAI_PageOne&"_pp_d_"&id&".js")						
	ElseIF t="home" Then '生成主页
		'id 前缀
		url_=t_Dir("/"&Session("Page_skinsa")&G_JIN_TAI_IndexPage)	
	ElseIF t="city" Then '全国地图
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF	
		IF G_moshi="1" Then
			url_=t_Dir(G_jingtai_wenjian_mulu&"/"&Session("Page_skinsa")&"pCity.html")	
		Else
			url_=t_Dir("/come/index2.asp?sindex=/Ztool/city/index.html")
		End IF		
	ElseIF t="newsall" Then
		
	ElseIF t="n" Then
		IF G_moshi="1" Then
			url_= t_Dir("/"&G_JIN_TAI_Detailnews&"/"&id&G_HTML)
		Else
			url_=t_Dir("/Come/NewsDetail.asp?tag="&id)
		End IF	
	ElseIF t="np" Then
		url_=t_Dir("/Come/ProductDetail.asp?tag="&id)	
	ElseIF t="pall" Then
		url_=t_Dir("/Come/Productlist.asp")	
	ElseIF t="type2js" Then
		IF G_jingtai_wenjian_mulu<>"" Then
			N_fso.CreateFolders t_Dir(G_jingtai_wenjian_mulu)
		End IF
		url_=t_Dir(G_jingtai_wenjian_mulu&"/"&G_JIN_TAI_PageOne&"_type2"&id&".js")							
	Else
		url_=t_Dir("/")
	End IF
End Function

Function url_d(ty,m_name)
	'http://movie.gougou.com/search?id=20017&search=放羊的星星
	
	IF StayNub(G_xunlei_ad2)=""   Then
		P_xunlei_id="20116"
	Else
		P_xunlei_id=replace(StayNub(G_xunlei_ad2),"5835","20116")
	End IF
	IF ty=1 Then
		url_d="http://movie.gougou.com/search?id="&P_xunlei_id&"&search="&server.URLEncode(m_name)
		'url_d="http://www.gougou.com/search?search="&server.URLEncode(m_name)&"&suffix=&restype=-1&id=2"
	End IF
End Function

Function closers(rs)
	rs.close
	Set rs=nothing
End Function
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


'*******************************
Function qingtian_content_xunlei(content)
	content=REPLACE(content,"""","'")
	content=REPLACE(content,"<br>","")
	content=REPLACE(content,"&nbsp;","")
	Content=REPLACE(Content,space(1),"")
	Content=REPLACE(Content,CHR(32),"")	
	Content=REPLACE(Content,CHR(10),"\n")
	Content=REPLACE(Content,"<p>","")	
	Content=REPLACE(Content,"</p>","\n")
	Content=REPLACE(Content,"&middot;","·")
	Content=REPLACE(Content,"&ldquo;","“")
	Content=REPLACE(Content,"&rdquo;","”")
	Content=REPLACE(Content,"&mdash;","—")
	Content=REPLACE(Content,"&hellip;","…")
	Content=REPLACE(Content,"<br/>","\n")
	qingtian_content_xunlei=content	
End Function
'********************************
Function bobo_bytes2BSTR(vIn)
	dim i
	strReturn = ""
	For i = 1 To LenB(vIn)
		ThisCharCode = AscB(MidB(vIn,i,1))
		If ThisCharCode < &H80 Then
		strReturn = strReturn & Chr(ThisCharCode)
		Else
		NextCharCode = AscB(MidB(vIn,i+1,1))
		strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
		i = i + 1
		End If
	Next
	bobo_bytes2BSTR = strReturn
End Function
function GetSource(url)   
   '取得url页面的数据. 
   on error resume next  
   dim oXmlHttp,oStream   
   set oXmlHttp = Server.CreateObject(G_XMLHTTP) 
   oXmlHttp.open "GET",url,false
   oXmlHttp.send()
   if oXmlHttp.readystate<>4 then
      GetSource=url
  	 exit function 
   End IF 
   GetSource = bobo_bytes2BSTR(oXmlHttp.responseBody)
   if err.number<>0 then err.Clear
end function 
function chinese2unicode(Str) 
IF Str="" or isnull(Str) Then chinese2unicode="":Exit Function
dim i 
dim Str_one 
dim Str_unicode 
for i=1 to len(Str) 
Str_one=Mid(Str,i,1) 
Str_unicode=Str_unicode&chr(38) 
Str_unicode=Str_unicode&chr(35) 
Str_unicode=Str_unicode&chr(120) 
Str_unicode=Str_unicode& Hex(ascw(Str_one)) 
Str_unicode=Str_unicode&chr(59) 
next 
chinese2unicode=Str_unicode 
end function


%>