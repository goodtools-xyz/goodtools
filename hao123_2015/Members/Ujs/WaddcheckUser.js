
function $_soojs(id){
	return document.getElementById(id);	
}
function showError(msg, itm,onclickun){
	if (itm.getAttribute("rel")=="text_flag"){
		arr = $_soojs(itm.id+'_1');
		if(!arr.style.color)
			arr.style.color="#F00";
		arr.innerHTML = msg;
		if(typeof(onclickun)=="boolean" && onclickun==true &&itm.id=="w_url"){
			document.getElementById("w_url").value="";
			$_soojs("w_url_1").className="form-info error-info"
		}
		if(typeof(onclickun)=="boolean" && onclickun==true &&itm.id=="soojs_u_name"){
			document.getElementById("soojs_u_name").value="";
		}		
		if(typeof(onclickun)=="boolean" && onclickun==true &&itm.id=="soojs_code"){
			document.getElementById("soojs_code").value="";
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
			if(itm.id == "w_url" && !blank){
				checkw_url();
			}
			if(itm.id == "w_name" && !blank){
				$_soojs("w_name_1").className="form-info suc-info"
				showError(getMsg('msg_n_ok'), document.info.w_name);
			}	
			if(itm.id == "soojs_code" && !blank){
				checkVerifycode();
			}				
			return true;
		}
}
function checkw_url(){
	un = document.info.w_url;
	if(checkOnClick(un)){
		showError(getMsg('msg_url_checking'), un);
		scr = document.createElement('script')
		scr.src = 'Ujs/check.asp?tag=check_urlp&un=' + escape(un.value) + "&id="+$_soojs("id").value;
		document.getElementById('check_username_script').appendChild(scr);
	}
}
function checkemail(){
	un = document.form1_s.soojs_u_email;
	if(checkOnClick(un)){
		showError(getMsg('msg_email_checking'), un);
		scr = document.createElement('script')
		scr.src = 'Ujs/check.asp?tag=check_email&un=' + escape(un.value);
		document.getElementById('check_username_script').appendChild(scr);
	}
}
function checkVerifycode(){
	verifycode_va = document.form1_s.soojs_code;
	if(checkOnClick(verifycode_va)){
		showError(getMsg('msg_vc_checking'), verifycode_va);
		scr2 = document.createElement('script')
		scr2.src = 'Ujs/check.asp?tag=check_verifycode&un=' + escape(verifycode_va.value);
		document.getElementById('check_username_script').appendChild(scr2);
	}
}
function setw_urlUsable_f(bol){
       // document.form1_s.soojs_u_email.readOnly = false;
        if (bol == 0){
				$_soojs("w_url_1").className="form-info suc-info"
                showError(getMsg('msg_url_ok'), document.info.w_url);
				return true
        }else if(bol == 1){
                showError(getMsg('msg_url_exists'), document.info.w_url, true);
				return false
        }
}
function checkOnChange(itm){
	return checkInput(itm, false);
}
function checkOnClick(itm){
	return checkInput(itm, true);
}
function setUserNameUsable(bol){
        document.form1_s.soojs_u_name.readOnly = false;
        if (bol == 0){
                showError(getMsg('msg_un_ok'), document.form1_s.soojs_u_name);
				return true
        }else if(bol == 1){
                showError(getMsg('msg_un_exists'), document.form1_s.soojs_u_name, true);
				return false
        }else if(bol == 2){
                showError(getMsg('msg_un_format'), document.form1_s.soojs_u_name, true);
        }else if(bol == 3){
                showError(getMsg('msg_user_deny'), document.form1_s.soojs_u_name, true);
        }
}
function setverifycodeable(bol){
        document.form1_s.soojs_code.readOnly = false;
        if (bol == 0){
                showError(getMsg('msg_vc_err'), document.form1_s.soojs_code, true);
        }else if(bol == 1){
                showError(getMsg('msg_vc_ok'), document.form1_s.soojs_code);
				
        }
}
function checkItem(itm, blank){
	pwdflg = false;
	if (itm.id == 'w_url'){
		if (blank && itm.value == ''){
			$_soojs("w_url_1").className="form-info error-info"
			return getMsg('msg_url_blank');
		}else if (!("http://"+itm.value).match(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/gi)){
			$_soojs("w_url_1").className="form-info error-info"
			return getMsg('msg_url_format');
		}
	}else if (itm.id == 'w_name'){
		if (blank && itm.value == ''){
			$_soojs("w_name_1").className="form-info error-info"
			return getMsg('msg_n_blank');
		}else if (bytes(itm) > 40||bytes(itm) < 2){
			$_soojs("w_name_1").className="form-info error-info"
			return getMsg('msg_n_length');
		}

	}else if(itm.id == 'info_textarea'){
		if (blank && itm.value == ''){
			return getMsg('msg_cn_ok');
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
			document.getElementById('soojs_su').disabled = true;
			return true;
		}
	}else{
		alert('请勿重复提交请求');
		return false;
	}
}

function newverifypic()
{
	var timenow = new Date().getTime();
	url="Ujs/code.asp";
	url=url+"?"+timenow;
	document.getElementById("verifypic").src=url;
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
