<%

Sub GetSafeCode	
	Dim test,Result
	On Error Resume Next
	Set test=Server.CreateObject(G_Stream)
	Set test=Nothing
	If Err Then
		Dim zNum
		Randomize timer
		zNum = cint(8999*Rnd+1000)
		Session("SafeCode") = zNum
		Result = Session("SafeCode")		
	Else
		Result = "<img src=""inc/yz/Safecode.asp"" align=""absmiddle""  align=""absmiddle"">"		
	End If
	Response.Write Result
End Sub

%>