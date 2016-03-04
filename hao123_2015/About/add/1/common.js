
/*
by 六合导航,QQ:260075702
官方站点：www.panxinyou.com
*/

String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "")}
function $(id){
	return document.getElementById(id)	
}

var xmlHttp;

function soojs_xml()
{
	try{
		xmlHttp=new XMLHttpRequest();
		}
	catch(e){
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}	
}

function Get_type1(){
	var argv = Get_type1.arguments;
	var argc = Get_type1.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集歌手	
	var dir=(argc >3) ? argv[3] : ""  //相对路径
	soojs_xml();
	$(id2).innerHTML="正在切换...."+"，如果长时间未响应，点<span onclick=Get_type1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url=dir+"1/qingtiancms.com..asp";
	var t_post="tag=Get_type1&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_type1_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_type1_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
			document.getElementById("div_m_type3").innerHTML="<Select name=\"m_type3\" id=\"m_type3\"><Option value=\"0\">三级类别</Option></Select>"
		}
	}

}

function Get_type2(){
	var argv = Get_type2.arguments;
	var argc = Get_type2.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集名称
	var dir=(argc >3) ? argv[3] : ""  //相对路径
	soojs_xml();
	$(id2).innerHTML="正在切换...."+"，如果长时间未响应，点<span onclick=Get_type2('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url=dir+"1/qingtiancms.com..asp";
	var t_post="tag=Get_type2&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_type2_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_type2_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
		}
	}

}

function newverifypic()
{
	var argv = newverifypic.arguments;
	var argc = newverifypic.arguments.length;
	var dir=(argc >0) ? argv[0] : ""
	
	var timenow = new Date().getTime();
	url=dir+"1/code.asp";
	url=url+"?"+timenow;
	document.getElementById("verifypic").src=url;
}

function checkFormaddurl(o){
	if($("m_name").value.Trim()==""){
		alert("网站名称为必填项目")
		$("m_name").focus()
		return false
	}
	if($("m_url").value.Trim()==""){
		alert("网站网址为必填项目")
		$("m_url").focus()
		return false
	}	
	if((!$("m_url").value.Trim().match(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/gi))){
		alert("网站网址格式不正确")
		$("m_url").focus()
		return false	
	}
	if($("m_content").value.Trim()!=""){
		if($("m_content").value.length>200){
			alert("请将您的描述控制在200字以内")
			$("m_content").focus()
			return false
		}
	}
	if($("m_type1").value=="0"){
		alert("网站分类必选项目")
		$("m_type1").focus()
		return false
	}	
	if($("m_type2").value=="0"||$("m_type3").value=="0"){
		alert("网站分类必选项目")
		$("m_type2").focus()
		return false
	}	
	if($("m_type3").value=="0"){
		alert("网站分类必选项目")
		$("m_type3").focus()
		return false
	}	
	if($("authCode").value.Trim()==""){
		alert("验证码为必填项目")
		$("authCode").focus()
		return false
	}		
}