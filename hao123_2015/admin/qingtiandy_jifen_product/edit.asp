<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"兑奖产品管理" '标题
	GG_Table				=	"qingtiandy_jifen_goods"
	
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	f=Trim(request.QueryString("f"))
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	ref=IIf(f<>"",f,ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From qingtiandy_jifen_goods Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="l_look" And sID<>"" Then
		fId=FormatNumSerial(sID)
		l_look=StayNub(request("m_look"))
		IF l_look<>"" Then
			Conn.execute("update  "&GG_Table&" Set g_look="&l_look&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		sg_jifen=Bint(Request.Form("g_jifen"))
		sg_xing=Bint(Request.Form("g_xing"))
		sg_look=Bint(Request.Form("g_look"))
		sg_name=Replace_Text_2008(Request.Form("g_name"))
		sg_pic=Replace_Text_2008(Request.Form("m_pic"))		
		sg_content=Request.Form("g_content")
		sg_time=Replace_Text_2008(Request.Form("g_time"))
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE id=" & sID
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where g_name = '"& sg_name &"'")
				If Not Rs1.Eof Then
					doAlert "该产品已经存在！" , "javascript:history.back(-1);"
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing
			Else
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where g_name = '"& sg_name &"' And id<>"&sID)
				If Not Rs1.Eof Then
					doAlert "该产品已经存在！" , "javascript:history.back(-1);"
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End IF		
			.Fields.Item("g_jifen").Value				= sg_jifen
			.Fields.Item("g_xing").Value				= sg_xing
			.Fields.Item("g_name").Value				= sg_name
			.Fields.Item("g_pic").Value					= sg_pic
			.Fields.Item("g_look").Value				= sg_look
			.Fields.Item("g_content").Value				= sg_content			
			IF sg_time<>"" Then
				.Fields.Item("g_time").Value			= ForMatDate(sg_time,55)
			End IF	
			.Update()
			'Response.Redirect st_str&server.URLEncode("?id="&.Fields.Item("id").Value&"&r_l_type1="&sl_type1&"&r_l_group="&sl_group&"&r_l_list="&sl_list)
			IF ref="" Then ref=	"index.asp"
			doAlert "" , TurnBackPage(Request.Form("Ref"),"index.asp")
			Response.End()				
		End With			
	End IF	
	
	zg_content=""
	If CLng(sId)>0 Then
		Set rsObj = Server.CreateObject(G_RS)
		rsObj.open "SELECT * FROM "&GG_Table&" WHERE id=" & sId,conn,1,1
		If not rsObj.Eof Then 	
			zg_content=rsObj("g_content")
		End IF	
		rsObj.close
	End IF
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
<script language="javascript" src="../js/calendar.js"></script>
<script>
function checkadd(){

	if($("g_name").value.Trim()==""){
		alert("请填写产品名称！")
		$("g_name").focus()
		return false
	}	
	
		
}
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
function change_m_type2(v){
	for(var i=0;i<=3;i++){
		var s="tr_m_"+i
		if($(s))
			$(s).style.display="none"
	}
	if($("tr_m_"+v))
		$("tr_m_"+v).style.display=""		
}
</script>
</head>
<body>
<iframe name="check_id_1" id="check_id_1" width="0" height="0" src="_blank" style="display:none"></iframe>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25 colspan="2" class="tableHeaderText"><%=GetDhType1(a_arrmz,am_type1,"2")%>添加/编辑</th> 
	</tr> 
	<form method="POST" action="" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>是否有效： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="g_look" value="1"  checked="checked"/>是
		<input type="radio" name="g_look" value="0"/>否
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow"><b>奖品名称： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="g_name" class="smallInput" size="40"  id="m_name">
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>兑奖所需的积分： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="g_jifen" class="smallInput" size="40"  id="g_jifen" value="0">
		</TD> 
	</TR>	
	<tr>
		<td align="left" class="Forumrow"><b> 图片地址：</b> </td>
	  <td  class="Forumrow">
		  <input type="text" name="m_pic" id="m_pic" size="60" value=""> 
		  <iframe src="../qTcms_Upload/Uppic2009061/Uploadpicture.asp?f1=<%=Add_Root_Dir("/"&G_BIG_T&"/small")%>&f2=m_pic&w=&h=&bg=f7f3f7&txt=尺寸：16*16" scrolling="no" topmargin="0" width="200" height="20" marginwidth="0" marginheight="0" frameborder="0" id="frame_m_pic"></iframe>
	   </td>
	 </tr>
	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>描述： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="70" rows="8" name="g_content" id="g_content"><%=zg_content%></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>更新时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="g_time" class="smallInput" size="30"  id="g_time" value="<%=ForMatDate(now(),55)%>"> 
			格式：2008-08-08 08:08:08
		</TD> 
	</TR>	
			
	<TR> 
		<TD align="left" class="Forumrow" width="200"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="提交" name="submit_b" id="submit_b">
		  <input type="button" value="返回列表页" name="submit_c" id="submit_c" onClick="window.location='./index.asp?m_type1=<%=am_type1%>'">		</TD> 
	</TR>		
	</form>
</TABLE>

<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		Set rsObj = Server.CreateObject(G_RS)
		rsObj.open "SELECT * FROM "&GG_Table&" WHERE id=" & sId,conn,1,1
		If not rsObj.Eof Then 
			WriteLn("		g_jifen.value='" & Str4Js(rsObj.Fields.Item("g_jifen").Value) & "';")
			WriteLn("		g_name.value='" & Str4Js(rsObj.Fields.Item("g_name").Value) & "';")
			WriteLn("		m_pic.value='" & Str4Js(rsObj.Fields.Item("g_pic").Value) & "';")			
			WriteLn("		g_time.value='" & Str4Js(rsObj.Fields.Item("g_time").Value) & "';")
			g_look = Str4Js(rsObj.Fields.Item("g_look").Value)
			
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		
		WriteLn(CheckBoxScript("oForm.g_look",g_look))
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