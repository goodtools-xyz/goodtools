<!--#include file="../../../../p_inc/Include_func.asp"-->
<!--#include file="../../../../p_inc/openconn.asp"-->
<!--#include file="../../../../Members/config.asp"-->

<%
IF Not ChkPost() Then
	response.Redirect "http://www.qingtia"&"ncms.com/"
	response.End()
End IF
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
v=request("v")
IF v="c_shoucang" Then '在线收藏
	ppp_s=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs2=conn.Execute("Select   * From qingtiandy_listurl Where list_uid="&ppp_id&" Order By list_no ASC, ID ASC")
	IF Not oRs2.Eof Then
		Do While Not oRs2.Eof 
			plist_url=oRs2("list_url")
			plist_name=oRs2("list_name")
			plist_url=GetUrl_httpAll(plist_url)
			ppp_s=ppp_s&plist_name&"**"&plist_url&"^^"
			oRs2.MoveNext
		Loop
	Else
		ppp_s=ppp_s&""
	End IF
	Response.Write ppp_s
	Response.End()
ElseIF v="c_shoucang2" Then '在线收藏,带ID
	ppp_s=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs2=conn.Execute("Select   * From qingtiandy_listurl Where list_uid="&ppp_id&" Order By list_no Desc, ID Desc")
	IF Not oRs2.Eof Then
		Do While Not oRs2.Eof 
			pid=oRs2("id")
			plist_url=oRs2("list_url")
			plist_name=oRs2("list_name")
			plist_url=plist_url
			IF left(plist_url,4)="http" Then
			
			Else
				plist_url="http://"&plist_url
			End IF
			ppp_s=ppp_s&plist_name&"**"&plist_url&"**"&pid&"^^"
			oRs2.MoveNext
		Loop
	Else
		ppp_s=ppp_s&""
	End IF
	Response.Write ppp_s
	Response.End()		
ElseIF v="c_shoucang_d" Then '删除某个在线收藏
	ppp_s=""	
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	ppp_m2=Replace(Request("m2"),"'","")
	Conn.Execute("Delete From qingtiandy_listurl Where list_name='"&ppp_m2&"' And list_uid="&ppp_id)
	Response.Write "ok"
	Response.End()	
ElseIF v="c_shoucang_d2" Then '删除某个在线收藏,根据id
	ppp_s=""	
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	pp_id=Replace(Request("id"),"'","")
	pp_id=Bint(pp_id)
	Conn.Execute("Delete From qingtiandy_listurl Where id="&pp_id&" And list_uid="&ppp_id)
	Response.Write "ok"
	Response.End()	
ElseIF v="c_shoucang_a" Then '增加某个在线收藏
	ppp_s=""	
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	ppp_list_name=Trim(Replace(Request("d1"),"'",""))
	ppp_list_url=Trim(Replace(Request("d2"),"'",""))
	IF ppp_list_name<>"" And ppp_list_url<>"" Then
		Set oRs=Server.CreateObject(G_RS)
		oRs.open "Select * From qingtiandy_listurl Where list_uid="&ppp_id&" And list_name='"&ppp_list_name&"'",Conn,1,3
		IF  oRs.Eof Then
			oRs.Addnew()
			oRs("list_url")=ppp_list_url
			oRs("list_name")=ppp_list_name
			oRs("list_biaoqian")=""
			oRs("list_type1")=0
			oRs("list_content")=""
			oRs("list_gx")=0
			oRs("list_uid")=ppp_id
			oRs("list_date")=ForMatDate(now(),55)
			oRs("list_no")=0
			oRs.Update()
			Response.Write "ok"
		Else
			Response.Write "error"
		End IF
	Else
		Response.Write "error"
	End IF
	Response.End()		
ElseIF v="c_shoucang_edit" Then '编辑某个在线收藏
	ppp_s=""	
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	ppp_list_name=Trim(Replace(Request("d1"),"'",""))
	ppp_list_url=Trim(Replace(Request("d2"),"'",""))
	id=Trim(Replace(Request("id"),"'",""))
	id=Bint(id)
	IF ppp_list_name<>"" And ppp_list_url<>"" And id<>0 Then
		Set oRs=Server.CreateObject(G_RS)
		oRs.open "Select * From qingtiandy_listurl Where list_uid="&ppp_id&"  And id="&id,Conn,1,3
		IF not oRs.Eof Then
			oRs("list_url")=ppp_list_url
			oRs("list_name")=ppp_list_name
			oRs("list_biaoqian")=""
			oRs("list_type1")=0
			oRs("list_content")=""
			oRs("list_gx")=0
			oRs("list_uid")=ppp_id
			oRs("list_date")=ForMatDate(now(),55)
			oRs("list_no")=0
			oRs.Update()
			Response.Write "ok"
		Else	
			Response.Write "error"
		End IF
	Else
		Response.Write "error"
	End IF
	Response.End()	
