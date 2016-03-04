<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->
<LINK href="css/style.css" rel=stylesheet type=text/css>
<script>
 var sett;
 var i=1;
function $(id){return document.getElementById(id)}
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){
if (i%2==1)
	clearTimeout(sett)
else
	scrollWindow();
	i++;
}
document.ondblclick=scrollWindow2;
</script>
<%
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
Server.ScriptTimeOut=9999999

t3=Trim(request("t3")) '



IF t3<>"ok" Then

%>
<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
<form action="?t3=ok" method="post" name="form1">
<input name="t1" value="1" type="hidden">
	<tr> 
		<th class="tableHeaderText" height=25 colspan="2">网址导航类别转化</th>
	</tr>
	<tr>
		<td width="81%" class=forumRowHighlight style="line-height:25px">
		源类别：
		<select name="type1" id="type1">
		<option value="0"> > 请选择</option>
		<%
		
	
			pStr=""
			Set oRs=Conn.Execute("Select * From qingtiandh_type1 Order By typeno Asc, typeid Desc")
			
			
			Do While Not oRs.Eof
				otypeid=oRs("typeid")
				otypename=oRs("typename")
				pStr=pStr&"<optgroup label='"&otypename&"'>"
				Set oRs2=Conn.Execute("Select * from qingtiandh_type2 Where typeid1="&otypeid&" Order By typeno Asc, typeid Desc")
				Do WHile Not oRs2.Eof
					otypeid2=oRs2("typeid")
					otypename2=oRs2("typename")					
					pStr=pStr&"<option value='"&otypeid2&"'>"&otypename2&"</option>"
					oRs2.MoveNext
				Loop				
				pStr=pStr&"</optgroup>"
				oRs.MoveNext
				
			Loop
			oRs.close
			Response.Write pStr
			
				
		%>
		</select>
		目标类别下：
		<select name="ntype1" id="ntype1">
		<option value="0"> > 请选择</option>
		<%
			pStr=""
			Set oRs=Conn.Execute("Select * From qingtiandh_type1 Order By typeno Asc, typeid Desc")
			Do While Not oRs.Eof
				otypeid=oRs("typeid")
				otypename=oRs("typename")
				pStr=pStr&"<option value='"&otypeid&"'>"&otypename				
				pStr=pStr&"</option>"
				oRs.MoveNext
			Loop
			oRs.close
			Response.Write pStr
		%>
		</select>	
		<input type="submit" name="s" value="提交" />
		源类别的网址全部转入目标类别，同时删除源类别
		</td>
	</tr>
</form>	
</table>
<%
	Response.End()
End IF


IF t3="ok" Then
	ptype1=Bint(Request("type1"))'源 
	pntype1=Bint(Request("ntype1"))'目标
	IF ptype1=0 or pntype1=0 Then
		Response.Redirect "qingtian"&"cms.com...asp"
	Else
		Conn.Execute("Update qingtiandh_type3 Set typeid1="&pntype1&" Where Typeid2="&ptype1)
		Conn.Execute("Update qingtiandh_type2 Set typeid1="&pntype1&" Where Typeid="&ptype1)
		Conn.Execute("Update qingtiandh_List Set m_type1="&pntype1&"  Where m_type2="&ptype1)
		Response.Write "<script>alert('移动成功')</script>"
		Response.Redirect "qingtia"&"ncms.com...asp"
	End IF
End IF
%>