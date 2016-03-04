<!--#include file="../../../../p_inc/config.asp"-->
<%
Shortcut = "[InternetShortcut] " & vbCrLf
Shortcut = Shortcut & "URL="&G_WEBURL&"" & vbCrLf
Shortcut = Shortcut & "IDList= " & vbCrLf
Shortcut = Shortcut & "[{000214A0-0000-0000-C000-000000000046}] " & vbCrLf
Shortcut = Shortcut & "Prop3=19,2 " & vbCrLf
Shortcut = Shortcut & " " & vbCrLf
Response.AddHeader "Content-Disposition", "attachment;filename="&G_WEBNAME&".url;"
Response.ContentType = "application/octet-stream"
Response.Write Shortcut
%>


