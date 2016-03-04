<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%
	'=============================通用全局变量设置开始==============================
	GG_Title				=	"HTML网址批量入库 " '标题
	GG_Table				=	"qingtiandh_List2"
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	


	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		sm_type1=Bint(Request.Form("m_type1"))
		sm_no=Bint(Request.Form("m_no"))
		sm_content=Request.Form("m_content")
		
		all_str=qt_Url_Biaoti(sm_content,"$qingtiandy$")	
		
		all_str_a=Split(all_str,"$qingtiandy$")
		pi=Ubound(all_str_a)
		For ai=0 To Ubound(all_str_a)
			sm_name_1=all_str_a(pi)
			sm_name_1_a=Split(sm_name_1,"{##}")
			sm_name=sm_name_1_a(1)
			sm_url=sm_name_1_a(0)
			IF sm_name<>"" And Not IsNull(sm_name) Then sm_name=qtcmsdh.Ltxt(sm_name)
			IF sm_name<>"" And sm_url<>"" And Instr(sm_url,"http://")>0 Then
				Set oRs_ps=Server.CreateObject(G_RS)
				oRs_ps.open "Select * from "&GG_Table&" where m_name = '"& sm_name &"' And m_type1="&sm_type1,conn,1,3
				IF oRs_ps.Eof Then
					oRs_ps.AddNew()
					oRs_ps("m_type1")			= sm_type1
					oRs_ps("m_name")			= sm_name
					oRs_ps("m_color")			= ""
					oRs_ps("m_look")			= 1
					oRs_ps("m_url")				= sm_url
					oRs_ps("m_content")			= ""
					oRs_ps("m_time")			= ForMatDate(now(),55)
					oRs_ps("m_no")				= sm_no			
					oRs_ps.Update()
					Response.Write sm_name&"--"&sm_url&"<font color=blue>导入成功</font><br>"
					Response.Flush()
				Else
					Response.Write sm_name&"--"&sm_url&"<font color=red>已经存在</font><br>"
					Response.Flush()				
				End IF
			Else
				Response.Write sm_name&"--"&sm_url&"<font color=red>不是http地址</font><br>"
				Response.Flush()				
			End IF
			pi=pi-1
		Next
		IF ref="" Then ref=	"index.asp"
		doAlert "" , TurnBackPage(Request.Form("Ref"),"index.asp")
		Response.End()				
	End IF	
	
	am_type1=Bint(Request("m_type1"))
	am_type2=Bint(Request("m_type2"))
	am_type3=Bint(Request("m_type3"))
%>

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
	if($("m_content").value.Trim()==""){
		alert("HTML代码不能为空！")
		$("m_content").focus()
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
		<TD align="left" class="Forumrow" width="200"><b>复制HTML语言到这里： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<textarea cols="70" rows="12" name="m_content" id="m_content"></textarea>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>网站类别： <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">			 
			<Select name="m_type1" id="m_type1">
				<Option value="0">类别</Option>
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
			</Select>		</TD> 
	</TR>	

	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>权重系数： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="m_no" class="smallInput" size="30"  id="m_no" value="0"> 
			权重越大排在越前面
		</TD> 
	</TR>			
	<TR> 
		<TD align="left" class="Forumrow" width="200"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="批量入库" name="submit_b" id="submit_b">
		  <input type="button" value="返回列表页" name="submit_c" id="submit_c" onClick="window.location='./index.asp'">		</TD> 
	</TR>		
	</form>
</TABLE>

</body>
</html>