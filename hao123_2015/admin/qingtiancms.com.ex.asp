<!--#include file="../p_inc/Include_func.asp"-->
<%
response.Cookies(Sky_Admin_Cookies_1)("admin_u")=""
response.Cookies(Sky_Admin_Cookies_1)("admin_p")=""
response.Cookies(Sky_Admin_Cookies_1)("admin_m")=""
response.Redirect ("login.asp")
%>