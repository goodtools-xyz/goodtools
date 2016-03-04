<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<!--#include file="../../members/config.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"站长网站" '标题
	GG_Table				=	"qingtiandy_url"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From "&GG_Table&" Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="w_status" And sID<>"" Then
		fId=FormatNumSerial(sID)
		w_status=StayNub(request("w_status"))
		IF w_status<>"" Then
			Conn.execute("update  "&GG_Table&" Set w_status="&w_status&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="w_look" And sID<>"" Then
		fId=FormatNumSerial(sID)
		w_look=StayNub(request("w_look"))
		IF w_look<>"" Then
			Conn.execute("update  "&GG_Table&" Set w_look="&w_look&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="init" And sID<>"" Then '初始化数据
		fId=FormatNumSerial(sID)
		Conn.execute("update  "&GG_Table&" Set inj=0,outj=0,inc=0,outc=0,inp=0,outp=0 where id In("&fId&")")
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		sw_look=Bint(Request.Form("w_look"))
		sw_status=Bint(Request.Form("w_status"))
		sw_url=Replace_Text_2008(Request.Form("w_url"))
		sw_domain=Replace_Text_2008(Request.Form("w_domain"))
		sw_name=Replace_Text_2008(Request.Form("w_name"))
		sw_type1=Bint(Request.Form("w_type1"))
		sw_number=Bint(Request.Form("w_number"))
		sw_content=Replace_Text_Html(ReplaceTextArea(Request.Form("w_content")))
		sw_beian=Bint(Request.Form("w_beian"))
		sw_uid=Bint(Request.Form("w_uid"))
		sw_ser=Replace_Text_2008(Request.Form("w_ser"))
		sw_no=Bint(Request.Form("w_no"))
		sdateandtime=Replace_Text_2008(Request.Form("dateandtime"))
		sw_editdate=Replace_Text_2008(Request.Form("w_editdate"))
		sinc=Bint(Request.Form("inc"))
		sinj=Bint(Request.Form("inj"))
		soutc=Bint(Request.Form("outc"))
		soutj=Bint(Request.Form("outj"))	
		sfromdate=Replace_Text_2008(Request.Form("fromdate"))	
		sindate=Replace_Text_2008(Request.Form("indate"))
		soutdate=Replace_Text_2008(Request.Form("outdate"))
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE id=" & sID
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where w_url = '"& sw_url &"'")
				If Not Rs1.Eof Then
					doAlert "该网站已经存在！" , "javascript:history.back(-1);"
					'Response.Redirect "../qingtiancms.com.ts.asp?t=7_error&r=qingtiandh_List/edit.asp&n=返回重新添加"
					Response.End()
				Else
					st_str="../qingtiancms.com.ts.asp?t=7&n=返回编辑&r=qingtiandh_List/edit.asp"
				End If
				Rs1.Close : Set Rs1 = Nothing
			Else
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where w_url = '"& sw_url &"' And id<>"&sID&" ")
				If Not Rs1.Eof Then
					doAlert "该网站已经存在！" , "javascript:history.back(-1);"
					'Response.Redirect "../qingtiancms.com.ts.asp?t=7_error&r=qingtiandh_List/edit.asp?id="&sID&"&n=返回重新编辑"
					Response.End()
				Else
					'st_str="../qingtiancms.com.ts.asp?t=7&n=返回继续编辑&r=qingtiandh_List/edit.asp"
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End IF		
			.Fields.Item("w_look").Value				= sw_look
			.Fields.Item("w_status").Value				= sw_status
			.Fields.Item("w_url").Value					= sw_url
			.Fields.Item("w_domain").Value				= sw_domain
			.Fields.Item("w_name").Value				= sw_name
			.Fields.Item("w_type1").Value				= sw_type1
			.Fields.Item("w_number").Value				= sw_number
			.Fields.Item("w_content").Value				= sw_content
			.Fields.Item("w_beian").Value				= sw_beian
			.Fields.Item("w_uid").Value					= sw_uid
			.Fields.Item("w_ser").Value					= sw_ser
			.Fields.Item("w_no").Value					= sw_no
			IF sdateandtime<>"" Then
				.Fields.Item("dateandtime").Value		= ForMatDate(sdateandtime,55)
			End IF			
			IF sw_editdate<>"" Then
				.Fields.Item("w_editdate").Value		= ForMatDate(sw_editdate,55)
			End IF				
			.Fields.Item("inc").Value					= sinc
			.Fields.Item("inj").Value					= sinj
			.Fields.Item("outc").Value					= soutc
			.Fields.Item("outj").Value					= soutj
			IF sfromdate<>"" Then
				.Fields.Item("fromdate").Value				= sfromdate
			End IF
			IF sindate<>"" Then
				.Fields.Item("indate").Value				= sindate
			End IF
			IF soutdate<>"" Then
				.Fields.Item("outdate").Value				= soutdate
			End IF
			.Update()
			'Response.Redirect st_str&server.URLEncode("?id="&.Fields.Item("id").Value&"&r_l_type1="&sl_type1&"&r_l_group="&sl_group&"&r_l_list="&sl_list)
			IF ref="" Then ref=	"index.asp"
			doAlert "" , TurnBackPage(Request.Form("Ref"),"index.asp")
			Response.End()				
		End With			
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
	if($("w_url").value.Trim()=="0"){
		alert("请填写网站域名！")
		$("w_url").focus()
		return false
	}
	if($("w_domain").value.Trim()=="0"){
		alert("请填写网站域！")
		$("w_domain").focus()
		return false
	}	
	if($("w_name").value.Trim()=="0"){
		alert("请填写网站名！")
		$("w_name").focus()
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
</script>
</head>
<body>
<iframe name="check_id_1" id="check_id_1" width="0" height="0" src="_blank" style="display:none"></iframe>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25 colspan="2" class="tableHeaderText"><%=GG_Title%>添加/编辑</th> 
	</tr> 
	<form method="POST" action="" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>是否审核： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="w_look" value="1"  checked="checked"/>是
		<input type="radio" name="w_look" value="0"/>否
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>域名是否已认证： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="w_status" value="1"  checked="checked"/>是
		<input type="radio" name="w_status" value="0"/>否
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>网站域名： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_url" class="smallInput" size="50" onChange="check_w_url()" id="w_url">
			<span id="m_name_1"></span>
			请不要带http:// ，比如www.baidu.com
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>网站域： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_domain" class="smallInput" size="50"  id="w_domain"> 比如：qingtiandy.cn 或movie.qingtiandy.cn 
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>网站名： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_name" class="smallInput" size="50"  id="w_name"> 比如：晴天导航
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>网站类别： </b></TD> 
		<TD class="Forumrow">
		<select name="w_type1" id="w_type1" tabindex="3">
			<%
			For ii=0 To Ubound(G_u_w_type1)
				t1=G_u_w_type1(ii)
				t1_a=split(t1,"|")
				p1=t1_a(0) 'ID
				p2=t1_a(1) 'name
				Response.Write "<option value='"&p1&"'>"&p2&"</option>"&vbcrlf
			Next
			%>
		</select>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>网站访问量： </b></TD> 
		<TD class="Forumrow">
		<select name="w_number"  id="w_number" tabindex="4">
			<%
			For ii=0 To Ubound(G_u_w_number)
				t1=G_u_w_number(ii)
				t1_a=split(t1,"|")
				p1=t1_a(0) 'ID
				p2=t1_a(1) 'name
				Response.Write "<option value='"&p1&"'>"&p2&"</option>"&vbcrlf
			Next
			%>
		</select>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>描述： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="70" rows="8" name="w_content" id="w_content"></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>网站备案： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_beian" class="smallInput" size="30"  id="w_beian" value=""> 
			比如：浙ICP3652
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>用户ID： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_uid" class="smallInput" size="30"  id="w_uid" value=""> 
			只能是数字
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>域名验证码： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_ser" class="smallInput" size="30"  id="w_ser" value="<%=GetRamCode(40)%>"> 
			40位的随机码
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>权重： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_no" class="smallInput" size="30"  id="w_no" value="0"> 
			权重越高，显示越前面
		</TD> 
	</TR>				
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>网站登记时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="dateandtime" class="smallInput" size="30"  id="dateandtime" value="<%=ForMatDate(now(),55)%>"> 
			格式：<b>2008-08-08 08:08:08</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>网站编辑时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="w_editdate" class="smallInput" size="30"  id="w_editdate" value="<%=ForMatDate(now(),55)%>"> 
			格式：<b>2008-08-08 08:08:08</b>
		</TD> 
	</TR>	
	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>总点入： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="inc" class="smallInput" size="30"  id="inc" value="0"> 
			
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>今日点入： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="inj" class="smallInput" size="30"  id="inj" value="0"> 			
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>总点出： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="outc" class="smallInput" size="30"  id="outc" value="0"> 			
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>今日点出： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="outj" class="smallInput" size="30"  id="outj" value="0"> 			
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>开始统计时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="fromdate" class="smallInput" size="30"  id="fromdate" value="<%=ForMatDate(now(),55)%>"> 
			格式：<b>2008-08-08 08:08:08</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>最后点入时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="indate" class="smallInput" size="30"  id="indate" value="<%=ForMatDate(now(),55)%>"> 
			格式：<b>2008-08-08 08:08:08</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>最后点出时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="outdate" class="smallInput" size="30"  id="outdate" value="<%=ForMatDate(now(),55)%>"> 
			格式：<b>2008-08-08 08:08:08</b>
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
		Set rsObj = Server.CreateObject(G_RS)
		rsObj.open "SELECT * FROM "&GG_Table&" WHERE id=" & sId,conn,1,1
		If not rsObj.Eof Then 
			WriteLn("		w_url.value='" & Str4Js(rsObj.Fields.Item("w_url").Value) & "';")
			WriteLn("		w_domain.value='" & Str4Js(rsObj.Fields.Item("w_domain").Value) & "';")
			WriteLn("		w_name.value='" & Str4Js(rsObj.Fields.Item("w_name").Value) & "';")
			WriteLn("		w_type1.value='" & Str4Js(rsObj.Fields.Item("w_type1").Value) & "';")
			WriteLn("		w_number.value='" & Str4Js(rsObj.Fields.Item("w_number").Value) & "';")
			WriteLn("		w_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("w_content").Value))) & "';")
			WriteLn("		w_beian.value='" & Str4Js(rsObj.Fields.Item("w_beian").Value) & "';")
			WriteLn("		w_uid.value='" & Str4Js(rsObj.Fields.Item("w_uid").Value) & "';")
			WriteLn("		w_ser.value='" & Str4Js(rsObj.Fields.Item("w_ser").Value) & "';")
			WriteLn("		w_no.value='" & Str4Js(rsObj.Fields.Item("w_no").Value) & "';")
			WriteLn("		dateandtime.value='" & Str4Js(rsObj.Fields.Item("dateandtime").Value) & "';")
			WriteLn("		w_editdate.value='" & Str4Js(rsObj.Fields.Item("w_editdate").Value) & "';")
			WriteLn("		inc.value='" & Str4Js(rsObj.Fields.Item("inc").Value) & "';")
			WriteLn("		inj.value='" & Str4Js(rsObj.Fields.Item("inj").Value) & "';")
			WriteLn("		outc.value='" & Str4Js(rsObj.Fields.Item("outc").Value) & "';")
			WriteLn("		outj.value='" & Str4Js(rsObj.Fields.Item("outj").Value) & "';")
			WriteLn("		fromdate.value='" & Str4Js(rsObj.Fields.Item("fromdate").Value) & "';")
			WriteLn("		indate.value='" & Str4Js(rsObj.Fields.Item("indate").Value) & "';")
			WriteLn("		outdate.value='" & Str4Js(rsObj.Fields.Item("outdate").Value) & "';")
			w_look = Str4Js(rsObj.Fields.Item("w_look").Value)
			w_status = Str4Js(rsObj.Fields.Item("w_status").Value)
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		
		WriteLn(CheckBoxScript("oForm.w_look",w_look))
		WriteLn(CheckBoxScript("oForm.w_status",w_status))
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