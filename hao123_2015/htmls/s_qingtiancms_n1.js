
if(qtcmsdd.xxpf=="")qtcmsdd.xxpf="green";

var Config = {    getThemeUrl: function() {
        return qtcmsdd.t+"theme/html/theme.html?t=" + parseInt(Math.random() * 100)
    },
    getThemeTypeUrl: function(type) {
        type = type || "newest";
        return qtcmsdd.t+"theme/html/" + type + ".html?t=" + parseInt(Math.random() * 100)
    },
    cssFilePath: qtcmsdd.t+"public4/rebuild/css/skin/",
    SkinCookieName: "skinCss",
    defaultTheme: qtcmsdd.xxpf,
    Search: {
		        s115: {
            action: "http://s.116.com/",
            name: "q",
            btn: "搜 索",
            img: [qtcmsdd.t+"public4/rebuild/images/s/116.gif", "116.com"],
            url: "http://s.116.com/",
            params: {
                ie: "gbk"
            }
        },
        web: {
            action: "http://www.baidu.com/s",
            name: "wd",
            btn: "百度一下",
            img: [qtcmsdd.t+"public4/rebuild/images/s/baidu.gif?v2.0", "百度首页"],
            url: "http://www.baidu.com/index.php?tn=" + BaiduTn.tn + "&ch=" + BaiduTn.ch,
            params: {
                tn: BaiduTn.tn,
                ch: BaiduTn.ch
            }
        },
		baidu: {
			action: "http://www.baidu.com/s",
			btn: "百度一下",
			name: "wd",
			img: [qtcmsdd.t+"public4/rebuild/images/s/baidu.gif?v2.0", "百度一下"],
			url: "http://www.baidu.com/",
			params: {
				tn:  BaiduTn.tn
			}
		},
		bing: {
			action: "http://daohang.soojs.com/data/search.asp",
			btn: "必应搜索",
			name: "w",
			img: [qtcmsdd.t+"public4/rebuild/images/s/bing.gif?v2.0", "必应搜索"],
			url: "http://cn.bing.com/",
			params: {
				a: 'cn.bing.com'
			}
		},		
		sogou: {
			action: "http://www.sogou.com/sogou",
			btn: "搜狗搜索",
			name: "query",
			img: [qtcmsdd.t+"public4/rebuild/images/s/sogou.gif?v2.0", "搜狗搜索"],
			url: "http://www.sogou.com/",
			params: {
				pid: qtcmsdd.Ssg
			}
		},
		google: {
			action: "http://www.google.com.hk/cse",
			btn: "谷歌搜索",
			name: "q",
			img: [qtcmsdd.t+"public4/rebuild/images/s/google.gif?v2.0", "谷歌搜索"],
			url: "http://www.google.com.hk/",
			params: {
				cx:qtcmsdd.Sgg,
				hl:"zh-CN",
				ie:"gb2312",
				oe: 'gb2312',
				"newwindow":1
			}
		},
		s360: {
			action: "http://www.so.com/s",
			btn: "搜索一下",
			name: "q",
			img: [qtcmsdd.t+"public4/rebuild/images/s/360.gif?v2.0", "搜索一下"],
			url: "http://www.so.com/",
			params: {
				ie:"gb2312"
			}
		},
		youdao: {
			action: "http://www.youdao.com/search",
			btn: "有道搜索",
			name: "q",
			img: [qtcmsdd.t+"public4/rebuild/images/s/youdao.gif?v2.0", "有道搜索"],
			url: "http://www.youdao.com/",
			params: {
				ie:"gb2312",
				keyfrom:"web.index"
			}
		},		
        mp3: {
            action: "http://daohang.soojs.com/data/search.asp",
            name: "w",
            btn: "百度一下",
            img: [qtcmsdd.t+"public4/rebuild/images/s/yinyue.gif?v2.0", "百度一下"],
            url: "http://music.baidu.com/?ie=utf-8&ct=134217728&word=&tn=" + BaiduTn.tn + "&ch=" + BaiduTn.ch,
            params: {
                a: "mp3.baidu.com"
            }
        },
        video: {
            action: "http://video.baidu.com/v",
            name: "word",
            btn: "百度一下",
            img: [qtcmsdd.t+"public4/rebuild/images/s/video.gif", "百度一下"],
            url: "http://video.baidu.com/",
            params: {
               
            }
        },
        v115: {
            action: "http://hz.v.baofeng.com/search/web/search.php",
            name: "keywords",
            btn: "暴风视频",
            img: [qtcmsdd.t+"public4/rebuild/images/s/bf-video.gif?v2.0", "暴风视频"],
            url: "http://hz.v.baofeng.com/",
            params: {}
        },
        image: {
            action: "http://image.baidu.com/i",
            name: "word",
            btn: "百度一下",
            img: [qtcmsdd.t+"public4/rebuild/images/s/pic.gif?v2.0", "百度图片"],
            url: "http://image.baidu.com/",
            params: {
                ct: "201326592",
                cl: "2",
                pv: "",
                lm: "-1"
            }
        },
        zhidao: {
            action: "http://zhidao.baidu.com/q",
            name: "word",
            btn: "百度一下",
            img: [qtcmsdd.t+"public4/rebuild/images/s/zhidao.gif?v2.0", "百度知道"],
            url: "http://zhidao.baidu.com/q?pt=ylmf_ik",
            params: {
                tn: "ikaslist",
                ct: "17"
            }
        },
        taobao: {
            action: "http://search8.taobao.com/search",
            name: "q",
            btn: "淘宝搜索",
            img: [qtcmsdd.t+"public4/rebuild/images/s/taobao.gif?v2.0", "淘宝网"],
            url: "http://www.taobao.com/",
            params: {
                pid: qtcmsdd.taobao,
                commend: "all"
            }
        },
        baike: {
            action: "http://baike.baidu.com/searchword/",
            name: "word",
            btn: "搜索词条",
            img: [qtcmsdd.t+"public4/rebuild/images/s/baike.gif", "百度百科"],
            url: "http://baike.baidu.com/",
            params: {
                tn: "baiduWikiSearch",
                submit: "search",
                pn: "0",
                rn: "10",
                ct: "17",
                lm: "0"
            }
        },
        ditu: {
            action: "http://map.baidu.com/m",
            name: "word",
            btn: "搜索地图",
            img: [qtcmsdd.t+"public4/rebuild/images/s/ditu.gif", "百度地图"],
            url: "http://map.baidu.com/",
            params: {
                ie: "gbk"
            }
        },
        computer: {
            action: "http://search.yesky.com/searchproduct.do",
            name: "wd",
            btn: "搜 索",
            img: [qtcmsdd.t+"public4/rebuild/images/s/yesky.gif", "天极电脑"],
            url: "http://product.yesky.com/",
            params: {
                ie: "gbk"
            }
        },
        qvod: {
            action: "http://daohang.soojs.com/data/search.asp",
            name: "w",
            btn: "快播搜索",
            img: [qtcmsdd.t+"public4/rebuild/images/s/qvod.gif", "快播搜索"],
            url: "http://product.yesky.com/",
            params: {
                a:"www.ketuan.cc"
            }
        }
    },
    Mail: [{
        val: 0
    },
    {
        action: "http://reg.163.com/CheckUser.jsp",
        params: {
            url: "http://entry.mail.163.com/coremail/fcg/ntesdoor2?lightweight=1&verifycookie=1&language=-1&style=15",
            username: "#{u}",
            password: "#{p}"
        }
    },
    {
        action: "https://reg.163.com/logins.jsp",
        params: {
            domain: "126.com",
            username: "#{u}@126.com",
            password: "#{p}",
            url: "http://entry.mail.126.com/cgi/ntesdoor?lightweight%3D1%26verifycookie%3D1%26language%3D0%26style%3D-1"
        }
    },
    {
        action: "https://ssl1.vip.163.com/logon.m",
        params: {
            username: "#{u}",
            password: "#{p}",
            enterVip: true
        }
    },
    {
        action: "http://mail.sina.com.cn/cgi-bin/login.cgi",
        params: {
            u: "#{u}",
            psw: "#{p}"
        }
    },
    {
        action: "http://vip.sina.com.cn/cgi-bin/login.cgi",
        params: {
            user: "#{u}",
            pass: "#{p}"
        }
    },
    {
        action: "https://edit.bjs.yahoo.com/config/login",
        params: {
            login: "#{u}@yahoo.com.cn",
            passwd: "#{p}",
            domainss: "yahoo",
            ".intl": "cn",
            ".src": "ym"
        }
    },
    {
        action: "https://edit.bjs.yahoo.com/config/login",
        params: {
            login: "#{u}@yahoo.cn",
            passwd: "#{p}",
            domainss: "yahoocn",
            ".intl": "cn",
            ".done": "http://mail.cn.yahoo.com/inset.html"
        }
    },
    {
        action: "http://passport.sohu.com/login.jsp",
        params: {
            loginid: "#{u}@sohu.com",
            passwd: "#{p}",
            fl: "1",
            vr: "1|1",
            appid: "1000",
            ru: "http://login.mail.sohu.com/servlet/LoginServlet",
            ct: "1173080990",
            sg: "5082635c77272088ae7241ccdf7cf062"
        }
    },
    {
        action: "http://login.mail.tom.com/cgi/login",
        params: {
            user: "#{u}",
            pass: "#{p}"
        }
    },
    {
        action: "http://passport.21cn.com/maillogin.jsp",
        params: {
            UserName: "#{u}@21cn.com",
            passwd: "#{p}",
            domainname: "21cn.com"
        }
    },
    {
        action: "https://reg.163.com/logins.jsp",
        params: {
            domain: "yeah.net",
            username: "#{u}@yeah.net",
            password: "#{p}",
            url: "http://entry.mail.yeah.net/cgi/ntesdoor?lightweight%3D1%26verifycookie%3D1%26style%3D-1"
        }
    },
    {
        action: "http://zx.passport.189.cn/Logon/UDBCommon/S/PassportLogin.aspx?PassportLoginRequest=3500000000400101%243qGTaeZcFhxvAWjKmUNeSXwAgn1LsgB7Baj1rQn96XNKuzpE%2baP%2b9Q6CDg1Bqmrnosfrnoa6ujbo%0aBzYxmWBAESIoGVwlaoSM4%2fMixUkU7%2fAcJ0L4Yrckifcqhk3rO22i",
        params: {
            __VIEWSTATE: "/wEPDwUKMTYxODg2ODExNQ9kFgJmD2QWDgIBDxYCHgVzdHlsZQUSdmlzaWJpbGl0eTp2aXNpYmxlFgICAQ8PFgIeBFRleHQFG+eUqOaIt+WQjeaIluWvhueggemUmeivr+OAgmRkAg0PDxYEHgtOYXZpZ2F0ZVVybAVIaHR0cDovL3Bhc3Nwb3J0LjE4OS5jbi9TZWxmUy9ML1JlZy9TZWxlY3QuYXNweD9EZXZpY2VObz0zNTAwMDAwMDAwNDAwMTAxHwEFByDms6jlhoxkZAIPDw8WAh8BBTRodHRwOi8vd3d3LjE4OS5jbi93ZWJtYWlsL2pzcC8xODltaXNjL3Y1L2Nzcy91ZGIuY3NzZGQCEQ8PFgIfAQUtaHR0cDovL3dlYm1haWw1LjE4OS5jbi93ZWJtYWlsL1VEQkxvZ2luUmV0dXJuZGQCEw8PFgIfAQUQMzUwMDAwMDAwMDQwMDEwMWRkAhUPDxYCHwEFDDEyNC4yMDUuNzcuOWRkAhcPDxYCHwEFDHZCWWdGcWRydTVrPWRkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYBBQtjYl9TYXZlTmFtZYevyftAQT5CX9s2VZJOrPsTLqDH",
            __EVENTVALIDATION: "/wEWCQLckeONBALT8dy8BQKd+7qdDgK/8ZbBBQKhwImNCwK1yJy1AQLhyKz0DgKh/9zICgKnqZGuBiPwFoYTVzM5HAbhLCKRJWRuEyet",
            txtUserID: "#{u}",
            txtPwd: "#{p}"
        }
    },
    {
        action: "https://mail.10086.cn/Login/Login.ashx",
        params: {
            UserName: "#{u}",
            Password: "#{p}",
            ClientId: "5028",
            type: "mail"
        }
    },
    {
        action: "http://passport.baidu.com/?login",
        params: {
            u: "http://passport.baidu.com/center",
            username: "#{u}",
            password: "#{p}"
        }
    },
    {
        action: "http://passport.renren.com/PLogin.do",
        params: {
            email: "#{u}",
            password: "#{p}",
            origURL: "http://www.renren.com/Home.do",
            domain: "renren.com"
        }
    },
    {
        action: "http://passport.51.com/login.5p",
        params: {
            passport_51_user: "#{u}",
            passport_51_password: "#{p}",
            gourl: "http%3A%2F%2Fmy.51.com%2Fwebim%2Findex.php"
        }
    },
    {
        action: "http://passport.sohu.com/login.jsp",
        params: {
            loginid: "#{u}@chinaren.com",
            passwd: "#{p}",
            fl: "1",
            vr: "1|1",
            appid: "1005",
            ru: "http://profile.chinaren.com/urs/setcookie.jsp?burl=http://alumni.chinaren.com/",
            ct: "1174378209",
            sg: "84ff7b2e1d8f3dc46c6d17bb83fe72bd"
        }
    }],
    banner: {
        b4: {
            img: "static/images/banner/taoke12060.jpg",
            url: "http://pindao.huoban.taobao.com/channel/channelMall.htm?pid=mm_11140156_0_0"
        }
    },
    Track: [["js_mailSubmit", {
        n: "邮箱登录",
        u: "邮箱登录",
        q: 0
    }]],
    Keywords: [["免费杀毒软件", "http://www.xiazaiba.com/html/1773.html"], ["酷狗", "http://www.xiazaiba.com/html/63.html"]]
};
function getProId(proName) {
    var ProId;
    CityArr.forEach(function(element, index, array) {
        if (element[0] === proName) {
            ProId = element[2]
        }
    });
    return ProId
}
function getCityId(ProId, CityName) {
    var CityId;
    CityArr.forEach(function(element, index, array) {
        if (element[0] === CityName && element[1] === ProId) {
            CityId = element[2]
        }
    });
    return CityId
};
if (Cookie.get("ws")) {
    $("#classicsWrap").addClass("kpWrap")
}
DOMReady(function() {
    if (Browser.isIE) {
        $("#sf .searchWord").el.value = ""
    }
    $("#sf .searchWord").el.focus();
    if (typeof($(".sortSite")) != "undefined") {
        $(".sortSite li").on("mouseover",
        function(b) {
            $(b).addClass("hover")
        }).on("mouseout",
        function(b) {
            $(b).removeClass("hover")
        })
    }
    $("li.drop").on("mouseover",
    function(b) {
        $(b).addClass("hover")
    }).on("mouseout",
    function(b) {
        $(b).removeClass("hover")
    });
    if (typeof($("#js_cal")) !== "undefined") {
        var a = '<ul class="fl" ><li class="date">' + Calendar.day() + '</li><li class="lcal">' + Calendar.cnday() + "</li></ul>";
        $("#js_cal").el.innerHTML = a
    }
    MailLogin.userNameGotFocus();
    MailLogin.setMailAddress()
});
var Ylmf = {
    getProId: function(b) {
        var c;
        for (var d = 0,
        a = CityArr.length; d < a; ++d) {
            if (CityArr[d][0] == b && parseInt(CityArr[d][2]) < 900) {
                c = CityArr[d][2]
            }
        }
        return c
    },
    getCityId: function(b, d) {
        if (!b) {
            return false
        }
        var e;
        for (var c = 0,
        a = CityArr.length; c < a; ++c) {
            if (CityArr[c][1] == b && CityArr[c][0] == d) {
                e = CityArr[c][2]
            }
        }
        return e
    },
    getCitys: function(c) {
        if (!c) {
            return false
        }
        var b = [];
        for (var d = 0,
        a = CityArr.length; d < a; ++d) {
            if (CityArr[d][1] == c) {
                b.push(CityArr[d])
            }
        }
        return b
    },
    getSelectValue: function(b) {
        var a = b.selectedIndex,
        c, d;
        if (a > -1) {
            c = b.options[a];
            d = c.innerHTML.split(" ")[1];
            return d
        }
        return null
    },
    ScriptLoader: {
        Add: function(c) {
            if (!c || !c.src) {
                return
            }
            var d = document;
            var b = d.getElementsByTagName("head")[0],
            a = d.createElement("script");
            a.onload = a.onreadystatechange = function() {
                if (a && a.readyState && a.readyState != "loaded" && a.readyState != "complete") {
                    return
                }
                a.onload = a.onreadystatechange = a.onerror = null;
                a.Src = "";
                if (!d.all) {
                    a.parentNode.removeChild(a)
                }
                a = null
            };
            a.src = c.src;
            a.charset = c.charset || "gb2312";
            b.insertBefore(a, b.firstChild)
        }
    }
};
Date.prototype.format = function(b) {
    var c = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        S: this.getMilliseconds()
    };
    if (/(y+)/.test(b)) {
        b = b.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length))
    }
    for (var a in c) {
        if (new RegExp("(" + a + ")").test(b)) {
            b = b.replace(RegExp.$1, RegExp.$1.length == 1 ? c[a] : ("00" + c[a]).substr(("" + c[a]).length))
        }
    }
    return b
};
var AddLink = (function() {
    var b = function() {
        var c = [];
        if (Cookie.get("citydata")) {
            c = Cookie.get("citydata").split(",");
            a(c[c.length - 1])
        }
    };
    var a = function(f) {
        if (f == "东莞") {
            if (typeof($("#J_localList")) != "undefined") {
                var e = $("#J_localList"),
                d = $("#J_localList li a")
            }
            var c = document.createElement("li");
            var g = document.createElement("a");
            g.setAttribute("href", "http://www.114la.com/city/dongguan.html");
            g.innerHTML = "东莞";
            c.appendChild(g);
            d.each(function(h) {
                if (h.innerHTML != "东莞") {
                    e.el.insertBefore(c, e.el.firstChild);
                    return
                }
            })
        } else {
            if (typeof($("#J_localList")) != "undefined") {
                var e = $("#J_localList"),
                d = $("#J_localList li a")
            }
            var c = document.createElement("li");
            var g = document.createElement("a");
            g.setAttribute("href", "http://www.114la.com/city/sichuan.htm");
            g.innerHTML = "四川";
            c.appendChild(g);
            d.each(function(h) {
                if (h.innerHTML != "四川") {
                    e.el.insertBefore(c, e.el.lastChild);
                    return
                }
            })
        }
    };
    return {
        Init: b
    }
})();

