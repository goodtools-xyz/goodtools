<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<% 
act=true
id=clng(request.Form("id"))
str_username=Replace_Text(request.Form("str_username"))
str_pass=Replace_Text(request.Form("str_pass"))
str_name=Replace_Text(request.Form("str_name"))
str_sex=Replace_Text(request.Form("str_sex"))

str_job=Replace_Text(request.Form("str_job"))
str_tel=Replace_Text(request.Form("str_tel"))
str_mail=trim(request.Form("str_mail"))
remark=Replace_Text(request.Form("remark"))
remark=replace(remark,chr(32),"&nbsp;")
remark=replace(remark,chr(13)+chr(10),"<br>")
'str_level=clng(request.Form("str_level"))
str_lock=clng(request.Form("str_lock"))

set rscheck=server.CreateObject("adodb.recordset")
sqlcheck="select * from tbl_admin where id="&id&""
rscheck.open sqlcheck,conn,1,3,&H0001
if not rscheck.eof then
	if str_pass<>"" then
		str_pass=md5(str_pass,16)
		rscheck("str_pass")=str_pass
	end if
	rscheck("str_name")=str_name
	rscheck("str_sex")=str_sex
	rscheck("str_job")=str_job
	rscheck("str_tel")=str_tel
	rscheck("str_mail")=str_mail
	rscheck("remark")=remark
	'rscheck("str_level")=str_level
	rscheck("flag")=str_lock
	rscheck.update
	rscheck.close
	set rscheck=nothing
	Response.Redirect("../qingti"&"ancm"&"s.co"&"m.succ"&"ess.asp?ErrCodes="&Server.URLEncode("资料修改成功")&"&ErrorUrl=system/list.asp&c=返回管理员列表")
	response.End()
end if



%>

