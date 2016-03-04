//用户登陆
var soojs_id=qTcms.Cookie.get3(qTcms.Cookie.get(qtcmsdd.co),"soojs_id");
var soojs_u=qTcms.reconvert(qTcms.Cookie.get4("qtcmsuser"));	
if(soojs_u=="")soojs_u="QQ用户!";
//if(soojs_u=="")soojs_u=qTcms.reconvert(qTcms.Cookie.get22("qtcmsuser"));
//if(soojs_u=="")soojs_u=qTcms.Cookie.get3(qTcms.Cookie.get(qtcmsdd.co),"soojs_u");

			
			

if(soojs_id==null){soojs_id=0;};
if(soojs_id=="")soojs_id=0;

if(soojs_id!=0){
	if(document.getElementById("p_skin_login")){
		document.getElementById("p_skin_login").innerHTML="<b>"+soojs_u+"</b>";
		document.getElementById("p_skin_login").href=qtcmsdd.d+"members/";
		document.getElementById("p_skin_login").style.display="block";
	}
	if(document.getElementById("p_skin_reg")){
		document.getElementById("p_skin_reg").innerHTML="退出";
		document.getElementById("p_skin_reg").href=qtcmsdd.d+"members/regok.asp?action=out&Back_url="+window.location;	
		document.getElementById("p_skin_reg").style.display="block";
	}
	if(document.getElementById("p_skin_qqlogin")){
		if(qtcmsdd.aqq.a==1){
			document.getElementById("p_skin_qqlogin").innerHTML='<li><a href="'+qtcmsdd.d+"members/"+'" id="p_skin_login" target="_self">'+"<b>"+soojs_u+"</b>"+'</a></li>';
			document.getElementById("p_skin_qqlogin").className="";
		}else{
			document.getElementById("p_skin_qqlogin").style.display="none";	
		}
	}
	
}
//绑定
var soojs_jj=qTcms.Cookie.get("soojsjj");
if(soojs_jj==null) 
	soojs_jj=0;
else
	if(soojs_jj=="")
		soojs_jj=0
		

	
if(soojs_jj!=0&&document.getElementById("p_skin_jinbi")){
	if(document.getElementById("p_skin_jinbi"))document.getElementById("p_skin_jinbi").innerHTML='<font color=#178517>本机'+qtcmsdd.jn+'已经绑定</font>';	
	if(document.getElementById("p_skin_jinbi"))document.getElementById("p_skin_jinbi").className="divgreen"
}
