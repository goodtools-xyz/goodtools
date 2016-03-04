<!--#include file="qingtiancms.com.....asp"-->
<%
Function Get_length(str,n,length)
		str=GetRp(str)
	'IF n="" Then
		IF L_length(str)>length Then
			Get_length=LeftTrue(str,length)&""
		Else		
			Get_length=LeftTrue(str,length)
		End IF		
	'Else
	
	'End IF
End Function
Function Get2_length(str,n,length)
	'IF n="" Then
		IF len(str)>length Then
			Get2_length=left(str,length)&""
		Else		
			Get2_length=left(str,length)
		End IF		
	'Else
	
	'End IF
End Function


Function Get_List_numb(type1) '根据类别获取信息条数
	Dim s
	type1=StayNub(type1)
	IF type1="" Then s=0
	Dim oRs
	Set oRs=Server.CreateObject(G_RS)
	IF s<>"0" THen
		oRs.open "Select Count(*) From qingtiandh_List Where m_type1="&type1,conn,1,1
	Else
		oRs.open "Select Count(*) From qingtiandh_List ",conn,1,1
	End IF
	s=oRs(0)
	'oRs.close:Set oRs=Nothing	
	Get_List_numb=s	
End Function

Function Get_type1_id(m_type1_name)
	Set rs_type1=conn.execute("select typeid from qingtiandh_type1 where typename='"&m_type1_name&"'")
	IF rs_type1.Eof Then
		Get_type1_id=0
	Else
		Get_type1_id=rs_type1(0)
	End IF	
End Function

Function Get_type1_name(m_type1_id)
	Set rs_type1=conn.execute("select typename from qingtiandh_type1 where typeid="&m_type1_id&"")
	IF rs_type1.Eof Then
		Get_type1_name=""
	Else
		Get_type1_name=rs_type1(0)
	End IF	
End Function

