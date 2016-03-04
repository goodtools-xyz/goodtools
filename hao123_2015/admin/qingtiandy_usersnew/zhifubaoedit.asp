<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"支付宝黑名单列表" '标题
	GG_Table				=	"qingtiandh_zhifubaopb"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"zhifubao.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			'删除类别
			conn.Execute("Delete From qingtiandh_zhifubaopb Where id="&fId2(id0))
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	

	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		ssoojs_u_content=Replace_Text_Html(ReplaceTextArea(Request.Form("soojs_u_content")))
		ssoojs_u_alipay=Replace_Text_2008(Request.Form("soojs_u_alipay"))
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE id=" & sID
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where soojs_u_alipay = '"& ssoojs_u_alipay &"'")
				If Not Rs1.Eof Then
					doAlert "该支付宝账号已经存在！" , "javascript:history.back(-1);"
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing
				.Fields.Item("soojs_time").Value=FormatDate(now,55)'注册时间
			Else
			
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where (soojs_u_alipay = '"& ssoojs_u_alipay &"') And id<>"&sID)
				If Not Rs1.Eof Then
					doAlert "该支付宝账号已经存在！" , "javascript:history.back(-1);"
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End IF		
			.Fields.Item("soojs_u_alipay").Value=ssoojs_u_alipay
			.Fields.Item("soojs_u_content").Value=ssoojs_u_content
			.Update()
			'Response.Redirect st_str&server.URLEncode("?id="&.Fields.Item("id").Value&"&r_l_type1="&sl_type1&"&r_l_group="&sl_group&"&r_l_list="&sl_list)
			IF ref="" Then ref=	"zhifubao.asp"
			doAlert "" , TurnBackPage(Request.Form("Ref"),"zhifubao.asp")
			Response.End()				
		End With			
	End IF	
	
	am_type1=Bint(Request("m_type1"))
	am_type2=Bint(Request("m_type2"))
	am_type3=Bint(Request("m_type3"))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title><%=G_WebName%> - <%=GG_Title%>添加/编辑</title>
<script language="javascript" src="../js/p_js.js"></script>
<script type="text/javascript" src="FormCity.js"></script>
<script type="text/javascript" src="FormScript.js"></script>
<script>
function checkadd(){
	if($("soojs_u_alipay").value.Trim()==""){
		alert("请填写支付宝账号！")
		$("soojs_u_alipay").focus()
		return false
	}		
}

</script>
</head>
<body>
<iframe name="check_id_1" id="check_id_1" width="0" height="0" src="_blank" style="display:none"></iframe>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<form method="POST" action="" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<tr> 
	  	<th height=25 class="tableHeaderText" colspan="2">支付宝屏蔽</th> 
	</tr> 	
	<TR> 
		<TD align="left" class="Forumrow"><b>支付宝帐号： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_alipay" class="smallInput" size="50"  id="soojs_u_alipay">
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>备注： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="70" rows="8" name="soojs_u_content" id="soojs_u_content"></textarea>
		</TD> 
	</TR>						
	<TR> 
		<TD align="left" class="Forumrow" width="200"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="提交" name="submit_b" id="submit_b">
		  <input type="button" value="返回列表页" name="submit_c" id="submit_c" onClick="window.location='./index.asp'">		</TD> 
	</TR>		
	</form>
</TABLE>

<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		
		Set rsObj = Server.CreateObject(G_Rs)
		rsObj.open "SELECT * FROM "&GG_Table&" WHERE id=" & sId,conn,1,1
		If not rsObj.Eof Then 
			WriteLn("		soojs_u_alipay.value='" & Str4Js(rsObj.Fields.Item("soojs_u_alipay").Value) & "';")
			WriteLn("		soojs_u_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("soojs_u_content").Value))) & "';")
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
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