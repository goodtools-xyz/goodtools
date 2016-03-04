<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>网站静态HTML生成管理</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
<body>
<%
	Sub ShowSpaceInfo(drvpath)
 		dim fso,d,size,showsize
 		set fso=server.createobject("scripting.filesystemobject") 	
		IF IsFolderExists(drvpath) Then
			drvpath=server.mappath(drvpath) 		 		
			set d=fso.getfolder(drvpath) 		
			size=d.size
			showsize=size & "&nbsp;Byte" 
			if size>1024 then
			   size=(size\1024)
			   showsize=size & "&nbsp;KB"
			end if
			if size>1024 then
			   size=(size/1024)
			   showsize=formatnumber(size,2) & "&nbsp;MB"		
			end if
			if size>1024 then
			   size=(size/1024)
			   showsize=formatnumber(size,2) & "&nbsp;GB"	   
			end if   
		End IF
 		response.write "<font face=verdana>" & showsize & "</font>"
 	End Sub	
 	
 	
 	Function Drawbar(drvpath)
 		dim fso,drvpathroot,d,size,totalsize,barsize
 		set fso=server.createobject("scripting.filesystemobject")
 		drvpathroot=server.mappath("\")
 		set d=fso.getfolder(drvpathroot)
 		totalsize=d.size
 		
		IF IsFolderExists(drvpath) THen
			drvpath=server.mappath(drvpath) 		
			set d=fso.getfolder(drvpath)
			size=d.size
			
			barsize=cint((size/totalsize)*350)
			Drawbar=barsize
		End iF
 	End Function 	
 		
%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th width="88%" class="tableHeaderText" height=25>单个静态页面生成</th> 
    <th width="12%" class="tableHeaderText"><a href="../qingtiancms.com.ex.asp"><font color="#FFFFFF">退出管理</font></a></th>
  </tr> 
  <tr> 
    <td colspan="2" class="forumRowHighlight"><p><B>说明</B>：<BR> <BR>
        ①所谓单个：就是不同模版有时候需要生成不同的单个页面，比如 单张排行榜等<BR>
		②单张静态模版都是放在/template/模版名称/html/下，里面的必须文件请不要重新命名或删除。<br>不可以删除/重命名文件：top.html、button.html、index.html、list.html<br>
新生成的单个目录在网站所在的根目录下<br><br>		
&nbsp;<br>
&nbsp;</td> 
  </tr> 
</table>
  <br>
<script>
function openplay(url){
	
	var widthv,heightv,xposition,yposition
	xposition = (screen.width - widthv)/2;
	yposition = (screen.height - heightv)/2;
	widthv = "500";
	heightv = "465";	
	window.open(url,'read','toolbar=no,Directories=no,location=no,Status=no,,menubar=no,resizable=no,scrollbars=no,width='+widthv+',height='+heightv+',left='+xposition+',top='+yposition)
}
</script>
  <table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
    <tr> 
      <th height=25 colspan="3" class="tableHeaderText">以下是模版<b><%=G_moban%></b>下的所有单个非系统文件</th> 
    </tr> 
<%
	p_flag=false
	p=Qingtiandy_getfilecontent(server.MapPath(Add_Root_Dir("/template/"&G_moban&"/js/jingtaiguize.txt")))
	str_p1=body2s(p,"{#","#}","@@@@@",true)
	str_p1_arr=split(str_p1,"@@@@@")
	For ii=0 To Ubound(str_p1_arr)
		str_1=str_p1_arr(ii)
		str_1=replace(str_1,chr(13),"")
		str_1=replace(str_1,chr(10),"")
		IF str_1<>"" And Instr(str_1,"||")>0 And Instr(str_1,".")>0 Then
			str_1_a=split(str_1,"||")
			str_1_1=str_1_a(0)'原始路径
			str_1_1_name=str_1_1
			str_1_1_utf=""
			str_1_1_a=str_1_1
			IF Instr(str_1_1_a,"$$")>0 Then
				str_1_1_a_a=Split(str_1_1_a,"$$")
				str_1_1_name=str_1_1_a_a(0)
				str_1_1_utf=str_1_1_a_a(1)
			End IF				
			str_1_1_2=replace(str_1_1,".asp",".html")
			str_1_2=str_1_a(1)'原始路径说明
			str_1_3="make_html.asp?f="&server.URLEncode("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir(str_1_a(2))&"?sindex="&str_1_1)&"&g="&str_1_1_2'调用路径
			IF N_Fso.IsFileExists(url_(Array("one",str_1_1_2))) Then
				str_1_4="开始重新生成"
			Else
				str_1_4="开始生成"
			End IF
%>
	<tr> 
      <td width=18% height=40 class="forumRowHighlight"><strong><%=str_1_2%>:</strong> </td> 
      <td class="forumRowHighlight">文件名：<%=str_1_1_name%> <a href='../moban/index.asp?t1=/template/<%=G_moban%>/<%=G_moban_html%>/<%=str_1_1_name%>&t3=<%=str_1_2%>'>编辑</a></td>
      <td class="forumRowHighlight" width=39% align="center">
	  <img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="<%=str_1_3%>" target="_blank"><%=str_1_4%><%=str_1_2%> </a>	   </td>
    </tr> 
<%			
		p_flag=True
		End IF
	Next
	
	IF p_flag Then
%>	
	<tr> 
      <td width=18% height=40 class="forumRowHighlight"><strong>全部频道:</strong> </td> 
      <td class="forumRowHighlight">所有文件</td>
      <td class="forumRowHighlight" width=39% align="center">
	  <img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="make_html.asp?all=all&tag=a" target="_blank"><b>开始生成所有单页</b></a>	   </td>
    </tr> 	
<%	
	End IF
%>

</table> 
<br>
</body>
</html>