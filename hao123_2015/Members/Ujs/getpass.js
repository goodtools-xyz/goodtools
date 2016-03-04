
function $_soojs(id){
	return document.getElementById(id);	
}

function check_getpass(){
	var email=$_soojs("email").value
	if(!email.match(/^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig))	{
		$_soojs("email_1").className="form-info error-info"	
		$_soojs("email_1").innerHTML="E-mail地址格式不对"
		return false
	}
}
function check_getcart(){
	var soojs_u_card=$_soojs("soojs_u_card").value.Trim()
	if(soojs_u_card.length==15||soojs_u_card.length==18){
	}else{
		$_soojs("soojs_u_card_1").className="form-info error-info"	
		$_soojs("soojs_u_card_1").innerHTML="身份证格式不对"
		return false		
	}
} 
function check_getusername(){
	var soojs_u_name=$_soojs("soojs_u_name").value.Trim()
	if(soojs_u_name.length<4){
		$_soojs("soojs_u_name_1").className="form-info error-info"	
		$_soojs("soojs_u_name_1").innerHTML="昵称格式不对"
		return false		
	}else if(soojs_u_name.length>16){
		$_soojs("soojs_u_name_1").className="form-info error-info"	
		$_soojs("soojs_u_name_1").innerHTML="昵称格式不对"
		return false		
	}else if(!soojs_u_name.match(/^[A-Za-z0-9_]+$/gi)){
		$_soojs("soojs_u_name_1").className="form-info error-info"	
		$_soojs("soojs_u_name_1").innerHTML="昵称格式不对"
		return false
	}
}  
 
 
String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "");}


//++++++++++++++++++++++++++++++++++++++++++++++a.txt+++++++++++++++++++++++++++++++
