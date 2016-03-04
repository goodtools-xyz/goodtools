




















var _imgEl = document.getElementById("imgArr").getElementsByTagName("a");
var _imgarr = Math.floor(Math.random() * _imgEl.length);
_imgEl[_imgarr].style.display = "inline";

if(qtcmsdd.add.a=="code"){
	qingtiancms_com.g("imgArr_t").innerHTML="";	
	qingtiancms_com.g("imgArr_t").style.display="";
	qingtiancms_com.g("imgArr_t").className="imgArr_t_ad";
	
}
else{
	var _imgEl = document.getElementById("imgArr_t").getElementsByTagName("a");
	var _imgarr = Math.floor(Math.random() * _imgEl.length);
	_imgEl[_imgarr].style.display = "inline";
}

var Suggest = (function() {
    var h = $("#sf .searchWord"),
    c = $("#suggest"),
    s = $("#topShow"),
    l,
    o = -1,
    b = null,
    n,
    g,
    a = false,
    m = false,
    p = false,
    q = false;
    h.el.onkeydown = function(u) {
        var u = u || window.event;
        if (q) {
            return
        }
        s.hide();
        $(".overArw").removeClass("up");
        switch (u.keyCode) {
        case 38:
            if (p) {
                if (this.value == "") {
                    return
                }
                c.show();
                p = false
            } else {
                o--
            }
            d();
            break;
        case 40:
            if (p) {
                if (this.value == "") {
                    return
                }
                c.show();
                p = false
            } else {
                o++
            }
            d();
            break;
        case 27:
            this.value = l;
            j();
            break;
        case 13:
            cache.set("Handdle_Key", "13");
            j();
            break;
        default:
            break
        }
    };
    h.el.onkeyup = function(u) {
        var u = u || window.event;
        if (q) {
            return
        }
        l = this.value;
        switch (u.keyCode) {
        case 38:
            m = true;
            break;
        case 40:
            m = true;
            break;
        case 8:
            if (this.value == "") {
                j()
            } else {
                r()
            }
            break;
        case 27:
            this.value = l;
            j();
        case 13:
            cache.set("Handdle_Key", "13");
            j();
            break;
        default:
            if (l != "") {
                r()
            }
            break
        }
    };
    h.el.onblur = function() {
        if (!a) {
            j();
            s.hide();
            $(".overArw").removeClass("up")
        }
    };
    function d() {
        if (!g) {
            return
        }
        var u = g.length;
        m = true;
        if (o < 0) {
            o = u - 1
        } else {
            if (o >= u) {
                o = 0
            }
        }
        for (var v = 0,
        u = g.length; v < u; v++) {
            g[v].className = ""
        }
        g[o].className = "hover";
        h.el.value = g[o].innerHTML
    }
    function f() {
        if (typeof(n) != "object" || typeof(n) == "undefined") {
            return
        }
        var u = "<ul>";
        n.forEach(function(x, w, v) {
            if (cache.get("CURRENT_SE_TAB") == "taobao") {
                u += '<li key="' + w + '">' + x[0] + "</li>"
            } else {
                u += '<li key="' + w + '">' + x + "</li>"
            }
        });
        u += "</ul>";
        g = c.el.getElementsByTagName("li");
        c.el.innerHTML = u;
        c.show();
        o = -1;
        p = false;
        e()
    }
    function j() {
        c.hide();
        p = true
    }
    function i() {
        h.el.setAttribute("autocomplete", "on");
        h.el.focus();
        c.hide();
        q = true
    }
    function e() {
        c.el.onmouseover = function(x) {
            var x = x || window.event,
            w = x.target || x.srcElement;
            if (w.tagName.toUpperCase() == "LI") {
                for (var v = 0,
                u = g.length; v < u; v++) {
                    g[v].className = ""
                }
                w.className = "hover";
                o = parseInt(w.getAttribute("key"));
                $(w).on("mouseout",
                function(y) {
                    y.className = ""
                })
            }
            a = true
        };
        c.el.onmouseout = function() {
            a = false
        };
        c.el.onclick = function(w) {
            var w = w || window.event,
            v = w.target || w.srcElement;
            if (v.tagName.toUpperCase() == "LI") {
                h.el.value = v.innerHTML;
                h.el.focus();
                j();
                var u = document.getElementById("searchForm");
                cache.set("Handdle_Key", "S");
                u.onsubmit();
                u.submit()
            }
            if (v.id == "closeSugBtn") {
                i()
            }
        }
    }
    function t() {
        s.el.onmouseover = function(v) {
            var v = v || window.event,
            u = v.target || v.srcElement;
            if (u.tagName.toUpperCase() == "LI") {
                $(u).addClass("hover");
                o = parseInt(u.getAttribute("key"))
            }
            a = true
        };
        s.el.onmouseout = function(v) {
            var v = v || window.event,
            u = v.target || v.srcElement;
            if (u.tagName.toUpperCase() == "LI") {
                $(u).removeClass("hover")
            }
            a = false
        };
        s.el.onclick = function(w) {
            var w = w || window.event,
            v = w.target || w.srcElement;
            if (v.tagName.toUpperCase() == "A") {
                h.el.value = v.innerHTML;
                h.el.focus();
                s.hide();
                $(".overArw").removeClass("up");
                var u = document.getElementById("searchForm");
                cache.set("Handdle_Key", "TS");
                u.onsubmit();
                u.submit()
            }
            if (v.tagName.toUpperCase() == "LI") {
                h.el.value = v.getAttribute("rel");
                h.el.focus();
                s.hide();
                $(".overArw").removeClass("up");
                var u = document.getElementById("searchForm");
                cache.set("Handdle_Key", "TS");
                u.onsubmit();
                u.submit()
            }
        }
    }
    $("#searchForm").el.onsubmit = function() {
        var u = cache.get("CURRENT_SE_TAB") ? cache.get("CURRENT_SE_TAB") : "web";
        KeywordCount({
            type: u,
            word: h.el.value,
            url: window.location.href,
            key: cache.get("Handdle_Key")
        },
        "http://www.tjj.com/click.php");
        if (_hmt) {
            _hmt.push(["_trackEvent", "搜索框", "submit", u, h.el.value])
        }
    };
    $("#search_btn").on("click",
    function() {
        cache.set("Handdle_Key", "B")
    });
    function r() {
        var x = $("head").el;
        var v = cache.get("CURRENT_SE_TAB");
        if (b) {
            if (v == "taobao") {
                b.charset = "utf-8"
            } else {
                b.charset = "gb2312"
            }
        }
        if (!Browser.isIE) {
            if (b) {
                x.removeChild(b)
            }
            b = null
        }
        if (!b) {
            var u = document.createElement("script");
            u.type = "text/javascript";
            if (v == "taobao") {
                u.charset = "utf-8"
            } else {
                u.charset = "gb2312"
            }
            x.insertBefore(u, x.firstChild);
            b = u
        }
        var y = new Date().getTime();
        var w = encodeURIComponent(h.el.value);
        var z = "";
        switch (v) {
        case "taobao":
            z = "http://suggest.taobao.com/sug?code=utf-8&callback=taobaoSU&q=" + w + "&rd=" + y;
            break;
        default:
            z = "http://unionsug.baidu.com/su?wd=" + w + "&p=3&cb=baiduSU&t=" + y
        }
        b.src = z
    }
    window.baiduSU = function(u) {
        if (typeof(u) == "object" && typeof(u.s) != "undefined" && typeof(u.s[0]) != "undefined") {
            n = u.s;
            f()
        } else {
            j()
        }
    };
    window.taobaoSU = function(u) {
        if (typeof(u) == "object" && typeof(u.result) != "undefined" && typeof(u.result[0][0]) != "undefined") {
            n = u.result;
            f()
        } else {
            j()
        }
    }
})();


