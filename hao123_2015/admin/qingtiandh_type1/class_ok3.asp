<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"三级导航类别" '标题
	GG_Table				=	"qingtiandh_type3"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	IF Action="Del" And sID<>"" Then
		Del_Mlist3 sID	
		response.Redirect ref
		response.End()
	End IF	
	stypeid1=Bint(Request("typeid1"))
	stypeid2=Bint(Request("typeid2"))	
	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sTflag=""
		sID = Bint(sID)
		stypeid1=Bint(Request("typeid1"))
		stypeid2=Bint(Request("typeid2"))
		sTypename=Replace_Text_2008(Request.Form("typename"))
		sTypename2=Replace_Text_2008(Request.Form("typename2"))
		sTypeno=StayNub(Request.Form("typeno")):IF sTypeno="" Then sTypeno=100
		sTypecontent=Replace_Text_Html(ReplaceTextArea(Request.Form("typecontent")))
		sTypehide=StayNub(Request.Form("typehide")):IF sTypehide="" Then sTypehide=1
		stypecolor=Replace_Text_2008(Request.Form("typecolor"))
		stypeTitle=Replace_Text_2008(Request.Form("typeTitle"))
		stypedes=Replace_Text_2008(Request.Form("typedes"))
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE typeid=" & sID
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select typeid from "&GG_Table&" where typename = '"& sTypename &"' And typeid1="&stypeid1&" And typeid2="&stypeid2)
				If Not Rs1.Eof Then
					doAlert "该类别已经存在！" , "javascript:history.back(-1);"
					'Response.Redirect "../qingtiancms.com.ts.asp?t=4_error&r=qingtiandy_type1/edit.asp&n=返回重新添加"
					Response.End()
				Else
					sTflag="add_ok"
					st_str="../qingtiancms.com.ts.asp?t=4&n=返回修改该类别&r=qingtiandy_type1/edit.asp"
				End If
				Rs1.Close : Set Rs1 = Nothing
			Else
				Set Rs1 = Conn.Execute("Select typeid from "&GG_Table&" where typename = '"& sTypename &"' And typeid<>"&sID&" And typeid1="&stypeid1&" And typeid2="&stypeid2)
				If Not Rs1.Eof Then
					doAlert "该类别已经存在！" , "javascript:history.back(-1);"
					'Response.Redirect "../qingtiancms.com.ts.asp?t=4_error&r=qingtiandy_type1/edit.asp?id="&sID&"&n=返回重新编辑"
					Response.End()
				Else
					st_str="../qingtiancms.com.ts.asp?t=4&n=返回继续编辑&r=qingtiandy_type1/edit.asp"
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End IF
			.Fields.Item("typeid1").Value				= stypeid1
			.Fields.Item("typeid2").Value				= stypeid2
			.Fields.Item("typename").Value				= stypename
			.Fields.Item("typename2").Value				= stypename2
			.Fields.Item("typeno").Value				= stypeno
			.Fields.Item("typecontent").Value			= stypecontent
			.Fields.Item("typehide").Value				= stypehide
			.Fields.Item("typecolor").Value				= stypecolor
			.Fields.Item("typeTitle").Value				= stypeTitle
			.Fields.Item("typedes").Value				= stypedes
			.Update()
			InsertInd Cadmin,.Fields.Item("typeid").Value,GG_Table,"typeid"
			IF ref="" Then ref=	"type.asp"
			doAlert "" , TurnBackPage(Request.Form("Ref"),"type.asp")
			Response.End()
		End With
		rsObj.Close:set rsObj=Nothing
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
	if($("typename").value.Trim()==""){
		alert("请填写类别名称！")
		$("typename").focus()
		return false
	}
}
</script>
<script>
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
<form method="POST" action="" name="myform" onSubmit="return checkadd()">
<input type="hidden" value="<%=stypeid1%>" name="typeid1" />
<input type="hidden" value="<%=stypeid2%>" name="typeid2" />
<input type="hidden" name="ref" value="<%=ref%>">
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25 colspan="2" class="tableHeaderText"><%=GG_Title%>添加/编辑</th> 
	</tr> 	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>类别名称： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="typename" class="smallInput" size="50"  id="typename"> 
		  <input name="typecolor" type=text id="A1"  size=8  >
		  <img border=0 src="../js/color/rect.gif" width=18 style="cursor:hand" id=As_1 onClick="SelectColorcmdt('A1','As_1')">		  
			
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>类别别名：</b></TD> 
		<TD class="Forumrow">
			<input type="text" name="typename2" class="smallInput" size="50"  id="typename2"> 
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>序号： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="typeno" class="smallInput" size="50"  id="typeno" value="100"> 序号越小，显示在越前面，必须是数字
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>类别标题： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="50" rows="5" name="typeTitle" id="typeTitle"></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>类别关键词： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="50" rows="5" name="typecontent" id="typecontent"></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>类别描述： </b></TD> 
		<TD class="Forumrow">
			<textarea cols="50" rows="5" name="typedes" id="typedes"></textarea>
		</TD> 
	</TR>
    <TR> 
      <TD align="left" class="Forumrow" width="200"><b>是否显示：</b></TD> 
      <TD class="Forumrow">
	  <select name="typehide">
	  <option value="0">隐藏</option>
	  <option value="1" selected="selected">显示</option>
	  </select>
	  </TD> 
    </TR> 	
	<TR> 
		<TD align="left" class="Forumrow" width="200"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="提交" name="submit_b" id="submit_b">
		  <input type="button" value="返回列表页" name="submit_c" id="submit_c" onClick="window.location='./type_3.asp?typeid1='+myform.typeid1.value+'&typeid2='+myform.typeid2.value+''">		
		  </TD> 
	</TR>		
</TABLE>
</form>
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		Set rsObj = Conn.Execute( "SELECT * FROM "&GG_Table&" WHERE typeid=" & sId )
		If not rsObj.Eof Then 
			WriteLn("		typeid1.value='" & Str4Js(rsObj.Fields.Item("typeid1").Value) & "';")
			WriteLn("		typeid2.value='" & Str4Js(rsObj.Fields.Item("typeid2").Value) & "';")
			WriteLn("		typename.value='" & Str4Js(rsObj.Fields.Item("typename").Value) & "';")
			WriteLn("		typename2.value='" & Str4Js(rsObj.Fields.Item("typename2").Value) & "';")
			WriteLn("		typeno.value='" & Str4Js(rsObj.Fields.Item("typeno").Value) & "';")
			WriteLn("		typecontent.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("typecontent").Value))) & "';")
			WriteLn("		typedes.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("typedes").Value))) & "';")
			WriteLn("		typeTitle.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("typeTitle").Value))) & "';")
			WriteLn("		typehide.value='" & Str4Js(rsObj.Fields.Item("typehide").Value) & "';")
			WriteLn("		typecolor.value='" & Str4Js(rsObj.Fields.Item("typecolor").Value) & "';")
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