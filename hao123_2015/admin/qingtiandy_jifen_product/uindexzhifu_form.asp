<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
id=Bint(Request("id"))
Set oRs=Conn.Execute("Select * From soojs_un Where id="&id)
IF Not oRs.Eof Then
	u=oRs("soojs_u_email")
	p=oRs("soojs_u_pass")
End IF
%>
<form method="post" action="../../members/regok.asp" style="border-top:1px #bfbfbf solid; padding-top:5px;" name="form1">
	<input type="hidden" name="Back_url" value="j_list_1.asp" />
	<input type="hidden" name="action" value="login"/>
	<input type="hidden" name="alt" value="a"/>
	<input type="text" tabindex="1" class="input-text" id="soojs_u_email" name="soojs_u_email" value="<%=u%>" maxlength="60" />
	<input  type="password" tabindex="2" class="input-text" id="soojs_u_pass"  name="soojs_u_pass" maxlength="20" value="<%=p%>" />
	<input type="submit" tabindex="5"  class="button btn-blue mr5" value="µÇÂ¼" />
</form>
<script>form1.submit()</script>