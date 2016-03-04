<%

'//---- COCOON_自定义类_翻页优化代码 ----//'
Class cc_db_Pager
	'--------------------------------
	'     COCOON Db_Pager 类 (Ver: 1)
	'     作者: Sunrise_Chen (sunrise_chen@msn.com)
	'     请保留此信息，谢谢。
	'     Thanks for eway365 from Club.PCHOME.net
	'                           2003.6
	'
	'     2003-07-05	对代码做了较大的改动，增加了一些特性
	'					增加了DISTINCT选择属性
	'--------------------------------
	
	'//-------------------- 定义变量 --------------------//'
	Private sTableName		'//表名
	Private sSqlString		'//自定义Sql语句
	Private aCondition()	'//查询条件(数组)
	Private sCondition		'//查询条件(字符串)
	Private iPage			'//当前页码
	Private iPageSize		'//每页记录数
	Private iPageCount		'//总页数
	Private iRecCount		'//当前查询条件下的记录数
	Private iTotalRecCount	'//总记录数
	Private sFields			'//输出的字段名
	Private sOrderBy		'//排序字符串
	Private sSql			'//当前的查询语句
	Private sPkey			'//主键
	Private oConn			'//连接对象
	Private iDefPageSize	'//默认每页显示的记录数
	Private sProjectName	'/项目名
	Private sVersion		'/版本号
	Private bShowError		'//是否显示错误信息
	Private bDistionct		'//是否显示唯一记录
	Private sPageInfo		'//记录数、页码等信息
	Private sPagerFuncName	'//前台翻页函数名
	Private bDistinct		'//是否Distinct
	Private sPageParam		'//page参数名称
	Private iStyle			'//翻页的样式
	Private iPagerSize		'//翻页按钮的数值
	Private sReWrite		'//用ISAP REWRITE做的路径
	Private iTableKind		'//表的类型，是不是要 [ ]
	Private ss,iStart,iEnd,PgStart
	
	'//-------------------- 事件、方法 --------------------//'
	'//类初始化事件
	Private Sub Class_Initialize()
		ReDim aCondition(-1)
		sProjectName	= "COCOON 类系列 数据库翻页优化类"
		sVersion		= "1.05"
		sPkey			= "ID"
		sFields			= "*"
		sCondition		= ""
		sOrderBy		= ""
		sSqlString		= ""
		iPageSize		= 10
		iPage			= 1
		iRecCount		= Null
		iTotalRecCount	= Null
		iPageCount		= Null
		bShowError		= True
		bDistionct		= False
		sPageInfo		= "每页<font color=red>%4</font>条,当前<font color=red>%1</font>/%2 页 共<font color=red>%3</font> "
		sPagerFuncName	= "__cc_doPage"
		sPageParam		= "page"
		iStyle			= 0
		iPagerSize		= 10
		iTableKind		= 0
	End Sub
	
	'//类结束事件
	Private Sub Class_Terminate()
		Set oConn = Nothing
	End Sub
	
	'//从来也没搞懂过VBSCRIPT里竟然没有IIF()函数！！！
	Private Function IIf(Expr,Val1,Val2)
		If (Expr) Then
			IIf = Val1
		Else
			IIf = Val2
		End If
	End Function
	
	'//处理错误信息
	Public Sub doError(s)
			Dim sTmp
			sTmp = CLng(Rnd() * 100)
			Response.Write( "<DIV STYLE='WIDTH:760;font-size:9pt;cursor:hand'>" )
			Response.Write( "<LABEL ONCLICK='ERRORDIV"&sTmp&".style.display=(ERRORDIV"&sTmp&".style.display==""""?""none"":"""")'><SPAN STYLE='BACKGROUND-COLOR:#CCCC00;COLOR:WHITE;'>〖 CC_db_Pager 提示信息 〗</SPAN><BR></LABEL>" )
			Response.Write( "<DIV ID='ERRORDIV"&sTmp&"' STYLE='DISPLAY:NONE;WIDTH:100%;BORDER: 1PX SOLID #CCCC00;PADDING:5;overflow:hidden;text-overflow:ellipsis;'><NOBR>" )
			Response.Write( "<SPAN STYLE='COLOR:RED'>Description</SPAN>: " & s & "<BR>" )
			Response.Write( "<SPAN STYLE='COLOR:RED'>Provider</SPAN>: " & sProjectName & "&nbsp;&nbsp;<SPAN STYLE='COLOR:RED'>Version</SPAN>: " & sVersion & "<BR>" )
			Response.Write( "</NOBR></DIV></DIV><BR>" )
	End Sub
	
	'//产生分页的SQL语句
	Public Function getSql()
		Dim iStart, iEnd
		Call makeCondition()
		If Not isNumeric(iPage) Then iPage = 1
		If CLng(iPage)<1 Then iPage = 1
		iStart = ( iPage - 1 ) * iPageSize
		iEnd = iStart + iPageSize
		getSql  = " SELECT " & IIf(bDistinct,"DISTINCT","") & " " & sFields & " FROM " & TableFormat(sTableName) & " " _
				& " WHERE ["&sPKey&"] IN ( " _
				& "   SELECT TOP "&iEnd&" ["&sPKey&"] FROM " & TableFormat(sTableName) & " " & sCondition & " " & sOrderBy & " " _
				& " )"
		If CLng(iPage)>1 Then
			getSql = getSql & " AND ["&sPKey&"] NOT IN ( " _
					& "   SELECT TOP "&iStart&" ["&sPKey&"] FROM " & TableFormat(sTableName) & " " & sCondition & " " & sOrderBy & " " _
					& " )"
					
		End If
		getSql = getSql & " " & sOrderBy & " "
	End Function
	
	'//产生条件字符串
	Private Sub makeCondition()
		If Len(sCondition)>0 Then Exit Sub
		If UBound(aCondition)>=0 Then
			sCondition = " WHERE " & Join(aCondition, " AND ")
		End If
	End Sub
	
	'//计算记录数
	Private Sub CaculateRecCount()
		On Error Resume Next
		Dim oRs
		Call makeCondition()
		sSqlString = "SELECT COUNT(["&sPKey&"]) FROM " & TableFormat(sTableName) & "" & IIf(Len(sCondition)<1,"",sCondition)
		Set oRs = oConn.Execute( sSqlString )
		If Err Then doError Err.Description : Response.End()
		iRecCount = oRs.Fields.Item(0).Value
		Set oRs = Nothing
	End Sub
	
	'//计算总记录数
	Private Sub CaculateTotalRecCount()
		Dim oRs
		Set oRs = oConn.Execute( "SELECT COUNT(*) FROM " & TableFormat(sTableName) & "" )
		iTotalRecCount = oRs.Fields.Item(0).Value
		Set oRs = Nothing
	End Sub
	
	'//计算页数
	Private Sub CaculatePageCount()
		If isNull(iRecCount) Then CaculateRecCount()
		If iRecCount = 0 Then iPageCount = 0 : Exit Sub
		iPageCount = Abs( Int( 0 - (iRecCount / iPageSize) ) )
	End Sub
	
	'//设置页码
	Private Function setPage(n)
		iPage = n
		If Not isNumeric(iPage) Then iPage = 1
		If CLng(iPage)<1 Then iPage = 1
	End Function

	'//增加条件
	Public Sub AddCondition(s)
		If Len(s)<0 Then Exit Sub
		ReDim Preserve aCondition(UBound(aCondition)+1)
		aCondition(UBound(aCondition)) = s
	End Sub

	'//版本信息
	Public Function Information()
		doError "Coding by <A HREF='MAILTO:sunrise_chen@msn.com'>Sunrise_Chen</A> @ <A HREF='http://www.ccopus.com'>http://www.ccopus.com</A> ."
	End Function
	
	Private Function ReWrite(sReWrite,iPage)
		ReWrite = Replace(sReWrite,"*",iPage)
	End Function
	
	Private Function TableFormat(s)
		Select Case iTableKind
			Case 0
				TableFormat = "[" & s & "]"
			Case 1
				TableFormat = " " & s & " "
		End Select
	End Function
	
	'//-------------------- 输入属性 --------------------//'
	'//定义连接对象
	Public Property Set ActiveConnection(o)
		Set oConn = o
	End Property
	
	'//连接字符串
	Public Property Let ConnectionString(s)
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.ConnectionString = s
		oConn.Open()
	End Property
	
	'//定义查询表名
	Public Property Let TableName(s)
		sTableName = s
		'//如果发现表名包含 ( ，那么就认为是由 sql 语句组成的表名，就不要用 [] 
		If Instr(s,"(")>0 then iTableKind = 1
	End Property
	
	'//定义需要输出的字段名
	Public Property Let Fields(s)
		sFields = s
	End Property
	
	'//定义主键
	Public Property Let Pkey(s)
		sPkey = s
	End Property
	
	'//定义排序规则
	Public Property Let OrderBy(s)
		sOrderBy = " ORDER BY " & s & " "
	End Property
	
	'//定义每页的记录条数 
	Public Property Let PageSize(s)
		iPageSize = s
		If Not isNumeric(iPageSize) Then iPageSize = iDefaultPageSize
		If CLng(iPageSize)<1 Then iPageSize = iDefaultPageSize
	End Property
	
	'//定义当前页码
	Public Property Let Page(s)
		setPage s
	End Property
	
	'//定义当前页码(同Property Page)
	Public Property Let AbsolutePage(s)
		setPage s
	End Property
	
	'//自定义查询语句
	Public Property Let Sql(s)
		sSqlString = s
	End Property
	
	'//是否DISTINCT
	Public Property Let Distinct(b)
		bDistinct = b
	End Property
	
	Public Property Let PageParam(s)
		sPageParam = LCase(s)
	End Property
	
	Public Property Let Style(s)
		iStyle = s
	End Property
	
	Public Property Let PagerSize(s)
		iPagerSize = s
	End Property
	
	Public Property Let ReWritePath(s)
		sReWrite = s
	End Property
	
	Public Property Let TableKind(i)
		iTableKind = i
	End Property
	
	Public Property Let RecordCount(i)
		iRecCount = i
	End Property

	Public Property Let PageCount(i)
		iPageCount = i
	End Property
	
	'//-------------------- 输出属性 --------------------//'
	'//输出查询表名
	Public Property Get TableName()
		TableName = sTableName
	End Property
	
	'//输出需要输出的字段名
	Public Property Get Fields()
		Fields = sFields
	End Property
	
	'//输出主键
	Public Property Get Pkey()
		Pkey = sPkey
	End Property
	
	'//输出排序规则
	Public Property Get OrderBy()
		OrderBy = sOrderBy
	End Property
	
	'//取得当前条件下的记录数
	Public Property Get RecordCount
		If isNull(iRecCount) Then CaculateRecCount()
		RecordCount = iRecCount
	End Property
	
	'//取得每页记录数
	Public Property Get PageSize
		PageSize = iPageSize
	End Property
	
	'//取得当前查询的条件
	Public Property Get Condition
		If Len(sCondition)<1 Then makeCondition()
		Condition = sCondition
	End Property
	
	'//取得当前页码
	Public Property Get Page
		Page = iPage
	End Property

	'//取得当前页码
	Public Property Get AbsolutePage
		AbsolutePage = iPage
	End Property
	
	'//取得总的记录数
	Public Property Get TotalRecordCount
		If isNull(iTotalRecCount) Then CaculateTotalRecCount()
		TotalRecordCount = iTotalRecCount
	End Property
	
	'//取得总页数
	Public Property Get PageCount
		If isNull(iPageCount) Then CaculatePageCount()
		PageCount = iPageCount
	End Property
	
	'//得到分页后的记录集
	Public Property Get Recordset
		On Error Resume Next
		sSql = getSql()
		Set Recordset = oConn.Execute( sSql )
		If Err Then
			If bShowError Then doError Err.Description
			If Len(sSqlString)>0 Then
				Set Recordset = oConn.Execute( sSqlString )
				If Err Then
					doError Err.Description
					Response.End()
				End If
			Else
				doError Err.Description
			End If
		End If
		Err.Clear()
	End Property
	
	'//版本信息
	Public Property Get Version
		Version = sVersion
	End Property
	
	'//输出翻页的前台脚本
	Public Property Get PagerScript
		Dim sUrl, sQueryString, x
		sUrl = Request.ServerVariables("URL")
		sQueryString = ""
		For Each x In Request.QueryString
			If LCase(x)<>sPageParam Then sQueryString = sQueryString & x & "=" & Request.QueryString(x) & "&"
		Next
		PagerScript = vbCrLf & _
					"<S"&"CRIPT LANGUAGE=""JavaScript"" ID=""cc_script_dbPager"">" & vbCrLf & _
					"    //"&sProjectName&" (ver: "&sVersion&")" & vbCrLf & _
					"    //Coding by Sunrise_Chen (sunrise_chen@msn.com)" & vbCrLf & _
					"    function " & sPagerFuncName & "(n){" & vbCrLf & _
					"        location.href='" & sUrl & "?" & sQueryString & sPageParam &"='+n+'" & "';" & vbCrLf & _
					"    }" & vbCrLf & _
					"</S"&"CRIPT>" & vbCrLf & _
					vbCrLf
	End Property
	
	'//输出页码及记录数等信息
	Public Property Get PageInfo
		CaculatePageCount()
		PageInfo = Replace(Replace(Replace(Replace(sPageInfo,"%3",iRecCount),"%2",iPageCount),"%1",iPage),"%4",iPageSize)
	End Property
	
	'//输出翻页按钮
	Public Property Get Pager
	
		
		Pager = "" & vbCrlf
		Select Case iStyle
		Case 1
		
			If iPageCount>0 then
				PgStart=clng(iPage\10)
				Pager = Pager &  "当前页为第<font color=red> "&iPage&"</font> 页 共 <font color=red>"& iPageCount &"</font> 页 共 <font color=red>"&iRecCount&"</font> 条记录　"
				If iPage mod 10 = 0 then PgStart=PgStart-1
				If iPage>10 then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&PgStart*10&");'><font face=webdings>9</font></a> "
				Else
					Pager = Pager &  "<font face=webdings color=red >9</font> "
				End if
				If iPage>1 then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&iPage-1&");'><font face=webdings>7</font></a> "
				Else
					Pager = Pager &  "<font face=webdings color=red >7</font> "
				End if
				For i=1 to 10
					If iPageCount>=i+PgStart*10 then
						if i+PgStart*10=clng(iPage) then
							Pager = Pager &  "<font color=red ><b>"&i+PgStart*10&"</b></font> "
						else
							Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&i+PgStart*10&");'><b>"&i+PgStart*10&"</b></a> "
						end if
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&iPage+1&");'><font face=webdings>8</font></a> "
				Else
					Pager = Pager &  "<font face=webdings color=red >8</font> "
				End if
				If clng(iPageCount)>PgStart*10+10 then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&PgStart*10+11&");'><font face=webdings>:</font></a>" 
				Else
					Pager = Pager &  "<font face=webdings color=red >:</font> "
				End if
			End if
			
		Case 2
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\2 )
				If ss = 0 then ss = iPagerSize\2
				If iPage <= iPagerSize\2 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss
				If iEnd >= iPageCount then iEnd = iPageCount
				If iPage>1 then
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & "1" & sQueryString & "' >[首页]</a> "
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & (iPage-1) & sQueryString & "' >[上一页]</a> "
				Else
					Pager = Pager &  "[首页] "
					Pager = Pager &  "[上一页] "
				End if
				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font> "
					Else
						Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (i+PgStart*10) & sQueryString & "' >["&i+PgStart*10&"]</a> "
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPage+1) & sQueryString & "' >[下一页]</a> "
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPageCount) & sQueryString & "' >[末页]</a> "
				Else
					Pager = Pager &  "[下一页] "
					Pager = Pager &  "[末页] "
				End if
			End if
			
		Case 3
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\2 )
				If ss = 0 then ss = iPagerSize\2
				If iPage <= iPagerSize\2 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss -4
				If iEnd >= iPageCount then iEnd = iPageCount
				If iPage>1 then
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(1)) & "' >[首页]</a> "
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(iPage-1)) & "' >[上一页]</a> "
				Else
					Pager = Pager &  "[首页] "
					Pager = Pager &  "[上一页] "
				End if
				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font> "
					Else
						Pager = Pager &  "<a href='" & ReWrite(sReWrite,(i+PgStart*10)) & "' >["&i+PgStart*10&"]</a> "
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(iPage+1)) & "' >[下一页]</a> "
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(iPageCount)) & "' >[末页]</a> "
				Else
					Pager = Pager &  "[下一页] "
					Pager = Pager &  "[末页] "
				End if


			End if




		Case 4
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\2 )
				If ss = 0 then ss = iPagerSize\2
				If iPage <= iPagerSize\2 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss
				If iEnd >= iPageCount then iEnd = iPageCount
				'add by zkh
				Pager=Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=1" & sQueryString & "' >[首页]</a> "

				If iPage>1 then
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & (iPage-1) & sQueryString & "' >[上一页]</a> "
				Else
					Pager = Pager &  "[上一页] "
				End if

				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font> "
					Else
						Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (i+PgStart*10) & sQueryString & "' >["&i+PgStart*10&"]</a> "
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPage+1) & sQueryString & "' >[下一页]</a> "
				Else
					Pager = Pager &  "[下一页] "
				End if

				'add by zkh
				Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & iPageCount & sQueryString & "' >[末页]</a> "
			End if
			
		Case 5
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\5 )
				If ss = 0 then ss = iPagerSize\5
				If iPage <= iPagerSize\5 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss
				If iEnd >= iPageCount then iEnd = iPageCount
				'add by zkh
				Pager=Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=1" & sQueryString & "' >[首页]</a> "

				If iPage>1 then
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & (iPage-1) & sQueryString & "' >[上一页]</a> "
				Else
					Pager = Pager &  "[上一页] "
				End if

				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font>"
					Else
						Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (i+PgStart*10) & sQueryString & "' >["&i+PgStart*10&"]</a>"
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPage+1) & sQueryString & "' >[下一页]</a> "
				Else
					Pager = Pager &  "[下一页] "
				End if

				'add by zkh
				Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & iPageCount & sQueryString & "' >[末页]</a> "
				
				Pager = Pager &  "进入第 <input type='text' name='"& sPageParam &"' size='7' > 页 &nbsp;&nbsp;<input type='submit' value='确认'>"
			End if
			
						
		Case Else
		
			Pager  = "" &  vbCrLf _
			& "[<A "&IIf(CLng(iPage)<=1,"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"(1);'")&">首页</A>]" & vbCrLf _
			& "[<A "&IIf(CLng(iPage)<=1,"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"("&(iPage-1)&");'")&">前页</A>]" & vbCrLf _
			& "[<A "&IIf(CLng(iPage)>=CLng(iPageCount),"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"("&(iPage+1)&");'")&">后页</A>]" & vbCrLf _
			& "[<A "&IIf(CLng(iPage)>=CLng(iPageCount),"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"("&iPageCount&");'")&">末页</A>]"
		
		End Select
	End Property
	
	'//输出连接语句
	Public Property Get ConnectionString()
		ConnectionString = oConn.ConnectionString
	End Property

	'//输出连接对象
	Public Property Get Conn()
		Set Conn = oConn
	End Property
	
	
End Class

Sub Eg()
	Response.Write "iPageSize = 10<br>"
	Response.Write "Dim oDbPager<br>"
	Response.Write "Set oDbPager = New cc_db_Pager<br>"
	Response.Write "Set oDbPager.ActiveConnection = Conn<br>"
	Response.Write "oDbPager.TableName = """"<br>"
	Response.Write "oDbPager.Fields = ""*""<br>"
	Response.Write "oDbPager.PKey = """"<br>"
	Response.Write "oDbPager.OrderBy = """"<br>"
	Response.Write "oDbPager.AddCondition """"<br><br>"
	Response.Write "oDbPager.PageSize = iPageSize<br>"
	Response.Write "oDbPager.Page = Request.QueryString(""page"")<br>"
	Response.Write "iCurrPage = oDbPager.Page<br>"
	Response.Write "Set Rs = oDbPager.Recordset<br>"
	Response.Write "iRecCount = oDbPager.RecordCount<br>"
	Response.Write "iPageCount = oDbPager.PageCount<br>"
	Response.Write "Do While Not Rs.Eof<br>"
	Response.Write "Rs.MoveNext<br>Loop<br>Rs.Close"
End Sub

%>