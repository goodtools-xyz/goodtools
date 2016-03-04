
(function(){
    if(Cookie.get('ws')){
        var link = document.createElement('link');
        link.href = qtcmsdd.t+'public4/rebuild/css/ws.css?v2013';
        link.rel = "stylesheet";
        link.id = 'ws';
        var h = document.getElementsByTagName('base')[0];
        h.parentNode.insertBefore(link, h);
    };
    if(Cookie.get('oldLayout') && Cookie.get('skinCss') == 'classicsBlue' && Cookie.get("ws")){
        var cssFilePath = qtcmsdd.t+'public4/rebuild/css/skin/', skinStyleObj = $("#js_skinStyle");
        skinStyleObj.el.setAttribute('href', cssFilePath + 'classicsBlue.css');
    }else if(Cookie.get('oldLayout') && Cookie.get('skinCss') == 'classicsBlue') {
        var cssFilePath = qtcmsdd.t+'public4/rebuild/css/skin/', skinStyleObj = $("#js_skinStyle");
        skinStyleObj.el.setAttribute('href', cssFilePath + 'classicsBlue.css');
    }else if(Cookie.get('skinCss')) {
        var cssFilePath = qtcmsdd.t+'public4/rebuild/css/skin/', skinStyleObj = $("#js_skinStyle");
        skinStyleObj.el.setAttribute('href', cssFilePath + Cookie.get('skinCss') + '.css'); }
		

})();

var qingtiancms_com={
	g:function(id){
		return document.getElementById(id)	
	},
	a:function(){
		var g=qingtiancms_com.g;
		if(g(qtcmsdd.dff.c)){
			$("#"+qtcmsdd.dff.c).addClass("box-left-mzz");
			$("#"+qtcmsdd.dff.c).html(qtcmsdd.dff.b)
		}	
	},
	b:function(){
		if(qtcmsdd.add.a=="code"){
			var g=qingtiancms_com.g;
			qingtiancms_com.g("imgArr_t").innerHTML=qingtiancms_com.g("imgArr_t_code").innerHTML;
			qingtiancms_com.g("imgArr_t").className="imgArr_t_ad";
		}
	}
}