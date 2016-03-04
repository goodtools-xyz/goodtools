<!--#include file="../p_Inc/Include_func.asp"-->
<!--#include file="config.inc.asp"-->
<!--#include file="qingtiancms.com.config____.asp"-->
<%
Dim qTcms_qc, url
SET qTcms_qc = New QqConnet
Session("State")=qTcms_qc.MakeRandNum()
url = qTcms_qc.GetAuthorization_Code()
Response.Redirect(url)
Set qTcms_qc=Nothing
%>