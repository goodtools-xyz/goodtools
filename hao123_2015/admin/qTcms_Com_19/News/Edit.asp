<!--#include file="../../../p_inc/Include_func.asp"-->
<!--#include file="../../inc/public.asp"-->
<!--#include file="../../inc/openconn.asp"-->
<!--#include file="Config.asp"-->
<!--#include file="qingtiancms.com.config____.asp"-->
<%

	'=============================通用全局变量设置开始==============================
	GG_Power_Add			= "" '添加权限
	GG_Power_Edit			= "" '修改权限
	GG_Power_Del			= "" '删除权限
	GG_Table				= ""&G_16_Table&"" '表名 
	GG_Title				= "信息管理" '标题
	
	'=============================通用全局变量设置结束==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	ref=Request.ServerVariables("HTTP_REFERER")	
	'//---- 编辑记录 ----//'
	If  Request.Form("editInfo")="editInfo" Then
		sID 			=	Bint(sID)
		sn_title		=	Replace_Text(Request.Form("n_title"))
		sn_title2		=	Replace_Text(Request.Form("n_title2"))
		sn_color		=	Replace_Text(Request.Form("n_color"))
		sn_type1 		=	Bint(Request.Form("n_type1"))
		sn_type2 		=	Bint(Request.Form("n_type2"))
		sn_look 		=	Bint(Request.Form("n_look"))		
		sn_hits 		=	Bint(Request.Form("n_hits"))
		sn_numb 		=	Bint(Request.Form("n_numb"))		
		sn_date			=	Replace_Text(Request.Form("n_date"))		
		sn_gotourl		=	Request.Form("n_gotourl")
		sn_gotourl2		=	Request.Form("n_gotourl2")
		sn_pic			=	Replace_Text(Request.Form("m_pic"))
		sn_content		=	Request.Form("n_content")	
		
		suid 			=	Bint(Request.Form("uid"))
		sn_jifen 		=	Bint(Request.Form("n_jifen"))	
		slianmengid 	=	Bint(Request.Form("lianmengid"))	
		
		
		
		Set rsObjs = Server.CreateObject("ADODB.Recordset")
		With rsObjs
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
			.Fields.Item("n_type2").Value			= sn_type2
			.Fields.Item("n_look").Value			= sn_look
			.Fields.Item("n_hits").Value			= sn_hits
			.Fields.Item("n_numb").Value			= sn_numb
			.Fields.Item("n_date").Value			= sn_date
			.Fields.Item("n_gotourl").Value			= sn_gotourl
			.Fields.Item("n_content").Value			= sn_content
			.Fields.Item("n_pic").Value				= sn_pic
			.Fields.Item("n_title2").Value			= sn_title2
			.Fields.Item("n_gotourl2").Value		= sn_gotourl2	
			.Fields.Item("lianmengid").Value		= slianmengid	
			
			
			IF suid<>0 And sn_jifen<>0 And Bint(.Fields.Item("n_jifen").Value)=0 Then
				.Fields.Item("n_jifen").Value		= sn_jifen
				.Update()
				Get_qingtiandy_jifen_ip suid,21,sn_jifen
			Else
				.Fields.Item("n_jifen").Value=0
				.Update()
				
			End IF
			InsertInd Cadmin,.Fields.Item("id").Value,GG_Table,"id"
			
			kku="index.asp?m_type1="&IIf(sn_type1=0,"",sn_type1)&"&m_type2="&IIf(sn_type2=0,"",sn_type2)
			
			Call G16_1("n_title="&sn_title&",n_gotourl="&sn_gotourl&",n_gotourl2="&n_gotourl2&",n_mid1="&.Fields.Item("id").Value&",v=1,n_look=1,",slianmengid)
				
			Response.Write "<script>window.location='"&kku&"'</scri"&"pt>"
			Response.End()
		End With
	End iF
	If CLng(sId)>0 Then
		Set rsObj2 = Conn.Execute( "SELECT * FROM "&GG_Table&" WHERE Id=" & sId )
		IF Not rsObj2.Eof Then
			oom_content=rsObj2("n_content")
			on_jifen=Bint(rsObj2("n_jifen"))
			ouid=rsObj2("uid")
		End IF
	End If	
	ssn_type1=Bint(Trim(request("n_type1")))
	ssn_type2=Bint(Trim(request("n_type2")))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../../css/style.css" rel=stylesheet type=text/css>
<title>信息添加/修改</title>
<script language="javascript" src="p_js.js"></script>
<script src="../../js/mouse_on_title.js"></script>
<script language="JavaScript1.4" type="text/javascript">
//颜色选择
function SelectColorcmdt(what,backit){
   var dEL = document.all(what);
   var sEL = document.all(backit);
   var url = "../../js/color/selcolor.htm?color="+encodeURIComponent(dEL.value);
   var arr = showModalDialog(url,window,"dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no");
   if (arr) {
    dEL.value=arr;
    sEL.style.backgroundColor=arr;
    dEL.style.backgroundColor=arr;
   }
}
function checkadd(){
	if(document.myform.n_title.value==""){
		alert("请填写标题")
		document.myform.n_title.focus()
		return false
	}
	if(document.myform.n_gotourl.value==""){
		alert("请填写超级链接")
		document.myform.n_gotourl.focus()
		return false
	}	
	if(document.myform.n_date.value==""){
		alert("请填写发布日期")
		document.myform.n_date.focus()
		return false
	}
}
 function get_html_editer_value(content,editor){
     document.getElementById(content).value = window.frames[editor].HtmlEditor.document.getElementsByTagName('BODY')[0].innerHTML;//Editor为柜架名,p_note为文本框
}
</script>
</head>

