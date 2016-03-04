function $(id){
	return document.getElementById(id)	
}
function openwin(htm){
	var paramet="width=680,height=600,resizable=1,scrollbars=1,status=yes,toolbar=yes,location=yes,menu=yes"
	newWindow = window.open(htm,"",paramet);
	newWindow.focus(); 
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




function Get_typeh2(){
	var argv = Get_typeh2.arguments;
	var argc = Get_typeh2.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // 默认专集歌手	
	soojs_xml();
	$(id2).innerHTML="正在切换...."+unescape("%u6674%u5929%u63D0%u4F9B%u6280%u672F%u652F%u6301")+"，如果长时间未响应，点<span onclick=Get_typen1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>这里</u></span>刷新"
	var url="qingtiancms.com..asp";
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


