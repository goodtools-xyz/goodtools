var G_All_moshi = "1"
var G_Newqt_Dir = "/"
var G_Newqt_countimg = document.createElement('img');
var G_Newqt_countimg2 = document.createElement('img');
var G_Newqt_G_WebUrl = "http://127.0.0.1:99/"
var G_Newqt_G_WEBNAME = "�����˼���ַ������"
var G_Newqt_G_All_dhList_f = "{qt:G_All_dhList_f}"
var G_Newqt_G_lm_baidu = "site71090"
var G_Newqt_G_lm_baidu_ch = "site71090"
var G_Newqt_G_lm_google_s = "partner-pub-0520467129961361:mibs8b9cu7d"
var G_Newqt_G_lm_sogou_s = "site71090"
var G_Newqt_G_lm_taobao2 = "mm_10797100_0_0"
var G_Newqt_G_lm_xunlei = "20116"
var G_Newqt_G_lm_dangdang_s = "P-306222"
var G_Newqt_G_lm_amazon_s = "site71090"
var G_Newqt_G_moban = "skin19_4_20100527"
var G_Newqt_G_lm_360buy = "22542"
var G_Newqt_G_u_Cookies = "ingtiancmscom"

function qtisSameSite(str) {
    return (new RegExp("http://" + document.location.host)).test(str);
}


function qtchickout(mid) { //ԭ��
    if ((G_All_moshi == "1") && ('' != mid.id) && (!isNaN(mid))) {
        var url = G_Newqt_Dir + "qtunion/go.asp?to=" + mid + "&tof=a&ref=" + document.referrer + "&t=" + (new Date()).getTime();
        G_Newqt_countimg.src = url;
    }
}

function qtchickout2(mid) { //��ַ��
    if ((G_All_moshi == "1") && ('' != mid.id) && (!isNaN(mid)) && (G_Newqt_G_All_dhList_f == "1")) {
        var url = G_Newqt_Dir + "qtunion/go.asp?to=0&tof=a&sId=" + mid + "&ref=" + document.referrer + "&t=" + (new Date()).getTime();
        G_Newqt_countimg.src = url;
    }
}
try {
    if (G_All_moshi == "1" && ('' != document.referrer) && !qtisSameSite(document.referrer)) {
        G_Newqt_countimg.src = G_Newqt_Dir + "qtUnion/in.asp?ref=" + document.referrer;
    }
} catch (e) {}

try {
    function G_Newqt_c() {
        var G_Newqt_union_idstr = location.search
        var G_Newqt_union_idpos = G_Newqt_union_idstr.indexOf("?")
        var G_Newqt_union_id = 0
        if (G_Newqt_union_idpos == 0) {
            G_Newqt_union_id = G_Newqt_union_idstr.substr(1, G_Newqt_union_idstr.length)
            var G_Newqt_union_id_z = /^\d+$/gi
            if (G_Newqt_union_id_z.test(G_Newqt_union_id))
                G_Newqt_countimg.src = G_Newqt_Dir + "qtUnion/Default.asp?a=" + G_Newqt_union_id + "&p=index&t=" + new Date().getTime();
        }
    }
    setTimeout("G_Newqt_c()", { qt: G_jifen_tuiguang_time })
} catch (e) {}

try {
    function G_Newqt_b() {
        G_Newqt_countimg2.src = G_Newqt_Dir + "qtUnion/bangding.asp?t=" + new Date().getTime();
    }
    setTimeout("G_Newqt_b()", { qt: G_jifen_home_time })
} catch (e) {}