Function Get_type1_Content(m_type2_id)
	Set rs_type2=conn.execute("select typecontent from qingtiandh_type1 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type1_Content=""
	Else
		Get_type1_Content=rs_type2(0)
	End IF	
End Function

Function Get_type3_Content(m_type2_id)
	Set rs_type2=conn.execute("select typecontent_19 from qingtiandh_type2 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type3_Content=""
	Else
		Get_type3_Content=GetUrl_TextUrl(GetRp(rs_type2(0)))
	End IF	
End Function

Function Get_type3_Content_top(m_type2_id)
	Set rs_type2=conn.execute("select typecontent_19_top from qingtiandh_type2 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type3_Content_top=""
	Else
		Get_type3_Content_top=GetUrl_TextUrl(GetRp(rs_type2(0)))
	End IF	
End Function

Function Get_type2_id(m_type1_name)
	Set rs_type1=conn.execute("select typeid from qingtiandh_type2 where typename='"&m_type1_name&"'")
	IF rs_type1.Eof Then
		Get_type2_id=0
	Else
		Get_type2_id=rs_type1(0)
	End IF	
End Function

Function Get_type2_name(m_type2_id)
	Set rs_type2=conn.execute("select typename from qingtiandh_type2 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type2_name=""
	Else
		Get_type2_name=rs_type2(0)
	End IF	
End Function

Function Get_typel1_name(m_type2_id)
	Set rs_type2=conn.execute("select typename from qingtiandh_ltype1 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_typel1_name=""
	Else
		Get_typel1_name=rs_type2(0)
	End IF	
End Function

Function Get_typel1_id(m_type1_name)
	Set rs_type1=conn.execute("select typeid from qingtiandh_ltype1 where typename='"&m_type1_name&"'")
	IF rs_type1.Eof Then
		Get_typel1_id=0
	Else
		Get_typel1_id=rs_type1(0)
	End IF	
End Function

Function Get_type2_Content(m_type2_id)
	Set rs_type2=conn.execute("select typecontent from qingtiandh_type2 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type2_Content=""
	Else
		Get_type2_Content=rs_type2(0)
	End IF	
End Function

Function Get_type2_title(m_type2_id)
	Set rs_type2=conn.execute("select typetitle from qingtiandh_type2 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type2_title=""
	Else
		Get_type2_title=rs_type2(0)
	End IF	
End Function

Function Get_type2_typedes(m_type2_id)
	Set rs_type2=conn.execute("select typedes from qingtiandh_type2 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type2_typedes=""
	Else
		Get_type2_typedes=rs_type2(0)
	End IF	
End Function

Function Get_type1_title(m_type2_id)
	Set rs_type2=conn.execute("select typetitle from qingtiandh_type1 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type1_title=""
	Else
		Get_type1_title=rs_type2(0)
	End IF	
End Function

Function Get_type1_typedes(m_type2_id)
	Set rs_type2=conn.execute("select typedes from qingtiandh_type1 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type1_typedes=""
	Else
		Get_type1_typedes=rs_type2(0)
	End IF	
End Function

Function Get_type3_id(m_type1_name)
	Set rs_type1=conn.execute("select typeid from qingtiandh_type3 where typename='"&m_type1_name&"'")
	IF rs_type1.Eof Then
		Get_type3_id=0
	Else
		Get_type3_id=rs_type1(0)
	End IF	
End Function

Function Get_type3_name(m_type3_id)
	Set rs_type2=conn.execute("select typename from qingtiandh_type3 where typeid="&m_type3_id&"")
	IF rs_type2.Eof Then
		Get_type3_name=""
	Else
		Get_type3_name=rs_type2(0)
	End IF	
End Function

Function Del_Mlist3(id) '根据二级类别删除对应的导航
	Dim rs,rs2,zId
	id=Bint(id)
	conn.Execute("Delete From qingtiandh_type3 Where typeid="&id)
	conn.Execute("Delete From qingtiandh_List Where m_type3="&id)
End Function

Function Del_Mlist2(id) '根据二级类别删除对应的导航
	Dim rs,rs2,zId
	id=Bint(id)
	conn.Execute("Delete From qingtiandh_type2 Where typeid="&id)
	conn.Execute("Delete From qingtiandh_List Where m_type2="&id)
	conn.Execute("Delete From qingtiandh_type3 Where typeid2="&id)
End Function

Function Del_Mlist(id) '根据一级类别删除对应的导航
	Dim rs,rs2,zId
	id=Bint(id)
	conn.Execute("Delete From qingtiandh_type3 Where typeid1="&id)
	conn.Execute("Delete From qingtiandh_type2 Where typeid1="&id)
	conn.Execute("Delete From qingtiandh_type1 Where typeid="&id)
	conn.Execute("Delete From qingtiandh_List Where m_type1="&id)
End Function


Function Get_qingtiandy_listurl_total(v)'根据用户获取收藏数
	v=bint(v)
	Dim oRs
	Set oRs=conn.Execute("Select Count(*) From qingtiandy_listurl Where list_uid="&v)
	Get_qingtiandy_listurl_total=oRs(0)
End Function

Function Get_soojs_un_soojs_u_name(v) '所属用户
	v=bint(v)
	Dim oRs,str
	Set oRs=conn.Execute("Select soojs_u_name From soojs_un Where id="&v)
	IF Not oRs.Eof Then
		str=oRs(0)
	Else
		str=""
	End IF
	Get_soojs_un_soojs_u_name=str
End Function

Function Bint(Str)
	Str = Trim(Str)
	If Str = "" Or IsNull(Str) Or Not IsNumeric(Str) Then Str = "0"
	Bint = Round(Str, 0)
End Function



Function Get_newsm_name(id)
	Set rs_type1=conn.execute("select n_title from qingtiandy_News where id="&id&"")
	IF rs_type1.Eof Then
		Get_newsm_name="其他"
	Else
		Get_newsm_name=rs_type1(0)
	End IF	
End Function

'新闻类别相关
Function Get_producttype1_name(m_type1_id)
	Set rs_type1=conn.execute("select typename from qingtiandy_Ptype1 where typeid="&m_type1_id&"")
	IF rs_type1.Eof Then
		Get_producttype1_name=""
	Else
		Get_producttype1_name=rs_type1(0)
	End IF	
	
End Function
Function Get_type1_name4(m_type2_id)
	Set rs_type2=conn.execute("select typename from qingtiandy_Ptype1 where typeid="&m_type2_id&"")
	IF rs_type2.Eof Then
		Get_type1_name4=""
	Else
		Get_type1_name4=rs_type2(0)
	End IF	
End Function
Function Get_productm_name(id)
	Set rs_type1=conn.execute("select n_title from qingtiandy_product where id="&id&"")
	IF rs_type1.Eof Then
		Get_productm_name="其他"
	Else
		Get_productm_name=rs_type1(0)
	End IF	
End Function


Function Str4Like(byVal sText)
    sText = Replace(sText, "'" , "''")
    sText = Replace(sText, "[" , "[[]")
    sText = Replace(sText, "%" , "[%]")
    sText = Replace(sText, "_" , "[_]")
    Str4Like = sText
End Function

'点
Function InsertInd(Cadmin,id,table,ziduan)
	Dim id2
	IF Cadmin="1" Then
		id2=id
	Else
		id2=0
	End IF
	Conn.Execute("Update "&table&" Set qingtiancmsid="&id2&" Where "&ziduan&"="&id)
End Function



%>