(function(global, undefined){
  var listened = {};
  var ah = window.autoheight = window.autoheight || {};

  function $(id){return global.document.getElementById(id);}

  var EXPR_MSG_SPL = /\&/g;
  var EXPR_MSGI_SPL = /=/g;

  ah.listen = function(key, id){
    if(!id) id = key;
    if(key){
      listened[key] = id;
    }
  };

  function getMainDomain(domain){ 
	  var a = "areo|arts|asia|firm|info|jobs|mobi|name|post|biz|com|edu|gen|gov|idv|ind|int|net|nom|org|pro|rec|web|xxx|ac|ag|am|at|au|be|br|bz|ca|cc|cm|co|de|es|eu|fm|fr|gs|ie|in|it|jp|me|ms|mx|nl|nu|nz|se|tk|tv|tw|uk|us|vg|ws".split(/\|/g),
		  d = domain.split(/\./g);
	  for(var i = 0; i < a.length; i++){
		  if (a[i] === d[d.length-2]) 
			  return d.slice(d.length - 3, d.length).join(".");
	  }
	  return d.slice(d.length -2, d.length).join(".");
  };

  var receiveMessage = function(e){
	  
    var msg = e.data.toString();
    var msga = msg.split(EXPR_MSG_SPL);
    var id, w, h, o;
    var scroll=false,top,left;
    for(var i = 0; i < msga.length; i++){
      var msgia = msga[i].split(EXPR_MSGI_SPL);
      var k = msgia[0];
      var v = msgia[1];
      if(v){
        switch(k){
          case "width": w = v; break;
          case "height": h = v; break;
          case "id": id = v; break;
          case "top": scroll=true; top=v; break;
          case "left": scroll=true; left=v; break;
        }
      }
    }
    if(msga.length == 1 && !h && !isNaN(parseInt(msga[0],10))){
      h = parseInt(msga[0],10);
    }
    if(listened[id] && (o = $(listened[id]))){
      if(w) o.style.width = w + "px";
      if(h) o.style.height = h + "px";
      if(scroll){
        scrollTo(left,top);
      }
    }
  }
  if(global.postMessage){
	  
    if(global.addEventListener){
		
      global.addEventListener("message", receiveMessage, false);
    }else if(global.attachEvent){
      global.attachEvent("onmessage", function(){receiveMessage.call(global, window.event);});
    }else{
      global.onmessage = function(){receiveMessage.call(global, window.event);};
    }
  }else{
  	
	document.domain = getMainDomain(document.domain);
  }
  ah.raise = receiveMessage;

})(this);
