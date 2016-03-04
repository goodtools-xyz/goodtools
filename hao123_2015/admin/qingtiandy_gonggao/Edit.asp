<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%

	'=============================通用全局变量设置开始==============================
	GG_Power_Add			= "" '添加权限
	GG_Power_Edit			= "" '修改权限
	GG_Power_Del			= "" '删除权限
	GG_Table				= "[qingtiandy_gonggao]" '表名 
	GG_Title				= "公告管理" '标题
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	ref=Request.ServerVariables("HTTP_REFERER")	
	'//---- 编辑记录 ----//'
	If  Request.Form("editInfo")="editInfo" Then
		sID 			=	Bint(sID)
		sn_title		=	Replace_Text(Request.Form("n_title"))
		sn_color		=	Replace_Text(Request.Form("n_color"))
		sn_type1 		=	Bint(Request.Form("n_type1"))
		sn_look 		=	Bint(Request.Form("n_look"))		
		sn_hits 		=	Bint(Request.Form("n_hits"))
		sn_numb 		=	Bint(Request.Form("n_numb"))		
		sn_date			=	Replace_Text(Request.Form("n_date"))		
		sn_gotourl		=	Replace_Text(Request.Form("n_gotourl"))
		sn_content		=	Request.Form("n_content")	
		Set rsObj = Server.CreateObject("ADODB.Recordset")
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE ID=" & sID
			.ActiveConnection = Conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				.Fields.Item("n_date").Value= FormatDate(sn_date,55)
			End If
			.Fields.Item("n_title").Value			= sn_title
			.Fields.Item("n_color").Value			= sn_color
			.Fields.Item("n_type1").Value			= sn_type1
			.Fields.Item("n_look").Value			= sn_look
			.Fields.Item("n_hits").Value			= sn_hits
			.Fields.Item("n_numb").Value			= sn_numb
			.Fields.Item("n_date").Value			= sn_date
			.Fields.Item("n_gotourl").Value			= sn_gotourl
			.Fields.Item("n_content").Value			= sn_content
			.Update()					
			kku="index.asp"
			Response.Write "<script>window.location='"&kku&"'</script>"
		End With
	End iF
	If CLng(sId)>0 Then
		Set rsObj2 = Conn.Execute( "SELECT * FROM "&GG_Table&" WHERE Id=" & sId )
		IF Not rsObj2.Eof Then
			oom_content=rsObj2("n_content")
		End IF
	End If	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>全部公告管理</title>
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
	if(document.myform.n_title.value==""){
		alert("请填写公告标题")
		document.myform.n_title.focus()
		return false
	}
	if(document.myform.n_date.value==""){
		alert("请填写发布日期")
		document.myform.n_date.focus()
		return false
	}
	get_html_editer_value("n_content","Editor")
	document.myform.submit();	
}
 function get_html_editer_value(content,editor){
     document.getElementById(content).value = window.frames[editor].HtmlEditor.document.getElementsByTagName('BODY')[0].innerHTML;//Editor为柜架名,p_note为文本框
}
</script>
</head>

<body>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25 colspan="2" class="tableHeaderText">添加公告信息</th> 
	</tr> 
	<form method="POST" action="edit.asp" name="myform">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="id" value="<%=sId%>">
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>公告标题： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="n_title" class="smallInput" size="50"  id="n_title">
			颜色：
		  <input name="n_color" type=text id="A1"  size=8  >
		<img border=0 src="../js/color/rect.gif" width=18 style="cursor:hand" id=As_1 onClick="SelectColorcmdt('A1','As_1')">
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" ><b>是否有效： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="n_look" value="1"  checked="checked"/>是
		<input type="radio" name="n_look" value="0"/>否
		</TD> 
	</TR>
	<!--		
	<TR> 
		<TD align="left" class="Forumrow" ><b>超级链接网址： </b></TD> 
		<TD colspan="3" class="Forumrow">
			<input type="text" name="n_gotourl" class="smallInput" size="40"  id="n_gotourl" value="">	一旦这个不为空的时候，就此地址优先，格式如：http://qingtiandy.cn/	
		</TD> 
	</TR>
	-->	
	<TR> 
		<TD align="left" class="Forumrow" ><b>主要内容： </b></TD> 
		<TD class="Forumrow">
		<textarea cols="90" rows="14" name="n_content" id="n_content" style="display:none"><%=oom_content%></textarea>
		<iframe ID="Editor" name="Editor" src="../../QingTianEditor/index.html?ID=n_content" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:300px;width:575px"></iframe>
		
		<br />
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>点击数： </b></TD> 
		<TD class="Forumrow">
		<input name="n_hits" id="n_hits" value="0" />	
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>权重： </b></TD> 
		<TD class="Forumrow">
		<input name="n_numb" id="n_numb" value="0" />	数字越大，显示越前面
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>发布日期： </b></TD> 
		<TD class="Forumrow">
		<input name="n_date" id="n_date" value="<%=ForMatdate(now(),55)%>" />	
		</TD> 
	</TR>	
	<TR> 
		<TD align="right" class="Forumrow" ></TD> 
		<TD class="Forumrow">
		<input type="hidden" value="editInfo" name="editInfo">
		<input type="button" value="添加" name="addok" onClick="checkadd()">&nbsp;&nbsp;
		<input type="reset" value="清除" name="addreset">&nbsp;&nbsp;
		</TD> 
	</TR>	
				
	</form>
</TABLE>	
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		Set rsObj = Conn.Execute( "SELECT * FROM "&GG_Table&" WHERE Id=" & sId )
		If not rsObj.Eof Then 
			WriteLn("		n_title.value='" & Str4Js(rsObj.Fields.Item("n_title").Value) & "';")
			WriteLn("		n_color.value='" & Str4Js(rsObj.Fields.Item("n_color").Value) & "';")
			WriteLn("		n_hits.value='" & Str4Js(rsObj.Fields.Item("n_hits").Value) & "';")
			WriteLn("		n_numb.value='" & Str4Js(rsObj.Fields.Item("n_numb").Value) & "';")
			WriteLn("		n_date.value='" & Str4Js(rsObj.Fields.Item("n_date").Value) & "';")
			'WriteLn("		n_gotourl.value='" & Str4Js(rsObj.Fields.Item("n_gotourl").Value) & "';")
			'WriteLn("		n_content.value='" & Str4Js(rsObj.Fields.Item("n_content").Value) & "';")		
			n_look=Str4Js(rsObj.Fields.Item("n_look").Value)
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		WriteLn(CheckBoxScript("oForm.n_look",n_look))
	End Function
</SCRIPT>

<%
	If CLng(sId)>0 Then
		ShowInfo sId
	End If
	CloseConn()
%>
</body>
</html>