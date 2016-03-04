function $_soojs(id){
	return document.getElementById(id);	
}
function showError(msg, itm,onclickun){
	if (itm.getAttribute("rel")=="text_flag"){
		arr = $_soojs(itm.id+'_1');
		if(!arr.style.color)
			arr.style.color="#F00";
		arr.innerHTML = msg;
		if(typeof(onclickun)=="boolean" && onclickun==true &&itm.id=="list_url"){
			document.getElementById("list_url").value="";
			$_soojs("list_url_1").className="form-info error-info"
		}		
	}
}
function showError2(msg, itm, onclickun){
	arr = getItem(itm);
	msg2=msg;
	if(typeof(onclickun)=="boolean" && onclickun==true)
	{
		var vcode = document.getElementById("soojs_code").value;
		//re=/###/gi;
		//msg2 = msg.replace(re,vcode);
		document.getElementById("soojs_code").value="";
	}
	arr[1].innerHTML = msg2;
	arr[1].style.display = 'block';
}
function hideError(itm){
	if (itm.getAttribute("rel")=="text_flag"){
		arr = $_soojs(itm.id+'_1');
		arr.innerHTML = '';
	}
}
function chkstr(str){
	if(typeof(str)!='string'){
		str = str.value;
	}
	for(var i = 0; i < str.length; i++){
		if (str.charCodeAt(i) < 127 && !str.substr(i,1).match(/^\w+$/ig)){
			return false;
		}
	}
	return true;
}
function getMsg(name){
	itm = document.getElementById('err_msg');
	for (var i=0; i<itm.childNodes.length; i++){
		if (itm.childNodes[i].id == name){
			return itm.childNodes[i].innerHTML;
		}
	}
	return -1;
}
function bytes(str){
	if(typeof(str)!='string'){
		str = str.value;
	}
	var len = 0;
	for(var i = 0; i < str.length; i++){
		if(str.charCodeAt(i) > 127){
			len++;
		}
		len++;
	}
	return len;
}
var pwdflg = false;
function checkInput(itm, blank){
		str = checkItem(itm, blank);
		if (str!=''){
			showError(str, itm);
			if(pwdflg)
				return true;
			else
				return false;
		}
		else{
			
			hideError(itm);
			if(itm.id == "list_url" && !blank){
				checklist_url();
			}					
			return true;
		}
}
function checklist_url(){
	un = document.info.list_url;
	if(checkOnClick(un)){
		showError(getMsg('msg_url_checking'), un);
		scr = document.createElement('script')
		scr.src = 'Ujs/check.asp?tag=check_listurlp&un=' + escape(un.value) + "&id="+$_soojs("id").value+"&uid="+$_soojs("uid").value;
		document.getElementById('check_username_script').appendChild(scr);
	}
}

function setlist_urlUsable_f(bol){
       // document.form1_s.soojs_u_email.readOnly = false;
        if (bol == 0){
				$_soojs("list_url_1").className="form-info suc-info"
                showError(getMsg('msg_url_ok'), document.info.list_url);
				return true
        }else if(bol == 1){
                showError(getMsg('msg_url_exists'), document.info.list_url, true);
				return false
        }
}
function checkOnChange(itm){
	return checkInput(itm, false);
}
function checkOnClick(itm){
	return checkInput(itm, true);
}


function checkItem(itm, blank){
	pwdflg = false;
	if (itm.id == 'list_url'){
		if (blank && itm.value == ''){
			$_soojs("list_url_1").className="form-info error-info"
			return getMsg('msg_url_blank');
		}else if (!("http://"+itm.value).match(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/gi)){
			$_soojs("list_url_1").className="form-info error-info"
			return getMsg('msg_url_format');
		}
	}else if (itm.id == 'list_name'){
		if (blank && itm.value == ''){
			$_soojs("list_name_1").className="form-info error-info"
			return getMsg('msg_n_blank');
		}else if (bytes(itm) > 40||bytes(itm) < 2){
			$_soojs("list_name_1").className="form-info error-info"
			return getMsg('msg_n_length');
		}

	}
	
	return '';
}
var submited = false;


