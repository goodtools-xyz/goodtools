<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"网址" '标题
	GG_Table				=	"qingtiandy_shouluurl"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From qingtiandy_shouluurl Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="l_look" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			qid=fId2(id0)
			Set pRs=Server.CreateObject(G_RS)
			pRs.open "Select * From qingtiandy_shouluurl Where id="&qid,conn,1,1
			IF Not pRs.Eof Then
				pm_type1=pRs("m_type1")
				pm_type2=pRs("m_type2")
				pm_type3=pRs("m_type3")
				pm_name=pRs("m_name")
				pm_url=pRs("m_url")
				pm_content=pRs("m_content")
				Set qRs=Server.CreateObject(G_RS)
				qRs.open "Select * from qingtiandh_List where m_name = '"& pm_name &"' And m_type1="&pm_type1&" And m_type2="&pm_type2&" And m_type3="&pm_type3,conn,1,3
				IF qRs.Eof Then
					qRs.Addnew()
					qRs("m_type1")				= pm_type1
					qRs("m_type2")				= pm_type2
					qRs("m_type3")				= pm_type3
					qRs("m_name")				= pm_name
					qRs("m_color")				= ""
					qRs("m_look")				= 1
					qRs("m_url")				= pm_url
					qRs("m_content")			= pm_content
					qRs("m_time")				= ForMatDate(now(),55)
					qRs("m_no")					= 0	
					qRs.Update()				
					conn.Execute("update qingtiandy_shouluurl Set m_status=1 Where id="&qid)
				End IF
			End IF	
		Next		
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		sm_type1=Bint(Request.Form("m_type1"))
		sm_type2=Bint(Request.Form("m_type2"))
		sm_type3=Bint(Request.Form("m_type3"))
		sm_name=Replace_Text_2008(Request.Form("m_name"))
		sm_url=Replace_Text_2008(Request.Form("m_url"))
		sm_color=""
		sm_look=1
		sm_content=Replace_Text_Html(ReplaceTextArea(Request.Form("m_content")))
		sm_time=ForMatDate(now(),55)
		sm_no=0 '权重
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM qingtiandh_List where m_name = '"& sm_name &"' And m_type1="&sm_type1&" And m_type2="&sm_type2&" And m_type3="&sm_type3
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If Not  .Eof Then 
				doAlert "该网站已经存在！" , "javascript:history.back(-1);"
				Response.End()			
			Else	
				.AddNew()	
				.Fields.Item("m_type1").Value				= sm_type1
				.Fields.Item("m_type2").Value				= sm_type2
				.Fields.Item("m_type3").Value				= sm_type3
				.Fields.Item("m_name").Value				= sm_name
				.Fields.Item("m_color").Value				= sm_color
				.Fields.Item("m_look").Value				= sm_look
				.Fields.Item("m_url").Value					= sm_url
				.Fields.Item("m_content").Value				= sm_content
				.Fields.Item("m_time").Value				= ForMatDate(sm_time,55)
				.Fields.Item("m_no").Value					= sm_no
				.Update()
				conn.Execute("update qingtiandy_shouluurl Set m_status=1 Where id="&sID)
				'Response.Redirect st_str&server.URLEncode("?id="&.Fields.Item("id").Value&"&r_l_type1="&sl_type1&"&r_l_group="&sl_group&"&r_l_list="&sl_list)
				IF ref="" Then ref=	"index.asp"
				doAlert "" , TurnBackPage(Request.Form("Ref"),"index.asp")
				Response.End()	
			End IF			
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
<script language="javascript" src="../js/calendar.js"></script>
<script>
function checkadd(){
	if($("m_type1").value.Trim()=="0"){
		alert("请选择一级类别！")
		$("m_type1").focus()
		return false
	}
	if($("m_type2").value.Trim()=="0"){
		alert("请选择二级类别！")
		$("m_type2").focus()
		return false
	}	
	if($("m_type3").value.Trim()=="0"){
		alert("请选择三级类别！")
		$("m_type3").focus()
		return false
	}
	if($("m_name").value.Trim()==""){
		alert("请填写网站名称！")
		$("m_name").focus()
		return false
	}	
	if($("m_url").value.Trim()==""){
		alert("请填写网站地址！")
		$("m_url").focus()
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
	  	<th height=25 colspan="2" class="tableHeaderText"><%=GG_Title%>查看/审核</th> 
	</tr> 
	<form method="POST" action="" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>审核状态： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="m_status" value="1"  checked="checked"/>是
		<input type="radio" name="m_status" value="0"/>否
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>网站一级类别： </b></TD> 
		<TD class="Forumrow">			 
			<Select name="m_type1" onChange="Get_type1(this.value,'div_m_type2')" id="m_type1">
				<Option value="0">一级类别</Option>
			<%
				Set oRs_t=Server.CreateObject(G_RS)
				oRs_t.open "Select * from qingtiandh_type1 order by typehide asc,typeno asc,typeid asc",conn,1,1
				Do While Not oRs_t.Eof 
					kTypeid=oRs_t("typeid")
					kTypename=oRs_t("typename")
					IF Cstr(am_type1)=Cstr(kTypeid) Then
						kS1=" Selected"
					Else
						kS1=""
					End IF
					
			%>
					<Option value="<%=kTypeid%>"<%=kS1%>><%=kTypename%></Option>
			<%		
					oRs_t.MoveNext
				Loop
				oRs_t.close:Set oRs_t=Nothing
			%>
			</Select>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>网站二级类别： </b></TD> 
		<TD class="Forumrow">			 
			<div id="div_m_type2">			 
				<Select name="m_type2" id="m_type2" onChange="Get_type2(this.value,'div_m_type3')">
					<Option value="0">二级类别</Option>
				<%
					Set oRs_t=Server.CreateObject(G_RS)
					oRs_t.open "Select * from qingtiandh_type2 where typeid1="&am_type1&" order by typehide asc,typeno asc,typeid asc",conn,1,1
					Do While Not oRs_t.Eof 
						kId=oRs_t("typeid")
						kG_name=oRs_t("typename")
						IF Cstr(am_type2)=Cstr(kId) Then
							kS1=" Selected"
						Else
							kS1=""
						End IF
						
				%>
						<Option value="<%=kId%>"<%=kS1%>><%=kG_name%></Option>
				<%		
						oRs_t.MoveNext
					Loop
					oRs_t.close:Set oRs_t=Nothing
				%>
				</Select>	
				</div>
		</TD> 
	</TR>	
		<TD align="left" class="Forumrow" ><b>网站三级类别： </b></TD> 
		<TD class="Forumrow">			 
			<div id="div_m_type3">			 
			<Select name="m_type3" id="m_type3">
				<Option value="0">三级类别</Option>
				<%
					Set oRs_t=Server.CreateObject(G_RS)
					oRs_t.open "Select * from qingtiandh_type3 where typeid2="&am_type2&" And typeid1="&am_type1&" order by typehide asc,typeno asc,typeid asc",conn,1,1
					Do While Not oRs_t.Eof 
						kId=oRs_t("typeid")
						kG_name=oRs_t("typename")
						IF Cstr(am_type3)=Cstr(kId) Then
							kS1=" Selected"
						Else
							kS1=""
						End IF
						
				%>
						<Option value="<%=kId%>"<%=kS1%>><%=kG_name%></Option>
				<%		
						oRs_t.MoveNext
					Loop
					oRs_t.close:Set oRs_t=Nothing
				%>						
			</Select>	
			</div>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow"><b>网站名称： </b></TD> 
	  <TD class="Forumrow">
		<input type="text" name="m_name" class="smallInput" size="50" onChange="check_music()" id="m_name"></TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>网站地址： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_url" class="smallInput" size="50"  id="m_url">
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>描述： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="70" rows="8" name="m_content" id="m_content"></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>建站时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_jtime" class="smallInput" size="30"  id="m_jtime" value=""> 
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>联系人： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_contactname" class="smallInput" size="30"  id="m_contactname" value=""> 
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>联系电话： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_tel" class="smallInput" size="30"  id="m_tel" value=""> 
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>联系QQ： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_qq" class="smallInput" size="30"  id="m_qq" value=""> 
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>已做好本站友情链接： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="m_youqing" value="1"/>是
		<input type="radio" name="m_youqing" value="0"/>否
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>提交时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_time" class="smallInput" size="30"  id="m_time" value=""> 
		</TD> 
	</TR>				
	<TR> 
		<TD align="left" class="Forumrow" width="200"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="入库" name="submit_b" id="submit_b">
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
			WriteLn("		m_type1.value='" & Str4Js(rsObj.Fields.Item("m_type1").Value) & "';")
			WriteLn("		m_type2.value='" & Str4Js(rsObj.Fields.Item("m_type2").Value) & "';")
			WriteLn("		m_name.value='" & Str4Js(rsObj.Fields.Item("m_name").Value) & "';")
			WriteLn("		m_url.value='" & Str4Js(rsObj.Fields.Item("m_url").Value) & "';")
			WriteLn("		m_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("m_content").Value))) & "';")
			WriteLn("		m_jtime.value='" & Str4Js(rsObj.Fields.Item("m_jtime").Value) & "';")
			WriteLn("		m_contactname.value='" & Str4Js(rsObj.Fields.Item("m_contactname").Value) & "';")
			WriteLn("		m_tel.value='" & Str4Js(rsObj.Fields.Item("m_tel").Value) & "';")
			WriteLn("		m_qq.value='" & Str4Js(rsObj.Fields.Item("m_qq").Value) & "';")
			m_status = Str4Js(rsObj.Fields.Item("m_status").Value)
			m_youqing = Str4Js(rsObj.Fields.Item("m_youqing").Value)
			WriteLn("		m_time.value='" & Str4Js(rsObj.Fields.Item("m_time").Value) & "';")
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		
		WriteLn(CheckBoxScript("oForm.m_status",m_status))
		WriteLn(CheckBoxScript("oForm.m_youqing",m_youqing))
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