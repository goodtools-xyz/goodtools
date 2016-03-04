<%
Sub JS_Conn2
	Dim Fy_In,Fy_Inf,Fy_Get,Fy_Xh,Flag
	Dim JS_ConnStr2
	Set connip = Server.CreateObject("ADODB.Connection")
	JS_ConnStr2 = "provider=microsoft.jet.oledb.4.0;data source="&Server.MapPath(Add_Root_Dir("/p_inc/data/##IPµØÖ·.mdb"))
	connip.Open JS_ConnStr2
End Sub
Dim connip:JS_Conn2
%>