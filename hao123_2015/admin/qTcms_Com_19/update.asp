<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>安装步骤</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.dates{margin:10px 0 0 0px;border:1px solid #1a1aa3;height:27px;width:700px;padding:1px;}
.dates .cos{float:left;background:#1a1aa3;height:25px;color:red;}
#prompt{border:#E8F7FF 0px solid;width:400px;margin:20px auto; margin-top:200px}
#prompt strong{display:block;background:url(images/6.gif);height:20px;padding:5px 0 0 10px;color:#fff;font-weight:normal;}
#prompt p{background:url(images/sprompt.gif) 20px center no-repeat;border:#1989D7 1px solid;border-top:none;font-size:14px;color:#000;line-height:20px;min-height:35px;margin:0px; padding-top:35px; padding-bottom:35px; text-align:center}
* html #prompt p{height:35px; margin:0px}
-->
</style>
</head>
<body>
<%
t=Bint(Request("t"))
IF t="1" Then
	Call Sub_m1(t)
End IF
%>
<%
Sub Sub_m1(t)
	Dim a,f1
	'on error resume next
	a=t
	IF G_IS_SQL_User_DB="1" Then
		Sql1=qtcmsdh.Qingtiandy_getHTTPPage(G_G_H&"qtuser/2013daohang_19/16/k.Sql.install/1.txt")
		Sql1=Replace(Sql1,"{Pre}","")
		Conn.Execute(Sql1)	
	ElseIF 	G_IS_SQL_User_DB="0" Then
		Sql1=qtcmsdh.Qingtiandy_getHTTPPage(G_G_H&"qtuser/2013daohang_19/16/k.Sql.install/0.txt")
		Sql1=Replace(Sql1,"{Pre}","")
		Sql1_a=SPlit(Sql1,"<hr>")
		For ai=0 To Ubound(Sql1_a)
			Sql1_1=Sql1_a(ai)
			IF Sql1_1<>"" Then
				Conn.Execute(Sql1_1)	
			End IF	
		Next		
	End IF
	N_Fso.CopyFiles "../../template/"&G_moban&"/sql/"&a&".config","../../template/"&G_moban&"/sql/"&a&".config.bak"
	N_Fso.DelFiles "../../template/"&G_moban&"/sql/"&a&".config"
	Response.Write "<div id=""prompt""><strong>安装提示：</strong><p>第"&a&"步 安装成功，5秒后进入<a href='?t="&(a+1)&"'>下一步安装</a></p></div>"
	Response.Write "<script>setTimeout(""location.href='?t="&(a+1)&"'"",5000)</s"&"cript>"
End Sub
%>
</body>
</html>