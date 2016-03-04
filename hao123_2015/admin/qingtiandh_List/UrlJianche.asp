<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网址有效性检测</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
body{font-family: Georgia, "Times New Roman", Times, serif;}
-->
</style>
</head>
<body>
<script>
var xmlHttp
function qingtiandy_cxhr()
{
	try{
		xmlHttp=new XMLHttpRequest();
		}
	catch(e){
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}	
}

function qingtiandy_$(id){
	return document.getElementById(id);	
}
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
function $(id){return document.getElementById(id)}

var qtid=0 //全局变量，初始值

function a(str){
	var str3=((str=="")?"正在加载所有网址，请梢等.....":str)
	$("submit2").innerHTML=str3
	qingtiandy_cxhr();	
	var url="Ajax_UrlJianche.asp";
	var t_post="v="+qtid
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=qingtiandy_ok
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);	
}
function qingtiandy_ok(){
	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			if (temp_x.indexOf("{ok}")!=-1){
				//正常的
				temp_x_a=temp_x.split("{####}")
				//fid&"{####}"&fm_url&"{####}"&fm_name&"{####}"&fm_time&"{####}"&fm_type1&"{####}"&fm_type2&"{####}"&fm_type3&"{####}{ok}{###}"&Urlg
				a8=temp_x_a[8];//错误信息
				a9=temp_x_a[9];//当前个数，总个数
				if(a8!="1")
					AddTable(temp_x_a[0],"<a href='../../p_inc/Turnto.asp?u="+temp_x_a[1]+"' target=_blank>"+temp_x_a[1]+"</a>"+a8,temp_x_a[2],temp_x_a[4],temp_x_a[5],temp_x_a[6],temp_x_a[3])
				qtid++
				
				a9_str="正在检测"+a9+"：<a href='../../p_inc/Turnto.asp?u="+temp_x_a[1]+"' target=_blank><font color=red>"+temp_x_a[2]+"</font></a> 是否有效...<span style='color:#0000FF' onclick='a(\"开始重新加载...\")'>长时间不动，请点这里重新载入</span>"
				a(a9_str)
			}else if(temp_x.indexOf("{over}")!=-1){
				$("submit2").innerHTML="<font color=blue>全部检测完毕!</font>"
			}
			
		}
	}	
}
function AddTable(v1,v2,v6,v3_1_id,v3_2_id,v3_3_id,v5){
	//v1:id
	//v2:网址
	//v3_1:一类别名 v3_2:二类别名 v3_3:三类别名
	//v3_1_id 
	//v4：权重
	//v5：时间
	//v6：网站名
	var ul= document.getElementById("q_3");
	ti=parseInt(ul.childNodes.length)+1
	var div=document.createElement("div");
	tt='<TABLE width="100%" border="0" cellpadding="0" cellspacing="1" id="tabl_'+v1+'">	';
	tt=tt+'<tr height="20">';
	tt=tt+'<td nowrap="nowrap" class="forumRow" width="5%">'+v1+'</td>';
	tt=tt+'<td class="forumRow">'+v2+'</td>';	
	tt=tt+'<td nowrap="nowrap" class="forumRow" width="15%">'+v6+'</td>';
	tt=tt+'<td nowrap="nowrap" class="forumRow" width="17%">'+v5+'</td>';
	tt=tt+'<td nowrap="nowrap" class="forumRow" width="8%"><a href="edit.asp?id='+v1+'&m_type1='+v3_1_id+'&m_type2='+v3_2_id+'&m_type3='+v3_3_id+'" target=_blank><img src="../images/admin_top_icon_5.gif" border="0" title="编辑"></a> <a href="javascript:hideForm(this,'+v1+')" onclick=""><img src="../images/cha.gif" border="0" title="删除此网站"></a></td>'	;
	tt=tt+'<TD  align="center" class=forumRow width="7%"><input type=checkbox name=id value="'+v1+'"></td>'	;
	tt=tt+'</tr>';
	tt=tt+'</table>';
	div.innerHTML=tt;
	ul.insertBefore(div,ul.childNodes[0]);	
}
function hideForm(obj,id){
	//edit.asp?Id='+v1+'&Action=Del
	qingtiandy_cxhr();	
	var url="Ajax_UrlJianche.asp";
	var t_post="v="+id+"&action=del"
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function(){qingtiandy_ok_del(id)}
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);	
	$("tabl_"+id).style.display="none"
	//ul.removeChild(curObj);
}
function qingtiandy_ok_del(id){
	$("tabl_"+id).style.display="none"
}
function delall(form){
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       if(e.checked&&e.name=="id"){
	   		hideForm(e,e.value)
			
		}
    }	
}
</script>
<%


t3=Request("t3")
'Set oRs=conn.Execute("Select * From qingtiandy_url Order By Id Asc")
'Response.Write "<qingtiandy_url>"
'Do While Not oRs.Eof
'	zw_url=oRs("w_url")
'	zw_name=oRs("w_name")
'	Response.Write zw_url&"|||"&zw_name&"{###}"
'	oRs.MoveNext
'Loop
'Response.Write "</qingtiandy_url>"
%>


<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" height=25 colspan="2">网址有效性检测</th>
	</tr>
	<tr>
		<td width="81%" class=forumRowHighlight height="25" id=submit2 style="font-size:14px">
	  		<div  name=submit2 onclick="a('')" style="cursor:pointer; font-size:14px">开始检测</div>
		</td>
	</tr>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th  height=25 class="tableHeaderText" colspan="6"><a href='?tops=all'><font color="#FFFFFF">全部失效网站列表</font></a></th>	
	</tr> 
	<TR height=25>			
		<TD width="5%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
		<TD    class=bodytitle><font color="#CC3300"><b>网址</b></font></TD>
		<TD width="15%"   class=bodytitle><font color="#CC3300"><b>网站名</b></font></TD>
		<TD width="17%"   class=bodytitle><font color="#CC3300"><b>添加时间</b></font></TD>
		<TD width="8%"   class=bodytitle><font color="#CC3300"><b>操作选项</b></font></TD>
	    <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="删"  onClick="delall(this.form)"></td>
	</TR>	
	<tr>
		<td colspan="7" id="q_3"> 
  			<TABLE width="100%" border="0" cellpadding="0" cellspacing="1" height="0">				
			<tr height="20">
			<td nowrap="nowrap" class="forumRow" width="5%"></td>
			<td nowrap="nowrap" class="forumRow"></td>
			<td nowrap="nowrap" class="forumRow" width="15%"></td>
			<td nowrap="nowrap" class="forumRow" width="17%"></td>
			<td class="forumRow" width="8%"></td>
			<TD  align="center" class=forumRow width="7%"></td>
			</tr>			
			</TABLE>
		</td>
	</tr>
</table>
</form>
</body>


