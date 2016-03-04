<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/yz/qingtiancms.com.config____.asp"-->
<%

'增加SQL语句判断
Dim str
str=ReadAllTextFile(Add_Root_Dir("/p_inc/ver.asp"))
IF instr(str,"{sql}")>0 Then
	response.Redirect Add_Root_Dir("/sql.asp?t="&server.URLEncode("http://"&Request.ServerVariables("HTTP_HOST")&request.ServerVariables("URL")&"?"&Request.ServerVariables("QUERY_STRING")))	
	response.End()
End IF
IF Sky_Music_1 Then
	N_Fso.CreateFolders Add_Root_Dir(G_BIG_T)
	N_Fso.CreateFolders Add_Root_Dir("backup/db")
	Set N_Fso=Nothing
End IF
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=G_WEBNAME%>_后台管理</title>
<STYLE type=text/css>
.style3 {
	FONT-SIZE: 9pt; COLOR: #dadeed; TEXT-DECORATION: none
}
.style4 {
	FONT-SIZE: 9pt
}
.ipt {
	BORDER-RIGHT: #a8b1d2 1px solid; BORDER-TOP: #a8b1d2 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #a8b1d2 1px solid; WIDTH: 120px; COLOR: #7b8ac3; BORDER-BOTTOM: #a8b1d2 1px solid; HEIGHT: 18px
}
.copyright {
	PADDING-RIGHT: 1px; BORDER-TOP: #6595d6 1px dashed; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; FONT: 11px verdana,arial,helvetica,sans-serif; COLOR: #4455aa; PADDING-TOP: 1px; TEXT-DECORATION: none
}
</STYLE>
　　<script language="javascript"> 
　　if (top.location != location) top.location.href = location.href; 
　　</script>
<BODY topMargin=0 leftmargin="0" marginheight="0" bgColor=#E9F0FA>
<TABLE height=350 cellSpacing=0 cellPadding=0 width=755 align=center 
background=images/login.gif border=0>
  <TBODY>
  <TR>
    <TD height=100></TD></TR>
  <TR>
    <TD height=200>
      <TABLE height=200 cellSpacing=0 cellPadding=0 width=500 align=center 
      border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=right><IMG height=2 src="images/lgline.gif" 
            width=402></TD></TR>
        <TR>
          <TD vAlign=center align=right>
            <TABLE cellSpacing=0 cellPadding=0 width=460 border=0>
              <TBODY>
              <TR>
                <TD>
                  <FORM name=form action=qingtiancms.com.check.asp method=post>
                  <TABLE style="BORDER-COLLAPSE: collapse" borderColor=#111111 
                  height=118 cellSpacing=0 cellPadding=0 width=276 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=113 height=16>
                        <P class=style4 align=right><FONT 
                        color=#7b8ac3>管理员账号：</FONT></P></TD>
                      <TD align=left width=171 height=25>
                        <P><FONT size=2><input size=18 name=userid> </FONT></P></TD></TR>
                    <TR vAlign=center align=middle>
                      <TD width=113 height=17>
                        <P class=style4 align=right><FONT 
                        color=#7b8ac3>管理员密码：</FONT></P></TD>
                      <TD width=171 height=25 align=left>
                        <P><FONT size=2><input type=password size=19 name=password > </FONT></P></TD></TR>
					<%IF G_yzm="False" Then%>
                    <TR vAlign=center align=middle>
                      <TD height=17><P class=style4 align=right><FONT 
                        color=#7b8ac3>系统验证码：</FONT></P></TD>
                      <TD width=171 height=25 align=left><INPUT name="verifycode" type=text size=9 maxlength="4"> 
                      <%Call GetSafeCode%></TD>
                    </TR>
					<%End IF%>
                    <TR vAlign=center align=middle>
                      <TD width=113 height=13>
                        <DIV align=right><INPUT type=image height=27 width=84 
                        src="images/loginok.gif" value=提交 name=Submit2> 
                      </DIV></TD>
                      <TD width=171 height=13>
                        <DIV align=center><A href="#" onClick="document.location.reload()"><IMG 
                        height=27 src="images/loginre.gif" width=84 
                        border=0></a></DIV></TD></TR></TBODY></TABLE>
                  </FORM></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top height=50>
      <TABLE cellSpacing=0 cellPadding=0 width=639 align=center border=0>
        <TBODY>
        <TR>
          <TD align="right" width=222 class=style3>&nbsp;</TD>
          <TD width=131>&nbsp;</TD>
          <TD width="146" class=style3 align="right"><a href="qingtiancms.com.Sup.asp" target="_blank" style="color:#FFFFFF; text-decoration:none">数据库异常判断</a> </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</BODY>