/*++++++++++++++++++++++++++++++++*/

$("#js_ws").on("click",
function(c) {
    var a = document.getElementById("ws");
    if (!a) {
        $("#classicsWrap").addClass("kpWrap");
        var d = document.createElement("link");
        d.href = qtcmsdd.t+"public4/rebuild/css/ws.css?v2013";
        d.rel = "stylesheet";
        d.id = "ws";
        var b = document.getElementsByTagName("base")[0];
        b.parentNode.insertBefore(d, b);
        Cookie.set("ws", "1")
    }
});
$("#js_nm").on("click",
function(b) {
    $("#classicsWrap").removeClass("kpWrap");
    var a = document.getElementById("ws");
    if (a) {
        a.parentNode.removeChild(a);
        Cookie.clear("ws")
    }
});
$("#jp_today,#ht_today").each(function(b) {
    b.value = new Date(new Date().getTime() + 3600 * 24 * 1000).format("yyyy-MM-dd");
    var a = b.value;
    $(b).on("focus",
    function(c) {
        if (c.value == a) {
            c.value = ""
        }
    }).on("blur",
    function(c) {
        if (c.value == "") {
            c.value = a
        }
    })
});





var MailLogin = {
    userNameGotFocus: function() {
        var a = $("#mail .mailPrompt"),
        e = $("#js_mailLogin"),
        c = $("#js_mailUsername"),
        d = $("#js_mailPassWord"),
        b = $("#mail .mailPromptPw");
        if (Browser.isIE == "6.0") {
            c.el.value = ""
        }
        if (c.el.value !== "") {
            a.hide()
        }
        c.on("focus",
        function(f) {
            e.show();
            $("#js_eMail").hasClass("e-mailActived",
            function(g) {
                if (!g) {
                    $("#js_eMail").addClass("e-mailActived")
                }
            });
            a.hide()
        }).on("blur",
        function(f) {
            if (f.value === "") {
                a.show()
            }
        });
        d.on("focus",
        function(f) {
            b.hide()
        }).on("blur",
        function(f) {
            if (f.value === "") {
                b.show()
            }
        })
    },
    setMailAddress: function() {
        var d = $("#js_mailServer"),
        a = $("#js_eMailList"),
        c = $("#js_eMailList li"),
        b = 0;
        var e = [{
            sou: "@vip.163.com",
            tar: "@vip.163..."
        },
        {
            sou: "@vip.sina.com",
            tar: "@vip.sina..."
        },
        {
            sou: "@yahoo.com.cn",
            tar: "@yahoo.c.."
        }];
        c.on("click",
        function(g) {
            if (g.getAttribute("dn")) {
                b = g.getAttribute("dn");
                d.el.innerHTML = g.innerHTML;
                a.el.setAttribute("selectIndex", b);
                for (var f = 0; f < e.length; f++) {
                    if (Yl.trim(g.innerHTML.toString()) === e[f].sou) {
                        d.el.innerHTML = e[f].tar
                    }
                    continue
                }
            }
        }).on("mouseover",
        function(f) {
            c.removeClass("hover");
            $(f).hasClass("no",
            function(g) {
                if (!g) {
                    $(f).addClass("hover")
                }
            })
        })
    },
    flag: false,
    mailCache: [],
    sendMail: function() {
        var g = $("#js_mailUsername").el.value,
        b = $("#js_mailPassWord").el.value,
        f = $("#js_eMailList").el,
        e = $("#mail").el,
        a = f.getAttribute("selectIndex"),
        c = Config.Mail[a],
        d = {
            u: g,
            p: b
        };
        if (Yl.trim(d.u) == "") {
            alert("用户名不能为空！");
            $("#js_mailUsername").el.focus();
            $("#mail .mailPrompt").hide();
            return
        }
        if (Yl.trim(d.p) == "") {
            alert("密码不能为空！");
            $("#js_mailPassWord").el.focus();
            $("#mail .mailPromptPw").hide();
            return
        }
        if (this.mailCache.index != a) {
            this.mailCache.forEach(function(h) {
                e.removeChild(h)
            });
            this.mailCache = []
        }
        e.setAttribute("action", c.action);
        for (I in c.params) {
            $(e).create("input", {
                type: "hidden",
                name: I,
                value: format(c.params[I], d)
            },
            function(h) {
                MailLogin.mailCache.push(h);
                this.append(h)
            })
        }
		
		if(a==1||a==3){
			window.open("http://reg.163.com/CheckUser.jsp?url=http://fm163.163.com/coremail/fcg/ntesdoor2?lightweight=1&username="+Yl.trim(d.u)+"&password="+Yl.trim(d.p));	
		}else if(a==2){
			window.open("http://reg.163.com/CheckUser.jsp?url=http://entry.mail.126.com/cgi/ntesdoor?hid=10010102&lightweight=1&verifycookie=1&language=0&style=-1&product=mail126&type=1&username="+Yl.trim(d.u)+"@126.com"+"&password="+Yl.trim(d.p));
		}else if(a==11){
			window.open("http://reg.163.com/CheckUser.jsp?url=http://entry.mail.yeah.net/coremail/fcg/ntesdoor2?lightweight=1&username="+Yl.trim(d.u)+"@yeah.net"+"&password="+Yl.trim(d.p));
		}
		else{
        	e.submit();
		}
        $("#js_mailPassWord").el.value = ""
    }
};