ElseIF v="c_denglu" Then '用户登录状态
	ppp_s=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	IF ppp_id<>0 Then
		Set oRs3=Conn.Execute("Select soojs_u_name From soojs_un Where id="&ppp_id)
		IF Not oRs3.Eof Then
			ppp_s=oRs3(0)
		End IF
	End IF
	Response.Write ppp_s
	Response.End()
ElseIF v="newscn" Then '国内新闻列表
	numb=Bint(Request("n")) '显示个数
	pstr=qtcmsdh.Qingtiandy_getHTTPPage("http://news.baidu.com/n?cmd=1&class=civilnews&tn=rss")
	pstr_a=body2s(pstr,"<item>","</item>","###",true)
	pstr_a_title=body2s(pstr_a,"<title><![CDATA[","]]></title>","###",true):pstr_a_title_a=Split(pstr_a_title,"###")
	pstr_a_href=body2s(pstr_a,"<link><![CDATA[","]]></link>","###",true):pstr_a_href_a=Split(pstr_a_href,"###")
	ppp_s="["
	For ii=0 To Ubound(pstr_a_href_a)
		IF ii+1>numb Then Exit For
		ppp_s=ppp_s&"['"&Replace(pstr_a_title_a(ii),"'","")&"','"&Replace(pstr_a_href_a(ii),"'","")&"'],"
	Next
	ppp_s=ppp_s&"['','']]"
	Response.Write ppp_s
	Response.End()	
ElseIF v="mingzhan2" Then '插入名站集合
	om=Trim(Request("m"))
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb From soojs_un Where id="&ppp_id,Conn,1,3
	IF Not oRs.Eof Then
		oRs("soojs_u_myweb")=Replace(om,"'","")
		oRs.Update()
	End IF	
	oRs.Close
	Response.Write "ok"
	Response.End()	
ElseIF v="mingzhan2_2" Then '插入名站集合
	om=Trim(Request("m"))
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb4 From soojs_un Where id="&ppp_id,Conn,1,3
	IF Not oRs.Eof Then
		oRs("soojs_u_myweb4")=Replace(om,"'","")
		oRs.Update()
	End IF	
	oRs.Close
	Response.Write "ok"
	Response.End()	
ElseIF v="mingzhan3" Then '获取名站集合
	pstr=""
	pstr1=""
	pstr2=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb From soojs_un Where id="&ppp_id,Conn,1,1
	IF Not oRs.Eof Then
		pstr1=Replace(GetRp(oRs("soojs_u_myweb")),"'","‘")
		pstr1_a=Split(pstr1,"{|}")
		For ii=Ubound(pstr1_a) To 23
			pstr2=pstr2&"http://##自定义网址{|}"
		Next
		pstr=pstr1&pstr2
	End IF	
	oRs.Close
	Response.Write pstr
	Response.End()	
ElseIF v="mingzhan3_2" Then '获取名站集合
	pstr=""
	pstr1=""
	pstr2=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb4 From soojs_un Where id="&ppp_id,Conn,1,1
	IF Not oRs.Eof Then
		pstr1=Replace(GetRp(oRs("soojs_u_myweb4")),"'","‘")
		pstr1_a=Split(pstr1,"{|}")
		For ii=Ubound(pstr1_a) To 35
			pstr2=pstr2&"http://##自定义网址{|}"
		Next
		pstr=pstr1&pstr2
	End IF	
	oRs.Close
	Response.Write pstr
	Response.End()		
ElseIF v="mingzhan4" Then '获取名站集合
	pstr=""
	pstr1=""
	pstr2=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb2 From soojs_un Where id="&ppp_id,Conn,1,1
	IF Not oRs.Eof Then
		pstr1=Replace(GetRp(oRs("soojs_u_myweb2")),"'","‘")
		pstr=pstr1
	End IF	
	oRs.Close
	Response.Write pstr
	Response.End()	
ElseIF v="mingzhan4in" Then '插入名站
	om=Trim(Request("m"))
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb2 From soojs_un Where id="&ppp_id,Conn,1,3
	IF Not oRs.Eof Then
		oRs("soojs_u_myweb2")=Replace(om,"'","")
		oRs.Update()
	End IF	
	oRs.Close
	Response.Write "ok"
	Response.End()	
ElseIF v="jishiben" Then '获取记事本信息
	pstr=""
	pstr1=""
	pstr2=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_mytxt From soojs_un Where id="&ppp_id,Conn,1,1
	IF Not oRs.Eof Then
		pstr=oRs("soojs_u_mytxt")
		IF pstr="" or isnull(pstr) Then pstr=""
	End IF	
	oRs.Close
	Response.Write pstr
	Response.End()	
ElseIF v="jishibenin" Then '插入记事本信息
	om=Trim(Request("m"))
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_mytxt From soojs_un Where id="&ppp_id,Conn,1,3
	IF Not oRs.Eof Then
		oRs("soojs_u_mytxt")=om
		oRs.Update()
	End IF	
	oRs.Close
	Response.Write "ok"
	Response.End()	
