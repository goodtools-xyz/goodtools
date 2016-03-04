<%
Class qtcms_daohang
	
	Private Sub Class_Initialize()
	End Sub 

	'++++++++++++++++++++授权函数变量+++++++++++++++++++++++++++++++
	Function qtCms_yzYm()
		
		If InStr(Qtcmshttp, ",") > 0 Then
			Dim a, ai, aflag
			aflag = False
			a = Split(Qtcmshttp, ",")
			For ai = 0 To UBound(a)
				If InStr(Request.ServerVariables("HTTP_HOST"), a(ai)) > 0 Then
					aflag = True
					Exit For
				End If
			Next
			If Not aflag Then
				Response.End()
			End If
		Else
			If InStr(Request.ServerVariables("HTTP_HOST"), Qtcmshttp) = 0 Then
				Response.End()
			End If
		End If
	End Function
	Function qtCms_yzYm2()
		
		If InStr(Qtcmshttp, ",") > 0 Then
			Dim a, ai, aflag
			aflag = False
			a = Split(Qtcmshttp, ",")
			For ai = 0 To UBound(a)
				If InStr(Request.ServerVariables("HTTP_HOST"), a(ai)) > 0 Then
					aflag = True
					Exit For
				End If
			Next
			qtCms_yzYm2 = aflag
		Else
			qtCms_yzYm2 = False
		End If
	End Function
	
	Function aDir(G_VIRTUAL_ROOT_DIR, JS_Path)
		
		Dim JS_All_Path
		If Left(JS_Path, 3) = "../" Then
			aDir = JS_Path
			Exit Function
		End If
		If Left(JS_Path, 1) = "/" Then
			JS_All_Path = G_VIRTUAL_ROOT_DIR & JS_Path
		Else
			JS_All_Path = G_VIRTUAL_ROOT_DIR & "/" & JS_Path
		End If
		If Trim(G_VIRTUAL_ROOT_DIR) <> "" Then
			JS_All_Path = "/" & JS_All_Path
		End If
		aDir = JS_All_Path
	End Function
	
	'采集相关函数++++++++++++++++++++++++++++++++++++++++
	Function Qingtiandy_getHTTPPage_utf2(Path)
		
		Dim tt_soo
		tt_soo = Qingtiandy_GetBody_s(Path)
		Qingtiandy_getHTTPPage_utf2 = Qingtiandy_BytesToBstr(tt_soo, "UTF-8")
	End Function
	Function qTcms_c_f(Path)
		qTcms_c_f = Qingtiandy_getHTTPPage_utf2(Path)
	End Function
	
	Function Qingtiandy_GetBody_s(url)
		Dim Retrieval
		Set Retrieval = CreateObject("MSXML2.XMLHTTP")
		With Retrieval
		.Open "Get", url, False, "", ""
		.Send
		
		Qingtiandy_GetBody_s = .ResponseBody
		End With
		Set Retrieval = Nothing
	End Function
	Function Qingtiandy_BytesToBstr(body, Cset)
		Dim objstream
		Set objstream = Server.CreateObject("adodb.stream")
		objstream.Type = 1
		objstream.Mode = 3
		objstream.Open
		objstream.Write body
		objstream.Position = 0
		objstream.Type = 2
		objstream.Charset = Cset
		Qingtiandy_BytesToBstr = objstream.ReadText
		objstream.Close
		Set objstream = Nothing
	End Function
	Function Qingtiandy_getHTTPPage(Path)
		Dim tt_soo
		tt_soo = Qingtiandy_GetBody_s(Path)
		Qingtiandy_getHTTPPage = Qingtiandy_BytesToBstr(tt_soo, "GB2312")
	End Function
	
	Function Qingtiandy_getHTTPPage_new(Path)
		Dim tt_soo
		tt_soo = Qingtiandy_GetBody_s_new(Path)
		Qingtiandy_getHTTPPage_new = Qingtiandy_BytesToBstr_new(tt_soo)
	End Function
	Function Qingtiandy_GetBody_s_new(url)
		Dim Retrieval
		Set Retrieval = CreateObject("MSXML2.XMLHTTP")
		With Retrieval
		.Open "Get", url, False, "", ""
		.Send
		Qingtiandy_GetBody_s_new = .ResponseBody
		End With
		Set Retrieval = Nothing
	End Function
	Function Qingtiandy_BytesToBstr_new(arrBytes)
		Dim strReturn, i, ThisCharCode, NextCharCode
		strReturn = ""
		arrBytes = CStr(arrBytes)
		For i = 1 To LenB(arrBytes)
			ThisCharCode = AscB(MidB(arrBytes, i, 1))
			If ThisCharCode < &H80 Then
				strReturn = strReturn & Chr(ThisCharCode)
			Else
				NextCharCode = AscB(MidB(arrBytes, i + 1, 1))
				strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
				i = i + 1
			End If
		Next
		Qingtiandy_BytesToBstr_new = strReturn
	End Function
	Function Qingtiandy_getHTTPPage_utf(Path)
			Dim tt_soo
			tt_soo = Qingtiandy_getHTTPPage_new(Path)
			Qingtiandy_getHTTPPage_utf = Qingtiandy_BytesToBstr(tt_soo, "UTF-8")
	End Function
	'Email判断
	Function Emailis(email)
		Dim names, name, i, c
		Emailis = True
		names = Split(email, "@")
		If UBound(names) <> 1 Then
			Emailis = False
			Exit Function
		End If
		For Each name In names
		If Len(name) <= 0 Then
			Emailis = False
			Exit Function
		End If
		For i = 1 To Len(name)
			c = LCase(Mid(name, i, 1))
			If InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 And Not IsNumeric(c) Then
			Emailis = False
			Exit Function
			End If
		Next
		If Left(name, 1) = "." Or Right(name, 1) = "." Then
		  Emailis = False
		  Exit Function
		End If
		Next
		If InStr(names(1), ".") <= 0 Then
		Emailis = False
		Exit Function
		End If
		i = Len(names(1)) - InStrRev(names(1), ".")
		If i <> 2 And i <> 3 Then
		Emailis = False
		Exit Function
		End If
		If InStr(email, "..") > 0 Then
		Emailis = False
		End If
	End Function
	'数字化
	Function FNum(s)
		Dim a, i
		s = Replace(s, " ", "")
		If Len(s) < 1 Then FNum = 0: Exit Function
		a = Split(s, ",")
		For i = 0 To UBound(a)
			If Not IsNumeric(a(i)) Then a(i) = 0
		Next
		FNum = Join(a, ",")
	End Function
	'确保是数字
	Function Bint(str)
		str = Trim(str)
		If str = "" Or IsNull(str) Or Not IsNumeric(str) Then str = "0"
		str = Replace(str, "'", "")
		Bint = Round(str, 0)
	End Function
	Function StayNub(ContentStr)
	 If ContentStr = "" Or IsNull(ContentStr) Then
		Exit Function
	 End If
	 Dim ClsTempLoseStr, regEx
	 ClsTempLoseStr = CStr(ContentStr)
	 Set regEx = New RegExp
	 regEx.Pattern = "[^\d]*"
	 regEx.IgnoreCase = True
	 regEx.Global = True
	 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr, "")
	 StayNub = ClsTempLoseStr
	End Function
	'判断字段是否为空
	Function Lnumbs(v)
		
		If v = "" Or IsNull(v) Then
			Lnumbs = ""
		Else
			v = Replace(v, Chr(13), "")
			v = Replace(v, Chr(10), "")
			Lnumbs = v
		End If
	End Function
	'替换半角的"为全角的"
	Function Rm(str)
		str = Replace(str, """", "“")
		Rm = str
	End Function
	'是否同页面传递参数
	Function isPb()
		isPb = False
		If Request.ServerVariables("REQUEST_METHOD") = "POST" Then isPb = True
	End Function
	Function Ltxt(ContentStr)
	 Dim ClsTempLoseStr, regEx, RegExp
	 ClsTempLoseStr = CStr(ContentStr)
	 Set regEx = New RegExp
	 regEx.Pattern = "<\/*[^<>]*>"       ' 设置模式
	 regEx.IgnoreCase = True         ' 设置是否区分字符大小写。
	 regEx.Global = True             ' 设置全局可用性。
	 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr, "")       '意思是在ClsTempLoseStr中凡是有regEx.Pattern标签的全部用“”代替
	 Ltxt = ClsTempLoseStr
	End Function
	Function Str4Null(sInfo)
		Str4Null = sInfo
		If IsEmpty(sInfo) Then Str4Null = "": Exit Function
		If IsNull(sInfo) Then Str4Null = "": Exit Function
		Str4Null = Trim(Str4Null)
		Str4Null = Replace(Str4Null, """", "")
		Str4Null = Replace(Str4Null, "'", "")
		Str4Null = Replace(Str4Null, vbCrLf, "")
		Str4Null = Replace(Str4Null, vbCr, "")
		Str4Null = Replace(Str4Null, vbLf, "")
		Str4Null = Replace(Str4Null, vbTab, "")
		Do While (1)
			If InStr(Str4Null, "  ") > 0 Then
				Str4Null = Replace(Str4Null, "  ", " ")
			Else
				Exit Do
			End If
		Loop
	End Function
	'------------------------------------字符串输出-------------------------------------------
	Function qTcmsConstStr(v1, v2, v3)
		
		Dim str, Str2, str3
		str = ""
		If v1 = "1" Then '客户管理
			If v3 Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1001) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style='CURSOR: hand'><SPAN>客户管理</SPAN></TD></TR><TR><TD id=submenu1001><DIV class=sec_menu style='WIDTH: 158px'><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt='' src='images/left_image/bullet.gif' width=15 border=0><A href='customer/' target=main>客户管理</A></TD></TR><TBODY></TBODY></TABLE></DIV><DIV style='WIDTH: 158px'><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
			IF v3 Then
				IF v2="1" Then
					str="<TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""basic/old.asp"" target=main>网站基本参数恢复</A></TD></TR>"
					qTcmsConstStr = str
				End IF
			End IF
		 ElseIf v1 = "2" Then '公告
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1003) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>公告系统管理</SPAN> </TD></TR><TR><TD id=submenu1003><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_gonggao/index.asp"" target=main>公告列表管理 </A> <A href=""qingtiandy_gonggao/edit.asp"" target=main>添加 </A></TD></TR><TBODY></TBODY></TABLE> </DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "3" Then '消息
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1004) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>消息系统管理</SPAN> </TD></TR><TR><TD id=submenu1004><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_xxiaoxi/index.asp"" target=main>收到消息列表 </A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_xxiaoxi2/index.asp"" target=main>用户消息列表 </A> <A  href=""qingtiandy_xxiaoxi2/edit.asp"" target=main>添加 </A></TD></TR>   "
				Str2 = "<TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 boder=0><A  href=""qingtiandy_xxiaoxi2/index2.asp"" target=main>系统消息列表 </A> <A href=""qingtiandy_xxiaoxi2/edit.asp?iid=0"" target=main>添加 </A></TD></TR><TBODY></TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE> "
				str3 = str + Str2
				qTcmsConstStr = str3
			End If
		ElseIf v1 = "4" Then '新闻
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1005) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>新闻系统管理</SPAN> </TD></TR><TR><TD id=submenu1005><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_news/type.asp"" target=main>新闻类别管理 </A> <A href=""qingtiandy_news/class_ok.asp?action=add_class_1"" target=main>添加</A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A  href=""qingtiandy_news/index.asp"" target=main>新闻列表管理 </A> "
				str = str + "<A href=""qingtiandy_news/edit.asp"" target=main>添加 </A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_c/index.asp"" target=main>新闻评论管理 </A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""moban/index.asp?t1=/p_inc/Tag/pinglunlist.txt&t3=评论关键词过滤"" target=main>评论关键词过滤 </A></TD></TR><TBODY></TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "5" Then '点评
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1006) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>点评系统管理</SPAN> </TD></TR><TR><TD id=submenu1006><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandh_dianping/index.asp"" target=main>点评列表管理 </A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandh_dianping/uindex.asp"" target=main>点评内容列表管理 </A></TD></TR>"
				str = str + "<TBODY></TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "6" Then '产品
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1007) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>产品系统管理</SPAN> </TD></TR><TR><TD id=submenu1007><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_product/type.asp"" target=main>产品类别管理 </A> <A href=""qingtiandy_product/class_ok.asp?action=add_class_1"" target=main>添加</A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_product/index.asp"" target=main>产品列表管理 </A> "
				str = str + "<A href=""qingtiandy_product/edit.asp"" target=main>添加 </A></TD></TR><TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "7" Then '彩票
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1008) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>彩票管理</SPAN> </TD>"
				str = str + "</TR><TR><TD id=submenu1008><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingntiandy_caipiao_310/index.asp"" target=main>310竟猜列表</A>"
				str = str + " <a href=""qingntiandy_caipiao_310/edit.asp"" target=""main"">添加</a></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingntiandy_caipiao_28/index.asp"" target=main>28竟猜列表</A> </TD></TR><TBODY></TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "8" Then '任务
			If v3 = "1" Then
				str = "<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(1009) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>任务管理</SPAN> </TD></TR><TR><TD id=submenu1009><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_renwu_type1/index.asp"" target=main>全部类别列表</A> "
				str = str + "<a href=""qingtiandy_renwu_type1/edit.asp"" target=""main"">添加</a></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_renwu/index.asp"" target=main>全部任务列表</A> <a href=""qingtiandy_renwu/edit.asp"" target=""main"">添加</a></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_renwu_list/index.asp"" target=main>用户任务审核</A></TD></TR><TBODY></TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "31" Then '前台消息
			If v3 = "1" Then
				str = "<h4 class='font-14'>联系管理员</h4><ul class='p10'><li><a href='./xx_list3.asp'>系统消息</a></li><li><a href='./xx_add.asp'>发小消息</a></li><li><a href='./xx_list.asp'>我的消息</a></li><li>{#1}</li></ul>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "71" Then
			If v3 = "1" Then
				str = "<h4 class='font-14'>我的彩票</h4><ul class='p10'><li><a href='{#1}' target='_blank'>310竟猜</a> <a href='./Cp_310.asp'>购买记录</a></li><li><a href='{#2}' target='_blank'>幸运28</a> <a href='{#3}'>我的投注</a></li></ul>"
				qTcmsConstStr = str
			End If
		ElseIf v1 = "81" Then '前台任务菜单
			If v3 = "1" Then
				str = "<h4 class='font-14'>我的任务</h4><ul class='p10'><li><a href='./Task_my.asp?a=0'>审核中任务</a></li><li><a href='./Task_my.asp?a=1'>已确认任务</a></li><li><a href='./Task_my.asp?a=2'>已拒绝任务</a></li><li style='position:relative;'><a href='./Task_all.asp'>系统所有任务</a> <span  onclick='$(this).next().slideToggle()'><a href='javascript:void(0)'>分类</a></span><span class='task-content'><a href='./Task_all.asp'>所有</a><br />{#1}<br/><span class='close-btn' onclick='$(this).parent().slideUp();'>关闭</span></span></li></ul>"
				 qTcmsConstStr = str
			End If
		ElseIF v1="1001" Then '插件信息
			IF v3 = "1" Then
				g1="template/"&G_moban&"/js/qingtiandy_cn.config.gif"
				str=N_Fso.ReadAllTextFile(t_Dir(g1))
				qTcmsConstStr = str
			ElseIF v3="2" Then
				g1="qTcms_Chajian/Images16/p.gif"
				g1="template/"&G_moban&"/js/qingtiandy_cn.config2.gif"
				IF Not N_Fso.IsFileExists(t_Dir(g1)) Then
					str=N_Fso.ReadAllTextFile(t_Dir(g1))
					qTcmsConstStr = str					
				End IF
			ElseIF v3="3" Then
				IF v2="skin11" or v2="skin12" or v2="skin13"  or v2="skin14"  or v2="skin15"  or v2="skin16"  or v2="skin17"  or v2="skin18" or v2="skin19"  Then
				
				Else
					str="<TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""other/2.asp"" target=main>网站搜索引擎参数</A></TD></TR>"
					qTcmsConstStr = str	
				End IF
			End IF
		ElseIF v1="1002" Then '新闻管理
			IF v3="1" Then
				str="<TABLE cellSpacing=0 cellPadding=0 width=158 align=center><TBODY><TR><TD class=menu_title id=menuTitle1 onmouseover=""this.className='menu_title2';"" onclick=showsubmenu(44379) onmouseout=""this.className='menu_title';"" background=images/left_image/admin_left_9.gif height=25 style=""CURSOR: hand""><SPAN>全部新闻管理</SPAN> </TD></TR><TR><TD id=submenu44379><DIV class=sec_menu style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=150 align=center><TBODY><TR><TD height=5></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_news/type.asp""  target=main>新闻类别管理 </A> <A href=""qingtiandy_news/class_ok.asp?action=add_class_1&id=1"" target=main>添加 </A></TD></TR><TR><TD height=20><IMG height=20 alt="""" src=""images/left_image/bullet.gif"" width=15 border=0><A href=""qingtiandy_news/index.asp""  target=main>新闻总列表管理 </A> <A href=""qingtiandy_news/edit.asp"" target=main>添加 </A></TD></TR><TBODY></TBODY></TABLE></DIV><DIV style=""WIDTH: 158px""><TABLE cellSpacing=0 cellPadding=0 width=135 align=center><TBODY><TR><TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>"
				qTcmsConstStr = str	
			End IF
		End If
	End Function
	'==================关于1616模板
	Function J1616_m(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
		
		Dim s1, s2, s3
		If v1 = "xingzuo2" Then
			If v2 = "1" Then
				v5 = "/template/" + v3 + "/images/xingzuo2/data_bak/" + v4 + ".js"
				J1616_m = v5
				Exit Function
			End If
		ElseIf v1 = "caipiao" Then
				v5 = "http://apps.1616.net/caipiao/js/caipiao_data.js"
				J1616_m = v5
				Exit Function
		ElseIf v1 = "caipiao2" Then
				v5 = "http://loading.qtcms.net/Api/News/Data/caipiao_data.js"
				J1616_m = v5
				Exit Function
		ElseIf v1 = "tuangou" Then
			   v5 = "qTcms_Chajian/Images16/1.gif"
				J1616_m = v5
				Exit Function
		ElseIf v1 = "tuangou2" Then
			   v5 = "../../qTcms_Chajian/Images16/2.gif"
				J1616_m = v5
				Exit Function
		ElseIf v1 = "tuangou3" Then
			   v5 = "http://" + v2 + ".gouwuke.com/navigate.html"
				J1616_m = v5
				Exit Function
		ElseIf v1 = "16" Then
				If v2 = "1" Then
					v5 = "qtcms_com_16"
				ElseIf v2 = "2" Then
					v5 = "{self}"
				ElseIf v2 = "3" Then
					v5 = "{/self}"
				ElseIf v2 = "4" Then
					s1 = "select * from " + v3 + " where id>0"
					If v4 <> "" Then s1 = s1 + " and n_title like '%" + v4 + "%'"
					If v5 <> "" Then s1 = s1 + " and n_type1 =" + v5 + ""
					IF v8<>"0" Then	s1 = s1 + " and n_type2 =" + v8 
					If v6 <> "" Then s1 = s1 + " and n_look=" + v6
					If v7 <> "" Then
						s1 = s1 + " order by " + v7
					Else
						s1 = s1 + " order by  n_date desc,id desc"
					End If
					
					v5 = s1
				End If
				J1616_m = v5
				Exit Function
		End If
	
	End Function
	'====团购函数 团购分类函数切换
	Function J1616_Tuan_ppk_2(v)
		
		Dim p
		p = ""
		Select Case v
			Case "1"
				p = "1"
			Case "2"
				p = "2"
			Case "3"
				p = "3"
			Case "4"
				p = "4"
			Case "6"
				p = "6"
			Case Else
		End Select
		J1616_Tuan_ppk_2 = p
	End Function
	Function J1616_body2s(wstr, start, over, str, tag)
		Dim start1, over1, soojs, Matches, bstr, Match
		start1 = Replace(Replace(Replace(Replace(Replace(Replace(Replace(start, "(", "\("), ")", "\)"), "?", "\?"), "$", "\$"), "[", "\["), "]", "\]"), "\", "\\")
		over1 = Replace(Replace(Replace(Replace(Replace(Replace(over, "(", "\("), ")", "\)"), "?", "\?"), "[", "\["), "]", "\]"), "\", "\\")
		Set soojs = New RegExp '设置配置对象
		soojs.IgnoreCase = True '忽略大小写
		soojs.Global = True '设置为全文搜索
		soojs.Pattern = "" + start1 + "(\n|.)*?" & over1 '正则表达式
		Set Matches = soojs.Execute(wstr) '开始执行配置
		Set soojs = Nothing
		bstr = ""
		For Each Match In Matches
		bstr = bstr + Match.Value + str '循环匹配
		Next
		If tag Then
			bstr = Replace(bstr, start, "")
			bstr = Replace(bstr, over, "")
		End If
		J1616_body2s = bstr
	End Function
	Function J1616_GetContent(str, start, last, n)
		Dim PPstr
		If InStr(LCase(str), LCase(start)) > 0 And InStr(LCase(str), LCase(last)) > 0 Then
			Select Case n
			Case 0  '左右都截取（都取前面）（去处关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) - Len(start) + 1)
			PPstr = Left(PPstr, InStr(LCase(PPstr), LCase(last)) - 1)
			Case 1  '左右都截取（都取前面）（保留关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) + 1)
			PPstr = Left(PPstr, InStr(LCase(PPstr), LCase(last)) + Len(last) - 1)
			Case 2  '只往右截取（取前面的）（去除关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) - Len(start) + 1)
			Case 3  '只往右截取（取前面的）（包含关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) + 1)
			Case 4  '只往左截取（取后面的）（包含关键字）
			PPstr = Left(str, InStrRev(LCase(str), LCase(start)) + Len(start) - 1)
			Case 5  '只往左截取（取后面的）（去除关键字）
			PPstr = Left(str, InStrRev(LCase(str), LCase(start)) - 1)
			Case 6  '只往左截取（取前面的）（包含关键字）
			PPstr = Left(str, InStr(LCase(str), LCase(start)) + Len(start) - 1)
			Case 7  '只往右截取（取后面的）（包含关键字）
			PPstr = Right(str, Len(str) - InStrRev(LCase(str), LCase(start)) + 1)
			Case 8  '只往左截取（取前面的）（去除关键字）
			PPstr = Left(str, InStr(LCase(str), LCase(start)) - 1)
			Case 9  '只往右截取（取后面的）（包含关键字）
			PPstr = Right(str, Len(str) - InStrRev(LCase(str), LCase(start)))
			End Select
			J1616_GetContent = PPstr
		Else
			J1616_GetContent = ""
		End If
	End Function
	
	Function J1616_G1(str, start, last, n)
		Dim PPstr
		If InStr(LCase(str), LCase(start)) > 0 And InStr(LCase(str), LCase(last)) > 0 Then
			Select Case n
			Case 0  '左右都截取（都取前面）（去处关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) - Len(start) + 1)
			PPstr = Left(PPstr, InStr(LCase(PPstr), LCase(last)) - 1)
			Case 1  '左右都截取（都取前面）（保留关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) + 1)
			PPstr = Left(PPstr, InStr(LCase(PPstr), LCase(last)) + Len(last) - 1)
			Case 2  '只往右截取（取前面的）（去除关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) - Len(start) + 1)
			Case 3  '只往右截取（取前面的）（包含关键字）
			PPstr = Right(str, Len(str) - InStr(LCase(str), LCase(start)) + 1)
			Case 4  '只往左截取（取后面的）（包含关键字）
			PPstr = Left(str, InStrRev(LCase(str), LCase(start)) + Len(start) - 1)
			Case 5  '只往左截取（取后面的）（去除关键字）
			PPstr = Left(str, InStrRev(LCase(str), LCase(start)) - 1)
			Case 6  '只往左截取（取前面的）（包含关键字）
			PPstr = Left(str, InStr(LCase(str), LCase(start)) + Len(start) - 1)
			Case 7  '只往右截取（取后面的）（包含关键字）
			PPstr = Right(str, Len(str) - InStrRev(LCase(str), LCase(start)) + 1)
			Case 8  '只往左截取（取前面的）（去除关键字）
			PPstr = Left(str, InStr(LCase(str), LCase(start)) - 1)
			Case 9  '只往右截取（取后面的）（包含关键字）
			PPstr = Right(str, Len(str) - InStrRev(LCase(str), LCase(start)))
			End Select
			J1616_G1 = PPstr
		Else
			J1616_G1 = ""
		End If
	End Function
	Function J1616_Tuan_Smain(url, pcity, pcate, ppage)
		
		Dim str, Str_temp, Str2, Str_temp_a, Str_tempB, Page_t, str3, Page_t2
		Dim ai, Pstr, k1, k2, k3, k4, k5, k6, k7, k8
		str = Qingtiandy_getHTTPPage(url)
		
	   
		Str_temp = J1616_body2s(str, "<div id=""productlist""", "<div class=""cl""></div>", "#####", True)
		Str2 = ""
		If Str_temp <> "" Then Str_temp = Left(Str_temp, Len(Str_temp) - 5)
		Str_temp_a = Split(Str_temp, "#####")
		Str_tempB = UBound(Str_temp_a)
		If Str_tempB > 14 Then Str_tempB = 14
		
		For ai = 0 To Str_tempB
			Pstr = Str_temp_a(ai)
			k1 = J1616_GetContent(Pstr, "<span>【", "】</span>", 0)
			k2 = J1616_GetContent(Pstr, "<a href=""", """", 0)
			k3 = J1616_GetContent(Pstr, "<div class=""list_right"">", "</div>", 0)
			k3 = J1616_GetContent(k3, "<h3>", "</h3>", 0)
			k3 = Str4Null(k3)
			k3 = Replace(k3, "元", "")
			k4 = J1616_GetContent(Pstr, "<div class=""list_left"">", "</div>", 0)
			k4 = J1616_GetContent(k4, "<span>", "</span>", 0)
			k5 = J1616_GetContent(Pstr, "<div class=""list_left"">", "</div>", 0)
			k5 = J1616_GetContent(k5, "<h3>", "</h3>", 0)
			k5 = Str4Null(k5)
			k5 = Replace(k5, "人已购买", "")
			k6 = J1616_GetContent(Pstr, "src=""", """", 0)
			k7 = J1616_GetContent(Pstr, "<h2>", "</h2>", 0)
			k7 = J1616_GetContent(Pstr, "title=""", """", 0)
			k8 = J1616_GetContent(Pstr, "<h3>", "</h3>", 0)
			k8 = J1616_GetContent(k8, "href=""", """", 0)
			Dim VC2COMNAME, VC2COMURL, VC2CLASSCODE, VC2CITY, VC2PINGYIN, VC2TITLE, NUMPRICE, NUMDISPRICE, NUMDISPER, NUMORDERS, VC2SOURCEURL, DATOFFLINE, VC2THUMB, VC2BEFOREURL
			VC2COMNAME = Replace(k1, """", "")
			VC2COMURL = k2
			VC2TITLE = Replace(k7, """", "")
			NUMPRICE = k3
			NUMDISPRICE = k4
			NUMDISPER = Left(k3 / k4, 3)
			NUMORDERS = k5
			VC2SOURCEURL = Replace(k8, """", "")
			VC2THUMB = k6
			Str2 = Str2 + "{" + vbCrLf
			Str2 = Str2 + """VC2COMNAME"": """ + VC2COMNAME + """," + vbCrLf
			Str2 = Str2 + """VC2COMURL"": """ + VC2COMURL + """," + vbCrLf
			Str2 = Str2 + """VC2CLASSCODE"": """ + VC2CLASSCODE + """," & vbCrLf
			Str2 = Str2 + """VC2CITY"": """ + VC2CITY + """," + vbCrLf
			Str2 = Str2 + """VC2PINGYIN"": """ + VC2PINGYIN + """," & vbCrLf
			Str2 = Str2 + """VC2TITLE"": """ + VC2TITLE + """," + vbCrLf
			Str2 = Str2 + """NUMPRICE"": """ + NUMPRICE + """," + vbCrLf
			Str2 = Str2 + """NUMDISPRICE"": """ + NUMDISPRICE + """," + vbCrLf
			Str2 = Str2 + """NUMDISPER"": """ + NUMDISPER + """," + vbCrLf
			Str2 = Str2 + """NUMORDERS"": """ + NUMORDERS + """," + vbCrLf
			Str2 = Str2 + """VC2SOURCEURL"": """ + VC2SOURCEURL + """," + vbCrLf
			Str2 = Str2 + """DATOFFLINE"": """ + DATOFFLINE + """," + vbCrLf
			Str2 = Str2 + """VC2THUMB"": """ + VC2THUMB + """," + vbCrLf
			Str2 = Str2 + """VC2BEFOREURL"": """ + VC2BEFOREURL + """" + vbCrLf
			Str2 = Str2 + "},"
		Next
		
		If Str2 <> "" Then Str2 = Left(Str2, Len(Str2) - 1)
	   
		Page_t = J1616_GetContent(str, "pageCount : ", ">", 0)
		
		Page_t = StayNub(Page_t)
		If Page_t = "" Then Page_t = 0
		
		Page_t2 = CStr(Page_t * 16) + ""
		If CLng(Page_t2) > 1500 Then Page_t2 = "1500"
		
		str3 = "{" + vbCrLf
		str3 = str3 + """count"": """ + Page_t2 + """," + vbCrLf
	   
		str3 = str3 + """city"": " + CStr(pcity) + "," + vbCrLf
		str3 = str3 + """cate"": """ + J1616_Tuan_ppk_2(pcate) + """," + vbCrLf
		 
		str3 = str3 + """page"": " + CStr(ppage) + "," + vbCrLf
		str3 = str3 + """list"": [" + vbCrLf
		
		str3 = str3 + Str2
		str3 = str3 + "]" + vbCrLf
		str3 = str3 + "}" + vbCrLf
		
		J1616_Tuan_Smain = str3
	End Function
	'qiyifa联盟账号设置
	Function J1616_Tuan_Shezhi(str, n)
		Dim Pstr, PPstr, Str_1, Str_2, Str_1_a, Str_2_a, i, k1, k2, Purl, Str1, Str2
		Pstr = "var a1 = ["
		PPstr = ""
		Str_1 = J1616_body2s(str, "<a href=\""http://g.yiqifa.com/gc", "\""", "###", True)
		Str_2 = J1616_body2s(str, "'TUAN'", "</a>", "###", True)
		Str_2 = Replace(Str_2, ")\"">", "")
		Str_1_a = Split(Str_1, "###")
		Str_2_a = Split(Str_2, "###")
		For i = 0 To 48
			k1 = Str_1_a(i)
			k2 = Str_2_a(i)
			PPstr = PPstr + "[""" + k2 + """,""http://g.yiqifa.com/gc" + k1 + """],"
		Next
		If PPstr <> "" Then PPstr = Left(PPstr, Len(PPstr) - 1)
		Pstr = Pstr + PPstr + "];"
		Purl = "http://" + n + ".gouwuke.com/tuan/searchproduct.do"
		str = Qingtiandy_getHTTPPage(Purl)
		Str1 = J1616_GetContent(str, "var siteid = '", "'", 0)
		Str2 = J1616_GetContent(str, "var earnerid = '", "'", 0)
		Pstr = Replace(Pstr, "lianmengwid", Str1)
		Pstr = Replace(Pstr, "lianmenguid", Str2)
		J1616_Tuan_Shezhi = Pstr
	End Function
	
	Function J1616_Tuan_Shezhi_ID(str, n)
		Dim Strb, a, b
		Strb = Qingtiandy_getHTTPPage("http://" + n + ".gouwuke.com/tuan/searchproduct.do")
		a = J1616_GetContent(Strb, "var siteid = '", "';", 0)
		b = J1616_GetContent(Strb, "var earnerid = '", "';", 0)
		str = Replace(str, 161990, a)
		str = Replace(str, 27146, b)
		J1616_Tuan_Shezhi_ID = str
	End Function
	
	'首页12条新闻
	Function J1616_New_index()
		Dim str_t2, str, str_a, kkStr, ki, kii, shref, sAlt
		str_t2 = Qingtiandy_getHTTPPage("http://news.baidu.com/n?cmd=4&class=rolling&pn=1&from=tab&sub=0")
		str = str_t2
		str = J1616_GetContent(str, "国内新闻</a></div>", "国际新闻</a></div>", 0)
		str = J1616_body2s(str, "<div class=""p2"">", "</div>", "###", True)
		str_a = Split(str, "###")
		kkStr = "var qtCms_Net_k=[["""",""""]"
		kii = 1
		For ki = 0 To UBound(str_a)
			shref = J1616_GetContent(str_a(ki), "href=""", """", 0)
			sAlt = J1616_GetContent(str_a(ki), "target=""_blank"">", "</a>", 0)
			sAlt = Rm(sAlt)
			kkStr = kkStr + ",[""" + Trim(shref) + """,""" + Trim(sAlt) + """]"
			kii = kii + 1
		Next
		str = str_t2
		str = J1616_GetContent(str, "国际新闻</a></div>", "军事新闻</a></div>", 0)
		str = J1616_body2s(str, "<div class=""p2"">", "</div>", "###", True)
		str_a = Split(str, "###")
		For ki = 0 To UBound(str_a)
			shref = J1616_GetContent(str_a(ki), "href=""", """", 0)
			sAlt = J1616_GetContent(str_a(ki), "target=""_blank"">", "</a>", 0)
			sAlt = Rm(sAlt)
			kkStr = kkStr + ",[""" + Trim(shref) + """,""" + Trim(sAlt) + """]"
		Next
		kkStr = kkStr + "]"
		J1616_New_index = Array(kkStr, kii)
	End Function
	'采集qiyifa的商城信息
	Function J1616_Gouwu_Cj_Pic(Str2, oStr, oid)
		
		Dim Str_n, Str_Href, Str_Title, Str_Href_a, Str_Title_a, Pstr, i, ki, K_Href, K_Title, str, Str_Pic, Str_Pic_a, K_Pic
		str = J1616_GetContent(Str2, "<div id=""" + oid + """ style=""display:none"">", "</div>", 0)
		Str_n = J1616_body2s(str, "<span", "</a>", "#####", True)
		Str_Href = J1616_body2s(Str_n, "href=""", """", "#####", True): Str_Href_a = Split(Str_Href, "#####")
		Str_Pic = J1616_body2s(Str_n, "src=""", """", "#####", True): Str_Pic_a = Split(Str_Pic, "#####")
		Str_Title = J1616_body2s(Str_n, "title=""", """", "#####", True): Str_Title_a = Split(Str_Title, "#####")
		Pstr = ""
		For i = 0 To UBound(Str_Href_a) - 1
			ki = i + 1
			K_Href = Trim(Str_Href_a(i))
			K_Pic = Trim(Str_Pic_a(i))
			K_Title = Trim(Str_Title_a(i))
			If ki Mod 6 = 1 Then Pstr = Pstr + "<li>" + vbCrLf
			If ki Mod 6 <> 0 Then
				Pstr = Pstr + "<span class='a'><a href='" + K_Href + "' target='_blank'  title='" + K_Title + "'><img src='" + K_Pic + "' border='0' /></a>" + vbCrLf
				Pstr = Pstr + "<a href='" + K_Href + "' target='_blank'   title='" + K_Title + "'>" + K_Title + "</a></span>" + vbCrLf
			Else
				Pstr = Pstr + "<span class='b'><a href='" + K_Href + "' target='_blank'  title='" + K_Title + "'><img src='" + K_Pic + "' border='0' /></a>" + vbCrLf
				Pstr = Pstr + "<a href='" + K_Href + "' target='_blank'   title='" + K_Title + "'>" + K_Title + "</a></span>" + vbCrLf
			End If
			If ki Mod 6 = 0 Then Pstr = Pstr + "</li>" + vbCrLf
		Next
		If ki Mod 6 <> 0 Then Pstr = Pstr + "</li>" + vbCrLf
		J1616_Gouwu_Cj_Pic = Pstr
	End Function
	Function J1616_Gouwu_Cj_Txt(Str2, oStr, oid)
		
		Dim Str_n, Str_Href, Str_Title, Str_Href_a, Str_Title_a, Pstr, i, ki, K_Href, K_Title, str
		str = J1616_GetContent(Str2, "<div id=""" + oid + """ style=""display:none"">", "</div>", 0)
		Str_n = J1616_body2s(str, "<span", "</a>", "#####", True)
		Str_Href = J1616_body2s(Str_n, "href=""", """", "#####", True): Str_Href_a = Split(Str_Href, "#####")
		Str_Title = J1616_body2s(Str_n, "title=""", """", "#####", True): Str_Title_a = Split(Str_Title, "#####")
		Pstr = ""
		For i = 0 To UBound(Str_Href_a) - 1
			ki = i + 1
			K_Href = Trim(Str_Href_a(i))
			K_Title = Trim(Str_Title_a(i))
			If ki Mod 6 = 1 Then Pstr = Pstr + "<li>" + vbCrLf
			If ki Mod 6 <> 0 Then
				Pstr = Pstr + "<span class='a'><a href='" + K_Href + "' target='_blank'  title='" + K_Title + "'></a>" + vbCrLf
				Pstr = Pstr + "<a href='" + K_Href + "' target='_blank'   title='" + K_Title + "'>" + K_Title + "</a></span>" + vbCrLf
			Else
				Pstr = Pstr + "<span class='b'><a href='" + K_Href + "' target='_blank'  title='" + K_Title + "'></a>" + vbCrLf
				Pstr = Pstr + "<a href='" + K_Href + "' target='_blank'   title='" + K_Title + "'>" + K_Title + "</a></span>" + vbCrLf
			End If
			If ki Mod 6 = 0 Then Pstr = Pstr + "</li>" + vbCrLf
		Next
		If ki Mod 6 <> 0 Then Pstr = Pstr + "</li>" + vbCrLf
		J1616_Gouwu_Cj_Txt = Pstr
	End Function
	'程序标签
	Function Bq_x(v1)
		
		Dim v3, Vstr, v3_a, v3_0, v3_1, v3_2, v3_3, sql, v3_2_a, i
		Vstr = ""
		v3 = J1616_GetContent(v1, " ", "}", 0)
		v3 = Replace(v3, " ", "")
		If InStr(v3, ",") > 0 Then
			v3_a = Split(v3, ",")
			v3_0 = v3_a(3) '菜单个数，0表示按照默认的递增的排序方式，可以是1|2|3|4
			v3_1 = v3_a(2) '菜单个数，前者优先
			v3_2 = v3_a(1) '菜单的字数
			v3_3 = v3_a(0) '其他设置
			sql = "select top " + v3_1 + " * from  qingtiandh_type1 where typehide=1 "
			If InStr(v3_0, "|") > 0 Then
				v3_2_a = Split(v3_0, "|")
				For i = LBound(v3_2_a) To UBound(v3_2_a)
					If i = 0 Then
						sql = sql + " and (typeid=" + v3_2_a(i)
					ElseIf i = UBound(v3_2_a) Then
						sql = sql + " or typeid=" + v3_2_a(i) & ") "
					Else
						sql = sql + " or typeid=" + v3_2_a(i)
					End If
				Next
			Else
				If v3_0 <> "0" Then
					sql = sql + " and typeid=" + v3_0
				End If
			End If
			sql = sql + " order by typeno asc,typeid desc"
			Vstr = Array(sql, v3_2)
		Else
			Vstr = Array("", "")
		End If
		Bq_x = Vstr
	End Function
	'自定义标签
	
	
	
	Function J1616_templte_Self(str)
		Dim Main_str, temp_arr2, soojs, Matches, Match, temp_arr_b, i
		Main_str = str
		'获取自定义标签
		Set soojs = New RegExp
		soojs.IgnoreCase = True
		soojs.Global = True
		soojs.Pattern = "{self}(\n|.)*?{/self}"
		Set Matches = soojs.Execute(Main_str)
		Set soojs = Nothing
		temp_arr2 = ""
		For Each Match In Matches
			temp_arr2 = temp_arr2 + Match.Value + "{$$$}" '循环匹配
		Next
	
		
		J1616_templte_Self = temp_arr2
	End Function
	
	'汉字转化为\u
	Function J1616_z_1(str, p)
		Dim ss
		ss = str
		ss = Lnumbs(ss)
		If ss = "" Then J1616_z_1 = "": Exit Function
		Dim i, s, c, a
		s = ""
		For i = 1 To Len(ss)
			c = Mid(ss, i, 1)
			a = AscW(c)
			If (a >= 48 And a <= 57) Or (a >= 65 And a <= 90) Or (a >= 97 And a <= 122) Then
				s = s & c
			ElseIf InStr("@*_+-./", c) > 0 Then
				s = s & c
			ElseIf a > 0 And a < 16 Then
				s = s & "%0" & Hex(a)
			ElseIf a >= 16 And a < 256 Then
				s = s & "%" & Hex(a)
			Else
				s = s & "%u" & Hex(a)
			End If
		Next
		If p = "2" Then
			s = Replace(s, "%u", "\u")
		End If
		J1616_z_1 = s
	
	End Function
End Class

Dim qtcmsdh
Set qtcmsdh = New qtcms_daohang

%>

