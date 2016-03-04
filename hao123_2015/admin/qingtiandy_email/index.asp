<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%

IF Request.Form("editInfo")="editInfo" Then
	str=""
	str=str&"<mailserver>"&Request.Form("mailserver")&"</mailserver>"
	str=str&"<mailserverloginname>"&Request.Form("mailserverloginname")&"</mailserverloginname>"
	str=str&"<mailserverloginpass>"&Request.Form("mailserverloginpass")&"</mailserverloginpass>"
	str=str&"<mailuserdomain>"&Request.Form("mailuserdomain")&"</mailuserdomain>"
	str=str&"<frommail>"&Request.Form("frommail")&"</frommail>"
	str=str&"<fromname>"&Request.Form("fromname")&"</fromname>"
	str=str&"<PSubject>"&Request.Form("PSubject")&"</PSubject>"
	str=str&"<PAddRecipient>"&Request.Form("PAddRecipient")&"</PAddRecipient>"
	str=str&"<PBody>"&Request.Form("PBody")&"</PBody>"
	str=str&"<PSubjectZc>"&Request.Form("PSubjectZc")&"</PSubjectZc>"
	str=str&"<PBodyZc>"&Request.Form("PBodyZc")&"</PBodyZc>"
	N_Fso.CreateFolderFile Add_Root_Dir("p_inc/tag/email.config"),str
	Response.Write "<script>alert('保存成功');window.location='index.asp'</script>"
Else
	str=N_Fso.ReadAllTextFile(Add_Root_Dir("p_inc/tag/email.config"))
	mailserver=GetContent(str,"<mailserver>","</mailserver>",0)
	mailserverloginname=GetContent(str,"<mailserverloginname>","</mailserverloginname>",0)
	mailserverloginpass=GetContent(str,"<mailserverloginpass>","</mailserverloginpass>",0)
	mailuserdomain=GetContent(str,"<mailuserdomain>","</mailuserdomain>",0)
	frommail=GetContent(str,"<frommail>","</frommail>",0)
	fromname=GetContent(str,"<fromname>","</fromname>",0)
	PSubject=GetContent(str,"<PSubject>","</PSubject>",0)
	PAddRecipient=GetContent(str,"<PAddRecipient>","</PAddRecipient>",0)
	PBody=GetContent(str,"<PBody>","</PBody>",0)
	PSubjectZc=GetContent(str,"<PSubjectZc>","</PSubjectZc>",0)
	PBodyZc=GetContent(str,"<PBodyZc>","</PBodyZc>",0)
End IF	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>邮件基本参数设置</title>
<script src="../js/mouse_on_title.js"></script>
<script language="JavaScript1.4" type="text/javascript">
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
function checkadd(){
	if(document.myform.mailserver.value==""){
		alert("请填写发件邮箱smtp")
		document.myform.mailserver.focus()
		return false
	}
	if(document.myform.mailserverloginname.value==""){
		alert("请填写发件邮箱用户名")
		document.myform.mailserverloginname.focus()
		return false
	}
	if(document.myform.mailserverloginpass.value==""){
		alert("请填写发件邮箱密码")
		document.myform.mailserverloginpass.focus()
		return false
	}	
	if(document.myform.mailuserdomain.value==""){
		alert("请填写发件邮箱的域")
		document.myform.mailuserdomain.focus()
		return false
	}	
	if(document.myform.frommail.value==""){
		alert("请填写发件邮箱")
		document.myform.frommail.focus()
		return false
	}	
	if(document.myform.fromname.value==""){
		alert("请填写发件人姓名")
		document.myform.fromname.focus()
		return false
	}	
	if(document.myform.PAddRecipient.value==""){
		alert("请填写测试收件邮箱")
		document.myform.PAddRecipient.focus()
		return false
	}		
	if(document.myform.PSubject.value==""){
		alert("请填写密码找回标题")
		document.myform.PSubject.focus()
		return false
	}	
	if(document.myform.PBody.value==""){
		alert("请填写密码找回内容")
		document.myform.PBody.focus()
		return false
	}	
	if(document.myform.PSubjectZc.value==""){
		alert("请填写注册账号标题")
		document.myform.PSubjectZc.focus()
		return false
	}	
	if(document.myform.PBodyZc.value==""){
		alert("请填写账号激活内容")
		document.myform.PBodyZc.focus()
		return false
	}			
	document.myform.submit();	
}