var SE = (function() {
    var b = [$("#searchForm").el.tn, $("#searchForm").el.ch];
    function a(d) {
		var pp_qtcms_com_d_action=d.action;
		if(pp_qtcms_com_d_action=="http://www.google.com.hk/cse"){
			if(qtcmsdd.Sgg=="baidu"){
				d.action="https://www.google.com.hk/search"	
			}
		}		
        $("#searchForm").el.action = d.action;
        $("#searchGroupLogo").el.src = d.img[0];
        $("#searchGroupLogo").el.setAttribute("alt", d.img[1]);
        $("#sf .searchWord").el.name = d.name;
        $("#sf .searchSubmit ").el.value = d.btn;
        $("#sf_label").el.href = d.url;
        if (b.length > 0) {
            b = c(b)
        }
        function c(h) {
            for (var g = 0,
            f = h.length; g < f; g++) {
                $("#searchForm").remove(h[g])
            }
            return []
        }
        for (var e in d.params) {
            $("#searchForm").create("input", {
                name: e,
                value: d.params[e],
                type: "hidden"
            },
            function(f) {
                b.push(f);
                this.append(f)
            })
        }
    }
    $("#sf .searchWord").on("mouseover",
    function(c) {
        if (cache.get("SE_ONFOCUS")) {
            return
        }
        c.value = c.value;
        c.focus()
    });
    $("#sf .searchWord").on("blur",
    function(c) {
        cache.remove("SE_ONFOCUS")
    });
    $("#sf .searchWord").on("focus",
    function(c) {
        cache.set("SE_ONFOCUS", true);
        if (Browser.isIE) {
            Yl.getFocus(c)
        } else {
            c.focus()
        }
    });
    return {
        set: a
    }
})();


