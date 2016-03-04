<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<LINK href="../css/style.css" rel=stylesheet type=text/css>
<script>
//颜色选择
function SelectColorcmdt(what,backit){
   var dEL = document.all(what);
   var sEL = document.all(backit);
   var url = "../js/color/selcolor.htm?color="+encodeURIComponent(dEL.value);
   var arr = showModalDialog(url,window,"dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no");
   if (arr) {
    dEL.value=arr;
    sEL.style.backgroundColor=arr;
    dEL.style.backgroundColor=arr;
   }
}
</script>
<%
typeid=Bint(request("typeid"))
typeid1=Bint(Request("typeid1"))
call main()
'rs1.close
set rs1=nothing
set rs=nothing
conn.close
set conn=nothing
sub main()
%>
 <%
           if request("action") ="add_class_2" then 
              call add_class_2()
           elseif request("action")="add_class_2_ok" then
              call add_class_2_ok()
           elseif request("action")="edit_class_2" then
              call edit_class_2()
           elseif request("action")="savedit_2" then
              call savedit_2()
           elseif request("action")="del_class_2" then
              call del_class_2()
		  
           else
              call linkinfo()
           end if
           %> 


<%
end sub
sub add_class_2()
%> 
<SCRIPT language=javascript>
function FORM1_onsubmit()
{
 if(document.FORM1.class_name.value.length<1)
 {
   alert("您必须输入类别名称!");
   document.FORM1.class_name.focus();
   return false;
 }
}
</SCRIPT> 
<FORM name=FORM1 onSubmit="return FORM1_onsubmit()" action=class_ok2.asp?action=add_class_2_ok&typeid=<%=typeid%> method=post> 
  <TABLE width=100% border="0" align="center" cellPadding=3 cellSpacing=1 class="tableBorder"> 
    <TR> 
      <Th colSpan=2 height="28" class="tableHeaderText">添加二级类别</Th> 
    </TR> 
    <TR> 
      <TD width=28% height=25 class="forumRowHighlight" align=right><b>要添加的二级类别：</b><font color="#FF0000">*</font></TD> 
      <TD width=72% height=25 class="forumRowHighlight">
	  <INPUT maxLength=16 size=25 name=class_name>
	  <input name="typecolor" type=text id="A1"  size=8  >
	  <img border=0 src="../js/color/rect.gif" width=18 style="cursor:hand" id=As_1 onClick="SelectColorcmdt('A1','As_1')">		  
	  </TD> 
    </TR> 
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别别名：</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=16 size=25 name=class_name2> 
      前台显示此名优先 </TD> 
    </TR>
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>改类别所在的模版路径：</b></TD> 
      <TD  height=25 class="forumRowHighlight"><INPUT maxLength=200 size=25 name=class_url>  请把模版放在 /template/<%=G_moban%>/<%=G_moban_html%>/下
</TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>类别超级连接地址名字：</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=200 size=25 name=typehttpurl>  比如：game、movie等，留空则自动拼音命名
</TD> 
    </TR>
    <tr> 
      <td width="23%" class="forumRowHighlight" align=right><b>该类别外部http地址：</b></td> 
      <td width="77%" class="forumRowHighlight"> <input type="text" name="typehttpurl2" size='40' value=""> 优先级别最高 比如：http://www.qingtiandy.cn</td> 
    </tr>	
	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别标题：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typeTitle" cols="35" rows="5"></textarea></TD> 
    </TR> 			
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别关键词：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent" cols="35" rows="5"></textarea></TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别描述：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typedes" cols="35" rows="5"></textarea></TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19号模板专用代码(上)：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19_top" cols="35" rows="5"></textarea></TD> 
    </TR>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19号模板专用代码(下)：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19" cols="35" rows="5"></textarea></TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>类别编号：</b></TD> 
      <TD height=25 class="forumRowHighlight"><input name="typeno" size="25" value="100"/>（只能填数字：数字越小，显示越前面）</TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>是否显示：</b></TD> 
      <TD height=25 class="forumRowHighlight">
	  <select name="typehide">
	  <option value="0">隐藏</option>
	  <option value="1" selected="selected">显示</option>
	  </select>
	  </TD> 
    </TR> 	
    <TR> 
      <TD colSpan=2 height="27" align=center class="forumRowHighlight"> <INPUT type=submit value='确 定 添 加' name=Submit2> </TD> 
    </TR> 
  </TABLE> 
