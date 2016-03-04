<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"用户收藏" '标题
	GG_Table				=	"qingtiandy_listurl"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			'删除类别
			conn.Execute("Delete From qingtiandy_listurl Where id="&fId2(id0))
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
%>