document.onclick = function(f) {
    var f = f || window.event,
    d = f.srcElement || f.target,
    c = d.id;
    if ($("#js_mailLogin").el) {
        if (c === "js_mailUsername") {} else {
            if (c === "js_mailPassWord") {} else {
                if (c === "js_mailSubmit") {} else {
                    if (c === "js_mailServer") {} else {
                        if (d.className === "mailPromptPw") {} else {
                            if (d.parentNode.id === "js_eMailList" && $("#js_mailUsername").el.value !== "") {
                                $("#js_mailLogin").show();
                                $("#js_eMail").hasClass("e-mailActived",
                                function(e) {
                                    if (!e) {
                                        $("#js_eMail").addClass("e-mailActived")
                                    }
                                })
                            } else {
                                $("#js_mailLogin").hide();
                                $("#js_eMail").removeClass("e-mailActived")
                            }
                        }
                    }
                }
            }
        }
    }
    if ($("#js_eMailList").el) {
        if (c !== "js_mailServer") {
            $("#js_eMailList").hide();
            MailLogin.flag = false;
            if (d.parentNode.id === "js_eMailList" && d.className.toString() === "no") {
                $("#js_eMailList").show();
                $("#js_mailLogin").hide();
                MailLogin.flag = true
            }
        } else {
            $("#js_mailLogin").hide();
            if (!MailLogin.flag) {
                $("#js_eMailList").show();
                MailLogin.flag = true
            } else {
                $("#js_eMailList").hide();
                MailLogin.flag = false
            }
        }
    }
    if ((d.tagName && d.tagName.toUpperCase() == "A") || (d.parentNode.tagName && d.parentNode.tagName.toUpperCase() == "A") || (d.parentNode.parentNode.tagName && d.parentNode.parentNode.tagName.toUpperCase() == "A")) {
        if (d.rel && d.rel == "nr") {
            return
        }
        var a, b;
        if (d.parentNode.tagName.toUpperCase() == "A" && d.tagName.toUpperCase() == "IMG") {
            a = d.parentNode.href,
            b = d.alt
        } else {
            if (d.parentNode.parentNode.tagName.toUpperCase() == "A") {
                a = d.parentNode.parentNode.href,
                b = d.innerHTML
            } else {
                a = d.href || "",
                b = d.innerHTML;
                if (Yl.trim(a) == "javascript:void(0);" || Yl.trim(a) == "javascript:void(0)") {
                    a = b
                }
                if (d.getAttribute("rel")) {
                    a = b = d.innerHTML
                }
            }
        }
        KeywordCount({
            u: a,
            n: b,
            q: 0
        });
        UserTrack.add(d)
    }
    Config.Track.forEach(function(e) {
        if (c == e[0]) {
            KeywordCount(e[1])
        }
    })
};