function checkForm(itm){
	err1 = false;
	if (!submited){
		with (itm){
			for (var i=0; i<elements.length; i++){
				if (elements[i].type!="checkbox" &&!checkOnClick(elements[i])){
					if (!err1){
						err1 = true;
					}
				}
			}
		}

		if (err1){
			//alert('数据格式不正确，请检查后重新输入。');
			return false;
		}else{
			submited = true;
			return true;
		}
	}else{
		alert('请勿重复提交请求');
		return false;
	}
}




function getCookieVal(offset) {
	var endstr = document.cookie.indexOf (';', offset);
	if (endstr == -1) {
        endstr = document.cookie.length;
    }
	return unescape(document.cookie.substring(offset, endstr));
}

function getCookie (name) {  
	var arg = name + '=';  
	var alen = arg.length;  
	var clen = document.cookie.length;  
	var i = 0;  
	while (i < clen) {    
        var j = i + alen;
        if (document.cookie.substring(i, j) == arg){      
            return getCookieVal (j);
        }
        i = document.cookie.indexOf(' ', i) + 1;    
        if (i == 0) { 
            break;
        }  
	}  
	return null;
}

function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//获得数组
    var argc = setCookie.arguments.length;//获得数组的长度
    var expires = (argc > 2) ? argv[2] : 1;//可伸长变量
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //把传过来得变量变成天数
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
} 
String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "");}


function checkemail_f(){
	un = $_soojs("soojs_u_email").value;
	if(!un.match(/^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig)){
		//alert("新邮箱格式不对")
		$_soojs("soojs_u_email").focus()
		return false
	}	
	$_soojs("new_email-msg").innerHTML="<font color=green>正在检查邮件是否可用……</font>"
	scr = document.createElement('script')
	scr.src = 'Ujs/check.asp?tag=check_email_f&un=' + escape(un);
	document.getElementById('check_username_script').appendChild(scr);
}
function setEmailUsable_f(bol){
       // document.form1_s.soojs_u_email.readOnly = false;
        if (bol == 0){
			$_soojs("new_email-msg").innerHTML="<font color=green>您输入的邮件可用，请继续。</font>"
			
        }else if(bol == 1){
			$_soojs("new_email-msg").innerHTML="<font color=red>此邮件已存在，请另换一个</font>"
			$_soojs("soojs_u_email").value=""
			$_soojs("soojs_u_email").focus()
        }
}



//++++++++++++++++++++++++++++++++++++++++++++++a.txt+++++++++++++++++++++++++++++++



String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "")}
function $_(value){return document.getElementById(value)}

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

function act(v){
	for(var i=1;i<=2;i++){
		$_("a1_c"+i).style.display="none"	
	}
	$_("a1_c"+v).style.display=""
}
function act_in(){
	var timenow = new Date().getTime();
	var argv = act_in.arguments;
	var argc = act_in.arguments.length;
	var flag_=(argc >0) ? argv[0] : ""
	if($_('w_type1_a').value.Trim()==""){
		alert("存放目录不能为空!")
		$_('w_type1_a').focus()
		return false
	}
	soojs_xml();
	var url="./Ujs/check.asp";
	var t_post="tag=act_in&un="+escape($_('w_type1_a').value)+"&t="+timenow
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=act_in_ok;
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		
}
function act_in_ok(){
	var s	
	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			if(temp_x.indexOf("error")!=-1){
				s=temp_x
				s_a=s.split("||")
				alert(s_a[1])
				$_('w_type1_a').value=""
				$_('w_type1_a').focus()
			}else{
				//$_("a1_c1").style.display=""
				
				s=temp_x+" "	
//				s+='<span style="cursor:pointer;" onclick="act(2)" id="a1_c1">添加新分类</span>'
//				s+='<span id="a1_c2" style="display:none">'
//				s+='<input type="text" name="w_type1_a" value="" class="input-text" id="w_type1_a" maxlength="20" style="width:50px" />'
//				s+='<input type="button" class="button btn-blue" value="添加" onclick="act_in()"/>'
//				s+='<input type="button" class="button btn-gray" value="取消" onClick="act(1)"  />'
//				s+='</span>'
				act(1)
				$_("w_type1_td").innerHTML=s
			}
		}
	}
}
