<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
body{font-family: Georgia, "Times New Roman", Times, serif;}
-->
</style>
<%
'获取统计信息
Function Get_count_biao(x)
	dim rskz
	set rskz=server.createobject("adodb.recordset")
	if x=1 then '已认证
		set rskz=conn.execute("select count(*) from qingtiandy_url where w_status=1")
	else 
		if x=0 then  '未认证
			set rskz=conn.execute("select count(*) from qingtiandy_url where w_status=0")
		else
			set rskz=conn.execute("select count(*) from qingtiandy_url")
		end if
	end if
	Get_count_biao= rskz(0)
	rskz.close
	set rskz=nothing
End Function


dim TotalSite,TotalSite1,Totalinc,Totaloutc,Totalinj,Totaloutj
TotalSite = conn.execute("select count(0) from qingtiandy_url")(0)
TotalSite1 = conn.execute("select count(0) from qingtiandy_url where inc > 0")(0)
set rs = conn.execute("select sum(inc),sum(outc) from qingtiandy_url")
Totalinc = rs(0)
Totaloutc = rs(1)
set rs =nothing
set rs = conn.execute("select sum(inj),sum(outj) from qingtiandy_url")
Totalinj = rs(0)
Totaloutj = rs(1)
set rs =nothing
%>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align=center class="tableBorder">
<tr> 
    <th height=25 class="tableHeaderText" colspan="3">流量管理全局说明</th> 
  </tr>
<TR>
	<td width="33.3%">&nbsp;&nbsp;全部网站：<a href="../qingtiandy_usersweb/index.asp"><font color="#FF0000"><%=Get_count_biao("2") %></font></a></td>
    <td width="33.3%"  height=23>&nbsp;&nbsp;已认证网站：<a href="../qingtiandy_usersweb/index.asp?w_status=1"><font color="#FF0000"><%=Get_count_biao("1") %></font></a></td>
	<td width="33.3%">&nbsp;&nbsp;待认证网站：<a href="../qingtiandy_usersweb/index.asp?w_status=0"><font color="#FF0000"><%=Get_count_biao("0") %></font></a></td>
</tr>
<tr><td colspan="3" height="1" bgcolor="#cccccc"></td></tr>
<TR>
    <td height=23>&nbsp;&nbsp;注册用户：<a href="../qingtiandy_usersweb/index.asp"><font color="#FF0000"><%=TotalSite%></font></a></td>
	<td>&nbsp;&nbsp;有效用户：<font color="#FF0000"><%=TotalSite1%></font>(有点入的算有效)</td>
	<td>&nbsp;&nbsp;无效用户：<font color="#FF0000"><%=TotalSite-TotalSite1%></font></td>
	</tr>
<TR>
<tr><td colspan="3" height="1" bgcolor="#cccccc"></td></tr>
<TR>
    <td  height=23>&nbsp;&nbsp;总计来访：<font color="#FF0000"><%=Totalinc%></font></td>
	<td>&nbsp;&nbsp;总计点出：<font color="#FF0000"><%=Totaloutc%></font></td>
	<td></td>
	</tr>
<tr><td colspan="3" height="1" bgcolor="#cccccc"></td></tr>
<TR>
    <td  height=23>&nbsp;&nbsp;今天来访：<font color="#FF0000"><%=Totalinj%></font></td>
	<td>&nbsp;&nbsp;今天点出：<font color="#FF0000"><%=Totaloutj%></font></td>
	<td></td>
	</tr>
<tr><td colspan="3" height="1" bgcolor="#cccccc"></td></tr>
<TR>
    <td  height=23>&nbsp;&nbsp;今日有效入站数：<font color="#FF0000"><%=application(hxCacheName &"_IN")%></font></td>
	<td>&nbsp;&nbsp;今日无来路入站：<font color="#FF0000"><%=application(hxCacheName &"_NO")%></font></td>
	<td>&nbsp;&nbsp;今日未注册入站：<font color="#FF0000"><%=application(hxCacheName &"_NOREG")%></font></td>
	</tr>
<TR>
    <td  height=23>&nbsp;&nbsp;重复无效的入站：<font color="#FF0000"><%=application(hxCacheName &"_OLD")%></font></font></td>
	<td>&nbsp;&nbsp;今日有效出站数：<font color="#FF0000"><%=application(hxCacheName &"_OUT")%></font></font></td>
	<td></td>
	</tr>	
<tr><td colspan="3" height="1" bgcolor="#cccccc"></td></tr>

 
</table>