var kuxun = (function() {
    function EncodeUtf8(s1) {
        var s = escape(s1);
        var sa = s.split("%");
        var retV = "";
        if (sa[0] != "") {
            retV = sa[0]
        }
        for (var i = 1; i < sa.length; i++) {
            if (sa[i].substring(0, 1) == "u") {
                retV += Hex2Utf8(Str2Hex(sa[i].substring(1, 5)))
            } else {
                retV += "%" + sa[i]
            }
        }
        return retV
    }
    window.EncodeUtf8 = EncodeUtf8;
    function Str2Hex(s) {
        var c = "";
        var n;
        var ss = "0123456789ABCDEF";
        var digS = "";
        for (var i = 0; i < s.length; i++) {
            c = s.charAt(i);
            n = ss.indexOf(c);
            digS += Dec2Dig(eval(n))
        }
        return digS
    }
    function Dec2Dig(n1) {
        var s = "";
        var n2 = 0;
        for (var i = 0; i < 4; i++) {
            n2 = Math.pow(2, 3 - i);
            if (n1 >= n2) {
                s += "1";
                n1 = n1 - n2
            } else {
                s += "0"
            }
        }
        return s
    }
    function Dig2Dec(s) {
        var retV = 0;
        if (s.length == 4) {
            for (var i = 0; i < 4; i++) {
                retV += eval(s.charAt(i)) * Math.pow(2, 3 - i)
            }
            return retV
        }
        return - 1
    }
    function Hex2Utf8(s) {
        var retS = "";
        var tempS = "";
        var ss = "";
        if (s.length == 16) {
            tempS = "1110" + s.substring(0, 4);
            tempS += "10" + s.substring(4, 10);
            tempS += "10" + s.substring(10, 16);
            var sss = "0123456789ABCDEF";
            for (var i = 0; i < 3; i++) {
                retS += "%";
                ss = tempS.substring(i * 8, (eval(i) + 1) * 8);
                retS += sss.charAt(Dig2Dec(ss.substring(0, 4)));
                retS += sss.charAt(Dig2Dec(ss.substring(4, 8)))
            }
            return retS
        }
        return ""
    }
    return {
        searchTicket: function() {
            var _q = document.getElementById("jP_startCity").value;
            var _k = document.getElementById("jP_toCity").value;
            var _d = document.getElementById("jp_today").value;
            var _kw = "http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=20&FlightWay=0";
            if (_q == "") {
                alert("请输入出发地!")
            } else {
                _q = EncodeUtf8(EncodeUtf8(_q))
            }
            if (_k == "") {
                alert("请输入到达地!")
            } else {
                _k = EncodeUtf8(EncodeUtf8(_k))
            }
            if (_d == "") {
                alert("请输入起飞日期!")
            }
            _kw += "&StartCity=" + _q + "&DestCity=" + _k + "&DepartDate=" + _d + "&sid=1250&allianceid=1112";
            if (_q != "" && _k != "" && _d != "") {
                window.open(_kw)
            }
        },
        searchHotel: function() {
            var _q = document.getElementById("ht_city").value;
            var _k = document.getElementById("ht_key").value;
            var _d = document.getElementById("ht_today").value;
            var _kw = "http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=10";
            if (_q != "") {
                _q = EncodeUtf8(EncodeUtf8(_q))
            } else {
                alert("请输入入住城市！")
            }
            if (_d == "") {
                alert("请输入入住日期！")
            }
            if (_k != "") {
                _k = EncodeUtf8(EncodeUtf8(_k))
            }
            _kw += "&CityName=" + _q + "&CheckInDate=" + _d + "&CheckOutDate=" + _d + "&HotelName=" + _k + "&sid=1250&allianceid=1112";
            if (_q != "" && _d != "") {
                window.open(_kw)
            }
        },
        searchTravel: function() {
            var _q = document.getElementById("daodao_travel_q").value;
            var _k = document.getElementById("daodao_travel_k").value;
            var _kw = "http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=30";
            if (_q == "") {
                alert("请输入出发地！")
            } else {
                _q = EncodeUtf8(EncodeUtf8(_q))
            }
            if (_k == "") {} else {
                _k = EncodeUtf8(EncodeUtf8(_k))
            }
            _kw += "&StartCity=" + _q + "&SearchValue=" + _k + "&Channel=1&CurrentTab=0&sid=1250&allianceid=1112";
            if (_q != "") {
                window.open(_kw)
            }
        }
    }
})(); 








$("ul.colTitle li a").on("click",
function(b) {
    var a = YLMF.getEvent(),
    c = $(b.parentNode);
    if (!c.hasClass("active")) {
        if (a.preventDefault) {
            a.preventDefault()
        } else {
            window.event.returnValue = false
        }
    }
    return false
});


function sliderTab(d, b, g) {
    function c() {
        $("#" + d + " .comWrap").each(function(m) {
            if ($(m).getStyle("display") == "block") {
                var j = m.id,
                i = $("#" + j + " ." + b + " li");
                var l = null;
				if(j!="difangzhan"){
					i.each(function(o, n) {
						if ($(o).getStyle("display") == "block") {
							if (l != null) {
								return
							}
							l = n - 1;
							if (n <= 0) {
								l = i.size() - 1
							}
						}
					});
					l = l || 0;
					i.hide();
					i.eq(l).show();
					new Animate(i.get(l), "opacity", {
						from: 0,
						to: 1,
						time: 500
					}).start()
				}
            }
        })
    }
    function h() {

        $("#" + d + " .comWrap").each(function(m) {
            if ($(m).getStyle("display") == "block") {
                var j = m.id,
                i = $("#" + j + " ." + b + " li");
                var l = null;
                i.each(function(o, n) {
                    if ($(o).getStyle("display") == "block") {
                        if (l != null) {
                            return
                        }
                        l = n + 1;
                        if (n >= i.size() - 1) {
                            l = 0
                        }
                    }
                });
                l = l || 0;
                i.hide();
                i.eq(l).show();
                new Animate(i.get(l), "opacity", {
                    from: 0,
                    to: 1,
                    time: 500
                }).start()
            }
        })
    }
    var e;
    function a() {
        window.clearInterval(e);
        e = window.setInterval(function() {
            c()
        },
        g || 6000)
    }
    function f() {
        window.clearInterval(e)
    }
    $("#" + d + " ." + b).hover(function() {
        f()
    },
    function() {
        a()
    });
    $("#" + d + " .lft").on("click",
    function() {
        c()
    });
    $("#" + d + " .rgt").on("click",
    function() {
        h()
    });
    window.setTimeout(function() {
        a()
    },
    8000 * Math.random(0, 1))
}
sliderTab("aside-col01-cont", "mslide");
sliderTab("aside-col02-cont", "msColi");
sliderTab("aside-col03-cont", "msColi");
sliderTab("aside-col04-cont", "mslide");



