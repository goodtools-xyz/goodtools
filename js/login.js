//写入cookie
var exp = new Date();
exp.setTime(exp.getTime() + 1000 * 60 * 60 * 24); //这里表示保存24小时
document.cookie = "music_identify=" + id + ";expires=" + exp.toGMTString();

/* 获取指定cookie */
function getCookie(name) {
    var strCookie = document.cookie;
    var arrCookie = strCookie.split("; ");
    for (var i = 0; i < arrCookie.length; i++) {
        var arr = arrCookie[i].split("=");
        if (arr[0] == name)
            return arr[1];
    }
    return "";
}
/* Ajax登录 */
function ajaxLogin(id, pass, classes) {
    var xmlhttp;

    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else { // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET", "pages/loginByNav.php?user_id=" + id + "&user_pass=" + pass, false);

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText != 0) {
                var textArray = xmlhttp.responseText.split("|");
                document.getElementById("inputBox").innerHTML = "<h3>欢迎回来，" + textArray[1] + "</h3><img class='img-responsive img-circle' src='" + textArray[3] + "'>";
                document.getElementById("user_name_nav").innerHTML = " " + textArray[1] + "，欢迎你！";
                document.getElementById("user_img_nav").setAttribute("src", textArray[3]);
                document.getElementById("user_info_nav").style.visibility = "";
                document.getElementById("loginAndReg").style.visibility = "hidden";
                document.getElementById("loginAndReg1").style.visibility = "hidden";

                //增加的保存cookie代码
                var exp = new Date();
                var passHash = hex_md5(pass);
                exp.setTime(exp.getTime() + 60 * 1000 * 60 * 24); //24小时
                document.cookie = "music_identify=" + id + ";expires=" + exp.toGMTString();
                document.cookie = "music_key_code=" + passHash + ";expires=" + exp.toGMTString();
                //新增结束

                player(textArray[4]);

            } else {
                var login = document.getElementById("login_to");
                login.setAttribute("class", classes);
                login.innerHTML = "<i class='glyphicon glyphicon-log-in'></i> 登 录";
                removeElem("warningTip");
                var tips = "账号或密码错误！";
                var form = document.getElementById("form1");
                form.insertBefore(alertBox(tips, "warning"), form.childNodes[0]);
            }
        }
    };
    xmlhttp.send();
}

/* 读取cookie识别登录状态 */
function checkLogin() {
    if (getCookie("music_identify") != "" && getCookie("music_key_code") != "") {
        var id = getCookie("music_identify"),
            pass = getCookie("music_key_code"),
            xmlhttp;

        if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else { // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("GET", "pages/loginByCookie.php?user_id=" + id + "&user_pass=" + pass, false);

        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                if (xmlhttp.responseText != 0) {
                    //do something ...

                } else {
                    //do something ...
                }
            }
        };
        xmlhttp.send();
    }
}

/* 退出登录刷新页面,删除cookie状态 */
function exitLogin() {
    document.cookie = "music_identify=";
    document.cookie = "music_key_code=";
    window.location.reload(true);
}