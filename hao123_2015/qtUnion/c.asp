<!--#include file="../p_inc/Include_func.asp"-->
<%
	q=Request("q")
	q=Replace(q,"'","")
	q=Bint(q)
	IF G_xiaxian_1="1" Then
		'ÏÂÏßCookies
		IF q<>0 Then
			response.Cookies(G_u_Cookies+"xiaxian")=q
		End IF	
	End IF
	Response.Redirect "../"
%>
