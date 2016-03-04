<!--#include file="../../../p_inc/Include_func.asp"-->
<!--#include file="../../../p_inc/openconn.asp"-->
<%
IF Not ChkPost() Then
	response.Redirect "../"
	response.End()
End IF
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
tag=request("tag")
str=""
Select Case tag
	Case "Get_type1" '根据地区ID，获取导航集合
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='m_type2' onChange=""Get_type2(this.value,'div_m_type3')"">"
		str=str&"<Option value='0'>二级类别</Option>"
		IF id1="" Then
			'str=""
		Else
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtiandh_type2 where typeid1="&id1&" order by typehide desc,typeno asc,typeid asc",conn,1,1
			Do While Not oRs.Eof 
				kId=oRs("typeid")
				kG_name=oRs("typename")
				IF Clng(id3)=Clng(kId) Then
					str=str&"<option value='"&kId&"' selected>"&kG_name&"</option>"
				Else
					str=str&"<option value='"&kId&"'>"&kG_name&"</option>"	
				End IF
				oRs.MoveNext
			Loop	
			oRs.close:set oRs=Nothing		
		End IF
		str=str&"</Select>"
	Case "Get_type2" '根据导航，获取导航专集	
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='m_type3' id='m_type3'>"
		str=str&"<Option value='0'>三级类别</Option>"
		IF id1="" Then
			'str=""
		Else
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtiandh_type3 where typeid2="&id1&" order by typehide desc,typeno asc,typeid asc",conn,1,1
			Do While Not oRs.Eof 
				kId=oRs("typeid")
				kG_name=oRs("typename")
				IF Clng(id3)=Clng(kId) Then
					str=str&"<option value='"&kId&"' selected>"&kG_name&"</option>"
				Else
					str=str&"<option value='"&kId&"'>"&kG_name&"</option>"	
				End IF
				oRs.MoveNext
			Loop	
			oRs.close:set oRs=Nothing		
		End IF
		str=str&"</Select>"		
	Case "Add_list" '插入专集
		tFlag=True
		list_text=replace(request("list_text"),"'","")
		l_group=StayNub(Request("l_group"))	
		l_type1=StayNub(Request("l_type1"))
		IF l_type1="0" And tFlag  Then
			str="{地区不能为空}"
			tFlag=False
		End IF
		IF l_group="0" And tFlag  Then
			str="{导航不能为空}"
			tFlag=False
		End IF		
		IF list_text="" And tFlag  Then
			str="{专辑名不能为空}"
			tFlag=False
		End IF		
		IF tFlag Then
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtiandh_list Where l_group="&l_group&" And l_name='"&list_text&"'",conn,1,3
			IF Not oRs.Eof Then
				str="{已经存在}"&oRs("id")
			Else
				oRs.AddNew
					oRs("l_look")=1
					oRs("l_type1")=l_type1
					oRs("l_group")=l_group
					oRs("l_name")=list_text
					oRs("l_addtime")=ForMatDate(now(),55)
				oRs.Update
				str="{ok}"&oRs("id")
			End IF
			oRs.close:set oRs=Nothing
		End IF
	Case "Add_group" '插入导航
		tFlag=True
		group_text=replace(request("group_text"),"'","")
		l_type1=StayNub(Request("l_type1"))
		IF l_type1="0" And tFlag  Then
			str="{地区不能为空}"
			tFlag=False
		End IF			
		IF group_text="" And tFlag  Then
			str="{导航名不能为空}"
			tFlag=False
		End IF	
		IF tFlag Then
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtian_group where g_type1="&	l_type1&" And g_name='"&group_text&"'"	,conn,1,3
			IF Not oRs.Eof Then
				str="{已经存在}"&oRs("id")
			Else
				oRs.AddNew
					oRs("g_look")=1
					oRs("g_type1")=l_type1
					oRs("g_name")=group_text				
				oRs.Update
				str="{ok}"&oRs("id")
			End IF	
			oRs.close:set oRs=Nothing	
		End IF
	Case Else
End Select
'rs.close
'Set rs=Nothing
response.Write str
CloseConn()

%>