//�û�����
var qTcms = {
    screenWidth: window.screen.width,
    Dom: {
        get: function(a) {
            return (typeof a == "object") ? a : document.getElementById(a)
        },
        eles: function(b, a) {
            if (typeof(b) == "string") {
                b = qTcms.Dom.get(b)
            }
            return b.getElementsByTagName(a)
        },
        show: function(a, b) {
            qTcms.Dom.get(a).style.display = (b == 0 ? "" : "block")
        },
        hide: function(a) {
            qTcms.Dom.get(a).style.display = "none"
        },
        toggle: function(a) {
            var b = qTcms.Dom.get(a);
            b.style.display == "none" ? b.style.display = "block" : b.style.display = "none"
        }
    },
    Browser: {
        ie: /msie/.test(window.navigator.userAgent.toLowerCase()),
        ie6: /msie 6.0/.test(window.navigator.userAgent.toLowerCase()),
        moz: /gecko/.test(window.navigator.userAgent.toLowerCase()),
        opera: /opera/.test(window.navigator.userAgent.toLowerCase()),
        safari: /safari/.test(window.navigator.userAgent.toLowerCase())
    },
    Cookie: {
        set: function(b, d, a, e, c) {
            if (typeof a == "undefined") {
                a = new Date(new Date().getTime() + 1000 * 3600 * 24 * 30)
            }
            document.cookie = b + "=" + escape(d) + ((a) ? "; expires=" + a.toGMTString() : "") + ((e) ? "; path=" + e : "; path=/") + ((c) ? ";domain=" + c : "")
        },
        get2: function(b) {
            var aCookie = document.cookie.split("; ")
            for (var i = 0; i < aCookie.length; i++) {
                var aCrumb = aCookie[i].split("=")
                if (b == unescape(aCrumb[0])) return unescape(aCrumb[1])
            }
            return null
        },
        get22: function(b) {
            var aCookie = document.cookie.split("; ")
            for (var i = 0; i < aCookie.length; i++) {
                var aCrumb = aCookie[i].split("=")
                if (b == unescape(aCrumb[0])) return unescape(unescape(aCrumb[1]))
            }
            return null
        },
        get3: function(a, b) {
            if (a == null) return null
            var aCookie = a.split("&")
            for (var i = 0; i < aCookie.length; i++) {
                var aCrumb = aCookie[i].split("=")
                if (b == unescape(aCrumb[0])) return unescape(aCrumb[1])
            }
            return null
        },
        get: function(b) {
            var a = document.cookie.match(new RegExp("(^| )" + b + "=([^;]*)(;|$)"));
            if (a != null) {
                return unescape(a[2])
            }
            return null
        },
        clear: function(a, c, b) {
            if (this.get(a)) {
                document.cookie = a + "=" + ((c) ? "; path=" + c : "; path=/") + ((b) ? "; domain=" + b : "") + ";expires=Fri, 02-Jan-1970 00:00:00 GMT"
            }
        },
        get4: function(b) {
            var bb = "";
            var aCookie = document.cookie.split("&")
            for (var i = 0; i < aCookie.length; i++) {
                var aCrumb = aCookie[i].split("=")
                if (b == unescape(aCrumb[0])) {
                    bb = unescape(unescape(aCrumb[1]));
                    i = aCookie.length + 1
                }
            }
            if (bb == "") {
                bb = qTcms.Cookie.get22(b);
                return bb
            }
            return ""
        }
    },
    reconvert: function(str) {
        if (str == "" || str == null) return "";
        str = str.replace(/(\\u)(\w{4})/gi, function($0) {
            return (String.fromCharCode(parseInt((escape($0).replace(/(%5Cu)(\w{4})/g, "$2")), 16)));
        });

        str = str.replace(/(&#x)(\w{4});/gi, function($0) {
            return String.fromCharCode(parseInt(escape($0).replace(/(%26%23x)(\w{4})(%3B)/g, "$2"), 16));
        });
        if (str.indexOf(";") != -1) {
            var a = "";
            a = str.split(";");
            str = a[0];
        }
        return str;
    },
    getStyle: function(b, a) {
        if (document.defaultView) {
            return document.defaultView.getComputedStyle(b, null).getPropertyValue(a)
        } else {
            a = a.replace(/\-([a-z])([a-z]?)/ig, function(e, d, c) { return d.toUpperCase() + c.toLowerCase() });
            return b.currentStyle[a]
        }
    },
    getPosXY: function(c, d) {
        var b = d ? d.slice(0) : [0, c.offsetHeight - 1],
            a;
        do {
            b[0] += c.offsetLeft;
            b[1] += c.offsetTop;
            c = c.offsetParent
        } while (c);
        return b
    },
    Ajax: function(c, j) {
        var h;
        if (typeof XMLHttpRequest !== "undefined") {
            h = new XMLHttpRequest()
        } else {
            var b = ["Microsoft.XmlHttp", "MSXML2.XmlHttp", "MSXML2.XmlHttp.3.0", "MSXML2.XmlHttp.4.0", "MSXML2.XmlHttp.5.0"];
            for (var d = 0, a = b.length; d < a; d++) {
                try {
                    h = new ActiveXObject(b[d]);
                    break
                } catch (f) {}
            }
        }
        h.onreadystatechange = g;

        function g() {
            if (h.readyState < 4) { return }
            if (h.status !== 200) { return }
            if (h.readyState === 4) { j(h) }
        }
        h.open("GET", c, true);
        h.send("")
    },
    AjaxPost: function(url, query, j) {
        var h;
        if (typeof XMLHttpRequest !== "undefined") {
            h = new XMLHttpRequest()
        } else {
            var b = ["Microsoft.XmlHttp", "MSXML2.XmlHttp", "MSXML2.XmlHttp.3.0", "MSXML2.XmlHttp.4.0", "MSXML2.XmlHttp.5.0"];
            for (var d = 0, a = b.length; d < a; d++) {
                try {
                    h = new ActiveXObject(b[d]);
                    break
                } catch (f) {}
            }
        }
        h.onreadystatechange = g;

        function g() {
            if (h.readyState < 4) { return }
            if (h.status !== 200) { return }
            if (h.readyState === 4) { j(h) }
        }
        h.open("POST", url, true);
        h.setRequestHeader("Content-Length", query.length);
        h.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
        h.send(query);
    },
    JsLoader: function(d, a, e, c) {
        var b = document.createElement("script");
        if (c) { b.setAttribute("charset", c) } else { b.setAttribute("charset", "utf-8") }
        b.setAttribute("type", "text/javascript");
        b.setAttribute("src", d);
        b.id = a;
        document.getElementsByTagName("head")[0].appendChild(b);
        if (e) {
            if (qTcms.Browser.ie) {
                b.onreadystatechange = function() {
                    if (this.readyState == "loaded" || this.readyState == "complete") {
                        e()
                    }
                }
            } else {
                if (qTcms.Browser.moz) { b.onload = function() { e() } } else { e() }
            }
        }
    },
    addFav: function(a) {
        if (document.all) {
            window.external.AddFavorite(location.href, a)
        } else {
            if (window.sidebar) {
                window.sidebar.addPanel(a, location.href, "")
            } else {
                if (window.opera && window.print) { return true }
            }
        }
    },
    setHomepage: function(c, a) {
        var b = location.pathname.replace("/", "");
        b = b.split(".")[0];
        if (a) { b = "" }
        if (qTcms.Browser.moz) {
            alert("�趨ʧ�ܣ��ò�����֧��FireFox�������")
        } else {
            c.style.behavior = "url(#default#homepage)";
            if (b == "index" || b == "" || b.indexOf("/") !== -1) {
                c.setHomePage(window.location.href)
            } else {
                c.setHomePage(window.location.href)
            }
        }
    },
    setHomepage1: function(e_obj) {
        if (document.all) {
            try {
                document.body.style.behavior = 'url(#default#homepage)';
                document.body.setHomePage(window.location);
            } catch (e) {
                try {
                    e_obj.style.behavior = 'url(#default#homepage)';
                    e_obj.setHomePage(window.location);
                } catch (e) {
                    alert("�����������֧���Զ�������ҳ����ʹ��������˵��ֶ����ã�")
                }
            }
        } else if (window.sidebar) {
            if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("�����������֧���Զ�������ҳ����ʹ��������˵��ֶ����ã�")
                }
            } else {
                try {
                    var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                    prefs.setCharPref('browser.startup.homepage', window.location);
                    alert('���óɹ�');
                } catch (e) {
                    alert("�����������֧���Զ�������ҳ����ʹ��������˵��ֶ����ã�")
                }
            }
        } else {
            alert("�����������֧���Զ�������ҳ����ʹ��������˵��ֶ����ã�")
        }
    },
    U_GetUid: function() {
        var id = 0;
        var soojs_id = qTcms.Cookie.get3(qTcms.Cookie.get(G_Newqt_G_u_Cookies), "soojs_id");
        if (soojs_id == null)
            id = 0;
        else {
            if (soojs_id == "")
                id = 0
            else
                id = soojs_id
        }
        return id
    }
};