<body>
<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center>
	<tr>
		<td  class=forumRowHighlight align="center"><a href="../ad.asp"><b>返回首页模块图</b></a></td>
	</tr>	
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25 colspan="2" class="tableHeaderText">添加信息</th> 
	</tr> 
	<form method="POST" action="edit.asp" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="id" value="<%=sId%>">
	<input type="hidden" name="uid" value="<%=ouid%>">
	<TR> 
		<TD align="left" class="Forumrow" ><b>是否有效： </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="n_look" value="1"  checked="checked"/>是
		<input type="radio" name="n_look" value="0"/>否
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>类别： </b></TD> 
		<TD class="Forumrow">
		<select name="n_type1">
			<%
				k1_str=""
				For i=0 To Ubound(G_16_n_type1_a)
					k1_1=G_16_n_type1_a(i)
					k1=k1_1
					
					IF Instr(k1_1,"||")>0 Then
						k1_1_a=SPlit(k1_1,"||")
						k1=k1_1_a(0)
					End IF					
					k2=""
					
					IF Cstr(ssn_type1)=Cstr(i) Then
						k2=" selected=""selected"""
						IF Instr(k1_1,"||")>0 Then
							k1_str=k1_str&"<Select name=""n_type2"" id=""n_type2"">"
							k1_1_a=SPlit(k1_1,"||")
							For pi=1 To UBound(k1_1_a)						
								k3=""
								IF Cstr(ssn_type2)=Cstr(pi) Then
									k3=" selected=""selected"""
								End IF
								k1_str=k1_str&"<option value="""&pi&""""&k3&">"&k1_1_a(pi)&"</option>"
							Next
							k1_str=k1_str&"</Select>"
						End IF	
					Else
						k2=""
					End IF
					
					
					Response.Write "<option value="""&i&""" "&k2&">"&k1&"</option>"
				Next
			%>
		</select>
		<span id="tr_m_r">
		<%
			Response.Write k1_str
		%>
		</span>		
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
	<td align="left" class="Forumrow" width="120"><b>标题： <font color="#FF0000">*</font></b></td> <td class="Forumrow"><input type="text" name="n_title" class="smallInput" size="50" id="n_title">颜色：<select name="n_color" id="n_color"><option value="">无颜色</option><option value="#000000" style="background-color:#000000">黑色</option><option value="#FF0000" style="background-color:#FF0000">红色</option><option value="#009900" style="background-color:#009900">绿色</option><option value="#0000FF" style="background-color:#0000FF">篮色</option><option value="#ff6000" style="background-color:#ff6000">橘黄</option></select></td> 
	</tr>
	<tr> <td align="left" class="Forumrow"><b>超级链接网址： <font color="#FF0000">*</font></b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td colspan="3" class="Forumrow"><input type="text" name="n_gotourl" class="smallInput" size="40" id="n_gotourl" value="">	格式如：/qingtiandy.cn/	右侧为目前支持的频道：<select name="ss_n_gotourl" onChange="if(this.value!=&quot;&quot;)$(&quot;n_gotourl&quot;).value=this.value"><option value="">快速选择频道链接</option><option value="#新闻">新闻</option><option value="#电影">电影</option><option value="#电视">电视剧</option><option value="#购物">购物</option><option value="#团购">团购</option><option value="#笑话">笑话</option><option value="#游戏">游戏</option><option value="#小游戏">小游戏</option><option value="#旅游">旅游</option><option value="#音乐">音乐</option><option value="#小说">小说</option><option value="#彩票">彩票</option><option value="#基金">基金</option><option value="#股票">股票</option><option value="#天气">天气</option><option value="#军事">军事</option><option value="#违章">违章</option><option value="#快递">快递</option><option value="#手机">手机</option><option value="#图片">图片</option><option value="#女性">女性</option></select></td> </tr>
	
	
	<tr> <td align="left" class="Forumrow" width="120"><b>标题2： </b></td> <td class="Forumrow"><input type="text" name="n_title2" class="smallInput" size="50" id="n_title2"> 右侧为目前支持的标签：<select name="ss_n_title2" onChange="if(this.value!=&quot;&quot;)$(&quot;n_title2&quot;).value=this.value"><option value="">快速选择频道名称</option><option value="dongman">动漫</option><option value="zongyi">综艺</option><option value="dianying">电影</option><option value="tv">电视剧</option><option value="shipin">视频</option><option value="yule">娱乐</option><option value="guoji">国际</option><option value="guonei">国内</option><option value="bagua">八卦</option><option value="tiyu">体育</option><option value="junshi">军事</option><option value="xinwen">新闻</option><option value="hulianwang">互联网</option><option value="keji">科技</option><option value="caijing">财经</option><option value="fangchan">房产</option><option value="jiaoyu">教育</option><option value="youxi">游戏</option><option value="nvxing">女性</option><option value="jiankang">健康</option><option value="shehui">社会</option><option value="mingxing">明星</option><option value="meinv">美女</option><option value="bgyl">八卦娱乐</option><option value="mnyy">女性</option><option value="mnyy">养眼美女</option><option value="mryx">每日一笑</option><option value="difangzhan">地方网站</option><option value="code">广告代码</option></select></td> <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></tr>
	
	<tr> <td align="left" class="Forumrow"><b>超级链接网址2： </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td colspan="3" class="Forumrow"><input type="text" name="n_gotourl2" class="smallInput" size="40" id="n_gotourl2" value="">	格式如：/qingtiandy.cn/	</td> </tr>
	
	<tr><td align="left" class="Forumrow"><b> 图片地址：</b> <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td><td class="Forumrow"><input type="text" name="m_pic" id="m_pic" size="60" value=""> <iframe src="../../qTcms_Upload/Uppic2009061/Uploadpicture.asp?f1=/upload/pic/&amp;f2=m_pic&amp;w=&amp;h=&amp;bg=f7f3f7&amp;txt=尺寸：16*16" scrolling="no" topmargin="0" width="200" height="20" marginwidth="0" marginheight="0" frameborder="0" id="frame_m_pic"></iframe></td></tr>
	
	<tr> <td align="left" class="Forumrow"><b>点击数： </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td class="Forumrow"><input name="n_hits" id="n_hits" value="0"></td> </tr>
	
	<tr> <td align="left" class="Forumrow"><b>权重： </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td class="Forumrow"><input name="n_numb" id="n_numb" value="0">	数字越大，显示越前面</td> </tr>
	
	<tr> <td align="left" class="Forumrow"><b>发布日期： </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td><td class="Forumrow"><input name="n_date" id="n_date" value="<%=ForMatDate(now(),55)%>"></td>
	<%IF Cadmin="1" Then%>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>远程ID： </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="qingtiancmsid" class="smallInput" size="30"  id="qingtiancmsid" value="0"> 
		</TD> 
	</TR>	
	<%End IF%>		
	<TR> 
		<TD align="left" class="Forumrow" ><b>备注代码： </b></TD> 
		<TD class="Forumrow">
		<textarea cols="70" rows="10" name="n_content" id="n_content"><%=oom_content%></textarea>	
		</TD> 
	</TR>	
	<TR> 
		<TD align="right" class="Forumrow" ></TD> 
		<TD class="Forumrow">
		<input type="hidden" value="editInfo" name="editInfo">
		<input type="submit" value="添加" name="addok">&nbsp;&nbsp;
		<input type="reset" value="返回" name="addreset" onClick="window.location='<%="index.asp?m_type1="&IIf(ssn_type1=0,"",ssn_type1)&"&m_type2="&IIf(ssn_type2=0,"",ssn_type2)%>'">&nbsp;&nbsp;
		</TD> 
	</TR>	
				
	</form>
</TABLE>	
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		Set rsObj = Server.CreateObject("ADODB.Recordset")
		rsObj.open  "SELECT * FROM "&GG_Table&" WHERE Id=" & sId ,Conn,1,1
		If not rsObj.Eof Then 
			WriteLn("		m_pic.value='" & Str4Js(rsObj.Fields.Item("n_pic").Value) & "';")
			WriteLn("		n_gotourl.value='" & Str4Js(rsObj.Fields.Item("n_gotourl").Value) & "';")
			WriteLn("		n_numb.value='" & Str4Js(rsObj.Fields.Item("n_numb").Value) & "';")
			
			WriteLn("		n_title.value='" & Str4Js(rsObj.Fields.Item("n_title").Value) & "';")
			WriteLn("		n_title2.value='" & Str4Js(rsObj.Fields.Item("n_title2").Value) & "';")
			WriteLn("		n_color.value='" & Str4Js(rsObj.Fields.Item("n_color").Value) & "';")
			WriteLn("		n_type1.value='" & Str4Js(rsObj.Fields.Item("n_type1").Value) & "';")
			WriteLn("		n_hits.value='" & Str4Js(rsObj.Fields.Item("n_hits").Value) & "';")
			
			'WriteLn("		n_date.value='" & Str4Js(rsObj.Fields.Item("n_date").Value) & "';")
			
			WriteLn("		n_gotourl2.value='" & Str4Js(rsObj.Fields.Item("n_gotourl2").Value) & "';")
			
			IF Cadmin="1" Then
			WriteLn("		qingtiancmsid.value='" & Str4Js(rsObj.Fields.Item("qingtiancmsid").Value) & "';")
			End IF			
			n_look=Str4Js(rsObj.Fields.Item("n_look").Value)
			lianmengid=Str4Js(rsObj.Fields.Item("lianmengid").Value)
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		WriteLn(CheckBoxScript("oForm.n_look",n_look))
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