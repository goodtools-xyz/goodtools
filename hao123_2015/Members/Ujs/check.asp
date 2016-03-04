<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../../p_inc/openconn.asp"-->
<!--#include file="../config.asp"-->
<%
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
IF Not ChkPost() Then
	'response.Redirect "http://qingtiandy.cn/hao123.asp"
	'response.End()
End IF
Dim un,tag'定义用户名
un=replace(request("un"),"'","")
tag=request("tag")
IF tag="check_username" Then
	str=""
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select soojs_u_name from soojs_un where soojs_u_name='"&un&"'"
	s_u_n_a_m_e.open Sql,Conn,1,1
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		str=str&"setUserNameUsable(1);"
	Else
		str=str&"setUserNameUsable(0);"
	End IF
	response.Write str
	s_u_n_a_m_e.close
	Set s_u_n_a_m_e=nothing
	Conn.close
	Set Conn=nothing
ElseIF tag="check_email" Then
	str=""
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select soojs_u_email from soojs_un where soojs_u_email='"&un&"'"
	s_u_n_a_m_e.open Sql,Conn,1,1
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		str=str&"setEmailUsable(1);"
	Else
		str=str&"setEmailUsable(0);"
	End IF
	response.Write str
	s_u_n_a_m_e.close
	Set s_u_n_a_m_e=nothing
	Conn.close
	Set Conn=nothing
ElseIF tag="check_verifycode" Then
	IF Lcase(Session("SooJs_Un"))<>Lcase(un) Then
		str=str&"setverifycodeable(0);"
	Else
		str=str&"setverifycodeable(1);"
	End IF
	response.Write str
ElseIF tag="check_email_f" Then
	str=""
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select soojs_u_email from soojs_un where soojs_u_email='"&un&"'"
	s_u_n_a_m_e.open Sql,Conn,1,1
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		str=str&"setEmailUsable_f(1);"
	Else
		str=str&"setEmailUsable_f(0);"
	End IF
	response.Write str
	s_u_n_a_m_e.close
	Set s_u_n_a_m_e=nothing
	Conn.close
	Set Conn=nothing	
ElseIF tag="check_urlp" Then
	str=""
	oid=Bint(Request("id"))
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select w_url from qingtiandy_url where w_url='"&un&"' And id<>"&oid
	s_u_n_a_m_e.open Sql,Conn,1,1
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		str=str&"setw_urlUsable_f(1);"
	Else
		str=str&"setw_urlUsable_f(0);"
	End IF
	response.Write str
	s_u_n_a_m_e.close
	Set s_u_n_a_m_e=nothing
	Conn.close
	Set Conn=nothing
ElseIF tag="check_listurlp" Then
	str=""
	oid=Bint(Request("id"))
	uid=Bint(Request("uid"))
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select list_url from qingtiandy_listurl where list_url='"&un&"' And id<>"&oid&" And list_uid="&Request.Cookies(G_u_Cookies)("soojs_id")
	s_u_n_a_m_e.open Sql,Conn,1,1
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		str=str&"setlist_urlUsable_f(1);"
	Else
		str=str&"setlist_urlUsable_f(0);"
	End IF
	response.Write str
	s_u_n_a_m_e.close
	Set s_u_n_a_m_e=nothing
	Conn.close
	Set Conn=nothing		
ElseIF tag="checkw_ser" Then
		
	u1=Request("u1")
	id=Bint(Request("id"))
	str=Qingtiandy_getHTTPPage("http://"&u1&"/"&G_union_my&".txt")
	
	str2=ReadAllTextFile(Add_Root_Dir(G_BIG_T&"/users/0/"&id&".txt"))
	IF str=str2 Then
		conn.Execute("update qingtiandy_url set w_status=1 where id="&id)
		Response.Write "1"
	Else
		Response.Write "0"
	End IF
ElseIF tag="act_in" Then
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM qingtiandy_curl WHERE id=0 And c_uid="&Request.Cookies(G_u_Cookies)("soojs_id")
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			.AddNew()
			Set Rs1 = Conn.Execute("Select * from qingtiandy_curl where c_typename = '"& un &"' And c_uid="&Request.Cookies(G_u_Cookies)("soojs_id"))
			If Not Rs1.Eof Then
				Response.write "error||此分类名已经存在"
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing							
		End If
		.Fields.Item("c_typename").Value	= un
		.Fields.Item("c_no").Value			= 1
		.Fields.Item("c_uid").Value			= Request.Cookies(G_u_Cookies)("soojs_id")
		.Update()
	End With
	str=""
	str=str&"<select name='list_type1' id='list_type1' tabindex='3'>"&vbcrlf
	Set oRs2=conn.Execute("Select * From qingtiandy_curl Where c_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" Order by id Desc")
	IF oRs2.Eof Then
		str=str&"<option value='0'>我的收藏夹</option>"
	Else
		Do While Not oRs2.Eof
			oid=oRs2("id")
			oc_typename=oRs2("c_typename")
			oc_no=oRs2("c_no")
			str=str&"<option value='"&oid&"'>"&oc_typename&"</option>"&vbcrlf
			oRs2.MoveNext
		Loop	
	End IF	
	str=str&"</select>"&vbcrlf
	Response.Write str
ElseIF tag="ifip" Then
	oip=getIP()
	Set oRs=Conn.Execute("Select * From qingtiandh_userip Where uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" And uip='"&oip&"'")
	IF Not oRs.Eof Then
		str="1"
		response.Cookies("soojsjj")="1"
		Response.Cookies("soojsjj").expires=now()+100		
	Else
		str="0"
	End IF
	oRs.close
	Response.Write str
ElseIF tag="ifipin" Then
	oip=getIP()
	Set oRs2=Server.CreateObject(G_RS)
	oRs2.open "Select * From qingtiandh_userip Where uip='"&oip&"'",conn,1,3
	IF Not oRs2.Eof Then
		Conn.Execute("Delete From qingtiandh_userip Where uip='"&oip&"'")
	Else
		oRs2.AddNew()	
	End IF
	oRs2("uip")=oip
	oRs2("uid")=Request.Cookies(G_u_Cookies)("soojs_id")
	oRs2("utime")=ForMatDate(now(),55)
	oRs2("uedittime")=ForMatDate(now(),55)
	oRs2.Update()	
	oRs2.close
	response.Cookies("soojsjj")="1"
	Response.Cookies("soojsjj").expires=now()+100	
	Response.Write "1"
End IF

%>