$("#c_shop").on("click",
function() {
    $(".box-shadow").removeClass("box-shadow");
    $(".ecRow").addClass("box-shadow");
    var a = document.documentElement.scrollTop || document.body.scrollTop;
    new Animate(window, "scrollTop", {
        from: a,
        to: 1721,
        time: 500
    }).start()
});
$("#c_rest").on("click",
function() {
    $(".box-shadow").removeClass("box-shadow");
    $(".btmContent").addClass("box-shadow");
    var a = document.documentElement.scrollTop || document.body.scrollTop;
    new Animate(window, "scrollTop", {
        from: a,
        to: 2107,
        time: 500
    }).start()
});
$("#c_home").on("click",
function() {
    $(".box-shadow").removeClass("box-shadow");
    $(".btmlist").addClass("box-shadow");
    var a = document.documentElement.scrollTop || document.body.scrollTop;
    new Animate(window, "scrollTop", {
        from: a,
        to: 1540,
        time: 500
    }).start()
});
//var gotoTop = {
//    id: "#gotop",
//    bottomId: "#c_goBot",
//    wrap: document.getElementById("costom"),
//    timmer: null,
//    fps: 50,
//    startTime: null,
//    duration: 1000,
//    toggleTimer: null,
//    preAnimate: null,
//    clickMe: function() {
//        var a = document.documentElement.scrollTop || document.body.scrollTop;
//        new Animate(window, "scrollTop", {
//            from: a,
//            to: 0,
//            time: 500
//        }).start()
//    },
//    goBottom: function() {
//        var c = 0;
//        var a = 0;
//        var b = 0;
//        if (document.documentElement && document.documentElement.scrollTop) {
//            c = document.documentElement.scrollTop
//        } else {
//            if (document.body) {
//                c = document.body.scrollTop
//            }
//        }
//        if (document.body.clientHeight && document.documentElement.clientHeight) {
//            a = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
//        } else {
//            a = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
//        }
//        b = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
//        new Animate(window, "scrollTop", {
//            from: c,
//            to: b - a,
//            time: 500
//        }).start()
//    },
//    toggleMe: function() {
//        var a = document.documentElement.scrollTop || document.body.scrollTop;
//        if (a > 500) {
//            $("#gotop").show();
//            $("#c_goBot").hide()
//        } else {
//            $("#c_goBot").show();
//            $("#gotop").hide()
//        }
//    },
//    init: function() {
//        $(this.id).on("click",
//        function() {
//            gotoTop.clickMe();
//            return false
//        });
//        $(this.bottomId).on("click",
//        function() {
//            gotoTop.goBottom();
//            return false
//        });
//        gotoTop.toggleMe();
//        $(window).on("scroll",
//        function() {
//            window.clearTimeout(gotoTop.toggleTimer);
//            gotoTop.toggleTimer = window.setTimeout(function() {
//                gotoTop.toggleMe()
//            },
//            200)
//        });
//        $(window).on("resize",
//        function() {
//            window.clearTimeout(gotoTop.toggleTimer);
//            gotoTop.toggleTimer = window.setTimeout(function() {
//                gotoTop.toggleMe()
//            },
//            200)
//        })
//    }
//};


var gotoTop = {
	id: "#gotop",
	bottomId: "#c_goBot",

	wrap: document.getElementById("costom"),
	timmer: null,
	fps: 50,
	startTime: null,
	duration: 1000,
	toggleTimer: null,
	preAnimate: null,
	clickMe: function() {
		var a = document.documentElement.scrollTop || document.body.scrollTop;
		new Animate(window, "scrollTop", {
			from: a,
			to: 0,
			time: 500
		}).start()
	},
	goBottom: function() {
		var c = 0;
		var a = 0;
		var b = 0;
		if (document.documentElement && document.documentElement.scrollTop) {
			c = document.documentElement.scrollTop
		} else {
			if (document.body) {
				c = document.body.scrollTop
			}
		}
		if (document.body.clientHeight && document.documentElement.clientHeight) {
			a = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
		} else {
			a = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight: document.documentElement.clientHeight
		}
		b = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
		new Animate(window, "scrollTop", {
			from: c,
			to: b - a,
			time: 500
		}).start()
	},
	toggleMe: function() {
		var a = document.documentElement.scrollTop || document.body.scrollTop;
		var b = $(".m-search").getStyle("margin-top");
		if (a >100) {
			$("#gotop").show();
			$("#c_goBot").hide();
			$("#js_mailLogin").hide();
			$("#js_eMailList").hide();
			$("#js_eMail").removeClass("e-mailActived");
			$("#wrap").hasClass("m-fixed",function(g) {
				if (!g) {
					$("#wrap").addClass("m-fixed")
				}
			});
		} else {
			$("#c_goBot").show();
			$("#gotop").hide();
			$("#wrap").removeClass("m-fixed")
		}
	},
	init: function() {
		$(this.id).on("click",
		function() {
			gotoTop.clickMe();
			return false
		});
		$(this.bottomId).on("click",
		function() {
			gotoTop.goBottom();
			return false
		});
		gotoTop.toggleMe();
		$(window).on("scroll",
		function() {
			window.clearTimeout(gotoTop.toggleTimer);
			gotoTop.toggleTimer = window.setTimeout(function() {
				gotoTop.toggleMe()
			},
			200)
		});
		$(window).on("resize",
		function() {
			window.clearTimeout(gotoTop.toggleTimer);
			gotoTop.toggleTimer = window.setTimeout(function() {
				gotoTop.toggleMe()
			},
			200)
		})
	}
};
gotoTop.init();

function lazyload(a) {
    var c = a.get(0).getElementsByTagName("img");
    for (var b = 0; b < c.length; b++) {
        var d = c[b].getAttribute("org");
        if (d) {
            c[b].setAttribute("src", d);
            c[b].removeAttribute("org")
        }
    }
}
$("ul.colTitle li").each(function(a) {
    $(a).hover(function(b) {
        var c = b.getAttribute("rel");
        setTimeout(function() {
            lazyload($("#" + c))
        },
        500);
        $(b).addClass("hover")
    },
    function(b) {
        $(b).removeClass("hover")
    })
});


$("li.mySetting").on("click",
function() {
    lazyload($("#js_skinList li"))
});if (Browser.isIE == "6.0") {
//    $(window).on("load",
//    function() {
//        lazyload($("#js_skinList li"))
//    })
} 




