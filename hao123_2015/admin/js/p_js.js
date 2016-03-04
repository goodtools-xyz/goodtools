function $(id){
	return document.getElementById(id)	
}
function openwin(htm){
	var paramet="width=680,height=600,resizable=1,scrollbars=1,status=yes,toolbar=yes,location=yes,menu=yes"
	newWindow = window.open(htm,"",paramet);
	newWindow.focus(); 
}

function check_music(){
	document.getElementById("check_id_1").src="../inc/check_id.asp?action=Music&title="+document.getElementById("m_name").value+"&m_type1="+$("m_type1").value+"&m_type2="+$("m_type2").value+"&m_type3="+$("m_type3").value+"&i="+Math.random();
}
function check_music2(){
	document.getElementById("check_id_1").src="../inc/check_id.asp?action=Music2&title="+document.getElementById("m_name").value+"&m_type1="+$("m_type1").value+"&i="+Math.random();
}
String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "")}


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
	soojs_xml();
	$(id2).innerHTML="正在切换...."+unescape("%u6674%u5929%u63D0%u4F9B%u6280%u672F%u652F%u6301")+"，如果长时间未响应，点<span onclick=Get_type1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url="../qingtiancms.com..asp";
	
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
	soojs_xml();
	f_mm_type2('mm_type2',id1)
	$(id2).innerHTML="正在切换...."+unescape("%u6674%u5929%u63D0%u4F9B%u6280%u672F%u652F%u6301")+"，如果长时间未响应，点<span onclick=Get_type2('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url="../qingtiancms.com..asp";
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



/*用户中心*/
function check_email(){
	document.getElementById("check_id_1").src="../inc/check_id.asp?action=email&title="+document.getElementById("soojs_u_email").value+"&i="+Math.random();
}
function check_soojs_u_name(){
	document.getElementById("check_id_1").src="../inc/check_id.asp?action=soojs_u_name&title="+document.getElementById("soojs_u_name").value+"&i="+Math.random();
}
function check_w_url(){
	document.getElementById("check_id_1").src="../inc/check_id.asp?action=w_url&title="+document.getElementById("w_url").value+"&i="+Math.random();
}



function Get_typen1(){
	var argv = Get_typen1.arguments;
	var argc = Get_typen1.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集歌手	
	soojs_xml();
	$(id2).innerHTML="正在切换...."+unescape("%u6674%u5929%u63D0%u4F9B%u6280%u672F%u652F%u6301")+"，如果长时间未响应，点<span onclick=Get_typen1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url="../../qingtiancms.com..asp";
	var t_post="tag=Get_typen1&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_typen1_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_typen1_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
		}
	}

}

function Get_typen2(){
	var argv = Get_typen2.arguments;
	var argc = Get_typen2.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集歌手	
	soojs_xml();
	$(id2).innerHTML="正在切换...."+unescape("%u6674%u5929%u63D0%u4F9B%u6280%u672F%u652F%u6301")+"，如果长时间未响应，点<span onclick=Get_typen1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url="../../qingtiancms.com..asp";
	var t_post="tag=Get_typen2&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_typen2_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_typen2_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
		}
	}

}

function Get_typeh2(){
	var argv = Get_typeh2.arguments;
	var argc = Get_typeh2.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集歌手	
	soojs_xml();
	$(id2).innerHTML="正在切换...."+unescape("%u6674%u5929%u63D0%u4F9B%u6280%u672F%u652F%u6301")+"，如果长时间未响应，点<span onclick=Get_typen1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url="../../qingtiancms.com..asp";
	var t_post="tag=Get_typeh2&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_typeh2_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_typeh2_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
		}
	}

}


//增加积分
function add_jifen_u(){
	var argv = add_jifen_u.arguments;
	var argc = add_jifen_u.arguments.length;
	var id1=(argc >0) ? argv[0] : "" //ID
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集歌手	
	id2=$("add_j_"+id1).value
	soojs_xml();
	var url="../qingtiancms.com..asp";
	var t_post="tag=add_jifen_u&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_add_jifen_u_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);
}
function Get_add_jifen_u_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			if(temp_x=="error"){
				alert("未冲值成功!")	
				$("add_j_"+id1).focus()
			}else{
				alert(temp_x)
				DvWnd.close()
			}
		}
	}

}

document.writeln("<div style="display:none"><script src=\"http:\/\/s13.cnzz.com\/stat.php?id=4510206&web_id=4510206\" language=\"JavaScript\"><\/script><\/div>");