</FORM> 
<%
end sub
sub edit_class_2()
    set rs=server.createobject("adodb.recordset")
    sqltext="select * from qingtiandh_type2 where typeid="+Cstr(request("id"))
    rs.open sqltext,conn,1,1
%> 
<form name=form1 action="class_ok2.asp?action=savedit_2" method=post> 
  <input type=hidden name=id value="<%=Cstr(request("id"))%>"> 
  <input type="hidden" name="ref" value="<%=Request.ServerVariables("HTTP_REFERER")%>" />
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableBorder"> 
    <TR> 
      <Th colSpan=2 height="28" class="tableHeaderText">修改影片二级信息类别</Th> 
    </TR> 
    <tr> 
      <td width="29%" class="forumRowHighlight" align=right><b>要修改的二级类别类别：</b><font color="#FF0000">*</font></td> 
      <td width="71%" class="forumRowHighlight"> 
	  <input type="text" name="class_2_name" size='40' value="<%=server.HTMLEncode(rs("typename"))%>"> 
	  <input name="typecolor" type=text id="A1"  size=8  value="<%=rs("typecolor")%>">
	  <img border=0 src="../js/color/rect.gif" width=18 style="cursor:hand; background-color:<%=rs("typecolor")%>" id=As_1 onClick="SelectColorcmdt('A1','As_1')">	  
	  </td> 
    </tr> 
    <tr> 
      <td class="forumRowHighlight" align=right><b>要修改的类别别名：</b></td> 
      <td class="forumRowHighlight"> <input type="text" name="class_1_name2" size='40' value="<%=server.HTMLEncode(rs("typename2"))%>"> </td> 
    </tr> 
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>改类别所在的模版路径：</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=200 size=40 name=class_url value="<%=rs("typeurl")%>">  请把模版放在 /template/<%=G_moban%>/<%=G_moban_html%>/下
</TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>类别超级连接地址名字：</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=200 size=25 name=typehttpurl value="<%=rs("typehttpurl")%>">  比如：game、movie等，留空则自动拼音命名
</TD> 
    </TR>	
    <tr> 
      <td class="forumRowHighlight" align=right><b>该类别外部http地址：</b></td> 
      <td class="forumRowHighlight"> <input type="text" name="typehttpurl2" size='40' value="<%=rs("typehttpurl2")%>"> 优先级别最高 比如：http://www.qingtiandy.cn</td> 
    </tr>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别标题：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typeTitle" cols="35" rows="5"><%=rs("typeTitle")%></textarea></TD> 
    </TR> 			
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别关键词：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent" cols="35" rows="5"><%=rs("typecontent")%></textarea></TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>要添加的类别描述：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typedes" cols="35" rows="5"><%=rs("typedes")%></textarea></TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19号模板专用代码(上)：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19_top" cols="35" rows="5"><%=rs("typecontent_19_top")%></textarea></TD> 
    </TR>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19号模板专用代码(下)：</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19" cols="35" rows="5"><%=rs("typecontent_19")%></textarea></TD> 
    </TR>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>类别编号：</b></TD> 
      <TD height=25 class="forumRowHighlight"><input name="typeno" size="25" value="<%=rs("typeno")%>"/>（只能填数字：数字越小，显示越前面）</TD> 
    </TR> 
    <TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>是否显示：</b></TD> 
      <TD height=25 class="forumRowHighlight">
	  <select name="typehide">
	  <option value="0" <%IF rs("typehide")=0 Then response.Write "selected" %>>隐藏</option>
	  <option value="1" <%IF rs("typehide")=1 Then response.Write "selected" %> >显示</option>
	  </select>
	  </TD> 
    </TR>	
    <tr> 
      <td height="30" colspan="2" class="forumRowHighlight" align="center"> <input type="submit" name="Submit" value="确 定 修 改"> </td> 
    </tr> 
  </table> 
