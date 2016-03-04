<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%

if request("id")<>"" then
	flag=clng(request.QueryString("flag"))
	sql="select * from tbl_admin where id="&clng(request("id"))&""
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3,&H0001
	rs("flag")=flag
	rs.update:rs.close:set rs=nothing
	'session("admin_flag")=flag
end if
response.redirect("list.asp?page="&request("page")&"&act="&request("act")&"&keyword="&request("keyword"))

%>