ElseIF v="getemail" Then '获取当前用户E-mail
	om=Trim(Request("m"))
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	pstr=""
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_email From soojs_un Where id="&ppp_id,Conn,1,1
	IF Not oRs.Eof Then
		pstr=oRs("soojs_u_email")
	End IF	
	oRs.Close
	Response.Write pstr
	Response.End()		
'ElseIF v="1616_jj_1" Then '1616模板简洁版操作--
'	Response.Buffer=True
'	response.contenttype="x-javascript;charset=gb2312"	
'	pstr=""
'	pstr1=""
'	pstr2=""
'	pstr3=""
'	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
'		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
'	End IF		
'	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
'	Set oRs=Server.CreateObject(G_RS)
'	oRs.open "Select soojs_u_myweb From soojs_un Where id="&ppp_id,Conn,1,1
'	IF Not oRs.Eof Then
'		pstr1=Replace(GetRp(oRs("soojs_u_myweb")),"'","‘")
'		pstr1_a=Split(pstr1,"{|}")
'		For ii=0 To Ubound(pstr1_a)-1
'			pstr3=pstr1_a(ii)
'			pstr3_a=Split(pstr3,"##")
'			pstr2=pstr2&"[\"""&pstr3_a(1)&"\"",\"""&pstr3_a(0)&"\"",\""0\""],"
'			
'		Next
'		pstr3=pstr2&"[]"
'	End IF	
'	oRs.Close
'		
'	Response.Write "JAJAX_CALLBACK_0(""null|@|null|@|null|@|["&pstr3&"]|@|null|@|null|@|null|@|\""杭州_杭州_浙江\""|@|null|@|null|@|null|@|null|@|null"")"
ElseIF v="1616_jj_1" Then '1616模板简洁版操作--
	Response.Buffer=True
	response.contenttype="x-javascript;charset=gb2312"	
	pstr=""
	pstr1=""
	pstr2=""
	pstr3=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb3 From soojs_un Where id="&ppp_id,Conn,1,1
	IF Not oRs.Eof Then
		pstr2=Replace(GetRp(oRs("soojs_u_myweb3")),"'","‘")
		IF Instr(pstr2,"http://")>0 Then
			pstr3=replace(pstr2,"""","\""")
		End IF
	End IF	
	oRs.Close
		
	Response.Write "JAJAX_CALLBACK_0(""null|@|null|@|null|@|["&pstr3&"]|@|null|@|null|@|null|@|\""杭州_杭州_浙江\""|@|null|@|null|@|null|@|null|@|null"")"	
ElseIF v="1616_jj_2" Then '存入数据库中的操作--
	Response.Buffer=True
	response.contenttype="x-javascript;charset=gb2312"
	sVa=Request("va")
	pstr=""
	pstr1=""
	pstr2=""
	pstr3=""
	IF Request.Cookies(G_u_Cookies+"_a")<>"" Then
		Response.Cookies(G_u_Cookies)("soojs_id")=Request.Cookies(G_u_Cookies+"_a")
	End IF		
	ppp_id=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs=Server.CreateObject(G_RS)
	oRs.open "Select soojs_u_myweb3 From soojs_un Where id="&ppp_id,Conn,1,3
	IF Not oRs.Eof Then
		IF Instr(sVa,"http://")>0 Then
			pstr2=Replace(sVa,"[[","[")
			pstr2=Replace(pstr2,"]]","]")
			oRs("soojs_u_myweb3")=pstr2
			oRs.Update()
		End IF
	End IF	
	oRs.Close	
	Response.Write "JAJAX_CALLBACK_0(""null|@|null|@|null|@|"&sVa&"|@|null|@|null|@|null|@|\""杭州_杭州_浙江\""|@|null|@|null|@|null|@|null|@|null"")"
ElseIF v="1616_jj_3" Then '读取用户信息--	
	Response.Buffer=True
	response.contenttype="x-javascript;charset=gb2312"
	Response.Write "J1616.www.index.p_callback({""code"":1,""desc"":"""&chinese2unicode(Request.Cookies(G_u_Cookies)("soojs_u"))&"""});"	
ElseIF v="1616_jj_4" Then '读取用户信息--	
	Response.Buffer=True
	response.contenttype="x-javascript;charset=gb2312"
	Response.Write "qTcms_p_callback({""code"":1,""desc"":"""&Request.Cookies(G_u_Cookies)("soojs_u")&"""});"	
ElseIF v="1616_jj_5" Then '读取用户信息--摆脱1616	
	Response.Buffer=True
	response.contenttype="x-javascript;charset=gb2312"
	Response.Write "jsonp13225467654040&&jsonp13225467654040({""code"":1,""desc"":'null'})"		
End IF
%>