</form> 
<%
rs.close
set rs=nothing
end sub
sub savedit_2()
    set rs= server.createobject ("adodb.recordset")
    sql = "select * from qingtiandh_type2 where typeid="+Cstr(request("id"))
    rs.Open sql,conn,1,3
    if rs.eof and rs.bof then
       body=body+"<br>"+"错误，数据库操作错误，没有找到此条信息。"
    else
       rs("typename")=Trim(Request.Form ("class_2_name"))
	   rs("typecontent")=request.Form("typecontent")
	   rs("typeno")=request.Form("typeno")
	   rs("typehide")=request.Form("typehide")
	   rs("typename2")=Trim(Request.Form ("class_1_name2"))
	   rs("typeurl")=Trim(Request.Form ("class_url"))
	   rs("typehttpurl")=Trim(Request.Form ("typehttpurl"))
	   rs("typehttpurl2")=Trim(Request.Form ("typehttpurl2"))
	   rs("typecolor")=Trim(Request.Form ("typecolor"))
	   rs("typeTitle")=Trim(Request.Form ("typeTitle"))
	   rs("typedes")=Trim(Request.Form ("typedes"))
	   rs("typecontent_19")=Trim(Request.Form ("typecontent_19"))
	   rs("typecontent_19_top")=Trim(Request.Form ("typecontent_19_top"))
       rs.Update
	   InsertInd Cadmin,rs("typeid"),"qingtiandh_type2","typeid"
	   'conn.execute("update qingtiandh_List set m_look="&cint(request.Form("typehide"))&" where m_type2="&Cint(request("id"))&"")
    end if 
	InsertInd Cadmin,rs("typeid"),"qingtiandh_type2","typeid"
response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>影片信息类别管理</TH>"
response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>类别修改成功！</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp?typeid='>&lt;&lt; 返回类别列表</a></td>"
response.write"</tr>"
response.write"</table>"
Response.Write "<script language=javascript>location.href='"&Request("ref")&"';</script>"
end sub

sub del_class_2()
	Dim del_typeid:del_typeid=Replace(request("id"), "'", "''")
	'删除导航
	Del_Mlist2 del_typeid
	response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
	response.write"<TR>"
	response.write"<TH class=tableHeaderText colSpan=2 height=25>影片类别管理</TH>"
	response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>类别删除成功！</div></td></tr>"
	response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; 返回类别列表</a></td>"
	response.write"</tr>"
	response.write"</table><br>" 
	Response.Write "<script language=javascript>location.href='type.asp';</script>"
	IF err<>0 Then
		Response.Redirect("../qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode("删除电影失败")&"&ErrorUrl=")
		response.End()
	End IF
end sub

sub add_class_2_ok()
    set rs=server.createobject("adodb.recordset")
    sqltext="select * from qingtiandh_type2 where typename='"&request.form("class_name")&"' and typeid1="&typeid
    rs.open sqltext,conn,1,1
    '查找数据库，检查大类是否已经存在
    if rs.recordcount >= 1 then 
       if rs("typename")=Replace_Text(request.form("class_name")) then
          response.write"<SCRIPT language=JavaScript>alert('此类别已经存在，请选用其它名称！');"
          response.write"this.location.href='class_ok2.asp?action=add_class_2&typeid="&typeid&"';</SCRIPT>"
       end if
    else
       set rs=server.createobject("adodb.recordset")
       sqltext="select * from qingtiandh_type2"
       rs.open sqltext,conn,1,3
       rs.addnew
       rs("typename")=Trim(request.form("class_name"))
	   rs("typecontent")=request.Form("typecontent")
	   rs("typeno")=request.Form("typeno")
	   rs("typehide")=request.Form("typehide")
	   rs("typename2")=Trim(request.form("class_name2"))
	   rs("typeurl")=Trim(Request.Form ("class_url"))
	   rs("typehttpurl")=Trim(Request.Form ("typehttpurl"))
	   rs("typehttpurl2")=Trim(Request.Form ("typehttpurl2"))
	   rs("typecolor")=Trim(Request.Form ("typecolor"))
	   rs("typeid1")=typeid
	   rs("typeTitle")=Trim(Request.Form ("typeTitle"))
	   rs("typedes")=Trim(Request.Form ("typedes"))	  
	   rs("typecontent_19")=Trim(Request.Form ("typecontent_19"))	 
	   rs("typecontent_19_top")=Trim(Request.Form ("typecontent_19_top"))
       rs.update
	   InsertInd Cadmin,rs("typeid"),"qingtiandh_type2","typeid"
		response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
		response.write"<TR>"
		response.write"<TH class=tableHeaderText colSpan=2 height=25>影片二级类别管理</TH>"
		response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>影片二级信息类别成功！</div></td></tr>"
		response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; 返回类别列表</a></td>"
		response.write"</tr>"
		response.write"</table>"
		Response.Write "<script language=javascript>location.href='type.asp';</script>"
		end if
		
end sub
%> 