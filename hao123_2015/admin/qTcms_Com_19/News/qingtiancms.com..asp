<!--#include file="../../../p_inc/Include_func.asp"-->
<!--#include file="../../inc/public.asp"-->
<!--#include file="../../inc/openconn.asp"-->
<!--#include file="Config.asp"-->
<%
IF Not ChkPost() Then
	'response.Redirect "../"
	'response.End()
End IF
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
tag=request("tag")
str=""
Select Case tag
	Case "Get_typeh2" '根据一级网址，获取二级类别
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='n_type2' id='n_type2'>"
		str2=""
		IF id1="" Then
			'str=""
		Else
			IF id1="22" Then
				str2=str2&GetDhType1(a16_arrmz_22,id3,1)
			End IF		
		End IF
		IF str2="" Then 
			str=""
		Else
			str=str&str2&"</Select>"	
		End IF			

	Case Else
End Select
'rs.close
'Set rs=Nothing
response.Write str
CloseConn()

%>