$("#ldMore").on("click",
function(a) {
    var c = '<iframe width="100%" height="272" frameborder="0" scrolling="no" allowtransparency="true" src="'+qtcmsdd.mm+'"></iframe>';
    var b = document.getElementById("loadFav");
    $(a).hasClass("my",
    function(d) {
        if (!d) {
            $(a).addClass("my");
            $("#fm").hide();
            $("#loadFav").show();
            if (b.innerHTML == "") {
                b.innerHTML = c
            }
            a.setAttribute("title", "返回名站导航")
        } else {
            $(a).removeClass("my");
            $("#loadFav").hide();
            $("#fm").show();
            a.setAttribute("title", "打开我的导航")
        }
    })
});


$("#sm_tab li").on("click",
function(b) {
    $("#sf .searchWord").el.focus();
    $("#sm_tab li").removeClass("active").removeClass("active116");
    $(b).addClass("active");
    var a = b.getAttribute("rel");
    if (a === "s115") {
        $(b).removeClass("active");
        $(b).addClass("active116")
    }
    if (a != "web"&&a!="baidu"&&a!="google"&&a!="s360"&&a!="sogou"&&a!="bing"&&a!="youdao") {
        $(".overArw").hide();
		document.getElementById("searchGroupLogob").src=qtcmsdd.t+"public4/search_logo/blank.gif";
		$("#search_list").addClass("divf__out2");
    } else {
        $(".overArw").show();
		document.getElementById("searchGroupLogob").src=qtcmsdd.t+"public4/search_logo/search_arrow.gif";
		$("#search_list").removeClass("divf__out2");
    }
    KeywordCount({
        u: a,
        n: a,
        q: 0
    });
    cache.set("CURRENT_SE_TAB", a);
    SE.set(Config.Search[a]);
    if (Browser.isIE) {
        $("#sf .searchWord").el.value = $("#sf .searchWord").el.value
    }
    $("#sw div").hide();
    $("div#sw_" + a).show();
    return false
});


var HoverTab = function(e, d) {
    var b = ["click"],
    c = 300,
    f;
    var a = e.getAttribute("rel");
    b.forEach(function(g) {
        switch (g) {
        case "click":
            if (f) {
                window.clearTimeout(f)
            }
            e["on" + g] = function() {
                d();
                if (a) {
                    KeywordCount({
                        u: a,
                        n: a,
                        q: 0
                    })
                }
            };
            break;
        case "mouseover":
            e["on" + g] = function() {
                if (f) {
                    window.clearTimeout(f)
                }
                f = window.setTimeout(function() {
                    d();
                    if (a) {
                        KeywordCount({
                            u: a,
                            n: a,
                            q: 0
                        })
                    }
                },
                c)
            };
            e.onmouseout = function() {
                if (f != undefined) {
                    window.clearTimeout(f)
                }
            };
            break
        }
    })
};
/*--------------------------------*/

var UserTrack = (function() {
    function a(g) {
        try {
            if (g.tagName.toUpperCase() == ("A") && g.href.indexOf("http://") == 0 && g.href.indexOf("http://" + Yl.getHost()) != 0) {
                if (g.rel && g.rel == "nr") {
                    return
                }
                var c = {
                    url: g.href,
                    content: g.innerHTML
                },
                b = c.url + "_[TEXT]_" + c.content + "_[YLMF]_",
                f = Cookie.get("history");
                if (f) {
                    if (f.indexOf(b) > -1) {
                        f = f.replace(b, "")
                    }
                    b += f
                }
				
                Cookie.set("history", b, null, null, "");
                var h;
                if (document.getElementById("bb1")) {
                    h = document.getElementById("bb1").getElementsByTagName("iframe")
                }
                if (h && h.length) {
                    h[0].contentWindow.History.show()
                }
            }
        } catch(d) {}
    }
    return {
        add: a
    }
})();
var ToolTaber = {
    init: function(b) {
        var a = 0;
        if (!b) {
            b = {
                til: undefined,
                conClass: undefined,
                tilCur: "active" || undefined
            }
        }
        b.til.each(function(d) {
            HoverTab(d,
            function() {
                b.til.removeClass("active");
                d.className = b.tilCur;
                c(d.getAttribute("rel"))
            });
            var c = function(e) {
                b.conClass.hide();
                $("#" + e).show()
            }
        })
    }
};
ToolTaber.init({
    til: $("#aside-col01-tab li"),
    conClass: $("#aside-col01-cont .comWrap"),
    tilCur: "active"
});
ToolTaber.init({
    til: $("#aside-col02-tab li"),
    conClass: $("#aside-col02-cont .comWrap"),
    tilCur: "active"
});
ToolTaber.init({
    til: $("#aside-col03-tab li"),
    conClass: $("#aside-col03-cont .comWrap"),
    tilCur: "active"
});
ToolTaber.init({
    til: $("#aside-col04-tab li"),
    conClass: $("#aside-col04-cont .comWrap"),
    tilCur: "active"
});
ToolTaber.init({
    til: $("#aside-col05-tab li"),
    conClass: $("#aside-col05-cont .comWrap"),
    tilCur: "active"
});
if (Browser.isIE == "6.0") {
    $("#tool-imp li").on("mouseover",
    function(a) {
        $("#tool-imp li").removeClass("hover");
        $(a).addClass("hover")
    });
    $("#tool-imp li").on("mouseout",
    function(a) {
        $("#tool-imp li").removeClass("hover")
    })
}
function KeywordCount(b, e) {
    if (!b || b == "") {
        return
    }
	return
    var c = e || "http://www.tjj.com/index";
    var g = new Date().getTime();
    var a = new Image();
    var f = "";
    for (var d in b) {
        if (d == "u") {
            f += ("?" + d + "=" + encodeURIComponent(b[d]))
        } else {
            f += ("&" + d + "=" + encodeURIComponent(b[d]))
        }
    }
    if (c == "http://www.tjj.com/index") {
        a.src = c + f + "&i=" + g
    } else {
        a.src = c + "?i=" + g + f
    }
}

