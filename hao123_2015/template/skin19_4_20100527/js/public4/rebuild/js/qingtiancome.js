if(qtcmsdd.dc.c==""){
	ToolTaber.init({
		til: $("#tool-tab li"),
		conClass: $("#tb .tbox"),
		tilCur: "active"
	});
	var leisureSlider = new switchable("#btmHander li", ".con_item", {
		triggerType: "click",
		effect: "fade",
		circular: true
	});	
	
	leisureSlider.beforeSwitch(function(g, e, c, a) {
		e.removeClass("active");
		e.eq(g).addClass("active");
		var h = c.eq(g).get(0);
		var l = mini(".btmc_ss ul,.btmc_jq,.smallGameList .sgUl,.btmc_xs ul", h);
		var b = mini("img", l[0]);
		var d = b.length;
		for (var f = 0; f < d; f++) {
			var m = b[f].getAttribute("org");
			if (m) {
				b[f].setAttribute("src", m);
				b[f].removeAttribute("org")
			}
		}
		Cookie.set("leisureIndex", "" + g)
	});	
	
	var leisureIndex = Cookie.get("leisureIndex");
	if (leisureIndex) {
		leisureSlider.move(parseInt(leisureIndex))
	} else {
		leisureSlider.move(0)
	}
	$(".btmc_la").on("click",
	function() {
		leisureSlider.prev()
	});
	$(".btmc_ra").on("click",
	function() {
		leisureSlider.next()
	});	
	
	$(".btmContent .tabHander li").each(function(a) {
		$(a).hover(function() {
			$(a).addClass("hover")
		},
		function() {
			$(a).removeClass("hover")
		})
	});
	$("ul#tool-tab li a,#btmHander li a").on("click",
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
	$(".btmc_subTil li").on("click",
	function(b) {
		var r = $(b.parentNode),
		o = r.get(0).childNodes,
		g = 0,
		f,
		p = [];
		for (var h = 0; h < o.length; h++) {
			if (o[h].nodeType != 3) {
				p.push(o[h])
			}
		}
		g = p.indexOf(b);
		f = p.length;
		if (g == f - 1) {
			return
		}
		for (var h = 0; h < p.length; h++) {
			$(p[h]).removeClass("current")
		}
		$(b).addClass("current");
		var q = $(b.parentNode.parentNode.parentNode);
		var n = q.findChild(".btmc_ssWrap")[0] || q.findChild(".smallGameRow")[0];
		var d = $(n).findChild(".btmc_ss")[0] || $(n).findChild(".smallGameList")[0];
		var a = $($(d).findChild("ul"));
		a.hide();
		a.eq(g).show();
		var m = a.get(g);
		var c = mini("img", m);
		var e = c.length;
		for (var g = 0; g < e; g++) {
			var s = c[g].getAttribute("org");
			if (s) {
				c[g].setAttribute("src", s);
				c[g].removeAttribute("org")
			}
		}
		new Animate(m, "opacity", {
			from: 0,
			to: 1,
			time: 500
		}).start()
	}); 	
}



(function() {
	if(qtcmsdd.add.a=="code"){qtcmsdd.cpp.b=2}	  
    Ylmf.ScriptLoader.Add({
        src: "http://www.114la.com/icai.json?" + parseInt(Math.random() * 99),
        charset: "utf-8"
    });
    window.Ylmf.icai = function(d) {
		function rr(v){
			v=v.replace(/\?agentId=215124/gi,'');
			v=v.replace(/\&agentId=215124/gi,'');
			return v
		}
        var e = "<div style='text-align:center;line-height:162px;'>\u6570\u636e\u52a0\u8f7d\u5f02\u5e38\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\u3002</div>";
        if (typeof d == "object") {
            if (typeof d.ssq == "undefined") {
                $("#shuang").get(0).innerHTML = e;
                return false
            } else {
                if (typeof d.dlt == "undefined") {
                    $("#daletou").get(0).innerHTML = e;
                    return false
                } else {
                    if (typeof d.fc3d == "undefined") {
                        $("#3dee").get(0).innerHTML = e;
                        return false
                    } else {
                        if (typeof d.jx_11x5 == "undefined") {
                            $("#xuan").get(0).innerHTML = e;
                            return false
                        }
                    }
                }
            }
            var a = "";
            for (k in d) {
                switch (k) {
                case "ssq":
                    a = d.ssq[0];
                    var c = '<p class="icai cf"><span class="fl">\u7b2c<i>' + a.phase + '</i>\u671f</span><span class="fr">' + a.date + '    <a href="' + rr(a.url[0]) + '">\u73a9\u6cd5</a></span></p>';
                    c += '<ul class="tickets"><li>' + a.result[0] + "</li><li>" + a.result[1] + "</li><li>" + a.result[2] + "</li><li>" + a.result[3] + "</li><li>" + a.result[4] + "</li><li>" + a.result[5] + '</li><li class="blue last">' + a.result[6] + "</li></ul>";
                    c += '<ul class="selb"><li><a href="' + rr(a.url[1]) + '" class="current">\u7acb\u5373\u6295\u6ce8</a></li><li><a href="' + rr(a.chain[1]) + '">' + a.chain[0] + "</a></li></ul>";
                    c += '<ul class="tiOth cf">';
                    link = a.link;
                    for (var b = 0; b < qtcmsdd.cpp.b; b++) {
                        if (b % 2 === 0) {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a><i>|</i></li>"
                        } else {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a></li>"
                        }
                    }
                    c += "</ul>";
                    $("#shuang").get(0).innerHTML = c;
					
					
					if(qtcmsdd.add.a=="code"){
						var b_a1=document.getElementById("shuang").getElementsByTagName("ul");
						for (var o = 0; o < b_a1.length; o++) {
							var b_a1_1=b_a1[o];
							if(b_a1_1.className.indexOf("tiOth")!=-1){
								b_a1[o].style.height="25px";	
							}
						}				
					}
					
					
                    break;
                case "dlt":
                    a = d.dlt[0];
                    var c = '<p class="icai cf"><span class="fl">\u7b2c<i>' + a.phase + '</i>\u671f</span><span class="fr">' + a.date + '    <a href="' + rr(a.url[0]) + '">\u73a9\u6cd5</a></span></p>';
                    c += '<ul class="tickets"><li>' + a.result[0] + "</li><li>" + a.result[1] + "</li><li>" + a.result[2] + "</li><li>" + a.result[3] + "</li><li>" + a.result[4] + '</li><li class="blue">' + a.result[5] + '</li><li class="blue last">' + a.result[6] + "</li></ul>";
                    c += '<ul class="selb"><li><a href="' + rr(a.url[1]) + '" class="current">\u7acb\u5373\u6295\u6ce8</a></li><li><a href="' + rr(a.chain[1]) + '">' + a.chain[0] + "</a></li></ul>";
                    c += '<ul class="tiOth cf">';
                    link = a.link;
                    for (var b = 0; b < qtcmsdd.cpp.b; b++) {
                        if (b % 2 === 0) {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a><i>|</i></li>"
                        } else {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a></li>"
                        }
                    }
                    c += "</ul>";
                    $("#daletou").get(0).innerHTML = c;
					
					
					if(qtcmsdd.add.a=="code"){
						var b_a1=document.getElementById("daletou").getElementsByTagName("ul");
						for (var o = 0; o < b_a1.length; o++) {
							var b_a1_1=b_a1[o];
							if(b_a1_1.className.indexOf("tiOth")!=-1){
								b_a1[o].style.height="25px";	
							}
						}				
					}					
					
                    break;
                case "fc3d":
                    a = d.fc3d[0];
                    var c = '<p class="icai cf"><span class="fl">\u7b2c<i>' + a.phase + '</i>\u671f</span><span class="fr">' + a.date + '    <a href="' + rr(a.url[0]) + '">\u73a9\u6cd5</a></span></p>';
                    c += '<ul class="tickets"><li>' + a.result[0] + "</li><li>" + a.result[1] + "</li><li>" + a.result[2] + '</li><li class="txt">' + a.result[3] + "</li></ul>";
                    c += '<ul class="selb"><li><a href="' + rr(a.url[1]) + '" class="current">\u7acb\u5373\u6295\u6ce8</a></li><li><a href="' + rr(a.chain[1]) + '">' + a.chain[0] + "</a></li></ul>";
                    c += '<ul class="tiOth cf">';
                    link = a.link;
                    for (var b = 0; b < qtcmsdd.cpp.b; b++) {
                        if (b % 2 === 0) {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a><i>|</i></li>"
                        } else {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a></li>"
                        }
                    }
                    c += "</ul>";
                    $("#3dee").get(0).innerHTML = c;
					
					if(qtcmsdd.add.a=="code"){
						var b_a1=document.getElementById("3dee").getElementsByTagName("ul");
						for (var o = 0; o < b_a1.length; o++) {
							var b_a1_1=b_a1[o];
							if(b_a1_1.className.indexOf("tiOth")!=-1){
								b_a1[o].style.height="25px";	
							}
						}				
					}						
					
                    break;
                case "jx_11x5":
                    a = d.jx_11x5[0];
                    var c = '<p class="icai cf"><span class="fl">\u7b2c<i>' + a.phase + '</i>\u671f</span><span class="fr">' + a.date + "</span></p>";
                    c += '<ul class="tickets"><li>' + a.result[0] + "</li><li>" + a.result[1] + "</li><li>" + a.result[2] + "</li><li>" + a.result[3] + "</li><li>" + a.result[4] + "</li></ul>";
                    c += '<ul class="selb"><li><a href="' + rr(a.url[1]) + '" class="current">\u7acb\u5373\u6295\u6ce8</a></li><li><a href="' + rr(a.chain[1]) + '" class="w">' + a.chain[0] + "</a></li></ul>";
                    c += '<ul class="tiOth cf">';
                    link = a.link;
                    for (var b = 0; b < qtcmsdd.cpp.b; b++) {
                        if (b % 2 === 0) {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a><i>|</i></li>"
                        } else {
                            c += '<li><a href="' + rr(link[b]["url"]) + '">' + link[b]["title"] + "</a></li>"
                        }
                    }
                    c += "</ul>";
                    $("#xuan").get(0).innerHTML = c;
					
					if(qtcmsdd.add.a=="code"){
						var b_a1=document.getElementById("xuan").getElementsByTagName("ul");
						for (var o = 0; o < b_a1.length; o++) {
							var b_a1_1=b_a1[o];
							if(b_a1_1.className.indexOf("tiOth")!=-1){
								b_a1[o].style.height="25px";	
							}
						}				
					}					
					
                    break
                }
            }
        } else {
            $("#shuang").get(0).innerHTML = e
        }
    }
	
})();

if(qtcmsdd.dc.b==""){
	
	window.shopSwitch = new switchable(".ecTilTab a", ".ecSliderWrap li", {
		triggerType: "mouse",
		effect: "fade",
		circular: true
	});
	shopSwitch.beforeSwitch(function(h, e, c, a) {
		var b = $(".ecSliderWrap li").eq(h).el.getElementsByTagName("img");
		var d = b.length;
		for (var g = 0; g < d; g++) {
			var n = b[g].getAttribute("org");
			if (n) {
				b[g].setAttribute("src", n);
				b[g].removeAttribute("org")
			}
		}
		var l = $(".ecTilTab .ecTilItem").slice(h, h + 1);
		var f = $(".ecRow .ecBottomLine"),
		m = l.el.offsetLeft + (l.getOuterWidth() - f.getRect().width) / 2 + "px";
		f.setStyle("left", m)
	});
	$(".ecLeftArrow").on("click",
	function() {
		shopSwitch.prev()
	});
	$(".ecRightArrow").on("click",
	function() {
		shopSwitch.next()
	});
	var _ecTag = true;
	var _ecRuning = false;
	var _ecFirstTime = true;
	$(".ecLeftChange").on("click",
	function(a) {
		if (_ecRuning) {
			return
		}
		if (_ecFirstTime) {
			$(".ecLeftWrap img").each(function(b) {
				var c = b.getAttribute("org");
				if (c) {
					b.setAttribute("src", c);
					b.removeAttribute("org")
				}
			});
			_ecFirstTime = false
		}
		if (_ecTag) {
			$(".ecLeftWrap ul").eq(0).hide();
			$(".ecLeftWrap ul").eq(1).setStyle("opacity", 0).show();
			new Animate($(".ecLeftWrap ul").get(1), "opacity", {
				from: 0,
				to: 1,
				time: 500,
				callback: function() {
					_ecRuning = false
				}
			}).start();
			_ecTag = false
		} else {
			$(".ecLeftWrap ul").eq(1).hide();
			$(".ecLeftWrap ul").eq(0).setStyle("opacity", 0).show();
			new Animate($(".ecLeftWrap ul").get(0), "opacity", {
				from: 0,
				to: 1,
				time: 500,
				callback: function() {
					_ecRuning = false
				}
			}).start();
			_ecTag = true
		}
		_ecRuning = true
	});
	$(".ecRow .ecCenter").hover(function() {
		$(".ecLeftArrow,.ecRightArrow").show()
	},
	function() {
		$(".ecLeftArrow,.ecRightArrow").hide()
	});
}
if(qtcmsdd.dc.c==""){
	var _starOp_hover = false,
	_starChose_hover = false;
	$(".star_chose a").on("click",
	function(a) {
		$(".starCol .star_chose").hide();
		Cookie.set("star", a.getAttribute("xzid"));
		Ylmf.ScriptLoader.Add({
			src: qtcmsdd.t+"public4/xingzuo/" + a.getAttribute("xzid") + ".js",
			charset: "gb2312"
		})
	});
	$(".star_op").on("click",
	function() {
		$(".starCol .star_chose").show()
	});
	$(".star_op").hover(function() {
		_starOp_hover = true
	},
	function() {
		_starOp_hover = false
	});
	$(".star_chose").hover(function() {
		_starChose_hover = true
	},
	function() {
		_starChose_hover = false
	});
	
	
	$(document.body).on("click",
	function() {
		if (!_starOp_hover && !_starChose_hover) {
			$(".starCol .star_chose").hide()
		}
	});
	window.Ylmf.star = function(d) {
		function c(g) {
			var h = Math.ceil(g / 20),
			i = "";
			for (var f = 0; f < h; f++) {
				i += '<span class="sartIco"></span>'
			}
			for (var f = h; f < 5; f++) {
				i += '<span class="sartIco sartIco-h"></span>'
			}
			return i
		}
		function h(formatStr)   
		{   
			var myDate = new Date();
			var str = formatStr;   
			var Week = ['日','一','二','三','四','五','六'];  
		  
			str=str.replace(/yyyy|YYYY/,myDate.getFullYear());   
			str=str.replace(/yy|YY/,(myDate.getYear() % 100)>9?(myDate.getYear() % 100).toString():'0' + (myDate.getYear() % 100));   
		  
			str=str.replace(/MM/,myDate.getMonth()>9?(myDate.getMonth()+1).toString():'0' + (myDate.getMonth()+1));   
			str=str.replace(/M/g,myDate.getMonth());   
		  
			str=str.replace(/w|W/g,Week[myDate.getDay()]);   
		  
			str=str.replace(/dd|DD/,myDate.getDate()>9?myDate.getDate().toString():'0' + myDate.getDate());   
			str=str.replace(/d|D/g,myDate.getDate());   
		  
			str=str.replace(/hh|HH/,myDate.getHours()>9?myDate.getHours().toString():'0' + myDate.getHours());   
			str=str.replace(/h|H/g,myDate.getHours());   
			str=str.replace(/mm/,myDate.getMinutes()>9?myDate.getMinutes().toString():'0' + myDate.getMinutes());   
			str=str.replace(/m/g,myDate.getMinutes());   
		  
			str=str.replace(/ss|SS/,myDate.getSeconds()>9?myDate.getSeconds().toString():'0' + myDate.getSeconds());   
			str=str.replace(/s|S/g,myDate.getSeconds());   
		  
			return str;   
		}   	
		function e(f) {
			if (f > 80) {
				return "超棒"
			} else {
				if (f > 60) {
					return "出运"
				} else {
					if (f > 40) {
						return "平平"
					} else {
						if (f > 20) {
							return "不佳"
						} else {
							return "最差"
						}
					}
				}
			}
		}
		var a = '<div class="starRow1"><span class="starAdv"><a href="#{url}"><img src="'+qtcmsdd.t+'public4/rebuild/images/xingzuo/#{tupian}" /></a></span><div class="starTxt1"><div class="txt1Row"><span>#{astro}(#{date})</span>&nbsp;&nbsp;&nbsp;#{generalHtml}&nbsp;&nbsp;&nbsp;<span class="star_yun">#{generalTxt}</span><span class=""></span></div><div class="txt1Row2"><a href="http://astro.sina.com.cn/fate/astro_aries_tom.html?prourl=1">明日运</a><a href="http://astro.sina.com.cn/fate/astro_aries_week.html?prourl=3">本周运</a><a href="http://astro.sina.com.cn/fate/astro_aries_mon.html?prourl=3">本月运</a></div></div></div><div class="starRow2"><div class="starDRow"><span class="gray">幸运颜色：</span><em>#{color}</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">幸运数字：</span><em>#{number}</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">速配星座：</span><em>#{supei}</em></div><div class="starDRow"><span class="gray">爱情指数：</span>#{loveHtml}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">工作指数：</span>#{workHtml}</div><div class="starDRow"><span class="gray">财运指数：</span>#{moneyHtml}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">健康指数：</span>#{healthHtml}</div><div class="starDRow2"><span class="gray">今日概述：</span><em>#{description}</em>  <a href="http://astro.sina.com.cn/fate/astro_aries_mon.html?prourl=3" class="detail">详情&gt;&gt;</a></div></div>';
		var b = {
			generalHtml: c(d.general),
			loveHtml: c(d.love),
			workHtml: c(d.work),
			moneyHtml: c(d.money),
			healthHtml: c(d.health),
			generalTxt: e(d.general)
		};
		YLMF._extend(b, d);
		$(".star_op").get(0).innerHTML = "<label>" + d.astro + '</label><span class="op_icon"></span>';
		$(".starCom").get(0).innerHTML = format(a, b)
	};
	var _starC = Cookie.get("star") || qtcmsdd.xzd;
	Ylmf.ScriptLoader.Add({
		src: qtcmsdd.t+"public4/xingzuo/" + _starC + ".js",
		charset: "gb2312"
	});
	window.Ylmf.jingqi = function(f) {
		var b = "";
		f[1].height = "300px";
		f[3].width = "300px";
		f[9].width = "300px";
		var e = '<div class="btmc_jq_item jq_item_1"><a href="#{url}"><img org="#{imgurl}" src="'+qtcmsdd.t+'public4/rebuild/images/blank.png" style="height:#{height};width:#{width};"><span class="jq_item_mask"><span class="mask_left">#{title}</span><span class="mask_right"><em class="jq_heart"></em>#{love}</span></span></a></div>';
		for (var d = 1; d <= 9; d++) {
			f[d].width = f[d].width || "145px";
			f[d].height = f[d].height || "145px";
			b += format(e, f[d])
		}
		$(".btmc_jq").get(0).innerHTML = b;
		if (leisureSlider.getIndex() == 2) {
			var g = mini(".btmc_jq  img");
			var a = g.length;
			for (var c = 0; c < a; c++) {
				var h = g[c].getAttribute("org");
				if (h) {
					g[c].setAttribute("src", h);
					g[c].removeAttribute("org")
				}
			}
		}
	};
	(function(){
		var f,b="",c;	  
		function ef(v){
			if(qtcmsdd.NSs.indexOf("*")==-1){
				if(qtcmsdd.NSs.indexOf(v)==-1){
					return true;	
				}
			}
			if (document.getElementById("yule_"+v)){
				return false
			}else{
				return true;	
			}
			return false
		}		
		function af(l,kk){
			if (leisureSlider.getIndex() == kk) {
				var g = document.getElementById("yule_"+l).getElementsByTagName("IMG");
				var a = g.length;
				for (var c = 0; c < a; c++) {
					var h = g[c].getAttribute("org");
					if (h) {
						g[c].setAttribute("src", h);
						g[c].removeAttribute("org")
					}
				}
			}			
		}	
		f=qtcmsdd.b;	  
		for (k in f){	
			function e(l,h,kk){
				if(ef(l)) return false;
				var n="",nn="",c="",p="",d="",p2="";
				d = f[l],len = (h < d.length ? h: d.length);	
				for (var o = 0; o < len; o++) {
					if(kk==leisureSlider.getIndex()){
						p2=	'<img src="'+d[o]["img_url"]+'">';
					}else{
						p2='<img src="'+qtcmsdd.t+'public4/rebuild/pic2/blank.png" org="'+d[o]["img_url"]+'">';
					}
					
					p+='<li><a href="'+d[o]["url"]+'">'+p2+'<span class="btmc_txt1">'+d[o]["title"]+'</span></a></li>';
				}
				
				$("#yule_" + l).html(p);
				af(l,kk);
			}	
			function ee(l,h,kk){
				
				if(ef(l)) return false;
				var n="",nn="",c="",p="",d="",p2="";
				d = f[l],len = (h < d.length ? h: d.length);	
				for (var o = 0; o < len; o++) {
					if(kk==leisureSlider.getIndex()){
						p2=	'<img src="'+d[o]["img_url"]+'">';
					}else{
						p2='<img src="'+qtcmsdd.t+'public4/rebuild/pic2/blank.png" org="'+d[o]["img_url"]+'">';
					}
					
					p+='<li><a href="'+d[o]["url"]+'">'+p2;
					p+='<span class="up_txt">'+d[o]["state"]+'</span>';
					p+='<span class="btmc_txt1">'+d[o]["title"]+'</span>';
					p+='<span class="btmc_txt2">'+d[o]["txt"]+'</span>';
					p+='</a></li>';
				}
				
				$("#yule_" + l).html(p);	
				
				af(l,kk);
			}		
			function eee(l,h,kk){
				
				if(ef(l)) return false;
				var n="",nn="",c="",p="",d="",p2="";
				var w=145,h=145,w1=w,h1=h;
				d = f[l],len = (h < d.length ? h: d.length);	
				
				for (var o = 0; o < len; o++) {
					w1=w;
					h1=h;
					if(o==0)h1=300;
					if(o==2)w1=300;
					if(o==8)w1=300;
					
					if(kk==leisureSlider.getIndex()){
						p2=	'<img src="'+d[o]["img_url"]+'" style="height:'+h1+'px;width:'+w1+'px;">';
					}else{
						p2='<img src="'+qtcmsdd.t+'public4/rebuild/pic2/blank.png" org="'+d[o]["img_url"]+'" style="height:'+h1+'px;width:'+w1+'px;">';
					}
					p+='<div class="btmc_jq_item jq_item_1">';
					p+='<a href="'+d[o]["url"]+'" _orighref="'+d[o]["url"]+'" _tkworked="true">';
					p+=p2;
					p+='<span class="jq_item_mask"><span class="mask_left">'+d[o]["title"]+'</span><span class="mask_right"><em class="jq_heart">'+d[o]["state"]+'</em></span></span>';
					p+='</a></div>';
	
				}
				
				$("#yule_" + l).html(p);		
				
				af(l,kk);			
			}			
			switch (k) {
			case "mryx":
				e(k,10,3);
				break;				
			case "mnyy":
				eee(k,9,2);
				break;		
			case "tv":
				ee(k,10,1);
				break;		
			case "bgyl":
				e(k,10,0);
				break;				
			default:
				e(k,10,0);
				break
			}		
		}
	})();	
	(function() {
		var a = new Date();
		var b = $("#jp_today");
		var c = $("#ht_today");
		b.el.value = a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate();
		c.el.value = a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate()
	})();
	shopSwitch.move(0);	
}


