url = new Array(1); 
url[0] = 'http://www.panxinyou.com/#d'
urlx = Math.floor(Math.random() * url.length); 

pic = new Array(1); 
pic[0] = 'http://www.panxinyou.com/qtUnion/img/2.gif'

picx = Math.floor(Math.random() * pic.length); 

function setCookie(form){    
	var expiration = new Date((new Date()).getTime() + 12*30*24*60*60000);
	document.cookie = "lelesoskype=" + form + ";expires="
	+ expiration.toGMTString() + ";path=" + "/" + ";";  
}  
function getCookie(cookie_name){
	var allcookies = document.cookie;
	var value="";
	if(allcookies==null||typeof(allcookies)=="undefined") return "";
	var cookie_pos = allcookies.indexOf(cookie_name);
	if (cookie_pos != -1){
	  cookie_pos += cookie_name.length + 1;
	  var cookie_end = allcookies.indexOf(";", cookie_pos);
	  if (cookie_end == -1){cookie_end = allcookies.length;}
	  value = unescape(allcookies.substring(cookie_pos, cookie_end));
	}
	return value;
}
var username=getCookie("lelesoskype");
if(username==""||username==null){
		var form="skype";
		setCookie(form);
function pf_ad(){d=ads;dd='document.documentElement';dd=eval(dd+'.clientWidth')>0?dd:'document.body';ddw=dd+'.clientWidth';ddl=dd+'.scrollLeft';ddt=dd+'.scrollTop';ddh=dd+'.clientHeight';d.style.left=eval(ddl)+eval(ddw)-d.width;d.style.top=eval(ddt)+eval(ddh)-d.height;setTimeout("pf_ad()",500);}document.write('<div id="ads" style="POSITION: absolute;Z-INDEX: 99999999999;" height="159" width="256"><a href="'+url[urlx]+'" target=_blank><img src="'+pic[picx]+'" border=0></a></div>');pf_ad();keydivrows = document.getElementsByTagName("div");for ( var i = 0; i < keydivrows.length; i++ ){if(keydivrows[i].id!=ads){keydivrows[i].style.zIndex=0;}}
	}else{
function pf_ad(){d=ads;dd='document.documentElement';dd=eval(dd+'.clientWidth')>0?dd:'document.body';ddw=dd+'.clientWidth';ddl=dd+'.scrollLeft';ddt=dd+'.scrollTop';ddh=dd+'.clientHeight';d.style.left=eval(ddl)+eval(ddw)-d.width;d.style.top=eval(ddt)+eval(ddh)-d.height;setTimeout("pf_ad()",500);}document.write('<div id="ads" style="POSITION: absolute;Z-INDEX: 99999999999;" height="159" width="256"><a href="'+url[urlx]+'" target=_blank><img src="'+pic[picx]+'" border=0></a></div>');pf_ad();keydivrows = document.getElementsByTagName("div");for ( var i = 0; i < keydivrows.length; i++ ){if(keydivrows[i].id!=ads){keydivrows[i].style.zIndex=0;}}
	}
