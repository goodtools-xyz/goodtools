<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>积分明细</title>
<script src="../js/mouse_on_title.js"></script>
<script src="../js/p_js.js"></script>
<link id="css" href="../inc/moni/dv_wnd.css" type="text/css" rel="stylesheet">
<script language="javascript" src="../inc/moni/dv_wnd.js" type="text/javascript"></script>
<script>
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//获得数组
    var argc = setCookie.arguments.length;//获得数组的长度
    var expires = (argc > 2) ? argv[2] : 1;//可伸长变量
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //把传过来得变量变成天数
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
}

</script>
</head>
<body>
<%
	
	s_page=""
	IF request.Cookies("page_n")="" then
		msg_per_page=20
	else
		msg_per_page=Cint(request.Cookies("page_n"))
	end if
	kSql_where="id>0"
	kSql_order="id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	sa=Bint(Request("a"))
	
	
	IF G_IS_SQL_User_DB="1" Then
		kSql_where=kSql_where&" and datediff(day,Utime,getdate())<="&sa
	Else
		kSql_where=kSql_where&" and datediff('d',Utime,'"&now()&"')<="&sa
	End IF	
	
	sql="Select Uid,Sum(Ujifen),Uip from qingtiandy_jifen_ip Where "&kSql_where&" group by uip,uid order by 2 desc"
	
	'Response.Write sql
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page=""
%>

<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>用户管理选项</th>
	</tr>
	
	<tr> 
		<td width="12%" height=25 class="forumRowHighlight">
		用户ID:<%=sId%>
		</td>
	  <td width="88%" height=25 class="forumRowHighlight">
	  [<a href="editindex4.asp?a=0">今日积分</a>]
	  [<a href="editindex4.asp?a=1">昨日积分</a>]	
	  [<a href="editindex4.asp?a=2">近2天</a>]
	  [<a href="editindex4.asp?a=3">近3天</a>]
	  [<a href="editindex4.asp?a=4">近4天</a>]
	  [<a href="editindex4.asp?a=5">近5天</a>]
	  [<a href="editindex4.asp?a=6">近6天</a>]
	  [<a href="editindex4.asp?a=7">近7天</a>]
	  [<a href="editindex4.asp?a=14">近两周</a>] 
	   [<a href="editindex4.asp?a=30">近一个月</a>] 	      	    
	  </td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">用户积分排序</font></a></th>	
        <th width="12%" height=25 class="tableHeaderText" align="right">
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='index.asp'">
	<option value="">请选择页数</option>
	<option value="10">10</option>
	<option value="15">15</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="100">100</option>
	<option value="200">200</option>
	<option value="300">300</option>
	<option value="500">500</option>
	</select>		
	  </th>
	<tr> 
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" cellpadding="0" cellspacing="1">
			<TR height=25>			
				<TD width="23%"   class=bodytitle><font color="#CC3300"><b>IP</b></font></TD>
				<TD width="24%"   class=bodytitle><font color="#CC3300"><b>用户ID </b></font></TD>
				<TD width="46%"    class=bodytitle><font color="#CC3300"><b>积分</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle>&nbsp;</td>
			</TR>					
			<%
			do while not rs.eof and rowcount > 0
			%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=rs(2)%></td>
			<td nowrap="nowrap" class="forumRow"><a href="../qingtiandy_jifen_product/uindexzhifu_form.asp?id=<%=rs(0)%>" target="_blank"><%=rs(0)%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=rs(1)%></td>
			<TD  align="center" class=forumRow>&nbsp;</td>
			</tr>		
<%
	icolor=icolor+1
	if icolor>1 then icolor=0
	rowcount=rowcount-1
	rs.moveNext()
	Loop
	
%>						
			</TABLE>	
		</td>
	</tr>
	<tr align="center">
		<td class="forumrowHighLight" colspan="2"><%=listPages(s_page)%></td>
	</tr>	
</table>
</Form>


</body>
</html>