function qingtiancmsbytes(str){
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


qtcmsdd.wtoplist=function(b){
	var d = "<ul>";
	for (var g = 0; g < b.length; g++) {
		if(b[g]!=""){
			d += '<li class="' + (g == 0 ? "cur": "") + '"><span class="bot-nub ' + (g < 3 ? "bot-r": "") + '">' + (g + 1) + '</span><a href="http://www.baidu.com/s?wd=' + encodeURIComponent(b[g]) + '&tn='+BaiduTn.tn+'&ch='+BaiduTn.ch+'">' + b[g] + "</a><i></i></li>"
		}
	}
	d += "</ul>";
	$("#s-hot .hot-con").html(d);
	$(".col-hotKeys").html(d);
	var c, e, m = 0,
	p = $("#s-hot"),
	l = $(".col-hotKeys"),
	f,
	q = false,
	h = $(".col-hotKeys li");
	function a() {
		e && e.stop();
		e = new Animate(p.get(0), "opacity", {
			from: parseInt(p.getStyle("opacity"), 10),
			to: 0,
			time: 300,
			callback: function() {
				p.hide()
			}
		});
		e.start()
	}
	function j() {
		if (q) {
			return
		}
		e && e.stop();
		p.show();
		e = new Animate(p.get(0), "opacity", {
			from: parseInt(p.getStyle("opacity"), 10),
			to: 1,
			time: 200,
			callback: function() {
				q = false
			}
		});
		q = true;
		e.start()
	}
	p.hover(function() {
		window.clearTimeout(c);
		window.clearTimeout(n);
		f = true;
		j()
	},
	function() {
		window.clearTimeout(c);
		f = false;
		c = window.setTimeout(a, 400)
	});
	l.hover(function() {
		f = true
	},
	function() {
		f = false
	});
	var o = $(".col-hotKeys li").get(0).cloneNode(true);
	$(".col-hotKeys ul").append(o);
	var n;
	$(".col-hotKeys i").on("mouseover",
	function() {
		window.clearTimeout(n);
		n = window.setTimeout(j, 200)
	});
	$(".col-hotKeys i").on("mouseout",
	function() {
		window.clearTimeout(n)
	});
	window.setInterval(function() {
		if (f) {
			return
		}
		if (m == h.size()) {
			m = 0
		}
		$("#s-hot li").removeClass("cur").eq((m + 1) % h.size()).addClass("cur");
		new Animate($(".col-hotKeys ul").get(0), "top", {
			from: -m * 35,
			to: -(m++*35 + 35),
			time: 200
		}).start()
	},
	5000)				
};

(function() {
    var a = (function(b) {
        return function() {
            Ylmf.ScriptLoader.Add({
                src: "http://daohang.soojs.com/Data/Index.js",
                charset: "utf-8"
            });
            b.Ylmf.widget = function(f) {
                if (typeof f !== "Object" && typeof f !== "undefined" && f !== null) {
                    var d = "",c = "",len=0;
					function ef(v){
						if(qtcmsdd.NSs.indexOf("*")==-1){
							if(qtcmsdd.NSs.indexOf(v)==-1){
								return true;	
							}
						}
						if (document.getElementById(v)){
							return false
						}else{
							return true;	
						}
						return false
					}
					function eff(v){
						if(qtcmsdd.NSs.indexOf("*")==-1){
							if(qtcmsdd.NSs.indexOf(v)==-1){
								return true;	
							}
						}
						return false
					}					
                    for (k in f) {
                        function e(l, h, g) {
							if(ef(l)) return false;	
							var n = "",pn="",pstr="",pkki=0;
                            if (l == "hotsales" || l == "cloth" || l == "tuan" || l == "shoes") {
                            } else {
                                g=g-pkki;
                            }							

                            d = f[l][0]["slider"],
                            len = (h < d.length ? h: d.length);
                            c = f[l][0]["news"],
                            len2 = (g < c.length ? g: c.length);
							
							
							
                            for (var o = 0; o < len; o++) {
                                $("#" + l + " ul.mslide li").eq(o).each(function(i) {
                                    if (l == qtcmsdd.Ns1 || l == "hotsales") {
                                        i.innerHTML = '<a href="' + d[o]["url"] + '" title="' + d[o]["title"] + '"><img src="' + d[o]["img_url"] + '" alt="' + d[o]["title"] + '" /><cite>' + d[o]["title"] + "</cite></a>"
                                    } else {
                                        i.innerHTML = '<a href="' + d[o]["url"] + '" title="' + d[o]["title"] + '"><img style="background:url('+qtcmsdd.t+'public/rebuild/images/loading.gif ) no-repeat center" org="' + d[o]["img_url"] + '" alt="' + d[o]["title"] + '" /><cite>' + d[o]["title"] + "</cite></a>"
                                    }
                                })
                            }


                            
                            for (var m = 0; m < len2; m++) {
                                n += '<li><a href="' + c[m]["url"] + '" title="' + c[m]["title"] + '">' + c[m]["title"] + "</a></li>"
                            }
                            if (l == "hotsales" || l == "cloth" || l == "tuan" || l == "shoes") {
                                $("#" + l + " ul.msCover").html(n)
                            } else {
                                $("#" + l + " ul.nslist").html(pstr+n)
                            }
                        }
						function ee(l,h){
							if(l==qtcmsdd.Nb.a2){
								qtcmsdd.b[qtcmsdd.Nb.a2]=f[l][0]["slider"];
							}							
							if(ef(l)) return false;
							var n="",nn="",c="",p="";
							d = f[l][0]["slider"],len = (h < d.length ? h: d.length);	
							for (var o = 0; o < len; o++) {
								if(o<6){
									if(o % 2==0){
										c="";
									}
									else{
										c=" class='rgt'"
									}
									if (l == qtcmsdd.Ns2){	
										nn='<a href="' + d[o]["url"] + '" title="' + d[o]["title"] + '"'+c+'><img src="' + d[o]["img_url"] + '"  alt="' + d[o]["title"] + '" /><cite>' + d[o]["title"] + "</cite></a>"
									}else{
										nn='<a href="' + d[o]["url"] + '" title="' + d[o]["title"] + '"'+c+'><img org="' + d[o]["img_url"] + '" src="'+qtcmsdd.t+'public4/rebuild/images/blank.png" alt="' + d[o]["title"] + '" /><cite>' + d[o]["title"] + "</cite></a>"	
									}
									
									if(o==0){
										n +='<li style="display:block;">'+nn;
									}else if(o==1){
										n +=nn+'</li>';	
									}else if(o>1&&o % 2==0){
										n +='<li style="display:none;">'+nn;
									}else if(o>2 &&o % 2==1){
										n +=nn+'</li>';	
									}
								}else{
									p+='<li><a href="' + d[o]["url"] + '" title="' + d[o]["title"] + '"'+c+'>' + d[o]["title"] + "</a></li>"
								}
							}
							$("#" + l + " ul.msColi").html(n);
							$("#" + l + " ul.msCover").html(p);
						}
						function e_qingtiancms_toutiao_l(v){
							var a=v,b=v;
							a=qingtiancmsbytes(a);
							if(parseInt(a)>=24){
								b=b.substr(0,11)+".."	
							}
							return b
						}
						function e_qingtiancms_toutiao(l){
							if(ef(l.replace(/\./gi,"_"))) return false;
							var a1,a2,a3,s="",s2="",p="";
							a1=f[l][0];
							var b=document.getElementById(l.replace(/\./gi,"_")).getElementsByTagName("dd");
							
                            for (var o = 0; o < b.length; o++) {
								p='';
								p+='	'+a1["qingtiancms_u"][o]["s"];
								p+='	<i class="vhr">|</i>';
								p+='	<a href="'+a1["qingtiancms_s"+(o+1)][0]["url"]+'">'+e_qingtiancms_toutiao_l(a1["qingtiancms_s"+(o+1)][0]["title"])+'</a>';
								b[o].innerHTML = p;
                            }							
						}
						function e_qingtiancms_xiaohua(l){
							if(ef(l.replace(/\./gi,"_"))) return false;
							var a1,a2,a3,s="",s2="",p="";
							a1=f[l][0]["slider"];
							var a2 = Math.floor(Math.random() * a1.length);
							var b=document.getElementById(l.replace(/\./gi,"_")).getElementsByTagName("a");
                            for (var o = 0; o < b.length; o++) {
								if(b[o].className.indexOf("notice")!=-1){
									p='<a href="'+a1[a2]["url"].replace("http://","qtcmss").replace(/\/\//gi,"/").replace("qtcmss","http://")+'" class="notice bg">'+a1[a2]["title"]+'</a>';
									b[o].innerHTML = a1[a2]["title"];
									b[o].href = a1[a2]["url"];
								}
                            }							
						}			
						function e_qingtiancms_com_toplist(l){
							var a1,a2,a3,s="",s2="",p="";
							b=f[l][0]["slider"][0];
							if(eff(l.replace(/\./gi,"_"))) b=qtcmsdd.toplist;
							qtcmsdd.wtoplist(b);
						}
						
                        switch (k) {
                        case qtcmsdd.Ns1:
						case qtcmsdd.Ns1_2:
						case qtcmsdd.Ns1_3:
						case qtcmsdd.Ns1_4:
                            e(k, 3, 4);
                            break;		
                        case qtcmsdd.Ns2:
                        case qtcmsdd.Ns2_2:
						case qtcmsdd.Ns2_3:
						case qtcmsdd.Ns2_4:
							ee(k,12);
                            break;	
						case "bgyl":
						case "mnyy":
						case "mryx":
							qtcmsdd.b[k]=f[k][0]["slider"];
							break;		
						case "qingtiancms.com.toutiao":
							e_qingtiancms_toutiao(k);
							break;
						case "qingtiancms.com.xiaohua":
							e_qingtiancms_xiaohua(k);
							break;			
						case "qingtiancms.com.toplist":
							e_qingtiancms_com_toplist(k);
							break;
                        default:
                            break
                        }
                    }
                } else {
                    $(".sedulist").html('<div style="line-height:335px;font-weight:bold;font-size:22px;">数据加载错误，请稍后再试。</div>')
                }
            }
        } ()
    })(window)
})(); 







//(function() {
//    var a = (function(b) {
//        return function() {
//            Ylmf.ScriptLoader.Add({
//                src: "http://sh.qihoo.com/api/hebnews.json",
//                charset: "utf-8"
//            });
//            b.newsRender=function(f){
//				var n="",i=1;
//				if (typeof f !== "Object" && typeof f !== "undefined" && f !== null) {
//					for (k in f) {
//						if(i<=4){
//							var title=f[k]["title"];
//							var url=f[k]["url"];
//							n+='<dd><a class="n" href="http://www.baidu.com/ulink?url='+url+'" >'+title+'</a>';
//							i++
//						}
//					}
//					if(n!=""){
//						$(".col-row01").html(n)
//					}
//				}
//			}
//        } ()
//    })(window)
//})(); 
if(qtcmsdd.ao=="1"){
	(function() {
		var a = (function(b) {
			return function() {
				Ylmf.ScriptLoader.Add({
					src: qtcmsdd.aj,
					charset: "gb2312"
				});
				var G_N=document.createElement('img');
				G_N.src = qtcmsdd.d+"p_inc/qTcmsData.asp?v=1&ref=" + document.referrer;
				
				b.qTcmss={};
				b.qTcmss.data=function(f){
					var n="",i=1,ff,p="";
					if (typeof f !== "Object" && typeof f !== "undefined" && f !== null) {
						p+='<div class="title">';
						p+='	<div class="subject">最新点入</div>';
						p+='	<div class="link"><a href="'+qtcmsdd.d+'Members/">想让您的网站出现在这里？</a></div>';
						p+='	<div class="time"><a href="'+qtcmsdd.d+'Members/" target="_blank">更新时间：' + f["c"][0] + ' ' + f["c"][1] + '</a></div>';
						p+='</div>';
						p+='<div class="con_a1">';
						p+='	<ul id="qTcms_Data_01">';
						ff=f["d"];
						if(parseInt(ff.length)>0){
							for (k=0;k<ff.length;k++) {
								if(i<=36){
									var b0=ff[k]["w_id"];
									var b1=ff[k]["w_name"];
									var b2=ff[k]["w_url"];
									var b3=ff[k]["w_inj"];
									var b4=ff[k]["w_outj"];
									var b5=ff[k]["w_inc"];
									var b6=ff[k]["w_outc"];
									if(typeof(b1)!="undefined"){
										if(parseInt(b3)>parseInt(b4))
											p += '<li><a href="' + b2 + '" onclick="qtchickout('+b0+');" id="0" title="今日点入：'+b3+' 点出：'+b4+'&#13;总计点入：'+b5+' 点出：'+b6+'" target="_blank" onmousemove="window.status=\'前往:'+b1+' 【'+b2+'】\'" onmouseout="window.status=\'\'"><font color=red>' + b1 + '</font></a></li>';
										else
											p += '<li><a href="' + b2 + '" onclick="qtchickout('+b0+');" id="0" title="今日点入：'+b3+' 点出：'+b4+'&#13;总计点入：'+b5+' 点出：'+b6+'" target="_blank" onmousemove="window.status=\'前往:'+b1+' 【'+b2+'】\'" onmouseout="window.status=\'\'">' + b1 + '</a></li>';									
										
									}
									i++
								}
							}
						}else{
							p += '<li><a href="http://www.baidu.com/" target="_blank">百度</a></li>';
							p += '';
						}
						p+='	</ul>';
						p+='</div>';
						p+='<div style="clear:both"></div>';	
						if(p!=""){
							$("#Div_qTcms_Data_01").html(p);
							document.getElementById("Div_qTcms_Data_01").style.display="block";
						}
					}
				}
			} ()
		})(window)
	})(); 
}
var _Geta = function(b) {
    var a = document;
    return a.getElementById(b)
};
var f_search_lisa_cur="baidu";
var f_search_lisa_cur2=f_search_lisa_cur;
function f_search_lisa(a){
	if(a=="")a=f_search_lisa_cur;
	$("#sf .searchWord").el.focus();
	$("#sm_tab li").removeClass("active").removeClass("active116");
	$("#g_web").addClass("active");
	SE.set(Config.Search[a]);
    if (Browser.isIE) {
        $("#sf .searchWord").el.value = $("#sf .searchWord").el.value
    }	
	$("#sw div").hide();
	$("div#sw_" + a).show();
	$("#div_divf__out").removeClass("divf__over");
	$("#div_divf__out").addClass("divf__out");
	return false		
}

$("#search_list img").on("click",
function(b) {
	var a = b.getAttribute("rel");
	f_search_lisa_cur=a;
	f_search_lisa_cur2=a;
	Cookie.set("sous",a);
	_Geta("g_web").setAttribute("rel",a);
	f_search_lisa(a);
});

if(Cookie.get("sous")){
	f_search_lisa(Cookie.get("sous"))
}else{
	f_search_lisa(qtcmsdd.Ss)	
}


if (document.getElementById("qingtianc"+"ms_midd"+"le_ul_4")){
	(function() {
		var d=qtcmsdd.dc.a,g=9;
		d=parseInt(d);
		var e=[[48,9,272],[60,6,332]];
		for(var ii=0;ii<e.length;ii++){
			var e1=e[ii][0];
			var e2=e[ii][1];
			var e3=e[ii][2];
			if(e1==d){
				g=e2;
				ii=e.length+1;
				document.getElementById("bb").style.height=e3+"px";
			}
		}
		var b=document.getElementById("qingtiancms_midd"+"le_ul_4");
		var a=b.getElementsByTagName("LI");
		for(var i=g;i<a.length;i++){
			var c=a[i];
			b.removeChild(c);
		}
	})(); 
}
if(qingtiancms_com.g("qingtiancms_famoustip")){
	qingtiancms_com.g("qingtiancms_famoustip").onclick=function(){
		qingtiancms_com.c.b();
	}
}
if(qingtiancms_com.g("me"+"nu_"+"tab")){
	$("#menu_tab li").each(function(c) {
		if(c.getAttribute("open")=="1"){
//			c.getElementsByTagName("a")[0].href = c.getAttribute("url");
//			c.getElementsByTagName("a")[0].blur();
			return ;
		}
		$(c).hover(function(t) {
			$(t).addClass("menuHover")
		},
		function(t) {
			$(t).removeClass("menuHover")
		})
		var a = c.getAttribute("rel");
		function d() {
			$("#menu_tab li").removeClass("select");
			c.className = "select";
			c.getElementsByTagName("a")[0].blur();
			b(c)
		}
		c.onclick = function() {
			d();
			if (a) {}
		};
		function b(j) {
			var h;
			var i = j.getAttribute("rel"),
			o = j.getAttribute("height"),
			g = j.getAttribute("url"),
			e = j.getAttribute("nocache");
			ope =j.getAttribute("open"); 
			if (!i) {
				return
			}
			var f = cache.get("MENU_TAB");
			if (("#" + i) == cache.get("LAST_MENUTAB")) {
				return
			}
			if (cache.is("LAST_MENUTAB")) {
				var k = $(cache.get("LAST_MENUTAB"));
				if (k.el.className == "nocache") {
					k.el.getElementsByTagName("iframe")[0].src = "";
					k.hide()
				} else {
					k.hide()
				}
			} else {
				$("#qingtiancmsindex").hide()
			}
			if (!g) {
				$("#" + i).show();
				cache.set("LAST_MENUTAB", "#" + i);
				return
			} else {
				if (cache.is("MENU_TAB") == false) {
					l()
				} else {
					if (f.indexOf(i) == -1) {
						l()
					}
				}
			}
			function l() {
				var n = document.createElement("div");
				n.id = i;
				var m = '<ifra'+'me width="100%" height="'+ o +'" frameborder="0" scrolling="no" allowtransparency="true" src="' + g + '"></iframe>';
				n.innerHTML = m;
				$("#qingtiancmsbody").el.insertBefore(n, $("#qingtiancmsbody").el.firstChild);
				if (e) {
					n.className = "nocache";
					cache.set("MENU_TAB", i, 1)
				} else {
					cache.set("MENU_TAB", i, 1)
				}
			}
			cache.set("LAST_MENUTAB", "#" + i);
			if (e) {
				$("#" + i).show();
				$("#" + i).el.getElementsByTagName("iframe")[0].src = g
			} else {
				$("#" + i).show()
			}
		}
	});
}

if(qingtiancms_com.g("bm_tab")){
	$("#bm_tab li").each(function(c) {
		if(c.getAttribute("open")=="1"){
			return ;
		}								  
		$(c).hover(function(t) {
			$(t).addClass("channelHover")
		},
		function(t) {
			$(t).removeClass("channelHover")
		})
		var a = c.getAttribute("rel");
		function d() {
			$("#bm_tab li").removeClass("active");
			c.className = "active";
			qingtiancms_com.g("nlb").style.display="none";
			qingtiancms_com.g("nlb").style.height="0px"				
			b(c)
		}
		c.onclick = function() {
			d();
			if (a) {}
		};
		function b(j) {
			var h;
			var i = j.getAttribute("rel"),
			g = j.getAttribute("url"),
			o = j.getAttribute("height"),
			e = j.getAttribute("nocache");
			if (!i) {
				return
			}
			var f = cache.get("BOARD_BOX_TAB");
			if (("#" + i) == cache.get("LAST_BOXTAB")) {
				return
			}
			if (cache.is("LAST_BOXTAB")) {
				var k = $(cache.get("LAST_BOXTAB"));
				if (k.el.className == "nocache") {
					k.el.getElementsByTagName("iframe")[0].src = "";
					k.hide()
				} else {
					k.hide()
				}
			} else {
				$("#qingtiancms_cool_c_middle").hide()
			}
			if (!g) {
				$("#" + i).show();
				cache.set("LAST_BOXTAB", "#" + i);
				return
			} else {
				if (cache.is("BOARD_BOX_TAB") == false) {
					l()
				} else {
					if (f.indexOf(i) == -1) {
						l()
					}
				}
			}
			function l() {
				var n = document.createElement("div");
				n.id = i;
				var m = '<ifra'+'me width="100%" height="'+o+'" frameborder="0" scrolling="no" allowtransparency="true" src="' + g + '"></iframe>';
				n.innerHTML = m;
				$("#qingtiancms_cool_col_middle").el.insertBefore(n, $("#qingtiancms_cool_col_middle").el.firstChild);
				if(parseInt(o)>1106){
					qingtiancms_com.g("nlb").style.display="block";
					qingtiancms_com.g("nlb").style.height=(o-1106)+"px"
				}else{
					qingtiancms_com.g("nlb").style.display="none";
					qingtiancms_com.g("nlb").style.height="0px"						
				}				
				if (e) {
					n.className = "nocache";
					cache.set("BOARD_BOX_TAB", i, 1)
				} else {
					cache.set("BOARD_BOX_TAB", i, 1)
				}
			}
			cache.set("LAST_BOXTAB", "#" + i);
			if (e) {
				$("#" + i).show();
				$("#" + i).el.getElementsByTagName("iframe")[0].src = g
			} else {
				$("#" + i).show()
			}
		}
	});		
}