</script>
</head>

<body>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25  class="tableHeaderText">邮件服务器设置</th> 
		<th class="tableHeaderText"></th> 
	</tr> 
	<form method="POST" action="index.asp" name="myform">
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b><font color="#FF0000">友情提示：</font></b></TD> 
		<TD class="Forumrow">
			<font color="#FF0000">此功能主要用户前台注册用户忘记密码通过Email找回密码.</font>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b><font color="#FF0000"></font></b></TD> 
		<TD class="Forumrow">
			<font color="#FF0000">由于要填写您已经有的邮箱用户名和密码，建议注册163的邮箱，去新注册一个.</font>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b><font color="#FF0000"></font></b></TD> 
		<TD class="Forumrow">
		<%IF IsObjInstalled("JMail.SMTPMail") Then%>
			<!--<font color="#0000FF">已经填写好了，点这里测试.</font>-->
		<%Else%>
			<font color="#FF0000">你的服务器不支持JMail组件，无法使用此功能.</font>
		<%End IF%>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>发件邮箱smtp： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailserver" class="smallInput" size="30"  id="mailserver" value="<%=mailserver%>">
			建议申请163的邮件，比如163的邮箱smtp是:<b>smtp.163.com</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>发件邮箱用户名： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailserverloginname" class="smallInput" size="30"  id="mailserverloginname" value="<%=mailserverloginname%>">
			就是你注册163邮箱的时候，那个用户名，比如<b>test001</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>发件邮箱密码： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailserverloginpass" class="smallInput" size="30"  id="mailserverloginpass" value="<%=mailserverloginpass%>">
			就是你注册163邮箱的时候，那个邮箱密码，比如<b>mailserverloginpass</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>发件邮箱的域： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailuserdomain" class="smallInput" size="30"  id="mailuserdomain" value="<%=mailuserdomain%>">
			比如你是在163.com网站申请的，那就填写<b>163.com</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>发件邮箱： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="frommail" class="smallInput" size="30"  id="frommail" value="<%=frommail%>">
			就是你注册163邮箱的时候，那个带@163.com的邮件,比如<b>test001@163.com</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>发件人姓名： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="fromname" class="smallInput" size="30"  id="fromname" value="<%=fromname%>">
			人家收到邮件时候，发件人姓名那里显示，比如<b>晴天导航</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>测试收件邮箱： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="PAddRecipient" class="smallInput" size="30"  id="PAddRecipient" value="<%=PAddRecipient%>">
			做测试的接受邮箱，比如<b>123456@qq.com</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>密码找回标题： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="PSubject" class="smallInput" size="30"  id="PSubject" value="<%=PSubject%>">
			发件的标题，比如<b>晴天导航密码找回提示</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" ><b>密码找回内容： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
		<textarea cols="90" rows="14" name="PBody" id="PBody"><%=PBody%></textarea>
		<br />
		比如：<b>您在qingtiandy.cn上注册的用户名是：{u}，密码是：{p}</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>注册账号标题： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="PSubjectZc" class="smallInput" size="30"  id="PSubjectZc" value="<%=PSubjectZc%>">
			发件的标题，比如<b>晴天导航账号激活</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" ><b>账号激活内容： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
		<textarea cols="90" rows="14" name="PBodyZc" id="PBodyZc"><%=PBodyZc%></textarea>
		<br />
		比如：<b>您在晴天导航网上注册的账号激活链接：{href}，如果链接无法打开，请直接把链接地址复制到地址栏打开</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="right" class="Forumrow" ></TD> 
		<TD class="Forumrow">
		<input type="hidden" value="editInfo" name="editInfo">
		<input type="button" value="编辑" name="addok" onClick="checkadd()">&nbsp;&nbsp;
		<input type="reset" value="清除" name="addreset">&nbsp;&nbsp;
		</TD> 
	</TR>	
				
	</form>
</TABLE>	
</body>
</html>