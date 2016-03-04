var mini = (function() {
    var b = /(?:[\w\-\\.#]+)+(?:\[\w+?=([\'"])?(?:\\\1|.)+?\1\])?|\*|>/ig,
    g = /^(?:[\w\-_]+)?\.([\w\-_]+)/,
    f = /^(?:[\w\-_]+)?#([\w\-_]+)/,
    j = /^([\w\*\-_]+)/,
    h = [null, null];
    function d(o, m) {
        m = m || document;
        var k = /^[\w\-_#]+$/.test(o);
        if (!k && m.querySelectorAll) {
            return c(m.querySelectorAll(o))
        }
        if (o.indexOf(",") > -1) {
            var v = o.split(/,/g),
            t = [],
            s = 0,
            r = v.length;
            for (; s < r; ++s) {
                t = t.concat(d(v[s], m))
            }
            return e(t)
        }
        var p = o.match(b),
        n = p.pop(),
        l = (n.match(f) || h)[1],
        u = !l && (n.match(g) || h)[1],
        w = !l && (n.match(j) || h)[1],
        q;
        if (u && !w && m.getElementsByClassName) {
            q = c(m.getElementsByClassName(u))
        } else {
            q = !l && c(m.getElementsByTagName(w || "*"));
            if (u) {
                q = i(q, "className", RegExp("(^|\\s)" + u + "(\\s|$)"))
            }
            if (l) {
                var x = m.getElementById(l);
                return x ? [x] : []
            }
        }
        return p[0] && q[0] ? a(p, q) : q
    }
    function c(o) {
        try {
            return Array.prototype.slice.call(o)
        } catch(n) {
            var l = [],
            m = 0,
            k = o.length;
            for (; m < k; ++m) {
                l[m] = o[m]
            }
            return l
        }
    }
    function a(w, p, n) {
        var q = w.pop();
        if (q === ">") {
            return a(w, p, true)
        }
        var s = [],
        k = -1,
        l = (q.match(f) || h)[1],
        t = !l && (q.match(g) || h)[1],
        v = !l && (q.match(j) || h)[1],
        u = -1,
        m,
        x,
        o;
        v = v && v.toLowerCase();
        while ((m = p[++u])) {
            x = m.parentNode;
            do {
                o = !v || v === "*" || v === x.nodeName.toLowerCase();
                o = o && (!l || x.id === l);
                o = o && (!t || RegExp("(^|\\s)" + t + "(\\s|$)").test(x.className));
                if (n || o) {
                    break
                }
            } while (( x = x . parentNode ));
            if (o) {
                s[++k] = m
            }
        }
        return w[0] && s[0] ? a(w, s) : s
    }
    var e = (function() {
        var k = +new Date();
        var l = (function() {
            var m = 1;
            return function(p) {
                var o = p[k],
                n = m++;
                if (!o) {
                    p[k] = n;
                    return true
                }
                return false
            }
        })();
        return function(m) {
            var s = m.length,
            n = [],
            q = -1,
            o = 0,
            p;
            for (; o < s; ++o) {
                p = m[o];
                if (l(p)) {
                    n[++q] = p
                }
            }
            k += 1;
            return n
        }
    })();
    function i(q, k, p) {
        var m = -1,
        o, n = -1,
        l = [];
        while ((o = q[++m])) {
            if (p.test(o[k])) {
                l[++n] = o
            }
        }
        return l
    }
    return d
})();
if (typeof Ylmf === "undefined") {
    var Ylmf = {}
}
Function.prototype.method = function(name, fn) {
    this.prototype[name] = fn;
    return this
};
if (!Array.prototype.forEach) {
    Array.method("forEach",
    function(fn, thisObj) {
        var scope = thisObj || window;
        for (var i = 0,
        j = this.length; i < j; ++i) {
            fn.call(scope, this[i], i, this)
        }
    }).method("every",
    function(fn, thisObj) {
        var scope = thisObj || window;
        for (var i = 0,
        j = this.length; i < j; ++i) {
            if (!fn.call(scope, this[i], i, this)) {
                return false
            }
        }
        return true
    }).method("some",
    function(fn, thisObj) {
        var scope = thisObj || window;
        for (var i = 0,
        j = this.length; i < j; ++i) {
            if (fn.call(scope, this[i], i, this)) {
                return true
            }
        }
        return false
    }).method("map",
    function(fn, thisObj) {
        var scope = thisObj || window;
        var a = [];
        for (var i = 0,
        j = this.length; i < j; ++i) {
            a.push(fn.call(scope, this[i], i, this))
        }
        return a
    }).method("filter",
    function(fn, thisObj) {
        var scope = thisObj || window;
        var a = [];
        for (var i = 0,
        j = this.length; i < j; ++i) {
            if (!fn.call(scope, this[i], i, this)) {
                continue
            }
            a.push(this[i])
        }
        return a
    }).method("indexOf",
    function(el, start) {
        var start = start || 0;
        for (var i = start,
        j = this.length; i < j; ++i) {
            if (this[i] === el) {
                return i
            }
        }
        return - 1
    }).method("lastIndexOf",
    function(el, start) {
        var start = start || this.length;
        if (start >= this.length) {
            start = this.length
        }
        if (start < 0) {
            start = this.length + start
        }
        for (var i = start; i >= 0; --i) {
            if (this[i] === el) {
                return i
            }
        }
        return - 1
    })
} (function() {
    Ylmf.register = function(REG) {
        function __$(el) {
            if (typeof el == "string") {
                var elArr = mini(el);
                if (!elArr || elArr == "" || typeof(elArr) == "undefined" == "undefined") {
                    return false
                }
                if (elArr.length == 1) {
                    this.el = elArr[0]
                } else {
                    if (elArr.length > 1) {
                        this.el = elArr
                    }
                }
            } else {
                if (el.nodeType == 1) {
                    this.el = el
                } else {
                    if (YLMF.isArray(el)) {
                        if (el.length == 1) {
                            this.el = el[0]
                        } else {
                            if (el.length > 1) {
                                this.el = el
                            }
                        }
                    } else {
                        if (el == window) {
                            this.el = el
                        }
                    }
                }
            }
        }
        __$.method(REG.each,
        function(fn) {
            if (!this.el) {
                return
            }
            if (!this.el.length) {
                fn.call(this, this.el)
            } else {
                for (var i = 0,
                len = this.el.length; i < len; ++i) {
                    fn.call(this, this.el[i], i)
                }
            }
            return this
        }).method(REG.hasClass,
        function(c, fn) {
            if (fn) {
                this.each(function(el) {
                    var col = el.className.split(/\s+/).toString();
                    var result = (col.indexOf(c) > -1) ? true: false; (function() {
                        fn(result)
                    })()
                });
                return this
            } else {
                if (this.size() == 1) {
                    var col = this.el.className.split(/\s+/).toString();
                    return (col.indexOf(c) > -1) ? true: false
                }
            }
        }).method(REG.addClass,
        function(classNames) {
            this.each(function(el) {
                var col = (classNames || "").split(/\s+/);
                for (var i = 0; i < col.length; i++) {
                    var item = col[i];
                    this.hasClass(el,
                    function(b) {
                        if (!b) {
                            el.className += (el.className ? " ": "") + item
                        }
                    })
                }
            });
            return this
        }).method(REG.removeClass,
        function(c) {
            this.each(function(el) {
                if (c != undefined) {
                    var col = el.className.split(/\s+/);
                    var hasCol = [];
                    for (var i = 0,
                    len = col.length; i < len; ++i) {
                        var item = col[i];
                        if (item != c) {
                            hasCol.push(item)
                        }
                    }
                    el.className = hasCol.join(" ")
                } else {
                    el.className = ""
                }
            });
            return this
        }).method(REG.replaceClass,
        function(oc, nc) {
            this.removeClass(oc);
            this.addClass(nc);
            return this
        }).method(REG.setStyle,
        function(prop, val) {
            switch (prop) {
            case "opacity":
                this.each(function(el) {
                    if (document.all) {
                        el.style.filter = "alpha(opacity=" + val * 100 + ")"
                    } else {
                        el.style[prop] = val
                    }
                });
                break;
            default:
                this.each(function(el) {
                    el.style[prop] = val
                });
                break
            }
            return this
        }).method(REG.setCSS,
        function(styles) {
            for (var prop in styles) {
                if (!styles.hasOwnProperty(prop)) {
                    continue
                }
                this.setStyle(prop, styles[prop])
            }
            return this
        }).method(REG.getStyle,
        function(prop, fn) {
            var elem = this.el,
            attr = prop;
            if (elem.style[attr]) {
                return elem.style[attr]
            } else {
                if (elem.currentStyle) {
                    return elem.currentStyle[attr]
                } else {
                    if (document.defaultView && document.defaultView.getComputedStyle) {
                        attr = attr.replace(/([A-Z])/g, "-$1").toLowerCase();
                        return document.defaultView.getComputedStyle(elem, null).getPropertyValue(attr)
                    } else {
                        return null
                    }
                }
            }
        }).method(REG.show,
        function(n) {
            if (n == 0) {
                this.setStyle("display", "")
            } else {
                if (n == 1) {
                    this.setStyle("display", "")
                } else {
                    this.setStyle("display", "block")
                }
            }
            return this
        }).method(REG.hide,
        function() {
            this.setStyle("display", "none");
            return this
        }).method(REG.toggle,
        function(t) {
            this.each(function(el) {
                if (el.style.display == "none") {
                    if (t) {
                        t == 1 ? el.style.display = "inline": el.style.display = ""
                    } else {
                        el.style.display = "block"
                    }
                } else {
                    el.style.display = "block"
                }
            });
            return this
        }).method(REG.on,
        function(type, fn) {
            var add = function(el) {
                var f = function() {
                    fn(el)
                };
                if (window.addEventListener) {
                    el.addEventListener(type, f, false)
                } else {
                    if (window.attachEvent) {
                        el.attachEvent("on" + type, f)
                    }
                }
            };
            if (!this.el) {
                return
            }
            if (this.el.length == 0) {
                add(this.el)
            } else {
                this.each(function(el) {
                    add(el)
                })
            }
            return this
        }).method(REG.getRect,
        function(fn) {
            var _oRect = this.el.getBoundingClientRect(),
            oRect = {
                left: _oRect.left,
                top: _oRect.top,
                bottom: _oRect.bottom,
                right: _oRect.right,
                width: _oRect.width || Math.abs(_oRect.left - _oRect.right),
                height: _oRect.height || Math.abs(_oRect.top - _oRect.bottom)
            };
            if (fn) {
                fn.call(this, oRect)
            } else {
                return oRect
            }
            return this
        }).method(REG.create,
        function(el, o, cb) {
            var el = document.createElement(el);
            for (prop in o) {
                el.setAttribute(prop, o[prop])
            }
            if (cb) {
                cb.call(this, el)
            }
            return this
        }).method(REG.append,
        function(element) {
            this.el.appendChild(element);
            return this
        }).method(REG.remove,
        function(element) {
            if (element) {
                this.el.removeChild(element)
            }
            return this
        }).method(REG.size,
        function() {
            return this.el ? (this.el.length || 1) : 0
        }).method(REG.slice,
        function(start, end) {
            return new __$(this.el.slice(start, end))
        }).method(REG.get,
        function(n) {
            try {
                if (this.el.length) {
                    return this.el[n]
                } else {
                    return this.el
                }
            } catch(e) {
                return this.el
            }
        }).method("eq",
        function(n) {
            if (YLMF.isArray(this.el)) {
                return new __$(this.el[n])
            } else {
                if (n == 0) {
                    return this
                }
            }
        }).method("html",
        function(h) {
            if (typeof h == "string") {
                this.each(function(el) {
                    el.innerHTML = h
                })
            }
        }).method("getOuterWidth",
        function(n) {
            var oRect = this.getRect();
            var _marginL = parseInt(this.getStyle("margin-left"), 10) || 0,
            _marginR = parseInt(this.getStyle("margin-right"), 10) || 0;
            return oRect.width + _marginL + _marginR
        }).method("hover",
        function(overCallback, outCallback) {
            var isHover = false;
            var preOvTime = new Date().getTime();
            function over(el) {
                var curOvTime = new Date().getTime();
                isHover = true;
                if (curOvTime - preOvTime > 10) {
                    setTimeout(function() {
                        overCallback(el)
                    },
                    10)
                }
                preOvTime = curOvTime
            }
            function out(el) {
                var curOvTime = new Date().getTime();
                preOvTime = curOvTime;
                isHover = false;
                setTimeout(function() {
                    if (!isHover) {
                        outCallback(el)
                    }
                },
                10)
            }
            this.on("mouseover", over);
            this.on("mouseout", out)
        }).method("findChild",
        function(c) {
            if (c && c.charAt(0) == ".") {
                var childs = this.get(0).childNodes,
                l = childs.length,
                result = [];
                for (var i = 0; i < l; i++) {
                    if (childs[i].nodeType != 3 && $(childs[i]).hasClass(c.slice(1))) {
                        result.push(childs[i])
                    }
                }
                return result
            } else {
                var childs = this.get(0).childNodes,
                l = childs.length,
                result = [];
                for (var i = 0; i < l; i++) {
                    if (childs[i].nodeType != 3 && childs[i].tagName.toUpperCase() == c.toUpperCase()) {
                        result.push(childs[i])
                    }
                }
                return result
            }
        });
        window[REG.namespace] = function(el) {
            return new __$(el)
        };
        window[REG.namespace].forEach = Array.prototype.forEach;
        window[REG.namespace].every = Array.prototype.every;
        window[REG.namespace].some = Array.prototype.some;
        window[REG.namespace].map = Array.prototype.map;
        window[REG.namespace].filter = Array.prototype.filter;
        Ylmf.extendChain = function(name, fn) {
            __$.method(name, fn)
        }
    }
})();
Ylmf.register({
    namespace: "$",
    each: "each",
    addClass: "addClass",
    hasClass: "hasClass",
    removeClass: "removeClass",
    replaceClass: "replaceClass",
    setStyle: "setStyle",
    getStyle: "getStyle",
    setCSS: "setCSS",
    show: "show",
    hide: "hide",
    toggle: "toggle",
    on: "on",
    getRect: "getRect",
    append: "append",
    create: "create",
    remove: "remove",
    size: "size",
    get: "get",
    slice: "slice",
    hover: "hover"
});
var Yl = {
    getHost: function(A) {
        var _ = A || location.host,
        $ = _.indexOf(":");
        return ($ == -1) ? _: _.substring(0, $)
    },
    getFocus: function(el) {
        var txt = el.createTextRange();
        txt.moveStart("character", el.value.length);
        txt.collapse(true);
        txt.select()
    },
    loadFrame: function(iframe, callback) {
        if (Browser.isIE) {
            iframe.onreadystatechange = function() {
                callback()
            }
        } else {
            iframe.onload = function() {
                callback()
            }
        }
    },
    trim: function($) {
        $ = $.replace(/(^\u3000+)|(\u3000+$)/g, "");
        $ = $.replace(/(^ +)|( +$)/g, "");
        return $
    },
    encodeText: function($) {
        $ = $.replace(/</g, "&lt;");
        $ = $.replace(/>/g, "&gt;");
        $ = $.replace(/\'/g, "&#39;");
        $ = $.replace(/\"/g, "&#34;");
        $ = $.replace(/\\/g, "&#92;");
        $ = $.replace(/\[/g, "&#91;");
        $ = $.replace(/\]/g, "&#93;");
        return $
    },
    decodeHtml: function($) {
        $ = $.replace(/&lt;/g, "<");
        $ = $.replace(/&gt;/g, ">");
        $ = $.replace(/&#39;/g, "'");
        $ = $.replace(/&#34;/g, '"');
        $ = $.replace(/&#92;/g, "\\");
        $ = $.replace(/&#91;/g, "[");
        $ = $.replace(/\&#93;/g, "]");
        return $
    },
    createFrame: function(o) {
        if (!o || !o.src) {
            return
        }
        var s = o.src,
        w = o.width || "100%",
        h = o.height || "100%",
        Frame = format('<iframe src="#{src}" width="#{width}" height="#{height}" scrolling="no" frameborder="0" allowtransparency="true"></iframe>', {
            src: s,
            width: w,
            height: h
        });
        return Frame
    },
    getType: function(o) {
        var _t;
        return ((_t = typeof(o)) == "object" ? o == null && "null" || Object.prototype.toString.call(o).slice(8, -1) : _t).toLowerCase()
    },
    setStyle: function(A, $) {
        var _ = document.styleSheets[0];
        if (_.addRule) {
            A = A.split(",");
            for (var C = 0,
            B = A.length; C < B; C++) {
                _.addRule(A[C], $)
            }
        } else {
            if (_.insertRule) {
                _.insertRule(A + " { " + $ + " }", _.cssRules.length)
            }
        }
    },
    addFav: function(title) {
        var title = title || document.getElementsByTagName("title")[0].innerHTML;
        if (document.all) {
            window.external.AddFavorite(location.href, title)
        } else {
            if (window.sidebar) {
                window.sidebar.addPanel(title, location.href, "")
            } else {
                if (window.opera && window.print) {
                    return true
                }
            }
        }
    },
    setHome: function(c, a) {
        if (!Browser.isIE) {
            window.open(qtcmsdd.mi);
            return
        }
        var b = a;
        if (!b) {
            b = window.location.href
        }
        c.style.behavior = "url(#default#homepage)";
        c.setHomePage(b)
    }
},
Browser = (function() {
    var H = navigator.userAgent,
    F = 0,
    E = 0,
    I = 0,
    D = 0,
    A = 0,
    _ = 0,
    C = 0,
    B;
    if (H.indexOf("Chrome") > -1 && /Chrome\/(\d+(\.d+)?)/.test(H)) {
        C = RegExp.$1
    }
    if (H.indexOf("Safari") > -1 && /Version\/(\d+(\.\d+)?)/.test(H)) {
        F = RegExp.$1
    }
    if (window.opera && /Opera(\s|\/)(\d+(\.\d+)?)/.test(H)) {
        I = RegExp.$2
    }
    if (H.indexOf("Gecko") > -1 && H.indexOf("KHTML") == -1 && /rv\:(\d+(\.\d+)?)/.test(H)) {
        A = RegExp.$1
    }
    if (/MSIE (\d+(\.\d+)?)/.test(H)) {
        D = RegExp.$1
    }
    if (/Firefox(\s|\/)(\d+(\.\d+)?)/.test(H)) {
        _ = RegExp.$2
    }
    if (H.indexOf("KHTML") > -1 && /AppleWebKit\/([^\s]*)/.test(H)) {
        E = RegExp.$1
    }
    try {
        B = !!external.max_version
    } catch($) {}
    function G() {
        var _ = false;
        if (navigator.plugins) {
            for (var B = 0; B < navigator.plugins.length; B++) {
                if (navigator.plugins[B].name.toLowerCase().indexOf("shockwave flash") >= 0) {
                    _ = true
                }
            }
        }
        if (!_) {
            try {
                var $ = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
                if ($) {
                    _ = true
                }
            } catch(A) {
                _ = false
            }
        }
        return _
    }
    return ({
        isStrict: document.compatMode == "CSS1Compat",
        isChrome: C,
        isSafari: F,
        isWebkit: E,
        isOpera: I,
        isGecko: A,
        isIE: D,
        isFF: _,
        isMaxthon: B,
        isFlash: G(),
        isCookie: (navigator.cookieEnabled) ? true: false
    })
})(),
Cookie = {
    set: function(name, value, expires, path, domain) {
        if (typeof expires == "undefined") {
            expires = new Date(new Date().getTime() + 1000 * 3600 * 24 * 365)
        }
        document.cookie = name + "=" + escape(value) + ((expires) ? "; expires=" + expires.toGMTString() : "") + ((path) ? "; path=" + path: "; path=/") + ((domain) ? ";domain=" + domain: "")
    },
    get: function(name) {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) {
            return unescape(arr[2])
        }
        return null
    },
    clear: function(name, path, domain) {
        if (this.get(name)) {
            document.cookie = name + "=" + ((path) ? "; path=" + path: "; path=/") + ((domain) ? "; domain=" + domain: "") + ";expires=Fri, 02-Jan-1970 00:00:00 GMT"
        }
    }
};
Ajax = function() {
    function request(url, opt) {
        function fn() {}
        var async = opt.async !== false,
        method = opt.method || "GET",
        data = opt.data || null,
        success = opt.success || fn,
        failure = opt.failure || fn;
        method = method.toUpperCase();
        if (method == "GET" && data) {
            url += (url.indexOf("?") == -1 ? "?": "&") + data;
            data = null
        }
        var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
        xhr.onreadystatechange = function() {
            _onStateChange(xhr, success, failure)
        };
        xhr.open(method, url, async);
        if (method == "POST") {
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;")
        }
        xhr.send(data);
        return xhr
    }
    function _onStateChange(xhr, success, failure) {
        if (xhr.readyState == 4) {
            var s = xhr.status;
            if (s >= 200 && s < 300) {
                success(xhr)
            } else {
                failure(xhr)
            }
        } else {}
    }
    return {
        request: request
    }
} ();
cache = (function() {
    var cacheBox = {};
    function _get(name) {
        if (cacheBox[name]) {
            return cacheBox[name]
        }
        return null
    }
    function _set(name, value, A) {
        if (!A) {
            cacheBox[name] = value
        } else {
            if (Yl.getType(cacheBox[name]) != "array") {
                cacheBox[name] = []
            }
            cacheBox[name].push(value)
        }
    }
    function _remove(name) {
        delete cacheBox[name]
    }
    function _is(name) {
        return (_get(name) == null) ? false: true
    }
    return {
        get: _get,
        set: _set,
        is: _is,
        remove: _remove
    }
})();
format = function(_, B) {
    if (arguments.length > 1) {
        var F = format,
        H = /([.*+?^=!:${}()|[\]\/\\])/g,
        C = (F.left_delimiter || "{").replace(H, "\\$1"),
        A = (F.right_delimiter || "}").replace(H, "\\$1"),
        E = F._r1 || (F._r1 = new RegExp("#" + C + "([^" + C + A + "]+)" + A, "g")),
        G = F._r2 || (F._r2 = new RegExp("#" + C + "(\\d+)" + A, "g"));
        if (typeof(B) == "object") {
            return _.replace(E,
            function(_, A) {
                var $ = B[A];
                if (typeof $ == "function") {
                    $ = $(A)
                }
                return typeof($) == "undefined" ? "": $
            })
        } else {
            if (typeof(B) != "undefined") {
                var D = Array.prototype.slice.call(arguments, 1),
                $ = D.length;
                return _.replace(G,
                function(A, _) {
                    _ = parseInt(_, 10);
                    return (_ >= $) ? A: D[_]
                })
            }
        }
    }
    return _
};
function DOMReady(f) {
    if (/(?!.*?compatible|.*?webkit)^mozilla|opera/i.test(navigator.userAgent)) {
        document.addEventListener("DOMContentLoaded", f, false)
    } else {
        window.setTimeout(f, 0)
    }
}
if (Browser.isIE == "6.0") {
    document.execCommand("BackgroundImageCache", false, true)
}
var Calendar = (function() {
    var lunarInfo = [19416, 19168, 42352, 21717, 53856, 55632, 91476, 22176, 39632, 21970, 19168, 42422, 42192, 53840, 119381, 46400, 54944, 44450, 38320, 84343, 18800, 42160, 46261, 27216, 27968, 109396, 11104, 38256, 21234, 18800, 25958, 54432, 59984, 28309, 23248, 11104, 100067, 37600, 116951, 51536, 54432, 120998, 46416, 22176, 107956, 9680, 37584, 53938, 43344, 46423, 27808, 46416, 86869, 19872, 42416, 83315, 21168, 43432, 59728, 27296, 44710, 43856, 19296, 43748, 42352, 21088, 62051, 55632, 23383, 22176, 38608, 19925, 19152, 42192, 54484, 53840, 54616, 46400, 46752, 103846, 38320, 18864, 43380, 42160, 45690, 27216, 27968, 44870, 43872, 38256, 19189, 18800, 25776, 29859, 59984, 27480, 21952, 43872, 38613, 37600, 51552, 55636, 54432, 55888, 30034, 22176, 43959, 9680, 37584, 51893, 43344, 46240, 47780, 44368, 21977, 19360, 42416, 86390, 21168, 43312, 31060, 27296, 44368, 23378, 19296, 42726, 42208, 53856, 60005, 54576, 23200, 30371, 38608, 19415, 19152, 42192, 118966, 53840, 54560, 56645, 46496, 22224, 21938, 18864, 42359, 42160, 43600, 111189, 27936, 44448, 84835];
    var Gan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
    var Zhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
    var now = new Date();
    var SY = now.getFullYear();
    var SM = now.getMonth();
    var SD = now.getDate();
    function cyclical(num) {
        return (Gan[num % 10] + Zhi[num % 12])
    }
    function lYearDays(y) {
        var i, sum = 348;
        for (i = 32768; i > 8; i >>= 1) {
            sum += (lunarInfo[y - 1900] & i) ? 1 : 0
        }
        return (sum + leapDays(y))
    }
    function leapDays(y) {
        if (leapMonth(y)) {
            return ((lunarInfo[y - 1900] & 65536) ? 30 : 29)
        } else {
            return (0)
        }
    }
    function leapMonth(y) {
        return (lunarInfo[y - 1900] & 15)
    }
    function monthDays(y, m) {
        return (lunarInfo[y - 1900] & (65536 >> m)) ? 30 : 29
    }
    function Lunar(objDate) {
        var i, leap = 0,
        temp = 0;
        var baseDate = new Date(1900, 0, 31);
        var offset = (objDate - baseDate) / 86400000;
        this.dayCyl = offset + 40;
        this.monCyl = 14;
        for (i = 1900; i < 2050 && offset > 0; i++) {
            temp = lYearDays(i);
            offset -= temp;
            this.monCyl += 12
        }
        if (offset < 0) {
            offset += temp;
            i--;
            this.monCyl -= 12
        }
        this.year = i;
        this.yearCyl = i - 1864;
        leap = leapMonth(i);
        this.isLeap = false;
        for (i = 1; i < 13 && offset > 0; i++) {
            if (leap > 0 && i == (leap + 1) && this.isLeap == false) {--i;
                this.isLeap = true;
                temp = leapDays(this.year)
            } else {
                temp = monthDays(this.year, i)
            }
            if (this.isLeap == true && i == (leap + 1)) {
                this.isLeap = false
            }
            offset -= temp;
            if (this.isLeap == false) {
                this.monCyl++
            }
        }
        if (offset == 0 && leap > 0 && i == leap + 1) {
            if (this.isLeap) {
                this.isLeap = false
            } else {
                this.isLeap = true; --i; --this.monCyl
            }
        }
        if (offset < 0) {
            offset += temp; --i; --this.monCyl
        }
        this.month = i;
        this.day = offset + 1
    }
    function cDay(m, d) {
        var nStr1 = ["日", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"];
        var nStr2 = ["初", "十", "廿", "卅"];
        var s;
        if (m > 10) {
            s = "十" + nStr1[m - 10]
        } else {
            s = nStr1[m]
        }
        if (s == "一") {
            s = "正"
        }
        s += "月";
        switch (d) {
        case 10:
            s += "初十";
            break;
        case 20:
            s += "二十";
            break;
        case 30:
            s += "三十";
            break;
        default:
            s += nStr2[Math.floor(d / 10)];
            s += nStr1[parseInt(d % 10)]
        }
        return (s)
    }
    function solarDay2() {
        var lDObj = new Lunar(new Date(SY, SM, SD));
        var tt = cDay(lDObj.month, lDObj.day);
        return (tt)
    }
    function showToday() {
        var weekStr = "日一二三四五六";
        var template = '<a href="http://www.baidu.com/s?wd=%C8%D5%C0%FA" rel="nr" title="点击查看万年历">#{MM}月#{DD}日&nbsp;&nbsp;&nbsp;星期#{week} </a>';
        var day = format(template, {
            YY: SY,
            MM: SM + 1,
            DD: SD,
            week: weekStr.charAt(now.getDay())
        });
        return day
    }
    function showdate() {
        SD = SD + 1;
        var m = SM < 9 ? ("0" + (SM + 1)) : SM + 1;
        var d = SD + 1 < 10 ? ("0" + SD) : SD;
        return (SY + "-" + m + "-" + d)
    }
    function cncal() {
        var cacal = '<a href="http://www.baidu.com/s?wd=%C8%D5%C0%FA" rel="nr" title="点击查看万年历">农历 ' + solarDay2() + "</a>";
        return cacal
    }
    return {
        day: showToday,
        cnday: cncal,
        date: showdate
    }
})();
var pngfix = function(img) {
    if (window.XMLHttpRequest) {
        return
    }
    if (Browser.isIE == "6.0") {
        var imgStyle = "display:inline-block; " + img.style.cssText;
        var strNewHTML = '<span class="' + img.className + '" title="' + img.title + '" style="width:' + img.clientWidth + "px; height:" + img.clientHeight + "px;" + imgStyle + ";" + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + img.src + "', sizingMethod='scale');\"></span>";
        img.outerHTML = strNewHTML
    }
};
var _hmt = _hmt || [];
function seriesLoadScripts(scripts, callback) {
    if (typeof(scripts) != "object") {
        var scripts = [scripts]
    }
    var HEAD = document.getElementsByTagName("head").item(0) || document.documentElement;
    var s = new Array(),
    last = scripts.length - 1,
    recursiveLoad = function(i) {
        s[i] = document.createElement("script");
        s[i].setAttribute("type", "text/javascript");
        s[i].onload = s[i].onreadystatechange = function() {
            if (!
            /*@cc_on!@*/
            0 || this.readyState == "loaded" || this.readyState == "complete") {
                this.onload = this.onreadystatechange = null;
                this.parentNode.removeChild(this);
                if (i != last) {
                    recursiveLoad(i + 1)
                } else {
                    if (typeof(callback) == "function") {
                        callback()
                    }
                }
            }
        };
        s[i].setAttribute("src", scripts[i]);
        HEAD.appendChild(s[i])
    };
    recursiveLoad(0)
} (function() {
    window.YLMF = window.YLMF || {};
    YLMF.namespace = function(c) {
        if (!c || !c.length) {
            return null
        }
        var d = c.split(".");
        var b = YLMF;
        for (var a = (d[0] == "YLMF") ? 1 : 0; a < d.length; ++a) {
            b[d[a]] = b[d[a]] || {};
            b = b[d[a]]
        }
        return b
    };
    YLMF.extend = function(a, c) {
        var b = function() {};
        b.prototype = c.prototype;
        a.prototype = new b();
        a.prototype.constructor = a;
        a.superclass = c.prototype;
        if (c.prototype.constructor == Object.prototype.constructor) {
            c.prototype.constructor = c
        }
    };
    YLMF._extend = function(destination, source) {
        for (var property in source) {
            destination[property] = source[property]
        }
        return destination
    };
    YLMF.isArray = function(obj) {
        return Object.prototype.toString.call(obj) === "[object Array]"
    };
    YLMF.isObject = function(a) {
        return !! a && Object.prototype.toString.call(a) === "[object Object]"
    };
    YLMF.each = function(objArray, funName) {
        if (YLMF.isArray(objArray)) {
            var l = objArray.length;
            for (var i = 0; i < l; i++) {
                funName(i, objArray[i])
            }
        }
    };
    YLMF._extend(YLMF, {
        ajax: function(b, a, f) {
            var c = (YLMF.xhrs = YLMF.xhrs || {});
            f.dataType = f.dataType || "html";
            if (b) {
                try {
                    c[b] && c[b].abort()
                } catch(d) {}
                c[b] = $.ajax(a, f)
            } else {
                $.ajax(a, f)
            }
        },
        deferTimmer: {},
        defer: function(b, a, e, d, c) {
            e = e || 500;
            d = d || window;
            c = c || [];
            if (b) {
                this.cancelDefer(b);
                this.deferTimmer[b] = window.setTimeout(function() {
                    a.apply(d, c)
                },
                e)
            } else {
                window.setTimeout(function() {
                    a.apply(d, c)
                },
                e)
            }
        },
        cancelDefer: function(a) {
            window.clearTimeout(this.deferTimmer[a])
        },
        getEvent: function(b) {
            var a = b || window.event;
            if (!a) {
                var d = this.getEvent.caller;
                while (d) {
                    a = d.arguments[0];
                    if (a && (Event == a.constructor || MouseEvent == a.constructor)) {
                        break
                    }
                    d = d.caller
                }
            }
            return a
        },
        getEventTarget: function(a) {
            a = a || window.event;
            return a.target || a.srcElement
        },
        some: function(b, c) {
            if (b.some) {
                return b.some(c)
            }
            var a = b.length;
            if (typeof c != "function") {
                throw new TypeError()
            }
            for (var d = 0; d < a; d++) {
                if (d in b && c.call(c, b[d], d, b)) {
                    return true
                }
            }
            return false
        },
        getImg: function(c) {
            var a = new Image();
            this.img = a;
            var b = navigator.appName.toLowerCase();
            if (b.indexOf("netscape") == -1) {
                a.onreadystatechange = function() {
                    if (a.readyState == "complete") {
                        c(a)
                    }
                }
            } else {
                a.onload = function() {
                    if (a.complete == true) {
                        c(a)
                    }
                }
            }
        },
        imgResize: function(c, b, a) {
            if ($.browser.msie && $.browser.version == "6.0") {
                if (c.width == 0) {
                    return
                }
                if ((c.width / c.height) > (b / a)) {
                    c.width = b
                } else {
                    c.height = a
                }
            }
        }
    });
    YLMF.getImg.prototype.get = function(a) {
        this.img.src = a
    };
    YLMF.namespace("Observable");
    YLMF._extend(YLMF.Observable, {
        addEvents: function(a) {
            if (YLMF.isObject(a)) {
                for (var c in a) {
                    this.addEvents(c)
                }
            } else {
                if (typeof a == "string") {
                    this.addEvent(a)
                } else {
                    if (YLMF.isArray(a)) {
                        for (var b = 0; b < a.length; b++) {
                            this.addEvent(a[b])
                        }
                    }
                }
            }
        },
        addEvent: function(a) {
            if (typeof a == "string") {
                this.events = this.events || {};
                this.events[a] = []
            }
        },
        fireEvents: function(c, a) {
            this.fireEvent(c, a)
        },
        fireEvent: function(c, a) {
            if (typeof c == "string") {
                var b = Array.prototype.slice.call(arguments);
                this.events && YLMF.each(this.events[c],
                function(d, e) {
                    e.apply(a || this, b.slice(2) || [])
                })
            }
        },
        addListener: function(b, c) {
            if (YLMF.isObject(b)) {
                for (var a in b) {
                    this.events && this.events[a].push(b[a])
                }
            } else {
                if (typeof b == "string") {
                    this.events && this.events[b].push(c)
                }
            }
        },
        removeEvents: function(a) {
            if (YLMF.isObject(a)) {
                for (var b in a) {
                    this.removeEvents(b)
                }
            } else {
                if (typeof a == "STRING") {
                    this.events = this.events || {};
                    delete this.events[a]
                }
            }
        },
        removeListener: function(b) {
            for (var a in b) {
                this.events && (this.events[a] = $.grep(this.events[a],
                function(d, c) {
                    return d != b[a]
                }))
            }
        },
        on: function(b, c) {
            this.addListener(b, c)
        }
    })
})();
function Animate(el, prop, opts) {
    this.el = el;
    this.prop = prop;
    this.from = opts.from;
    this.to = opts.to;
    this.time = opts.time;
    this.callback = opts.callback;
    this.animDiff = this.to - this.from;
    this.fps = 1000 / 8
}
Animate.prototype._setStyle = function(val) {
    switch (this.prop) {
    case "opacity":
        this.el.style[this.prop] = val;
        this.el.style.filter = "alpha(opacity=" + val * 100 + ")";
        break;
    case "scrollTop":
        if (this.el == window) {
            var _left = document.documentElement.scrollLeft || document.body.scrollLeft;
            this.el.scrollTo(_left, val)
        }
        break;
    default:
		
        this.el.style[this.prop] = val + "px";
        break
    }
};
Animate.prototype._animate = function() {
    var that = this;
    this.now = new Date();
    this.diff = this.now - this.startTime;
    if (this.diff > this.time) {
        this._setStyle(this.to);
        if (this.callback) {
            this.callback.call(this)
        }
        clearInterval(this.timer);
        return
    }
    this.percentage = (Math.floor((this.diff / this.time) * 1000000) / 1000000);
    this.val = (this.animDiff * this.percentage) + this.from;
    this._setStyle(this.val)
};
Animate.prototype.start = function() {
    var that = this;
    this.startTime = new Date();
    this.timer = setInterval(function() {
        that._animate.call(that)
    },
    8)
};
Animate.prototype.stop = function() {
    var that = this;
    window.clearInterval(this.timer)
};
Animate.canTransition = function() {
    var el = document.createElement("foo");
    el.style.cssText = "-webkit-transition: all .5s linear;";
    return !! el.style.webkitTransitionProperty
} ();
function Shake(el, prop, opts) {
    Animate.call(this, el, prop, opts);
    this.shakeTime = opts.shakeTime || 2;
    this.amplitude = opts.amplitude || 100;
    this.starPeriod = Math.asin(this.animDiff / (Math.abs(this.amplitude) + Math.abs(this.animDiff)))
}
YLMF.extend(Shake, Animate);
Shake.prototype._animate = function() {
    var that = this;
    this.now = new Date();
    this.diff = this.now - this.startTime;
    if (this.diff > this.time) {
        this._setStyle(this.to);
        if (this.callback) {
            this.callback.call(this)
        }
        clearInterval(this.timer);
        return
    }
    var timePercentage = Math.round((this.diff / this.time) * 100000000) / 100000000;
    this.percentage = Math.sin((this.shakeTime * Math.PI * 2 - this.starPeriod) * timePercentage + this.starPeriod);
    this.val = ((this.amplitude - this.animDiff) * this.percentage * (1 - timePercentage)) + this.to;
    this._setStyle(this.val)
};
String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.substring(1).toLowerCase()
};
Array.prototype.contains = function(A) {
    return (this.indexOf(A) >= 0)
};
String.prototype.camelize = function() {
    return this.replace(/\-(\w)/ig,
    function(B, A) {
        return A.toUpperCase()
    })
};
var css = {
    getStyle: function(elem, styles) {
        var value;
        if (styles == "float") {
            document.defaultView ? styles = "float": styles = "styleFloat"
        }
        value = elem.style[styles] || elem.style[styles.camelize()];
        if (!value) {
            if (document.defaultView && document.defaultView.getComputedStyle) {
                var _css = document.defaultView.getComputedStyle(elem, null);
                value = _css ? _css.getPropertyValue(styles) : null
            } else {
                if (elem.currentStyle) {
                    value = elem.currentStyle[styles.camelize()]
                }
            }
        }
        if (value == "auto" && ["width", "height"].contains(styles) && elem.style.display != "none") {
            value = elem["offset" + styles.capitalize()] + "px"
        }
        if (styles == "opacity") {
            try {
                value = elem.filters["DXImageTransform.Microsoft.Alpha"].opacity;
                value = value / 100
            } catch(e) {
                try {
                    value = elem.filters("alpha").opacity
                } catch(err) {}
            }
        }
        return value == "auto" ? null: value
    }
}; (function($) {
    function switchable(tigger, panel, op) {
        var me = this,
        _tigger = $(tigger),
        _panel = $(panel),
        i = 0,
        l = _tigger.size() - 1,
        _op = YLMF._extend({
            triggers: "a",
            currentCls: "current",
            initIndex: 0,
            triggerType: "mouse",
            delay: 0.1,
            effect: "default",
            steps: 1,
            visible: 1,
            speed: 0.7,
            easing: "swing",
            circular: false,
            vertical: false,
            panelSwitch: false,
            beforeSwitch: null,
            onSwitch: null,
            api: false
        },
        op);
        this.addEvents("beforeSwitch");
        YLMF._extend(this, {
            getTigger: function() {
                return _tigger
            },
            getPanel: function() {
                return _panel
            },
            getOption: function() {
                return _op
            },
            getIndex: function() {
                return i
            },
            setIndex: function(index) {
                i = index
            },
            getLength: function() {
                return l
            }
        });
        if (_op.triggerType == "mouse") {
            var _hoverTimmer;
            _tigger.each(function(el, i) {
                $(el).hover(function() {
                    window.clearTimeout(_hoverTimmer);
                    _hoverTimmer = window.setTimeout(function() {
                        me.move(i)
                    },
                    200)
                },
                function() {
                    window.clearTimeout(_hoverTimmer)
                })
            })
        } else {
            _tigger.on("click",
            function(el) {
                var _i = _tigger.el.indexOf(el);
                me.move(_i)
            })
        }
    }
    YLMF._extend(switchable.prototype, YLMF.Observable);
    YLMF._extend(switchable.prototype, {
        move: function(index) {
            var _tigger = this.getTigger();
            _panel = this.getPanel(),
            _op = this.getOption(),
            me = this,
            _i = this.getIndex(),
            _l = this.getLength(),
            _index = index;
            if (_op.circular) {
                if (index < 0) {
                    _index = _l
                } else {
                    if (index > _l) {
                        _index = 0
                    }
                }
            } else {
                if (index < 0 || index > _l) {
                    return
                }
            }
            this.setIndex(_index);
            me.fireEvent("beforeSwitch", this, _index, _tigger, _panel, _op);
            _effects[_op.effect].call(this, _index,
            function() {
                me.fireEvent("afterSwitch", this, _index, _tigger, _panel, _op)
            });
            _tigger.removeClass(_op.currentCls);
            _tigger.eq(_index).addClass(_op.currentCls)
        },
        getSlidePanel: function(i) {
            var _op = this.getOption();
            return this.getPanel().slice(i * _op.steps, (i + 1) * _op.steps)
        },
        next: function() {
            this.move(this.getIndex() + 1)
        },
        prev: function() {
            this.move(this.getIndex() - 1)
        },
        beforeSwitch: function(fn) {
            this.on("beforeSwitch", fn)
        }
    });
    var _effects = {
        "default": function(a, e) {
            this.getPanels().hide();
            this.getSlidePanel(a).show();
            e.call()
        },
        "fade": function(a, e) {
            this.getPanel().hide();
            var _sp = this.getSlidePanel(a);
            _sp.setStyle("opacity", 0).show();
            new Animate(_sp.el, "opacity", {
                from: 0,
                to: 1,
                time: 500
            }).start();
            e.call();
            return
        }
    };
    window.switchable = switchable
})($);
try {
    document.execCommand("BackgroundImageCache", false, true)
} catch(e) {};