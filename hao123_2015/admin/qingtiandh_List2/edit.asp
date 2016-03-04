<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"网址" '标题
	GG_Table				=	"qingtiandh_List2"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			conn.Execute("Delete From qingtiandh_List2 Where ID="&fId2(id0))	
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="l_look" And sID<>"" Then
		fId=FormatNumSerial(sID)
		l_look=StayNub(request("m_look"))
		IF l_look<>"" Then
			Conn.execute("update  "&GG_Table&" Set m_look="&l_look&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		sm_type1=Bint(Request.Form("m_type1"))
		sm_type2=Bint(Request.Form("m_type2"))
		sm_type3=Bint(Request.Form("m_type3"))
		sm_name=Replace_Text_2008(Request.Form("m_name"))
		sm_color=Replace_Text_2008(Request.Form("m_color"))
		sm_url=Replace_Text_2008(Request.Form("m_url"))
		sm_look=Bint(Request.Form("m_look"))
		sm_content=Replace_Text_Html(ReplaceTextArea(Request.Form("m_content")))
		sm_time=Replace_Text_2008(Request.Form("m_time"))
		sm_no=Bint(Request.Form("m_no"))'权重
		sm_pic=Replace_Text_2008(Request.Form("m_pic"))
		slianmengid 	=	Bint(Request.Form("lianmengid"))
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE id=" & sID
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where m_name = '"& sm_name &"' And m_type1="&sm_type1)
				If Not Rs1.Eof Then
					doAlert "该网站已经存在！" , "javascript:history.back(-1);"
					'Response.Redirect "../qingtiancms.com.ts.asp?t=7_error&r=qingtiandh_List2/edit.asp&n=返回重新添加"
					Response.End()
				Else
					st_str="../qingtiancms.com.ts.asp?t=7&n=返回编辑&r=qingtiandh_List2/edit.asp"
				End If
				Rs1.Close : Set Rs1 = Nothing
			Else
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where m_name = '"& sm_name &"' And id<>"&sID&" And m_type1="&sm_type1)
				If Not Rs1.Eof Then
					doAlert "该网站已经存在！" , "javascript:history.back(-1);"
					'Response.Redirect "../qingtiancms.com.ts.asp?t=7_error&r=qingtiandh_List2/edit.asp?id="&sID&"&n=返回重新编辑"
					Response.End()
				Else
					'st_str="../qingtiancms.com.ts.asp?t=7&n=返回继续编辑&r=qingtiandh_List2/edit.asp"
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End IF		
			.Fields.Item("m_type1").Value				= sm_type1
			.Fields.Item("m_name").Value				= sm_name
			.Fields.Item("m_color").Value				= sm_color
			.Fields.Item("m_look").Value				= sm_look
			.Fields.Item("m_url").Value					= sm_url
			.Fields.Item("m_content").Value				= sm_content
			IF sm_time<>"" Then
				.Fields.Item("m_time").Value			= ForMatDate(sm_time,55)
			End IF			
			.Fields.Item("m_no").Value					= sm_no
			.Fields.Item("m_pic").Value					= sm_pic
			.Fields.Item("lianmengid").Value			= slianmengid	
			.Update()
			InsertInd Cadmin,.Fields.Item("id").Value,GG_Table,"id"
			Call G16_1("n_title="&sm_name&",n_gotourl="&sm_url&",n_mid2="&.Fields.Item("id").Value&",v=2,n_look=1,",slianmengid)
			IF ref="" Then ref=	"index.asp"
			doAlert "" , TurnBackPage(Request.Form("Ref"),"index.asp")
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
<script language="javascript" src="../js/calendar.js"></script>
<script>
function checkadd(){
	if($("m_type1").value.Trim()=="0"){
		alert("请选择类别！")
		$("m_type1").focus()
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
	  	<th height=25 colspan="2" class="tableHeaderText"><%=GG_Title%>添加/编辑</th> 
	</tr> 
	<form method="POST" action="" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>显示状态： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="m_look" value="1"  checked="checked"/>是
		<input type="radio" name="m_look" value="0"/>否
		</TD> 
	</TR>	
	
	<TR> 
		<TD align="left" class="Forumrow" ><b>网站类别： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">			 
			<Select name="m_type1" id="m_type1">
				<Option value="0">选择类别</Option>
			<%
				Set oRs_t=Server.CreateObject(G_RS)
				oRs_t.open "Select * from qingtiandh_ltype1 order by typehide asc,typeno asc,typeid asc",conn,1,1
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
		<TD align="left" class="Forumrow" ><b>是否广告链接： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="lianmengid" value="1"/>是
		<input type="radio" name="lianmengid" value="0" checked="checked"/>否
		比如是一些联盟的推荐链接，那么请选择"是"
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>网站名称： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_name" class="smallInput" size="50" onChange="check_music2()" id="m_name">
			<span id="m_name_1"></span>
			颜色：<select name="m_color" id="m_color"><option value="">无颜色</option><option value="#000000" style="background-color:#000000">黑色</option><option value="#FF0000" style="background-color:#FF0000">红色</option><option value="#009900" style="background-color:#009900">绿色</option><option value="#0000FF" style="background-color:#0000FF">篮色</option><option value="#ff6000" style="background-color:#ff6000">橘黄</option></select>			
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>网站地址： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_url" class="smallInput" size="50"  id="m_url">
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
			<textarea cols="70" rows="8" name="m_content" id="m_content"></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>更新时间： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_time" class="smallInput" size="30"  id="m_time" value="<%=ForMatDate(now(),55)%>"> 
			格式：<b>2008-08-08 08:08:08</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>权重系数： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_no" class="smallInput" size="30"  id="m_no" value="0"> 
			权重越大排在越前面
		</TD> 
	</TR>		
	<%IF Cadmin="1" Then%>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>远程ID： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="qingtiancmsid" class="smallInput" size="30"  id="qingtiancmsid" value="0"> 
		</TD> 
	</TR>	
	<%End IF%>			
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
			WriteLn("		m_type1.value='" & Str4Js(rsObj.Fields.Item("m_type1").Value) & "';")
			WriteLn("		m_name.value='" & Str4Js(rsObj.Fields.Item("m_name").Value) & "';")
			WriteLn("		m_color.value='" & Str4Js(rsObj.Fields.Item("m_color").Value) & "';")
			WriteLn("		m_url.value='" & Str4Js(rsObj.Fields.Item("m_url").Value) & "';")
			WriteLn("		m_pic.value='" & Str4Js(rsObj.Fields.Item("m_pic").Value) & "';")
			WriteLn("		m_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("m_content").Value))) & "';")
			'WriteLn("		m_time.value='" & Str4Js(rsObj.Fields.Item("m_time").Value) & "';")
			WriteLn("		m_no.value='" & Str4Js(rsObj.Fields.Item("m_no").Value) & "';")
			IF Cadmin="1" Then
			WriteLn("		qingtiancmsid.value='" & Str4Js(rsObj.Fields.Item("qingtiancmsid").Value) & "';")
			End IF			
			m_look = Str4Js(rsObj.Fields.Item("m_look").Value)
			lianmengid=Str4Js(rsObj.Fields.Item("lianmengid").Value)
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		
		WriteLn(CheckBoxScript("oForm.m_look",m_look))
		WriteLn(CheckBoxScript("oForm.lianmengid",lianmengid))
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