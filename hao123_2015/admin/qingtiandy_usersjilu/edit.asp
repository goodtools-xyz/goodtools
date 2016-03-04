<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"网址" '标题
	GG_Table				=	"qingtiandy_urllog"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From qingtiandy_urllog Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="w_status" And sID<>"" Then
		fId=FormatNumSerial(sID)
		w_status=StayNub(request("w_status"))
		IF w_status<>"" Then
			Conn.execute("update  "&GG_Table&" Set w_status="&w_status&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
%>