(function() {
    var e = false,
    n = null;
    skinStyleObj = $("#js_skinStyle"),
    oSkinCss = Cookie.get(Config.SkinCookieName) || Config.defaultTheme;
    curSkinValue = oSkinCss;
    _themeChangeLink = $("#themeChange a");
    var j = (function() {
        var p = function() {
            if (typeof($("#js_reOld")) !== "undefined" && typeof($("#js_feedback")) !== "undefined") {
                var q = $("#js_reOld");
                var t = qtcmsdd.t+"public4/rebuild/css/skin/",
                s = $("#js_skinStyle");
                var r = $("#js_reOld a");
                r.on("click",
                function(u) {
                    $(u).hasClass("exp-new",
                    function(w) {
                        if (!w) {
                            Cookie.set("oldLayout", 1);
                            $(u).addClass("exp-new");
                            u.innerHTML = "恢复默认";
                            Cookie.set("skinCss", "classicsBlue");
                            curSkinValue = "classicsBlue";
                            s.el.setAttribute("href", t + "classicsBlue.css?" + Math.round(Math.random() * 10000));
                            $(".box-mySetting .skin-list li").removeClass("actived");
                            $("#js_skinList #js_classicsBlue").addClass("actived");
                            if (Cookie.get("ws")) {
                                $("#classicsWrap").addClass("kpWrap")
                            }
                            i()
                        } else {
                            $("#classicsWrap").removeClass("kpWrap");
                            $(u).removeClass("exp-new");
                            u.innerHTML = "经典蓝";
                            Cookie.clear("oldLayout");
                            Cookie.clear("ws");
                            Cookie.set("skinCss", "blue");
                            curSkinValue = "blue";
                            s.el.setAttribute("href", t + "blue.css?" + Math.round(Math.random() * 10000));
                            $("#js_skinList #js_classicsBlue").removeClass("actived");
                            var v = document.getElementById("ws");
                            if (v) {
                                v.parentNode.removeChild(v)
                            }
                            i()
                        }
                    });
                    if (Browser.isIE) {
                        window.location.reload(true)
                    }
                });
                if (Cookie.get("oldLayout")) {
                    r.el.innerHTML = "恢复默认";
                    r.addClass("exp-new")
                } else {
                    r.el.innerHTML = "经典蓝";
                    r.removeClass("exp-new")
                }
            }
			
			
			
        };
        return {
            run: p
        }
    })();
    j.run();
    function b(p) {
        curSkinValue = p;
        skinStyleObj.el.setAttribute("href", Config.cssFilePath + p + ".css")
    }
    function g(p) {
        oSkinCss = curSkinValue;
        Cookie.set(Config.SkinCookieName, p)
    }
    function m() {
        Cookie.clear(Config.SkinCookieName)
    }
    function i() {
        _themeLis && _themeLis.each(function(p) {
            if (p.getAttribute("skin") == curSkinValue) {
                $(p).addClass("curTheme")
            } else {
                $(p).removeClass("curTheme")
            }
        })
    }
    function h() {
        if (Animate.canTransition) {
            $("#theme").setStyle("height", "0px")
        } else {
            n && n.stop();
            n = new Animate($("#theme").get(0), "height", {
                from: 210,
                to: 0,
                time: 300
            });
            n.start()
        }
        _themeChangeLink.html("换肤");
        $("#themeChange").removeClass("themeChangeDown");
        e = false
    }
    function d() {
        if (Animate.canTransition) {
            $("#theme").setStyle("height", "210px")
        } else {
            n && n.stop();
            n = new Animate($("#theme").get(0), "height", {
                from: 0,
                to: 210,
                time: 300
            });
            n.start()
        }
        _themeChangeLink.html("收起");
        $("#themeChange").addClass("themeChangeDown");
        e = true
    }
    $("#themeChange").on("click",
    function() {
        if (e) {
            g(curSkinValue);
            h()
        } else {
            d()
        }
    });
    $("#js_simpleSetColor a").on("click",
    function(p) {
        var q = p.getAttribute("skin");
        b(q);
        g(curSkinValue);
        _themeLis && _themeLis.removeClass("curTheme")
    });
    var l = 0,
    a = 900;
    _sliderUl = null,
    _curSliderAni = null,
    _typeLinks = null,
    _themeSlider = null,
    _typeChangeXhr = null,
    _themeLis = null,
    _totalPage = 0,
    _pageNubUl = null,
    _totalPageSpan = null;
    function c() {
        _sliderUl = $("#themeSliderUl");
        var r = _sliderUl.findChild("li");
        _totalPage = Math.ceil(r.length / 6);
        l = 0;
        _themeLis = $("#themeSliderUl li");
        _themeLis.on("click",
        function(s) {
            var t = s.getAttribute("skin");
            _themeLis.removeClass("curTheme");
            $(s).addClass("curTheme");
            b(t)
        });
        _themeLis.each(function(s) {
            $(s).hover(function(t) {
                $(t).addClass("themeLiHover")
            },
            function(t) {
                $(t).removeClass("themeLiHover")
            })
        });
        _totalPageSpan.html("/" + _totalPage + "页");
        var p = "";
        for (var q = 0; q < _totalPage; q++) {
            p += "<li>" + (q + 1) + "</li>"
        }
        _pageNubUl.setStyle("top", "0px").html(p);
        i()
    }
    var o = $("#themeChange").el;
    if (window.addEventListener) {
        o.addEventListener("mouseover", f, false)
    } else {
        o.attachEvent("onmouseover", f)
    }
    function f() {
        if (window.removeEventListener) {
            o.removeEventListener("mouseover", f, false)
        } else {
            o.detachEvent("onmouseover", f)
        }
        Ajax.request(Config.getThemeUrl(), {
            success: function(p) {
				var kk=p.responseText;
				kk=kk.replace(/###/gi,qtcmsdd.t)
                $(".themeWrap").html(kk);
                $(".themeWrap").removeClass("loadingBig");
                _sliderUl = $("#themeSliderUl");
                _typeLinks = $(".themeTop a");
                _themeSlider = $(".themeSlider");
                _pageNubUl = $(".themePagger ul");
                _totalPageSpan = $(".themePagger span.after");
                _typeLinks.on("click",
                function(q) {
                    _typeLinks.removeClass("cur");
                    $(q).addClass("cur");
                    _themeSlider.html("");
                    _themeSlider.addClass("loadingBig");
                    var s = q.getAttribute("alt");
                    if (_typeChangeXhr) {
                        try {
                            _typeChangeXhr.onreadystatechange = null;
                            _typeChangeXhr.abort()
                        } catch(r) {}
                    }
                    _typeChangeXhr = Ajax.request(Config.getThemeTypeUrl(s), {
                        success: function(t) {
							var kk=t.responseText;
							kk=kk.replace(/###/gi,qtcmsdd.t)
                            _themeSlider.html(kk);
                            _themeSlider.removeClass("loadingBig");
                            c()
                        }
                    })
                });
                $("#themeSave").on("click",
                function(q) {
                    g(curSkinValue);
                    h()
                });
                $("#themeCan").on("click",
                function(q) {
                    b(oSkinCss);
                    i();
                    h()
                });
                $("#themeDel").on("click",
                function(q) {
                    b(Config.defaultTheme);
                    i();
                    g(curSkinValue);
                    h()
                });
                $(".themeRight").on("click",
                function() {
                    if (l >= _totalPage - 1) {
                        _curSliderAni && _curSliderAni.stop();
                        _curSliderAni = new Shake(_sliderUl.get(0), "left", {
                            from: parseInt(_sliderUl.getStyle("left"), 0),
                            to: -l * a,
                            time: 800,
                            amplitude: -100
                        });
                        _curSliderAni.start();
                        return
                    }
                    l++;
                    _curSliderAni && _curSliderAni.stop();
                    _curSliderAni = new Animate(_sliderUl.get(0), "left", {
                        from: parseInt(_sliderUl.getStyle("left"), 0),
                        to: -l * a,
                        time: 300
                    });
                    _curSliderAni.start();
                    _pageNubUl.setStyle("top", -l * 24 + "px")
                });
                $(".themeLeft").on("click",
                function() {
                    if (l <= 0) {
                        _curSliderAni && _curSliderAni.stop();
                        _curSliderAni = new Shake(_sliderUl.get(0), "left", {
                            from: parseInt(_sliderUl.getStyle("left"), 0),
                            to: -l * a,
                            time: 800,
                            amplitude: 100
                        });
                        _curSliderAni.start();
                        return
                    }
                    l--;
                    _curSliderAni && _curSliderAni.stop();
                    _curSliderAni = new Animate(_sliderUl.get(0), "left", {
                        from: parseInt(_sliderUl.getStyle("left"), 0),
                        to: -l * a,
                        time: 300
                    });
                    _curSliderAni.start();
                    _pageNubUl.setStyle("top", -l * 24 + "px")
                });
                c()
            },
            failure: function(p) {}
        })
    }
})();






var __$ = function(b) {
    var a = document;
    return a.getElementById(b)
};


var W = document.getElementById("weather");
var Weather = {
    timer: null,
    CityCookieName: "citydata",
    WeatherCookieName: "weather",
    DefaultCity: ["109", "101010100", "101010100", "北京", "北京"],
    StatIPQueue: [],
    StatGetQueue: [],
    Set: function() {
        W.style.display = "none";
        __$("setCityBox").style.display = "";
        var a = Cookie.get(this.CityCookieName);
        if (a) {
            a = a.split(",")
        } else {
            a = this.DefaultCity
        }
        __$("w_pro").value = a[0];
        this.initCitys(a[0]);
        __$("w_city").value = a[1];
        this.initAreaCitys(a[2])
    },
    ShowStatus: function(f) {
        if (!f) {
            return
        }
        var d = '<ul class="weather"><li><h4 class="city">#{city}</h4><a class="cut" href="javascript:void(0);" onclick="Weather.Set();return false;">[切换]</a></li><li class="tWrap"><div class="i"><a href="http://www.weather.com.cn/weather/#{cityid}.shtml"><img  onload="pngfix(this)" title="#{img1_title}" src="'+qtcmsdd.t+'public4/rebuild/images/m/#{img1}.png" /></a></div><a href="http://www.weather.com.cn/weather/#{cityid}.shtml" target="_blank" class="t" title=#{jtitle}>今 #{img1_title}<i class="tem">#{today}</i><i class="tem2">#{pollution}</i></a></li><li class="mWrap"><div class="i"><a href="http://www.weather.com.cn/weather/#{cityid}.shtml"><img onload="pngfix(this)" title="#{img2_title}" src="'+qtcmsdd.t+'public4/rebuild/images/m/#{img2}.png" /></a></div><a href="http://www.weather.com.cn/weather/#{cityid}.shtml" target="_blank" class="t" title="#{mtitle}">明 #{img2_title}<i class="tem">#{tomorrow}</i></a></li></ul>';
        var g;
        $(".weather-tip").hide();
        switch (f) {
        case 100:
            g = '正在判断城市，请稍后...&nbsp; <a href="javascript:void(0);" onclick="Weather.Set();return false;" target="_self">[手动设置]</a> <a href="http://www.weather.com.cn/" target="_blank">快速查看</a>';
            break;
        case 101:
            g = "判断城市失败，默认为北京，请手动设置。";
            break;
        case 102:
            g = '正在获取天气数据，请稍候... <a href="http://www.weather.com.cn/" target="_blank">快速查看</a>';
            break;
        case 404:
            g = '很抱歉，暂无该城市天气数据。<a href="javascript:void(0);" onclick="Weather.Set();return false;" target="_self">[选择其它城市]</a>';
            break;
        case 500:
            g = '服务器错误或本地网络过慢。<a href="javascript:void(0);" target="_self" onclick="Weather.Init();return false;">[点击重试]</a>';
            break;
        case 200:
            var c = arguments[1];
            var h = ["日", "一", "二", "三", "四", "五", "六"],
            b = new Date();
            var e = b.getDay();
            var a = b.getDay() == 6 ? 0 : e + 1;
            g = format(d, {
                cityid: c[3],
                city: c[0],
                today: c[1],
                tomorrow: c[2],
                img1: c[4],
                img2: c[5],
                week1: h[e],
                week2: h[a],
                img1_title: c[6],
                img2_title: c[7],
                pollution: c[8] || "",
				weat:c[9],
				weam:c[10]
            });
            break
        }
        W.innerHTML = g
    },
    Ip2City: function(c) {
		//http://opens.haoyer.com/ip/
		//http://api.114la.com/ip
        this.ShowStatus(100);
        Ylmf.ScriptLoader.Add({
            src: "http://api.114la.com/ip",
            charset: "gb2312"
        });
        var a = this;
        if (typeof b != "undefined") {
            window.clearTimeout(b)
        }
        var b = window.setTimeout(function() {
            Cookie.clear(this.CityCookieName);
            c && c(a.DefaultCity)
        },
        3000);
        window.ILData_callback = function() {
            if (typeof(ILData) != "undefined") {
                if (typeof b != "undefined") {
                    window.clearTimeout(b)
                }
                if (ILData[2] && ILData[3]) {
                    var d = Ylmf.getProId(ILData[2]);
                    var f = Ylmf.getCityId(d, ILData[3]);
                    var e = [d, f, f, ILData[2], ILData[3]];
                    Cookie.set(a.CityCookieName, e);
                    c && c(e)
                } else {
                    a.ShowStatus(101);
                    Cookie.set(a.CityCookieName, a.DefaultCity);
                    c && c(a.DefaultCity)
                }
            }
        }
    },
    Get: function(e) {
        if (!e) {
			if(qtcmsdd.Dc!="")
				e=qtcmsdd.Dc;
			else
				e=Weather.DefaultCity[1]
        }
        var b = e.slice(3, 7);
        var f = this.ShowStatus;
        var d = this;
        f(102);
        if (typeof a != "undefined") {
            window.clearTimeout(a)
        }
        if (!Cookie.get(this.CityCookieName)) {
            var a = window.setTimeout(function() {
                f(500);
                Cookie.clear(this.CityCookieName)
            },
            5000)
        }
        var c = "http://opens.haoyer.com/weather.php?" + e + ".txt";
        if (!Cookie.get(this.WeatherCookieName)) {}
        Ylmf.ScriptLoader.Add({
            src: c.toString(),
            charset: "utf-8"
        });
        window.Ylmf.getWeather = function(i) {
            window.clearTimeout(Weather.timer);
            if (typeof(i) == "object" && typeof(i) != "undefined" && typeof(i.weatherinfo) != "undefined" && i.weatherinfo != false) {
				Weather.yx="2";
				var bb="空气质量 <span class=\"grade grade3\">中<\/span>";
				var bb_2=i.weatherinfo.pollution;
				var bb_3=bb_2.replace(/<a href=(.*?)>/gi, "");
				bb_3=bb_3.replace(/<\/a>/gi, "");
                var j = [i.weatherinfo.temp1, i.weatherinfo.temp2];
                var g = [i.weatherinfo.city, j[0], j[1], e, i.weatherinfo.img1, i.weatherinfo.img3, i.weatherinfo.weather1, i.weatherinfo.weather2, bb_3, "", ""];
                if (g) {
                    Weather.ShowStatus(200, g);
                    $(".tWrap").hover(function(l) {
                        $(l).addClass("tWrapHover")
                    },
                    function(l) {
                        $(l).removeClass("tWrapHover")
                    });
                    $(".mWrap").hover(function(l) {
                        $(l).addClass("mWrapHover")
                    },
                    function(l) {
                        $(l).removeClass("mWrapHover")
                    });
                    if (i.weatherinfo.pollution && i.weatherinfo.pollution != "") {
                        $("#weather .tWrap .tem").hide()
                    }
                    Weather.timer = window.setTimeout(function() {
                        $("#weather .tem2").hide();
                        $("#weather .tWrap .tem").show()
                    },
                    10000);
                    var h = ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "19", "21", "22", "23", "24", "25"];
					if (i.weatherinfo.tip && i.weatherinfo.tip!="") {
						$(".weather-txt").html(i.weatherinfo.tip);
						$(".weather-tip").show();
						$(".weather-close").on("click",
						function() {
							$(".weather-tip").hide()
						})
					}
                    Cookie.set(d.WeatherCookieName, 1)
                }
            } else {
                if (i.weatherinfo == false) {
                    Weather.ShowStatus(404)
                }
            }
        }
    },
    Init: function() {
        var c = this.CityCookieName;
        var b = this;
        if (Cookie.get(this.CityCookieName)) {
            var a = Cookie.get(this.CityCookieName).split(",");
            if (!a[2]) {
                Cookie.clear(this.CityCookieName);
                b.Init()
            }
            this.Get(a[2])
        } else {
            this.Ip2City(function(d) {
                var e = Cookie.get(b.CityCookieName);
                if (e) {
                    e = e.split(",");
					var p=e[2];
					if(qtcmsdd.Dc!=""){
						p=qtcmsdd.Dc;	
						Cookie.set(b.CityCookieName, p);
					}
                    b.Get(p)
                } else {
                    b.Get(d[2])
                }
            })
        }
    },
    getAreas: function(c, b) {
        var a = c.slice(3, 7);
        Ylmf.ScriptLoader.Add({
            src: "http://opens.haoyer.com/weather/getAreas/"+a+".txt?" + parseInt(Math.random() * 99),
            charset: "utf-8"

        });
        window.Ylmf.getAreaCity = function(d) {
            if (typeof(d) == "object" && typeof(d.result) != "undefined" && typeof(d.result[0][0]) != "undefined") {
				Weather.yx="2";	
                b(d.result)
            }
        }
    },
    initCitys: function(b) {
        if (!b) {
            return
        }
        __$("w_city").innerHTML = "";
        for (var d = 0,
        a = CityArr.length; d < a; ++d) {
            var c = CityArr[d];
            if (c[1] == b) {
                var e = document.createElement("option");
                e.value = c[2];
                e.innerHTML = c[3] + "&nbsp;" + c[0];
                __$("w_city").appendChild(e)
            }
        }
        __$("w_city").selectedIndex = 0
    },
    initAreaCitys: function(b, a) {
        __$("l_city").innerHTML = "";
        this.getAreas(b,
        function(g) {
            for (var e = 0,
            c = g.length; e < c; ++e) {
                var d = g[e];
                var f = document.createElement("option");
                if (d[0] == b) {
                    f.selected = true
                }
                f.value = d[0];
                f.innerHTML = d[2] + "&nbsp;" + d[1];
                __$("l_city").appendChild(f)
            }
            if (a) {
                a()
            }
        })
    },
    cp: function(a) {
        this.initCitys(a);
        __$("w_city").selectedIndex = 0;
        this.cc(__$("w_city").value)
    },
    cc: function(a) {
        this.initAreaCitys(a,
        function() {})
    },
    custom: function() {
        var a = Cookie.get(this.CityCookieName);
        if (a) {
            a = a.split(",")
        } else {
            a = this.DefaultCity
        }
        var b = [__$("w_pro").value, __$("w_city").value, __$("l_city").value ? __$("l_city").value: __$("w_city").value, Ylmf.getSelectValue(__$("w_pro")), Ylmf.getSelectValue(__$("w_city"))];
        if (a[2] != b[2]) {
            this.Get(b[2]);
            Cookie.set(this.CityCookieName, b)
        }
        __$("setCityBox").style.display = "none";
        W.style.display = ""
    },
    autoLoad: function() {
        Cookie.clear(this.CityCookieName);
        Cookie.clear(this.WeatherCookieName);
        this.Init();
        __$("setCityBox").style.display = "none";
        W.style.display = ""
    }
};
Weather.Init();
var CityArr = [["CategoryName", "ParentId", "Id"], ["华北地区", "0", "1"], ["北京", "1", "109"], ["北京", "109", "101010100", "B"], ["天津", "1", "110"], ["天津", "110", "101030100", "T"], ["河北", "1", "111"], ["石家庄", "111", "101090101", "S"], ["保定", "111", "101090201", "B"], ["承德市", "111", "101090402", "C"], ["沧州", "111", "101090701", "C"], ["衡水", "111", "101090801", "H"], ["邯郸", "111", "101091001", "H"], ["廊坊", "111", "101090601", "L"], ["秦皇岛", "111", "101091101", "Q"], ["唐山", "111", "101090501", "T"], ["邢台", "111", "101090901", "X"], ["张家口", "111", "101090301", "Z"], ["山西", "1", "112"], ["太原", "112", "101100101", "T"], ["长治", "112", "101100501", "C"], ["大同", "112", "101100201", "D"], ["晋中", "112", "101100401", "J"], ["晋城", "112", "101100601", "J"], ["临汾", "112", "101100701", "L"], ["吕梁", "112", "101101100", "L"], ["忻州", "112", "101101001", "X"], ["阳泉", "112", "101100301", "Y"], ["运城", "112", "101100801", "Y"], ["朔州", "112", "101100901", "Y"], ["内蒙古", "1", "113"], ["呼和浩特", "113", "101080101", "H"], ["阿拉善左旗", "113", "101081201", "A"], ["包头", "113", "101080201", "B"], ["赤峰", "113", "101080601", "C"], ["鄂尔多斯", "113", "101080701", "E"], ["呼伦贝尔", "113", "101081000", "H"], ["集宁", "113", "101080401", "J"], ["临河", "113", "101080801", "L"], ["通辽", "113", "101080501", "T"], ["乌海", "113", "101080301", "W"], ["乌兰浩特", "113", "101081101", "W"], ["锡林浩特", "113", "101080901", "X"], ["东北地区", "0", "2"], ["辽宁", "2", "114"], ["沈阳", "114", "101070101", "S"], ["鞍山", "114", "101070301", "A"], ["本溪", "114", "101070501", "B"], ["朝阳", "114", "101071201", "C"], ["大连", "114", "101070201", "D"], ["丹东", "114", "101070601", "D"], ["抚顺", "114", "101070401", "F"], ["阜新", "114", "101070901", "F"], ["葫芦岛", "114", "101071401", "H"], ["锦州", "114", "101070701", "J"], ["辽阳", "114", "101071001", "L"], ["盘锦", "114", "101071301", "P"], ["铁岭", "114", "101071101", "T"], ["营口", "114", "101070801", "Y"], ["吉林", "2", "115"], ["长春", "115", "101060101", "C"], ["白城", "115", "101060601", "B"], ["白山", "115", "101060901", "B"], ["吉林", "115", "101060201", "J"], ["辽源", "115", "101060701", "L"], ["四平", "115", "101060401", "S"], ["松原", "115", "101060801", "S"], ["通化", "115", "101060501", "T"], ["延吉", "115", "101060301", "Y"], ["黑龙江", "2", "116"], ["哈尔滨", "116", "101050101", "H"], ["大兴安岭", "116", "101050701", "D"], ["大庆", "116", "101050901", "D"], ["黑河", "116", "101050601", "H"], ["鹤岗", "116", "101051201", "H"], ["佳木斯", "116", "101050401", "J"], ["鸡西", "116", "101051101", "J"], ["牡丹江", "116", "101050301", "M"], ["齐齐哈尔", "116", "101050201", "Q"], ["七台河", "116", "101051002", "Q"], ["绥化", "116", "101050501", "S"], ["伊春", "116", "101050801", "Y"], ["双鸭山", "116", "101051301", "S"], ["华东地区", "0", "3"], ["上海", "3", "117"], ["上海", "117", "101020100", "S"], ["山东", "3", "118"], ["济南", "118", "101120101", "J"], ["滨州", "118", "101121101", "B"], ["德州", "118", "101120401", "D"], ["东营", "118", "101121201", "D"], ["菏泽", "118", "101121001", "H"], ["济宁", "118", "101120701", "J"], ["临沂", "118", "101120901", "L"], ["莱芜", "118", "101121601", "L"], ["聊城", "118", "101121701", "L"], ["青岛", "118", "101120201", "Q"], ["潍坊", "118", "101120601", "W"], ["威海", "118", "101121301", "W"], ["烟台", "118", "101120501", "Y"], ["日照", "118", "101121501", "R"], ["泰安", "118", "101120801", "T"], ["淄博", "118", "101120301", "Z"], ["枣庄", "118", "101121401", "Z"], ["安徽", "3", "119"], ["合肥", "119", "101220101", "H"], ["安庆", "119", "101220601", "A"], ["蚌埠", "119", "101220201", "B"], ["亳州", "119", "101220901", "B"], ["滁州", "119", "101221101", "C"], ["巢湖", "119", "101221601", "C"], ["池州", "119", "101221701", "C"], ["阜阳", "119", "101220801", "F"], ["淮南", "119", "101220401", "H"], ["黄山", "119", "101221001", "H"], ["淮北", "119", "101221201", "H"], ["六安", "119", "101221501", "L"], ["马鞍山", "119", "101220501", "M"], ["宿州", "119", "101220701", "S"], ["铜陵", "119", "101221301", "T"], ["芜湖", "119", "101220301", "W"], ["宣城", "119", "101221401", "X"], ["江苏", "3", "120"], ["南京", "120", "101190101", "N"], ["常州", "120", "101191101", "C"], ["南通", "120", "101190501", "N"], ["淮安", "120", "101190901", "H"], ["连云港", "120", "101191001", "L"], ["苏州", "120", "101190401", "S"], ["宿迁", "120", "101191301", "S"], ["泰州", "120", "101191201", "T"], ["无锡", "120", "101190201", "W"], ["徐州", "120", "101190801", "X"], ["扬州", "120", "101190601", "Y"], ["盐城", "120", "101190701", "Y"], ["镇江", "120", "101190301", "Z"], ["浙江", "3", "121"], ["杭州", "121", "101210101", "H"], ["湖州", "121", "101210201", "H"], ["嘉兴", "121", "101210301", "J"], ["金华", "121", "101210901", "J"], ["丽水", "121", "101210801", "L"], ["宁波", "121", "101210401", "N"], ["衢州", "121", "101211001", "Q"], ["绍兴", "121", "101210501", "S"], ["台州", "121", "101210601", "T"], ["温州", "121", "101210701", "W"], ["舟山", "121", "101211101", "Z"], ["江西", "3", "122"], ["南昌", "122", "101240101", "N"], ["抚州", "122", "101240401", "F"], ["赣州", "122", "101240701", "G"], ["九江", "122", "101240201", "J"], ["吉安", "122", "101240601", "J"], ["景德镇", "122", "101240801", "J"], ["萍乡", "122", "101240901", "P"], ["上饶", "122", "101240301", "S"], ["新余", "122", "101241001", "X"], ["宜春", "122", "101240501", "Y"], ["鹰潭", "122", "101241101", "Y"], ["福建", "3", "123"], ["福州", "123", "101230101", "F"], ["龙岩", "123", "101230701", "L"], ["宁德", "123", "101230301", "N"], ["南平", "123", "101230901", "N"], ["莆田", "123", "101230401", "P"], ["泉州", "123", "101230501", "Q"], ["三明", "123", "101230801", "S"], ["厦门", "123", "101230201", "X"], ["漳州", "123", "101230601", "Z"], ["中南地区", "0", "4"], ["河南", "4", "124"], ["郑州", "124", "101180101", "Z"], ["安阳", "124", "101180201", "A"], ["鹤壁", "124", "101181201", "H"], ["焦作", "124", "101181101", "J"], ["济源", "124", "101181801", "J"], ["开封", "124", "101180801", "K"], ["洛阳", "124", "101180901", "L"], ["漯河", "124", "101181501", "L"], ["南阳", "124", "101180701", "N"], ["平顶山", "124", "101180501", "P"], ["濮阳", "124", "101181301", "P"], ["商丘", "124", "101181001", "S"], ["三门峡", "124", "101181701", "S"], ["信阳", "124", "101180601", "X"], ["新乡", "124", "101180301", "X"], ["许昌", "124", "101180401", "X"], ["周口", "124", "101181401", "Z"], ["驻马店", "124", "101181601", "Z"], ["湖北", "4", "125"], ["武汉", "125", "101200101", "W"], ["鄂州", "125", "101200301", "E"], ["恩施", "125", "101201001", "E"], ["黄冈", "125", "101200501", "H"], ["黄石", "125", "101200601", "H"], ["荆州", "125", "101200801", "J"], ["荆门", "125", "101201401", "J"], ["潜江", "125", "101201701", "Q"], ["十堰", "125", "101201101", "S"], ["神农架", "125", "101201201", "S"], ["随州", "125", "101201301", "S"], ["天门", "125", "101201501", "T"], ["襄樊", "125", "101200201", "X"], ["孝感", "125", "101200401", "X"], ["咸宁", "125", "101200701", "X"], ["仙桃", "125", "101201601", "X"], ["宜昌", "125", "101200901", "Y"], ["湖南", "4", "126"], ["长沙", "126", "101250101", "C"], ["郴州", "126", "101250501", "C"], ["常德", "126", "101250601", "C"], ["衡阳", "126", "101250401", "H"], ["怀化", "126", "101251201", "H"], ["吉首", "126", "101251501", "J"], ["娄底", "126", "101250801", "L"], ["黔阳", "126", "101251301", "Q"], ["邵阳", "126", "101250901", "S"], ["湘潭", "126", "101250201", "X"], ["益阳", "126", "101250701", "Y"], ["岳阳", "126", "101251001", "Y"], ["永州", "126", "101251401", "Y"], ["株洲", "126", "101250301", "Z"], ["张家界", "126", "101251101", "Z"], ["广东", "4", "127"], ["广州", "127", "101280101", "G"], ["潮州", "127", "101281501", "C"], ["东莞", "127", "101281601", "D"], ["佛山", "127", "101280800", "F"], ["惠州", "127", "101280301", "H"], ["河源", "127", "101281201", "H"], ["江门", "127", "101281101", "J"], ["揭阳", "127", "101281901", "J"], ["梅州", "127", "101280401", "M"], ["茂名", "127", "101282001", "M"], ["清远", "127", "101281301", "Q"], ["韶关", "127", "101280201", "S"], ["汕头", "127", "101280501", "S"], ["深圳", "127", "101280601", "S"], ["汕尾", "127", "101282101", "S"], ["云浮", "127", "101281401", "Y"], ["阳江", "127", "101281801", "Y"], ["珠海", "127", "101280701", "Z"], ["肇庆", "127", "101280901", "Z"], ["湛江", "127", "101281001", "Z"], ["中山", "127", "101281701", "Z"], ["广西", "4", "128"], ["南宁", "128", "101300101", "N"], ["北海", "128", "101301301", "B"], ["百色", "128", "101301001", "B"], ["崇左", "128", "101300201", "C"], ["防城港", "128", "101301401", "F"], ["桂林", "128", "101300501", "G"], ["贵港", "128", "101300801", "G"], ["贺州", "128", "101300701", "H"], ["河池", "128", "101301201", "H"], ["柳州", "128", "101300301", "L"], ["来宾", "128", "101300401", "L"], ["钦州", "128", "101301101", "Q"], ["梧州", "128", "101300601", "W"], ["玉林", "128", "101300901", "Y"], ["海南", "4", "129"], ["海口", "129", "101310101", "H"], ["白沙", "129", "101310907", "B"], ["保亭", "129", "101311614", "B"], ["澄迈", "129", "101310604", "C"], ["昌江", "129", "101310806", "C"], ["东方", "129", "101310402", "D"], ["儋州", "129", "101310705", "D"], ["定安", "129", "101311109", "D"], ["临高", "129", "101310503", "L"], ["陵水", "129", "101311816", "L"], ["乐东", "129", "101312321", "L"], ["琼山", "129", "101310102", "Q"], ["琼中", "129", "101310208", "Q"], ["琼海", "129", "101311311", "Q"], ["清兰", "129", "101311513", "Q"], ["南沙岛", "129", "101312220", "N"], ["三亚", "129", "101310301", "S"], ["珊瑚岛", "129", "101312018", "S"], ["屯昌", "129", "101311210", "T"], ["通什", "129", "101312422", "T"], ["文昌", "129", "101311412", "W"], ["万宁", "129", "101311715", "W"], ["西沙", "129", "101311917", "X"], ["永署礁", "129", "101312119", "Y"], ["西北地区", "0", "5"], ["陕西", "5", "130"], ["西安", "130", "101110101", "X"], ["安康", "130", "101110701", "A"], ["宝鸡", "130", "101110901", "B"], ["汉中", "130", "101110801", "H"], ["商洛", "130", "101110601", "S"], ["铜川", "130", "101111001", "T"], ["渭南", "130", "101110501", "W"], ["咸阳", "130", "101110200", "X"], ["延安", "130", "101110300", "Y"], ["榆林", "130", "101110401", "Y"], ["甘肃", "5", "131"], ["兰州", "131", "101160101", "L"], ["白银", "131", "101161301", "B"], ["定西", "131", "101160201", "D"], ["合作", "131", "101161201", "H"], ["金昌", "131", "101160601", "J"], ["酒泉", "131", "101160801", "J"], ["临夏", "131", "101161101", "L"], ["平凉", "131", "101160301", "P"], ["庆阳", "131", "101160401", "Q"], ["天水", "131", "101160901", "T"], ["武威", "131", "101160501", "W"], ["武都", "131", "101161001", "W"], ["张掖", "131", "101160701", "Z"], ["宁夏", "5", "132"], ["银川", "132", "101170101", "Y"], ["固原", "132", "101170401", "G"], ["石嘴山", "132", "101170201", "S"], ["吴忠", "132", "101170301", "W"], ["中卫", "132", "101170501", "Z"], ["青海", "5", "133"], ["西宁", "133", "101150101", "X"], ["果洛", "133", "101150501", "G"], ["海西", "133", "101150701", "H"], ["海北", "133", "101150801", "H"], ["海东", "133", "101150201", "H"], ["黄南", "133", "101150301", "H"], ["海南", "133", "101150401", "H"], ["玉树", "133", "101150601", "Y"], ["新疆", "5", "134"], ["乌鲁木齐", "134", "101130101", "W"], ["阿勒泰", "134", "101131401", "A"], ["阿图什", "134", "101131501", "A"], ["阿克苏", "134", "101130801", "A"], ["阿拉尔", "134", "101130701", "A"], ["博乐", "134", "1011301601", "B"], ["昌吉", "134", "101130401", "C"], ["哈密", "134", "101131201", "H"], ["和田", "134", "101131301", "H"], ["克拉玛依", "134", "101130201", "K"], ["喀什", "134", "101130901", "K"], ["库尔勒", "134", "101130601", "K"], ["石河子", "134", "101130301", "S"], ["吐鲁番", "134", "101130501", "T"], ["塔城", "134", "101131101", "T"], ["伊宁", "134", "101131001", "Y"], ["西南地区", "0", "6"], ["重庆", "6", "135"], ["重庆", "135", "101040100", "C"], ["四川", "6", "136"], ["成都", "136", "101270101", "C"], ["阿坝", "136", "101271901", "A"], ["巴中", "136", "101270901", "B"], ["德阳", "136", "101272001", "D"], ["达州", "136", "101270601", "D"], ["广元", "136", "101272101", "G"], ["甘孜", "136", "101271801", "G"], ["泸州", "136", "101271001", "L"], ["乐山", "136", "101271401", "L"], ["凉山", "136", "101271601", "L"], ["眉山", "136", "101271501", "M"], ["绵阳", "136", "101270401", "M"], ["南充", "136", "101270501", "N"], ["内江", "136", "101271201", "N"], ["攀枝花", "136", "101270201", "P"], ["遂宁", "136", "101270701", "S"], ["广安", "136", "101270801", "G"], ["雅安", "136", "101271701", "Y"], ["宜宾", "136", "101271101", "Y"], ["资阳", "136", "101271301", "Z"], ["自贡", "136", "101270301", "Z"], ["贵州", "6", "137"], ["贵阳", "137", "101260101", "G"], ["安顺", "137", "101260301", "A"], ["毕节", "137", "101260701", "B"], ["都匀", "137", "101260401", "D"], ["凯里", "137", "101260501", "K"], ["六盘水", "137", "101260801", "L"], ["铜仁", "137", "101260601", "T"], ["遵义", "137", "101260201", "Z"], ["黔西", "137", "101260901", "Q"], ["云南", "6", "138"], ["昆明", "138", "101290101", "K"], ["保山", "138", "101290501", "B"], ["楚雄", "138", "101290801", "C"], ["大理", "138", "101290201", "D"], ["德宏", "138", "101291501", "D"], ["红河", "138", "101290301", "H"], ["景洪", "138", "101291601", "J"], ["临沧", "138", "101291101", "L"], ["丽江", "138", "101291401", "L"], ["怒江", "138", "101291201", "N"], ["曲靖", "138", "101290401", "Q"], ["思茅", "138", "101290901", "S"], ["文山", "138", "101290601", "W"], ["玉溪", "138", "101290701", "Y"], ["昭通", "138", "101291001", "Z"], ["中甸", "138", "101291301", "Z"], ["西藏", "6", "139"], ["拉萨", "139", "101140101", "L"], ["阿里", "139", "101140701", "A"], ["昌都", "139", "101140501", "C"], ["林芝", "139", "101140401", "L"], ["那曲", "139", "101140601", "N"], ["日喀则", "139", "101140201", "R"], ["山南", "139", "101140301", "S"], ["港澳台", "0", "7"], ["香港", "7", "140"], ["香港", "140", "101320101", "X"], ["澳门", "7", "141"], ["澳门", "141", "101330101", "A"], ["台湾", "7", "142"], ["台北县", "142", "101340101", "T"], ["高雄", "142", "101340201", "G"], ["花莲", "142", "101341001", "H"], ["嘉义", "142", "101340901", "J"], ["马公", "142", "101340801", "M"], ["彭佳屿", "142", "101341201", "P"], ["台南", "142", "101340301", "T"], ["台中", "142", "101340401", "T"], ["桃园", "142", "101340501", "T"], ["台东", "142", "101341101", "T"], ["新竹县", "142", "101340601", "X"], ["宜兰", "142", "101340701", "Y"]];

function User_login_f(){
	window.location.reload();
}