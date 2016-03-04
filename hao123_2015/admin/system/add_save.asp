<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<% 
act=true
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


IF  str_username="" Then
	response.Write("<script language=javascript>alert('此注册帐号不能为空！');window.history.back();</script>")
	response.End() 	
End IF

set rscheck=server.CreateObject("adodb.recordset")
sqlcheck="select * from tbl_admin where str_username='"&str_username&"'"
rscheck.open sqlcheck,conn,1,3,&H0001
if not rscheck.eof then
	rscheck.close
	set rscheck=nothing
	response.Write("<script language=javascript>alert('此注册帐号已经存在！');window.history.back();</script>")
	response.End() 
else
	str_pass=md5(str_pass,16)
	rscheck.addnew
	rscheck("str_username")=str_username
	rscheck("str_pass")=str_pass
	rscheck("str_name")=str_name
	rscheck("str_sex")=str_sex
	rscheck("str_job")=str_job
	rscheck("str_tel")=str_tel
	rscheck("str_mail")=str_mail
	rscheck("remark")=remark
	rscheck("str_level")=2
	rscheck("sj")=FormatDate(now(),55)
	rscheck("flag")=0
	rscheck.update
	rscheck.close
	set rscheck=nothing
	response.Redirect "list.asp"
	response.End()
end if

%>

