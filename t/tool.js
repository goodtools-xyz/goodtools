function whichTransitionEvent() {
    var e, t = document.createElement("fakeelement"),
        n = {
            transition: "transitionend",
            OTransition: "oTransitionEnd",
            MozTransition: "transitionend",
            WebkitTransition: "webkitTransitionEnd"
        };
    for (e in n)
        if (void 0 !== t.style[e]) return n[e]
}
if (function() {
        var e, t, n, o, i, r, s, a, l, c, d, u, p, f, h, m, g, v, y, w, b, _, x, C, k, T, S, $, E, N, R, A, D, O, j, I, P, L, H, F, M, z, W, q, B, U, Q, V, X, Y, G, K = [].indexOf || function(e) {
                for (var t = 0, n = this.length; n > t; t++)
                    if (t in this && this[t] === e) return t;
                return -1
            },
            J = function(e, t) {
                function n() {
                    this.constructor = e
                }
                for (var o in t) Z.call(t, o) && (e[o] = t[o]);
                return n.prototype = t.prototype, e.prototype = new n, e.__super__ = t.prototype, e
            },
            Z = {}.hasOwnProperty,
            ee = [].slice;
        N = {}, u = 10, Q = !1, m = null, $ = null, P = null, h = null, G = null, w = function(e) {
            var t;
            return e = new n(e), z(), d(), L(e), Q && (t = V(e.absolute)) ? (b(t), _(e)) : _(e, B)
        }, V = function(e) {
            var t;
            return t = N[e], t && !t.transitionCacheDisabled ? t : void 0
        }, g = function(e) {
            return null == e && (e = !0), Q = e
        }, _ = function(e, t) {
            return null == t && (t = function(e) {
                return function() {}
            }(this)), X("page:fetch", {
                url: e.absolute
            }), null != G && G.abort(), G = new XMLHttpRequest, G.open("GET", e.withoutHashForIE10compatibility(), !0), G.setRequestHeader("Accept", "text/html, application/xhtml+xml, application/xml"), G.setRequestHeader("X-XHR-Referer", P), G.onload = function() {
                var n;
                return X("page:receive"), (n = O()) ? (p.apply(null, y(n)), E(), H(), t(), X("page:load")) : document.location.href = e.absolute
            }, G.onloadend = function() {
                return G = null
            }, G.onerror = function() {
                return document.location.href = e.absolute
            }, G.send()
        }, b = function(e) {
            return null != G && G.abort(), p(e.title, e.body), j(e), X("page:restore")
        }, d = function() {
            var e;
            return e = new n(m.url), N[e.absolute] = {
                url: e.relative,
                body: document.body,
                title: document.title,
                positionY: window.pageYOffset,
                positionX: window.pageXOffset,
                cachedAt: (new Date).getTime(),
                transitionCacheDisabled: null != document.querySelector("[data-no-transition-cache]")
            }, f(u)
        }, A = function(e) {
            return null == e && (e = u), /^[\d]+$/.test(e) ? u = parseInt(e) : void 0
        }, f = function(e) {
            var t, n, o, i, r, s;
            for (r = Object.keys(N), t = r.map(function(e) {
                    return N[e].cachedAt
                }).sort(function(e, t) {
                    return t - e
                }), s = [], n = 0, i = r.length; i > n; n++) o = r[n], N[o].cachedAt <= t[e] && (X("page:expire", N[o]), s.push(delete N[o]));
            return s
        }, p = function(t, n, o, i) {
            return document.title = t, document.documentElement.replaceChild(n, document.body), null != o && e.update(o), U(), i && v(), m = window.history.state, X("page:change"), X("page:update")
        }, v = function() {
            var e, t, n, o, i, r, s, a, l, c, d, u;
            for (u = Array.prototype.slice.call(document.body.querySelectorAll('script:not([data-turbolinks-eval="false"])')), n = 0, i = u.length; i > n; n++)
                if (d = u[n], "" === (l = d.type) || "text/javascript" === l) {
                    for (t = document.createElement("script"), c = d.attributes, o = 0, r = c.length; r > o; o++) e = c[o], t.setAttribute(e.name, e.value);
                    t.appendChild(document.createTextNode(d.innerHTML)), a = d.parentNode, s = d.nextSibling, a.removeChild(d), a.insertBefore(t, s)
                }
        }, W = function(e) {
            return e.innerHTML = e.innerHTML.replace(/<noscript[\S\s]*?<\/noscript>/gi, ""), e
        }, U = function() {
            var e, t;
            return e = (t = document.querySelectorAll("input[autofocus], textarea[autofocus]"))[t.length - 1], e && document.activeElement !== e ? e.focus() : void 0
        }, L = function(e) {
            return (e = new n(e)).absolute !== P ? window.history.pushState({
                turbolinks: !0,
                url: e.absolute
            }, "", e.absolute) : void 0
        }, H = function() {
            var e, t;
            return (e = G.getResponseHeader("X-XHR-Redirected-To")) ? (e = new n(e), t = e.hasNoHash() ? document.location.hash : "", window.history.replaceState(m, "", e.href + t)) : void 0
        }, z = function() {
            return P = document.location.href
        }, M = function() {
            return window.history.replaceState({
                turbolinks: !0,
                url: document.location.href
            }, "", document.location.href)
        }, F = function() {
            return m = window.history.state
        }, E = function() {
            var e;
            return navigator.userAgent.match(/Firefox/) && !(e = new n).hasNoHash() ? (window.history.replaceState(m, "", e.withoutHash()), document.location.hash = e.hash) : void 0
        }, j = function(e) {
            return window.scrollTo(e.positionX, e.positionY)
        }, B = function() {
            return document.location.hash ? document.location.href = document.location.href : window.scrollTo(0, 0)
        }, D = function(e) {
            var t, n;
            return n = (null != (t = document.cookie.match(new RegExp(e + "=(\\w+)"))) ? t[1].toUpperCase() : void 0) || "", document.cookie = e + "=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/", n
        }, X = function(e, t) {
            var n;
            return n = document.createEvent("Events"), t && (n.data = t), n.initEvent(e, !0, !0), document.dispatchEvent(n)
        }, R = function() {
            return !X("page:before-change")
        }, O = function() {
            var e, t, n, o, i, r;
            return t = function() {
                var e;
                return 400 <= (e = G.status) && 600 > e
            }, r = function() {
                return G.getResponseHeader("Content-Type").match(/^(?:text\/html|application\/xhtml\+xml|application\/xml)(?:;|$)/)
            }, o = function(e) {
                var t, n, o, i, r;
                for (i = e.head.childNodes, r = [], t = 0, n = i.length; n > t; t++) o = i[t], null != ("function" == typeof o.getAttribute ? o.getAttribute("data-turbolinks-track") : void 0) && r.push(o.getAttribute("src") || o.getAttribute("href"));
                return r
            }, e = function(e) {
                var t;
                return $ || ($ = o(document)), t = o(e), t.length !== $.length || i(t, $).length !== $.length
            }, i = function(e, t) {
                var n, o, i, r, s;
                for (e.length > t.length && (i = [t, e], e = i[0], t = i[1]), r = [], n = 0, o = e.length; o > n; n++) s = e[n], K.call(t, s) >= 0 && r.push(s);
                return r
            }, !t() && r() && (n = h(G.responseText), n && !e(n)) ? n : void 0
        }, y = function(t) {
            var n;
            return n = t.querySelector("title"), [null != n ? n.textContent : void 0, W(t.body), e.get(t).token, "runScripts"]
        }, e = {
            get: function(e) {
                var t;
                return null == e && (e = document), {
                    node: t = e.querySelector('meta[name="csrf-token"]'),
                    token: null != t && "function" == typeof t.getAttribute ? t.getAttribute("content") : void 0
                }
            },
            update: function(e) {
                var t;
                return t = this.get(), null != t.token && null != e && t.token !== e ? t.node.setAttribute("content", e) : void 0
            }
        }, i = function() {
            var e, t, n, o, i, r, s;
            t = function(e) {
                return (new DOMParser).parseFromString(e, "text/html")
            }, e = function(e) {
                var t;
                return t = document.implementation.createHTMLDocument(""), t.documentElement.innerHTML = e, t
            }, n = function(e) {
                var t;
                return t = document.implementation.createHTMLDocument(""), t.open("replace"), t.write(e), t.close(), t
            };
            try {
                if (window.DOMParser) return s = t("<html><body><p>test"), t
            } catch (i) {
                return o = i, s = e("<html><body><p>test"), e
            } finally {
                if (1 !== (null != s && null != (r = s.body) ? r.childNodes.length : void 0)) return n
            }
        }, n = function() {
            function e(t) {
                return this.original = null != t ? t : document.location.href, this.original.constructor === e ? this.original : void this._parse()
            }
            return e.prototype.withoutHash = function() {
                return this.href.replace(this.hash, "")
            }, e.prototype.withoutHashForIE10compatibility = function() {
                return this.withoutHash()
            }, e.prototype.hasNoHash = function() {
                return 0 === this.hash.length
            }, e.prototype._parse = function() {
                var e;
                return (null != this.link ? this.link : this.link = document.createElement("a")).href = this.original, e = this.link, this.href = e.href, this.protocol = e.protocol, this.host = e.host, this.hostname = e.hostname, this.port = e.port, this.pathname = e.pathname, this.search = e.search, this.hash = e.hash, this.origin = [this.protocol, "//", this.hostname].join(""), 0 !== this.port.length && (this.origin += ":" + this.port), this.relative = [this.pathname, this.search, this.hash].join(""), this.absolute = this.href
            }, e
        }(), o = function(e) {
            function t(e) {
                return this.link = e, this.link.constructor === t ? this.link : (this.original = this.link.href, void t.__super__.constructor.apply(this, arguments))
            }
            return J(t, e), t.HTML_EXTENSIONS = ["html"], t.allowExtensions = function() {
                var e, n, o, i;
                for (n = 1 <= arguments.length ? ee.call(arguments, 0) : [], o = 0, i = n.length; i > o; o++) e = n[o], t.HTML_EXTENSIONS.push(e);
                return t.HTML_EXTENSIONS
            }, t.prototype.shouldIgnore = function() {
                return this._crossOrigin() || this._anchored() || this._nonHtml() || this._optOut() || this._target()
            }, t.prototype._crossOrigin = function() {
                return this.origin !== (new n).origin
            }, t.prototype._anchored = function() {
                var e;
                return (this.hash && this.withoutHash()) === (e = new n).withoutHash() || this.href === e.href + "#"
            }, t.prototype._nonHtml = function() {
                return this.pathname.match(/\.[a-z]+$/g) && !this.pathname.match(new RegExp("\\.(?:" + t.HTML_EXTENSIONS.join("|") + ")?$", "g"))
            }, t.prototype._optOut = function() {
                var e, t;
                for (t = this.link; !e && t !== document;) e = null != t.getAttribute("data-no-turbolink"), t = t.parentNode;
                return e
            }, t.prototype._target = function() {
                return 0 !== this.link.target.length
            }, t
        }(n), t = function() {
            function e(e) {
                this.event = e, this.event.defaultPrevented || (this._extractLink(), this._validForTurbolinks() && (R() || Y(this.link.href), this.event.preventDefault()))
            }
            return e.installHandlerLast = function(t) {
                return t.defaultPrevented ? void 0 : (document.removeEventListener("click", e.handle, !1), document.addEventListener("click", e.handle, !1))
            }, e.handle = function(t) {
                return new e(t)
            }, e.prototype._extractLink = function() {
                var e;
                for (e = this.event.target; e.parentNode && "A" !== e.nodeName;) e = e.parentNode;
                return "A" === e.nodeName && 0 !== e.href.length ? this.link = new o(e) : void 0
            }, e.prototype._validForTurbolinks = function() {
                return null != this.link && !(this.link.shouldIgnore() || this._nonStandardClick())
            }, e.prototype._nonStandardClick = function() {
                return this.event.which > 1 || this.event.metaKey || this.event.ctrlKey || this.event.shiftKey || this.event.altKey
            }, e
        }(), c = function(e) {
            return setTimeout(e, 500)
        }, k = function() {
            return document.addEventListener("DOMContentLoaded", function() {
                return X("page:change"), X("page:update")
            }, !0)
        }, S = function() {
            return "undefined" != typeof jQuery ? jQuery(document).on("ajaxSuccess", function(e, t, n) {
                return jQuery.trim(t.responseText) ? X("page:update") : void 0
            }) : void 0
        }, T = function(e) {
            var t, o;
            return (null != (o = e.state) ? o.turbolinks : void 0) ? (t = N[new n(e.state.url).absolute]) ? (d(), b(t)) : Y(e.target.location.href) : void 0
        }, C = function() {
            return M(), F(), h = i(), document.addEventListener("click", t.installHandlerLast, !0), window.addEventListener("hashchange", function(e) {
                return M(), F()
            }, !1), c(function() {
                return window.addEventListener("popstate", T, !1)
            })
        }, x = void 0 !== window.history.state || navigator.userAgent.match(/Firefox\/2[6|7]/), a = window.history && window.history.pushState && window.history.replaceState && x, r = !navigator.userAgent.match(/CriOS\//), q = "GET" === (I = D("request_method")) || "" === I, l = a && r && q, s = document.addEventListener && document.createEvent, s && (k(), S()), l ? (Y = w, C()) : Y = function(e) {
            return document.location.href = e
        }, this.Turbolinks = {
            visit: Y,
            pagesCached: A,
            enableTransitionCache: g,
            allowLinkExtensions: o.allowExtensions,
            supported: l
        }
    }.call(this), function(e, t) {
        "object" == typeof module && "object" == typeof module.exports ? module.exports = e.document ? t(e, !0) : function(e) {
            if (!e.document) throw new Error("jQuery requires a window with a document");
            return t(e)
        } : t(e)
    }("undefined" != typeof window ? window : this, function(e, t) {
        function n(e) {
            var t = "length" in e && e.length,
                n = Z.type(e);
            return "function" === n || Z.isWindow(e) ? !1 : 1 === e.nodeType && t ? !0 : "array" === n || 0 === t || "number" == typeof t && t > 0 && t - 1 in e
        }

        function o(e, t, n) {
            if (Z.isFunction(t)) return Z.grep(e, function(e, o) {
                return !!t.call(e, o, e) !== n
            });
            if (t.nodeType) return Z.grep(e, function(e) {
                return e === t !== n
            });
            if ("string" == typeof t) {
                if (ae.test(t)) return Z.filter(t, e, n);
                t = Z.filter(t, e)
            }
            return Z.grep(e, function(e) {
                return Q.call(t, e) >= 0 !== n
            })
        }

        function i(e, t) {
            for (;
                (e = e[t]) && 1 !== e.nodeType;);
            return e
        }

        function r(e) {
            var t = he[e] = {};
            return Z.each(e.match(fe) || [], function(e, n) {
                t[n] = !0
            }), t
        }

        function s() {
            K.removeEventListener("DOMContentLoaded", s, !1), e.removeEventListener("load", s, !1), Z.ready()
        }

        function a() {
            Object.defineProperty(this.cache = {}, 0, {
                get: function() {
                    return {}
                }
            }), this.expando = Z.expando + a.uid++
        }

        function l(e, t, n) {
            var o;
            if (void 0 === n && 1 === e.nodeType)
                if (o = "data-" + t.replace(be, "-$1").toLowerCase(), n = e.getAttribute(o), "string" == typeof n) {
                    try {
                        n = "true" === n ? !0 : "false" === n ? !1 : "null" === n ? null : +n + "" === n ? +n : we.test(n) ? Z.parseJSON(n) : n
                    } catch (i) {}
                    ye.set(e, t, n)
                } else n = void 0;
            return n
        }

        function c() {
            return !0
        }

        function d() {
            return !1
        }

        function u() {
            try {
                return K.activeElement
            } catch (e) {}
        }

        function p(e, t) {
            return Z.nodeName(e, "table") && Z.nodeName(11 !== t.nodeType ? t : t.firstChild, "tr") ? e.getElementsByTagName("tbody")[0] || e.appendChild(e.ownerDocument.createElement("tbody")) : e
        }

        function f(e) {
            return e.type = (null !== e.getAttribute("type")) + "/" + e.type, e
        }

        function h(e) {
            var t = Pe.exec(e.type);
            return t ? e.type = t[1] : e.removeAttribute("type"), e
        }

        function m(e, t) {
            for (var n = 0, o = e.length; o > n; n++) ve.set(e[n], "globalEval", !t || ve.get(t[n], "globalEval"))
        }

        function g(e, t) {
            var n, o, i, r, s, a, l, c;
            if (1 === t.nodeType) {
                if (ve.hasData(e) && (r = ve.access(e), s = ve.set(t, r), c = r.events)) {
                    delete s.handle, s.events = {};
                    for (i in c)
                        for (n = 0, o = c[i].length; o > n; n++) Z.event.add(t, i, c[i][n])
                }
                ye.hasData(e) && (a = ye.access(e), l = Z.extend({}, a), ye.set(t, l))
            }
        }

        function v(e, t) {
            var n = e.getElementsByTagName ? e.getElementsByTagName(t || "*") : e.querySelectorAll ? e.querySelectorAll(t || "*") : [];
            return void 0 === t || t && Z.nodeName(e, t) ? Z.merge([e], n) : n
        }

        function y(e, t) {
            var n = t.nodeName.toLowerCase();
            "input" === n && ke.test(e.type) ? t.checked = e.checked : ("input" === n || "textarea" === n) && (t.defaultValue = e.defaultValue)
        }

        function w(t, n) {
            var o, i = Z(n.createElement(t)).appendTo(n.body),
                r = e.getDefaultComputedStyle && (o = e.getDefaultComputedStyle(i[0])) ? o.display : Z.css(i[0], "display");
            return i.detach(), r
        }

        function b(e) {
            var t = K,
                n = Me[e];
            return n || (n = w(e, t), "none" !== n && n || (Fe = (Fe || Z("<iframe frameborder='0' width='0' height='0'/>")).appendTo(t.documentElement), t = Fe[0].contentDocument, t.write(), t.close(), n = w(e, t), Fe.detach()), Me[e] = n), n
        }

        function _(e, t, n) {
            var o, i, r, s, a = e.style;
            return n = n || qe(e), n && (s = n.getPropertyValue(t) || n[t]), n && ("" !== s || Z.contains(e.ownerDocument, e) || (s = Z.style(e, t)), We.test(s) && ze.test(t) && (o = a.width, i = a.minWidth, r = a.maxWidth, a.minWidth = a.maxWidth = a.width = s, s = n.width, a.width = o, a.minWidth = i, a.maxWidth = r)), void 0 !== s ? s + "" : s
        }

        function x(e, t) {
            return {
                get: function() {
                    return e() ? void delete this.get : (this.get = t).apply(this, arguments)
                }
            }
        }

        function C(e, t) {
            if (t in e) return t;
            for (var n = t[0].toUpperCase() + t.slice(1), o = t, i = Ye.length; i--;)
                if (t = Ye[i] + n, t in e) return t;
            return o
        }

        function k(e, t, n) {
            var o = Ue.exec(t);
            return o ? Math.max(0, o[1] - (n || 0)) + (o[2] || "px") : t
        }

        function T(e, t, n, o, i) {
            for (var r = n === (o ? "border" : "content") ? 4 : "width" === t ? 1 : 0, s = 0; 4 > r; r += 2) "margin" === n && (s += Z.css(e, n + xe[r], !0, i)), o ? ("content" === n && (s -= Z.css(e, "padding" + xe[r], !0, i)), "margin" !== n && (s -= Z.css(e, "border" + xe[r] + "Width", !0, i))) : (s += Z.css(e, "padding" + xe[r], !0, i), "padding" !== n && (s += Z.css(e, "border" + xe[r] + "Width", !0, i)));
            return s
        }

        function S(e, t, n) {
            var o = !0,
                i = "width" === t ? e.offsetWidth : e.offsetHeight,
                r = qe(e),
                s = "border-box" === Z.css(e, "boxSizing", !1, r);
            if (0 >= i || null == i) {
                if (i = _(e, t, r), (0 > i || null == i) && (i = e.style[t]), We.test(i)) return i;
                o = s && (G.boxSizingReliable() || i === e.style[t]), i = parseFloat(i) || 0
            }
            return i + T(e, t, n || (s ? "border" : "content"), o, r) + "px"
        }

        function $(e, t) {
            for (var n, o, i, r = [], s = 0, a = e.length; a > s; s++) o = e[s], o.style && (r[s] = ve.get(o, "olddisplay"), n = o.style.display, t ? (r[s] || "none" !== n || (o.style.display = ""), "" === o.style.display && Ce(o) && (r[s] = ve.access(o, "olddisplay", b(o.nodeName)))) : (i = Ce(o), "none" === n && i || ve.set(o, "olddisplay", i ? n : Z.css(o, "display"))));
            for (s = 0; a > s; s++) o = e[s], o.style && (t && "none" !== o.style.display && "" !== o.style.display || (o.style.display = t ? r[s] || "" : "none"));
            return e
        }

        function E(e, t, n, o, i) {
            return new E.prototype.init(e, t, n, o, i)
        }

        function N() {
            return setTimeout(function() {
                Ge = void 0
            }), Ge = Z.now()
        }

        function R(e, t) {
            var n, o = 0,
                i = {
                    height: e
                };
            for (t = t ? 1 : 0; 4 > o; o += 2 - t) n = xe[o], i["margin" + n] = i["padding" + n] = e;
            return t && (i.opacity = i.width = e), i
        }

        function A(e, t, n) {
            for (var o, i = (nt[t] || []).concat(nt["*"]), r = 0, s = i.length; s > r; r++)
                if (o = i[r].call(n, t, e)) return o
        }

        function D(e, t, n) {
            var o, i, r, s, a, l, c, d, u = this,
                p = {},
                f = e.style,
                h = e.nodeType && Ce(e),
                m = ve.get(e, "fxshow");
            n.queue || (a = Z._queueHooks(e, "fx"), null == a.unqueued && (a.unqueued = 0, l = a.empty.fire, a.empty.fire = function() {
                a.unqueued || l()
            }), a.unqueued++, u.always(function() {
                u.always(function() {
                    a.unqueued--, Z.queue(e, "fx").length || a.empty.fire()
                })
            })), 1 === e.nodeType && ("height" in t || "width" in t) && (n.overflow = [f.overflow, f.overflowX, f.overflowY], c = Z.css(e, "display"), d = "none" === c ? ve.get(e, "olddisplay") || b(e.nodeName) : c, "inline" === d && "none" === Z.css(e, "float") && (f.display = "inline-block")), n.overflow && (f.overflow = "hidden", u.always(function() {
                f.overflow = n.overflow[0], f.overflowX = n.overflow[1], f.overflowY = n.overflow[2]
            }));
            for (o in t)
                if (i = t[o], Je.exec(i)) {
                    if (delete t[o], r = r || "toggle" === i, i === (h ? "hide" : "show")) {
                        if ("show" !== i || !m || void 0 === m[o]) continue;
                        h = !0
                    }
                    p[o] = m && m[o] || Z.style(e, o)
                } else c = void 0;
            if (Z.isEmptyObject(p)) "inline" === ("none" === c ? b(e.nodeName) : c) && (f.display = c);
            else {
                m ? "hidden" in m && (h = m.hidden) : m = ve.access(e, "fxshow", {}), r && (m.hidden = !h), h ? Z(e).show() : u.done(function() {
                    Z(e).hide()
                }), u.done(function() {
                    var t;
                    ve.remove(e, "fxshow");
                    for (t in p) Z.style(e, t, p[t])
                });
                for (o in p) s = A(h ? m[o] : 0, o, u), o in m || (m[o] = s.start, h && (s.end = s.start, s.start = "width" === o || "height" === o ? 1 : 0))
            }
        }

        function O(e, t) {
            var n, o, i, r, s;
            for (n in e)
                if (o = Z.camelCase(n), i = t[o], r = e[n], Z.isArray(r) && (i = r[1], r = e[n] = r[0]), n !== o && (e[o] = r, delete e[n]), s = Z.cssHooks[o], s && "expand" in s) {
                    r = s.expand(r), delete e[o];
                    for (n in r) n in e || (e[n] = r[n], t[n] = i)
                } else t[o] = i
        }

        function j(e, t, n) {
            var o, i, r = 0,
                s = tt.length,
                a = Z.Deferred().always(function() {
                    delete l.elem
                }),
                l = function() {
                    if (i) return !1;
                    for (var t = Ge || N(), n = Math.max(0, c.startTime + c.duration - t), o = n / c.duration || 0, r = 1 - o, s = 0, l = c.tweens.length; l > s; s++) c.tweens[s].run(r);
                    return a.notifyWith(e, [c, r, n]), 1 > r && l ? n : (a.resolveWith(e, [c]), !1)
                },
                c = a.promise({
                    elem: e,
                    props: Z.extend({}, t),
                    opts: Z.extend(!0, {
                        specialEasing: {}
                    }, n),
                    originalProperties: t,
                    originalOptions: n,
                    startTime: Ge || N(),
                    duration: n.duration,
                    tweens: [],
                    createTween: function(t, n) {
                        var o = Z.Tween(e, c.opts, t, n, c.opts.specialEasing[t] || c.opts.easing);
                        return c.tweens.push(o), o
                    },
                    stop: function(t) {
                        var n = 0,
                            o = t ? c.tweens.length : 0;
                        if (i) return this;
                        for (i = !0; o > n; n++) c.tweens[n].run(1);
                        return t ? a.resolveWith(e, [c, t]) : a.rejectWith(e, [c, t]), this
                    }
                }),
                d = c.props;
            for (O(d, c.opts.specialEasing); s > r; r++)
                if (o = tt[r].call(c, e, d, c.opts)) return o;
            return Z.map(d, A, c), Z.isFunction(c.opts.start) && c.opts.start.call(e, c), Z.fx.timer(Z.extend(l, {
                elem: e,
                anim: c,
                queue: c.opts.queue
            })), c.progress(c.opts.progress).done(c.opts.done, c.opts.complete).fail(c.opts.fail).always(c.opts.always)
        }

        function I(e) {
            return function(t, n) {
                "string" != typeof t && (n = t, t = "*");
                var o, i = 0,
                    r = t.toLowerCase().match(fe) || [];
                if (Z.isFunction(n))
                    for (; o = r[i++];) "+" === o[0] ? (o = o.slice(1) || "*", (e[o] = e[o] || []).unshift(n)) : (e[o] = e[o] || []).push(n)
            }
        }

        function P(e, t, n, o) {
            function i(a) {
                var l;
                return r[a] = !0, Z.each(e[a] || [], function(e, a) {
                    var c = a(t, n, o);
                    return "string" != typeof c || s || r[c] ? s ? !(l = c) : void 0 : (t.dataTypes.unshift(c), i(c), !1)
                }), l
            }
            var r = {},
                s = e === wt;
            return i(t.dataTypes[0]) || !r["*"] && i("*")
        }

        function L(e, t) {
            var n, o, i = Z.ajaxSettings.flatOptions || {};
            for (n in t) void 0 !== t[n] && ((i[n] ? e : o || (o = {}))[n] = t[n]);
            return o && Z.extend(!0, e, o), e
        }

        function H(e, t, n) {
            for (var o, i, r, s, a = e.contents, l = e.dataTypes;
                "*" === l[0];) l.shift(), void 0 === o && (o = e.mimeType || t.getResponseHeader("Content-Type"));
            if (o)
                for (i in a)
                    if (a[i] && a[i].test(o)) {
                        l.unshift(i);
                        break
                    }
            if (l[0] in n) r = l[0];
            else {
                for (i in n) {
                    if (!l[0] || e.converters[i + " " + l[0]]) {
                        r = i;
                        break
                    }
                    s || (s = i)
                }
                r = r || s
            }
            return r ? (r !== l[0] && l.unshift(r), n[r]) : void 0
        }

        function F(e, t, n, o) {
            var i, r, s, a, l, c = {},
                d = e.dataTypes.slice();
            if (d[1])
                for (s in e.converters) c[s.toLowerCase()] = e.converters[s];
            for (r = d.shift(); r;)
                if (e.responseFields[r] && (n[e.responseFields[r]] = t), !l && o && e.dataFilter && (t = e.dataFilter(t, e.dataType)), l = r, r = d.shift())
                    if ("*" === r) r = l;
                    else if ("*" !== l && l !== r) {
                if (s = c[l + " " + r] || c["* " + r], !s)
                    for (i in c)
                        if (a = i.split(" "), a[1] === r && (s = c[l + " " + a[0]] || c["* " + a[0]])) {
                            s === !0 ? s = c[i] : c[i] !== !0 && (r = a[0], d.unshift(a[1]));
                            break
                        }
                if (s !== !0)
                    if (s && e["throws"]) t = s(t);
                    else try {
                        t = s(t)
                    } catch (u) {
                        return {
                            state: "parsererror",
                            error: s ? u : "No conversion from " + l + " to " + r
                        }
                    }
            }
            return {
                state: "success",
                data: t
            }
        }

        function M(e, t, n, o) {
            var i;
            if (Z.isArray(t)) Z.each(t, function(t, i) {
                n || kt.test(e) ? o(e, i) : M(e + "[" + ("object" == typeof i ? t : "") + "]", i, n, o)
            });
            else if (n || "object" !== Z.type(t)) o(e, t);
            else
                for (i in t) M(e + "[" + i + "]", t[i], n, o)
        }

        function z(e) {
            return Z.isWindow(e) ? e : 9 === e.nodeType && e.defaultView
        }
        var W = [],
            q = W.slice,
            B = W.concat,
            U = W.push,
            Q = W.indexOf,
            V = {},
            X = V.toString,
            Y = V.hasOwnProperty,
            G = {},
            K = e.document,
            J = "2.1.4",
            Z = function(e, t) {
                return new Z.fn.init(e, t)
            },
            ee = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
            te = /^-ms-/,
            ne = /-([\da-z])/gi,
            oe = function(e, t) {
                return t.toUpperCase()
            };
        Z.fn = Z.prototype = {
            jquery: J,
            constructor: Z,
            selector: "",
            length: 0,
            toArray: function() {
                return q.call(this)
            },
            get: function(e) {
                return null != e ? 0 > e ? this[e + this.length] : this[e] : q.call(this)
            },
            pushStack: function(e) {
                var t = Z.merge(this.constructor(), e);
                return t.prevObject = this, t.context = this.context, t
            },
            each: function(e, t) {
                return Z.each(this, e, t)
            },
            map: function(e) {
                return this.pushStack(Z.map(this, function(t, n) {
                    return e.call(t, n, t)
                }))
            },
            slice: function() {
                return this.pushStack(q.apply(this, arguments))
            },
            first: function() {
                return this.eq(0)
            },
            last: function() {
                return this.eq(-1)
            },
            eq: function(e) {
                var t = this.length,
                    n = +e + (0 > e ? t : 0);
                return this.pushStack(n >= 0 && t > n ? [this[n]] : [])
            },
            end: function() {
                return this.prevObject || this.constructor(null)
            },
            push: U,
            sort: W.sort,
            splice: W.splice
        }, Z.extend = Z.fn.extend = function() {
            var e, t, n, o, i, r, s = arguments[0] || {},
                a = 1,
                l = arguments.length,
                c = !1;
            for ("boolean" == typeof s && (c = s, s = arguments[a] || {}, a++), "object" == typeof s || Z.isFunction(s) || (s = {}), a === l && (s = this, a--); l > a; a++)
                if (null != (e = arguments[a]))
                    for (t in e) n = s[t], o = e[t], s !== o && (c && o && (Z.isPlainObject(o) || (i = Z.isArray(o))) ? (i ? (i = !1, r = n && Z.isArray(n) ? n : []) : r = n && Z.isPlainObject(n) ? n : {}, s[t] = Z.extend(c, r, o)) : void 0 !== o && (s[t] = o));
            return s
        }, Z.extend({
            expando: "jQuery" + (J + Math.random()).replace(/\D/g, ""),
            isReady: !0,
            error: function(e) {
                throw new Error(e)
            },
            noop: function() {},
            isFunction: function(e) {
                return "function" === Z.type(e)
            },
            isArray: Array.isArray,
            isWindow: function(e) {
                return null != e && e === e.window
            },
            isNumeric: function(e) {
                return !Z.isArray(e) && e - parseFloat(e) + 1 >= 0
            },
            isPlainObject: function(e) {
                return "object" !== Z.type(e) || e.nodeType || Z.isWindow(e) ? !1 : e.constructor && !Y.call(e.constructor.prototype, "isPrototypeOf") ? !1 : !0
            },
            isEmptyObject: function(e) {
                var t;
                for (t in e) return !1;
                return !0
            },
            type: function(e) {
                return null == e ? e + "" : "object" == typeof e || "function" == typeof e ? V[X.call(e)] || "object" : typeof e
            },
            globalEval: function(e) {
                var t, n = eval;
                e = Z.trim(e), e && (1 === e.indexOf("use strict") ? (t = K.createElement("script"), t.text = e, K.head.appendChild(t).parentNode.removeChild(t)) : n(e))
            },
            camelCase: function(e) {
                return e.replace(te, "ms-").replace(ne, oe)
            },
            nodeName: function(e, t) {
                return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
            },
            each: function(e, t, o) {
                var i, r = 0,
                    s = e.length,
                    a = n(e);
                if (o) {
                    if (a)
                        for (; s > r && (i = t.apply(e[r], o), i !== !1); r++);
                    else
                        for (r in e)
                            if (i = t.apply(e[r], o), i === !1) break
                } else if (a)
                    for (; s > r && (i = t.call(e[r], r, e[r]), i !== !1); r++);
                else
                    for (r in e)
                        if (i = t.call(e[r], r, e[r]), i === !1) break;
                return e
            },
            trim: function(e) {
                return null == e ? "" : (e + "").replace(ee, "")
            },
            makeArray: function(e, t) {
                var o = t || [];
                return null != e && (n(Object(e)) ? Z.merge(o, "string" == typeof e ? [e] : e) : U.call(o, e)), o
            },
            inArray: function(e, t, n) {
                return null == t ? -1 : Q.call(t, e, n)
            },
            merge: function(e, t) {
                for (var n = +t.length, o = 0, i = e.length; n > o; o++) e[i++] = t[o];
                return e.length = i, e
            },
            grep: function(e, t, n) {
                for (var o, i = [], r = 0, s = e.length, a = !n; s > r; r++) o = !t(e[r], r), o !== a && i.push(e[r]);
                return i
            },
            map: function(e, t, o) {
                var i, r = 0,
                    s = e.length,
                    a = n(e),
                    l = [];
                if (a)
                    for (; s > r; r++) i = t(e[r], r, o), null != i && l.push(i);
                else
                    for (r in e) i = t(e[r], r, o), null != i && l.push(i);
                return B.apply([], l)
            },
            guid: 1,
            proxy: function(e, t) {
                var n, o, i;
                return "string" == typeof t && (n = e[t], t = e, e = n), Z.isFunction(e) ? (o = q.call(arguments, 2), i = function() {
                    return e.apply(t || this, o.concat(q.call(arguments)))
                }, i.guid = e.guid = e.guid || Z.guid++, i) : void 0
            },
            now: Date.now,
            support: G
        }), Z.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(e, t) {
            V["[object " + t + "]"] = t.toLowerCase()
        });
        var ie = function(e) {
            function t(e, t, n, o) {
                var i, r, s, a, l, c, u, f, h, m;
                if ((t ? t.ownerDocument || t : M) !== D && A(t), t = t || D, n = n || [], a = t.nodeType, "string" != typeof e || !e || 1 !== a && 9 !== a && 11 !== a) return n;
                if (!o && j) {
                    if (11 !== a && (i = ye.exec(e)))
                        if (s = i[1]) {
                            if (9 === a) {
                                if (r = t.getElementById(s), !r || !r.parentNode) return n;
                                if (r.id === s) return n.push(r), n
                            } else if (t.ownerDocument && (r = t.ownerDocument.getElementById(s)) && H(t, r) && r.id === s) return n.push(r), n
                        } else {
                            if (i[2]) return J.apply(n, t.getElementsByTagName(e)), n;
                            if ((s = i[3]) && _.getElementsByClassName) return J.apply(n, t.getElementsByClassName(s)), n
                        }
                    if (_.qsa && (!I || !I.test(e))) {
                        if (f = u = F, h = t, m = 1 !== a && e, 1 === a && "object" !== t.nodeName.toLowerCase()) {
                            for (c = T(e), (u = t.getAttribute("id")) ? f = u.replace(be, "\\$&") : t.setAttribute("id", f), f = "[id='" + f + "'] ", l = c.length; l--;) c[l] = f + p(c[l]);
                            h = we.test(e) && d(t.parentNode) || t, m = c.join(",")
                        }
                        if (m) try {
                            return J.apply(n, h.querySelectorAll(m)), n
                        } catch (g) {} finally {
                            u || t.removeAttribute("id")
                        }
                    }
                }
                return $(e.replace(le, "$1"), t, n, o)
            }

            function n() {
                function e(n, o) {
                    return t.push(n + " ") > x.cacheLength && delete e[t.shift()], e[n + " "] = o
                }
                var t = [];
                return e
            }

            function o(e) {
                return e[F] = !0, e
            }

            function i(e) {
                var t = D.createElement("div");
                try {
                    return !!e(t)
                } catch (n) {
                    return !1
                } finally {
                    t.parentNode && t.parentNode.removeChild(t), t = null
                }
            }

            function r(e, t) {
                for (var n = e.split("|"), o = e.length; o--;) x.attrHandle[n[o]] = t
            }

            function s(e, t) {
                var n = t && e,
                    o = n && 1 === e.nodeType && 1 === t.nodeType && (~t.sourceIndex || V) - (~e.sourceIndex || V);
                if (o) return o;
                if (n)
                    for (; n = n.nextSibling;)
                        if (n === t) return -1;
                return e ? 1 : -1
            }

            function a(e) {
                return function(t) {
                    var n = t.nodeName.toLowerCase();
                    return "input" === n && t.type === e
                }
            }

            function l(e) {
                return function(t) {
                    var n = t.nodeName.toLowerCase();
                    return ("input" === n || "button" === n) && t.type === e
                }
            }

            function c(e) {
                return o(function(t) {
                    return t = +t, o(function(n, o) {
                        for (var i, r = e([], n.length, t), s = r.length; s--;) n[i = r[s]] && (n[i] = !(o[i] = n[i]))
                    })
                })
            }

            function d(e) {
                return e && "undefined" != typeof e.getElementsByTagName && e
            }

            function u() {}

            function p(e) {
                for (var t = 0, n = e.length, o = ""; n > t; t++) o += e[t].value;
                return o
            }

            function f(e, t, n) {
                var o = t.dir,
                    i = n && "parentNode" === o,
                    r = W++;
                return t.first ? function(t, n, r) {
                    for (; t = t[o];)
                        if (1 === t.nodeType || i) return e(t, n, r)
                } : function(t, n, s) {
                    var a, l, c = [z, r];
                    if (s) {
                        for (; t = t[o];)
                            if ((1 === t.nodeType || i) && e(t, n, s)) return !0
                    } else
                        for (; t = t[o];)
                            if (1 === t.nodeType || i) {
                                if (l = t[F] || (t[F] = {}), (a = l[o]) && a[0] === z && a[1] === r) return c[2] = a[2];
                                if (l[o] = c, c[2] = e(t, n, s)) return !0
                            }
                }
            }

            function h(e) {
                return e.length > 1 ? function(t, n, o) {
                    for (var i = e.length; i--;)
                        if (!e[i](t, n, o)) return !1;
                    return !0
                } : e[0]
            }

            function m(e, n, o) {
                for (var i = 0, r = n.length; r > i; i++) t(e, n[i], o);
                return o
            }

            function g(e, t, n, o, i) {
                for (var r, s = [], a = 0, l = e.length, c = null != t; l > a; a++)(r = e[a]) && (!n || n(r, o, i)) && (s.push(r), c && t.push(a));
                return s
            }

            function v(e, t, n, i, r, s) {
                return i && !i[F] && (i = v(i)), r && !r[F] && (r = v(r, s)), o(function(o, s, a, l) {
                    var c, d, u, p = [],
                        f = [],
                        h = s.length,
                        v = o || m(t || "*", a.nodeType ? [a] : a, []),
                        y = !e || !o && t ? v : g(v, p, e, a, l),
                        w = n ? r || (o ? e : h || i) ? [] : s : y;
                    if (n && n(y, w, a, l), i)
                        for (c = g(w, f), i(c, [], a, l), d = c.length; d--;)(u = c[d]) && (w[f[d]] = !(y[f[d]] = u));
                    if (o) {
                        if (r || e) {
                            if (r) {
                                for (c = [], d = w.length; d--;)(u = w[d]) && c.push(y[d] = u);
                                r(null, w = [], c, l)
                            }
                            for (d = w.length; d--;)(u = w[d]) && (c = r ? ee(o, u) : p[d]) > -1 && (o[c] = !(s[c] = u))
                        }
                    } else w = g(w === s ? w.splice(h, w.length) : w), r ? r(null, s, w, l) : J.apply(s, w)
                })
            }

            function y(e) {
                for (var t, n, o, i = e.length, r = x.relative[e[0].type], s = r || x.relative[" "], a = r ? 1 : 0, l = f(function(e) {
                        return e === t
                    }, s, !0), c = f(function(e) {
                        return ee(t, e) > -1
                    }, s, !0), d = [function(e, n, o) {
                        var i = !r && (o || n !== E) || ((t = n).nodeType ? l(e, n, o) : c(e, n, o));
                        return t = null, i
                    }]; i > a; a++)
                    if (n = x.relative[e[a].type]) d = [f(h(d), n)];
                    else {
                        if (n = x.filter[e[a].type].apply(null, e[a].matches), n[F]) {
                            for (o = ++a; i > o && !x.relative[e[o].type]; o++);
                            return v(a > 1 && h(d), a > 1 && p(e.slice(0, a - 1).concat({
                                value: " " === e[a - 2].type ? "*" : ""
                            })).replace(le, "$1"), n, o > a && y(e.slice(a, o)), i > o && y(e = e.slice(o)), i > o && p(e))
                        }
                        d.push(n)
                    }
                return h(d)
            }

            function w(e, n) {
                var i = n.length > 0,
                    r = e.length > 0,
                    s = function(o, s, a, l, c) {
                        var d, u, p, f = 0,
                            h = "0",
                            m = o && [],
                            v = [],
                            y = E,
                            w = o || r && x.find.TAG("*", c),
                            b = z += null == y ? 1 : Math.random() || .1,
                            _ = w.length;
                        for (c && (E = s !== D && s); h !== _ && null != (d = w[h]); h++) {
                            if (r && d) {
                                for (u = 0; p = e[u++];)
                                    if (p(d, s, a)) {
                                        l.push(d);
                                        break
                                    }
                                c && (z = b)
                            }
                            i && ((d = !p && d) && f--, o && m.push(d))
                        }
                        if (f += h, i && h !== f) {
                            for (u = 0; p = n[u++];) p(m, v, s, a);
                            if (o) {
                                if (f > 0)
                                    for (; h--;) m[h] || v[h] || (v[h] = G.call(l));
                                v = g(v)
                            }
                            J.apply(l, v), c && !o && v.length > 0 && f + n.length > 1 && t.uniqueSort(l)
                        }
                        return c && (z = b, E = y), m
                    };
                return i ? o(s) : s
            }
            var b, _, x, C, k, T, S, $, E, N, R, A, D, O, j, I, P, L, H, F = "sizzle" + 1 * new Date,
                M = e.document,
                z = 0,
                W = 0,
                q = n(),
                B = n(),
                U = n(),
                Q = function(e, t) {
                    return e === t && (R = !0), 0
                },
                V = 1 << 31,
                X = {}.hasOwnProperty,
                Y = [],
                G = Y.pop,
                K = Y.push,
                J = Y.push,
                Z = Y.slice,
                ee = function(e, t) {
                    for (var n = 0, o = e.length; o > n; n++)
                        if (e[n] === t) return n;
                    return -1
                },
                te = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",
                ne = "[\\x20\\t\\r\\n\\f]",
                oe = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",
                ie = oe.replace("w", "w#"),
                re = "\\[" + ne + "*(" + oe + ")(?:" + ne + "*([*^$|!~]?=)" + ne + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + ie + "))|)" + ne + "*\\]",
                se = ":(" + oe + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + re + ")*)|.*)\\)|)",
                ae = new RegExp(ne + "+", "g"),
                le = new RegExp("^" + ne + "+|((?:^|[^\\\\])(?:\\\\.)*)" + ne + "+$", "g"),
                ce = new RegExp("^" + ne + "*," + ne + "*"),
                de = new RegExp("^" + ne + "*([>+~]|" + ne + ")" + ne + "*"),
                ue = new RegExp("=" + ne + "*([^\\]'\"]*?)" + ne + "*\\]", "g"),
                pe = new RegExp(se),
                fe = new RegExp("^" + ie + "$"),
                he = {
                    ID: new RegExp("^#(" + oe + ")"),
                    CLASS: new RegExp("^\\.(" + oe + ")"),
                    TAG: new RegExp("^(" + oe.replace("w", "w*") + ")"),
                    ATTR: new RegExp("^" + re),
                    PSEUDO: new RegExp("^" + se),
                    CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + ne + "*(even|odd|(([+-]|)(\\d*)n|)" + ne + "*(?:([+-]|)" + ne + "*(\\d+)|))" + ne + "*\\)|)", "i"),
                    bool: new RegExp("^(?:" + te + ")$", "i"),
                    needsContext: new RegExp("^" + ne + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + ne + "*((?:-\\d)?\\d*)" + ne + "*\\)|)(?=[^-]|$)", "i")
                },
                me = /^(?:input|select|textarea|button)$/i,
                ge = /^h\d$/i,
                ve = /^[^{]+\{\s*\[native \w/,
                ye = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
                we = /[+~]/,
                be = /'|\\/g,
                _e = new RegExp("\\\\([\\da-f]{1,6}" + ne + "?|(" + ne + ")|.)", "ig"),
                xe = function(e, t, n) {
                    var o = "0x" + t - 65536;
                    return o !== o || n ? t : 0 > o ? String.fromCharCode(o + 65536) : String.fromCharCode(o >> 10 | 55296, 1023 & o | 56320)
                },
                Ce = function() {
                    A()
                };
            try {
                J.apply(Y = Z.call(M.childNodes), M.childNodes), Y[M.childNodes.length].nodeType
            } catch (ke) {
                J = {
                    apply: Y.length ? function(e, t) {
                        K.apply(e, Z.call(t))
                    } : function(e, t) {
                        for (var n = e.length, o = 0; e[n++] = t[o++];);
                        e.length = n - 1
                    }
                }
            }
            _ = t.support = {}, k = t.isXML = function(e) {
                var t = e && (e.ownerDocument || e).documentElement;
                return t ? "HTML" !== t.nodeName : !1
            }, A = t.setDocument = function(e) {
                var t, n, o = e ? e.ownerDocument || e : M;
                return o !== D && 9 === o.nodeType && o.documentElement ? (D = o, O = o.documentElement, n = o.defaultView, n && n !== n.top && (n.addEventListener ? n.addEventListener("unload", Ce, !1) : n.attachEvent && n.attachEvent("onunload", Ce)), j = !k(o), _.attributes = i(function(e) {
                    return e.className = "i", !e.getAttribute("className")
                }), _.getElementsByTagName = i(function(e) {
                    return e.appendChild(o.createComment("")), !e.getElementsByTagName("*").length
                }), _.getElementsByClassName = ve.test(o.getElementsByClassName), _.getById = i(function(e) {
                    return O.appendChild(e).id = F, !o.getElementsByName || !o.getElementsByName(F).length
                }), _.getById ? (x.find.ID = function(e, t) {
                    if ("undefined" != typeof t.getElementById && j) {
                        var n = t.getElementById(e);
                        return n && n.parentNode ? [n] : []
                    }
                }, x.filter.ID = function(e) {
                    var t = e.replace(_e, xe);
                    return function(e) {
                        return e.getAttribute("id") === t
                    }
                }) : (delete x.find.ID, x.filter.ID = function(e) {
                    var t = e.replace(_e, xe);
                    return function(e) {
                        var n = "undefined" != typeof e.getAttributeNode && e.getAttributeNode("id");
                        return n && n.value === t
                    }
                }), x.find.TAG = _.getElementsByTagName ? function(e, t) {
                    return "undefined" != typeof t.getElementsByTagName ? t.getElementsByTagName(e) : _.qsa ? t.querySelectorAll(e) : void 0
                } : function(e, t) {
                    var n, o = [],
                        i = 0,
                        r = t.getElementsByTagName(e);
                    if ("*" === e) {
                        for (; n = r[i++];) 1 === n.nodeType && o.push(n);
                        return o
                    }
                    return r
                }, x.find.CLASS = _.getElementsByClassName && function(e, t) {
                    return j ? t.getElementsByClassName(e) : void 0
                }, P = [], I = [], (_.qsa = ve.test(o.querySelectorAll)) && (i(function(e) {
                    O.appendChild(e).innerHTML = "<a id='" + F + "'></a><select id='" + F + "-\f]' msallowcapture=''><option selected=''></option></select>", e.querySelectorAll("[msallowcapture^='']").length && I.push("[*^$]=" + ne + "*(?:''|\"\")"), e.querySelectorAll("[selected]").length || I.push("\\[" + ne + "*(?:value|" + te + ")"), e.querySelectorAll("[id~=" + F + "-]").length || I.push("~="), e.querySelectorAll(":checked").length || I.push(":checked"), e.querySelectorAll("a#" + F + "+*").length || I.push(".#.+[+~]")
                }), i(function(e) {
                    var t = o.createElement("input");
                    t.setAttribute("type", "hidden"), e.appendChild(t).setAttribute("name", "D"), e.querySelectorAll("[name=d]").length && I.push("name" + ne + "*[*^$|!~]?="), e.querySelectorAll(":enabled").length || I.push(":enabled", ":disabled"), e.querySelectorAll("*,:x"), I.push(",.*:")
                })), (_.matchesSelector = ve.test(L = O.matches || O.webkitMatchesSelector || O.mozMatchesSelector || O.oMatchesSelector || O.msMatchesSelector)) && i(function(e) {
                    _.disconnectedMatch = L.call(e, "div"), L.call(e, "[s!='']:x"), P.push("!=", se)
                }), I = I.length && new RegExp(I.join("|")), P = P.length && new RegExp(P.join("|")), t = ve.test(O.compareDocumentPosition), H = t || ve.test(O.contains) ? function(e, t) {
                    var n = 9 === e.nodeType ? e.documentElement : e,
                        o = t && t.parentNode;
                    return e === o || !(!o || 1 !== o.nodeType || !(n.contains ? n.contains(o) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(o)))
                } : function(e, t) {
                    if (t)
                        for (; t = t.parentNode;)
                            if (t === e) return !0;
                    return !1
                }, Q = t ? function(e, t) {
                    if (e === t) return R = !0, 0;
                    var n = !e.compareDocumentPosition - !t.compareDocumentPosition;
                    return n ? n : (n = (e.ownerDocument || e) === (t.ownerDocument || t) ? e.compareDocumentPosition(t) : 1,
                        1 & n || !_.sortDetached && t.compareDocumentPosition(e) === n ? e === o || e.ownerDocument === M && H(M, e) ? -1 : t === o || t.ownerDocument === M && H(M, t) ? 1 : N ? ee(N, e) - ee(N, t) : 0 : 4 & n ? -1 : 1)
                } : function(e, t) {
                    if (e === t) return R = !0, 0;
                    var n, i = 0,
                        r = e.parentNode,
                        a = t.parentNode,
                        l = [e],
                        c = [t];
                    if (!r || !a) return e === o ? -1 : t === o ? 1 : r ? -1 : a ? 1 : N ? ee(N, e) - ee(N, t) : 0;
                    if (r === a) return s(e, t);
                    for (n = e; n = n.parentNode;) l.unshift(n);
                    for (n = t; n = n.parentNode;) c.unshift(n);
                    for (; l[i] === c[i];) i++;
                    return i ? s(l[i], c[i]) : l[i] === M ? -1 : c[i] === M ? 1 : 0
                }, o) : D
            }, t.matches = function(e, n) {
                return t(e, null, null, n)
            }, t.matchesSelector = function(e, n) {
                if ((e.ownerDocument || e) !== D && A(e), n = n.replace(ue, "='$1']"), _.matchesSelector && j && (!P || !P.test(n)) && (!I || !I.test(n))) try {
                    var o = L.call(e, n);
                    if (o || _.disconnectedMatch || e.document && 11 !== e.document.nodeType) return o
                } catch (i) {}
                return t(n, D, null, [e]).length > 0
            }, t.contains = function(e, t) {
                return (e.ownerDocument || e) !== D && A(e), H(e, t)
            }, t.attr = function(e, t) {
                (e.ownerDocument || e) !== D && A(e);
                var n = x.attrHandle[t.toLowerCase()],
                    o = n && X.call(x.attrHandle, t.toLowerCase()) ? n(e, t, !j) : void 0;
                return void 0 !== o ? o : _.attributes || !j ? e.getAttribute(t) : (o = e.getAttributeNode(t)) && o.specified ? o.value : null
            }, t.error = function(e) {
                throw new Error("Syntax error, unrecognized expression: " + e)
            }, t.uniqueSort = function(e) {
                var t, n = [],
                    o = 0,
                    i = 0;
                if (R = !_.detectDuplicates, N = !_.sortStable && e.slice(0), e.sort(Q), R) {
                    for (; t = e[i++];) t === e[i] && (o = n.push(i));
                    for (; o--;) e.splice(n[o], 1)
                }
                return N = null, e
            }, C = t.getText = function(e) {
                var t, n = "",
                    o = 0,
                    i = e.nodeType;
                if (i) {
                    if (1 === i || 9 === i || 11 === i) {
                        if ("string" == typeof e.textContent) return e.textContent;
                        for (e = e.firstChild; e; e = e.nextSibling) n += C(e)
                    } else if (3 === i || 4 === i) return e.nodeValue
                } else
                    for (; t = e[o++];) n += C(t);
                return n
            }, x = t.selectors = {
                cacheLength: 50,
                createPseudo: o,
                match: he,
                attrHandle: {},
                find: {},
                relative: {
                    ">": {
                        dir: "parentNode",
                        first: !0
                    },
                    " ": {
                        dir: "parentNode"
                    },
                    "+": {
                        dir: "previousSibling",
                        first: !0
                    },
                    "~": {
                        dir: "previousSibling"
                    }
                },
                preFilter: {
                    ATTR: function(e) {
                        return e[1] = e[1].replace(_e, xe), e[3] = (e[3] || e[4] || e[5] || "").replace(_e, xe), "~=" === e[2] && (e[3] = " " + e[3] + " "), e.slice(0, 4)
                    },
                    CHILD: function(e) {
                        return e[1] = e[1].toLowerCase(), "nth" === e[1].slice(0, 3) ? (e[3] || t.error(e[0]), e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])), e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && t.error(e[0]), e
                    },
                    PSEUDO: function(e) {
                        var t, n = !e[6] && e[2];
                        return he.CHILD.test(e[0]) ? null : (e[3] ? e[2] = e[4] || e[5] || "" : n && pe.test(n) && (t = T(n, !0)) && (t = n.indexOf(")", n.length - t) - n.length) && (e[0] = e[0].slice(0, t), e[2] = n.slice(0, t)), e.slice(0, 3))
                    }
                },
                filter: {
                    TAG: function(e) {
                        var t = e.replace(_e, xe).toLowerCase();
                        return "*" === e ? function() {
                            return !0
                        } : function(e) {
                            return e.nodeName && e.nodeName.toLowerCase() === t
                        }
                    },
                    CLASS: function(e) {
                        var t = q[e + " "];
                        return t || (t = new RegExp("(^|" + ne + ")" + e + "(" + ne + "|$)")) && q(e, function(e) {
                            return t.test("string" == typeof e.className && e.className || "undefined" != typeof e.getAttribute && e.getAttribute("class") || "")
                        })
                    },
                    ATTR: function(e, n, o) {
                        return function(i) {
                            var r = t.attr(i, e);
                            return null == r ? "!=" === n : n ? (r += "", "=" === n ? r === o : "!=" === n ? r !== o : "^=" === n ? o && 0 === r.indexOf(o) : "*=" === n ? o && r.indexOf(o) > -1 : "$=" === n ? o && r.slice(-o.length) === o : "~=" === n ? (" " + r.replace(ae, " ") + " ").indexOf(o) > -1 : "|=" === n ? r === o || r.slice(0, o.length + 1) === o + "-" : !1) : !0
                        }
                    },
                    CHILD: function(e, t, n, o, i) {
                        var r = "nth" !== e.slice(0, 3),
                            s = "last" !== e.slice(-4),
                            a = "of-type" === t;
                        return 1 === o && 0 === i ? function(e) {
                            return !!e.parentNode
                        } : function(t, n, l) {
                            var c, d, u, p, f, h, m = r !== s ? "nextSibling" : "previousSibling",
                                g = t.parentNode,
                                v = a && t.nodeName.toLowerCase(),
                                y = !l && !a;
                            if (g) {
                                if (r) {
                                    for (; m;) {
                                        for (u = t; u = u[m];)
                                            if (a ? u.nodeName.toLowerCase() === v : 1 === u.nodeType) return !1;
                                        h = m = "only" === e && !h && "nextSibling"
                                    }
                                    return !0
                                }
                                if (h = [s ? g.firstChild : g.lastChild], s && y) {
                                    for (d = g[F] || (g[F] = {}), c = d[e] || [], f = c[0] === z && c[1], p = c[0] === z && c[2], u = f && g.childNodes[f]; u = ++f && u && u[m] || (p = f = 0) || h.pop();)
                                        if (1 === u.nodeType && ++p && u === t) {
                                            d[e] = [z, f, p];
                                            break
                                        }
                                } else if (y && (c = (t[F] || (t[F] = {}))[e]) && c[0] === z) p = c[1];
                                else
                                    for (;
                                        (u = ++f && u && u[m] || (p = f = 0) || h.pop()) && ((a ? u.nodeName.toLowerCase() !== v : 1 !== u.nodeType) || !++p || (y && ((u[F] || (u[F] = {}))[e] = [z, p]), u !== t)););
                                return p -= i, p === o || p % o === 0 && p / o >= 0
                            }
                        }
                    },
                    PSEUDO: function(e, n) {
                        var i, r = x.pseudos[e] || x.setFilters[e.toLowerCase()] || t.error("unsupported pseudo: " + e);
                        return r[F] ? r(n) : r.length > 1 ? (i = [e, e, "", n], x.setFilters.hasOwnProperty(e.toLowerCase()) ? o(function(e, t) {
                            for (var o, i = r(e, n), s = i.length; s--;) o = ee(e, i[s]), e[o] = !(t[o] = i[s])
                        }) : function(e) {
                            return r(e, 0, i)
                        }) : r
                    }
                },
                pseudos: {
                    not: o(function(e) {
                        var t = [],
                            n = [],
                            i = S(e.replace(le, "$1"));
                        return i[F] ? o(function(e, t, n, o) {
                            for (var r, s = i(e, null, o, []), a = e.length; a--;)(r = s[a]) && (e[a] = !(t[a] = r))
                        }) : function(e, o, r) {
                            return t[0] = e, i(t, null, r, n), t[0] = null, !n.pop()
                        }
                    }),
                    has: o(function(e) {
                        return function(n) {
                            return t(e, n).length > 0
                        }
                    }),
                    contains: o(function(e) {
                        return e = e.replace(_e, xe),
                            function(t) {
                                return (t.textContent || t.innerText || C(t)).indexOf(e) > -1
                            }
                    }),
                    lang: o(function(e) {
                        return fe.test(e || "") || t.error("unsupported lang: " + e), e = e.replace(_e, xe).toLowerCase(),
                            function(t) {
                                var n;
                                do
                                    if (n = j ? t.lang : t.getAttribute("xml:lang") || t.getAttribute("lang")) return n = n.toLowerCase(), n === e || 0 === n.indexOf(e + "-"); while ((t = t.parentNode) && 1 === t.nodeType);
                                return !1
                            }
                    }),
                    target: function(t) {
                        var n = e.location && e.location.hash;
                        return n && n.slice(1) === t.id
                    },
                    root: function(e) {
                        return e === O
                    },
                    focus: function(e) {
                        return e === D.activeElement && (!D.hasFocus || D.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
                    },
                    enabled: function(e) {
                        return e.disabled === !1
                    },
                    disabled: function(e) {
                        return e.disabled === !0
                    },
                    checked: function(e) {
                        var t = e.nodeName.toLowerCase();
                        return "input" === t && !!e.checked || "option" === t && !!e.selected
                    },
                    selected: function(e) {
                        return e.parentNode && e.parentNode.selectedIndex, e.selected === !0
                    },
                    empty: function(e) {
                        for (e = e.firstChild; e; e = e.nextSibling)
                            if (e.nodeType < 6) return !1;
                        return !0
                    },
                    parent: function(e) {
                        return !x.pseudos.empty(e)
                    },
                    header: function(e) {
                        return ge.test(e.nodeName)
                    },
                    input: function(e) {
                        return me.test(e.nodeName)
                    },
                    button: function(e) {
                        var t = e.nodeName.toLowerCase();
                        return "input" === t && "button" === e.type || "button" === t
                    },
                    text: function(e) {
                        var t;
                        return "input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || "text" === t.toLowerCase())
                    },
                    first: c(function() {
                        return [0]
                    }),
                    last: c(function(e, t) {
                        return [t - 1]
                    }),
                    eq: c(function(e, t, n) {
                        return [0 > n ? n + t : n]
                    }),
                    even: c(function(e, t) {
                        for (var n = 0; t > n; n += 2) e.push(n);
                        return e
                    }),
                    odd: c(function(e, t) {
                        for (var n = 1; t > n; n += 2) e.push(n);
                        return e
                    }),
                    lt: c(function(e, t, n) {
                        for (var o = 0 > n ? n + t : n; --o >= 0;) e.push(o);
                        return e
                    }),
                    gt: c(function(e, t, n) {
                        for (var o = 0 > n ? n + t : n; ++o < t;) e.push(o);
                        return e
                    })
                }
            }, x.pseudos.nth = x.pseudos.eq;
            for (b in {
                    radio: !0,
                    checkbox: !0,
                    file: !0,
                    password: !0,
                    image: !0
                }) x.pseudos[b] = a(b);
            for (b in {
                    submit: !0,
                    reset: !0
                }) x.pseudos[b] = l(b);
            return u.prototype = x.filters = x.pseudos, x.setFilters = new u, T = t.tokenize = function(e, n) {
                var o, i, r, s, a, l, c, d = B[e + " "];
                if (d) return n ? 0 : d.slice(0);
                for (a = e, l = [], c = x.preFilter; a;) {
                    (!o || (i = ce.exec(a))) && (i && (a = a.slice(i[0].length) || a), l.push(r = [])), o = !1, (i = de.exec(a)) && (o = i.shift(), r.push({
                        value: o,
                        type: i[0].replace(le, " ")
                    }), a = a.slice(o.length));
                    for (s in x.filter) !(i = he[s].exec(a)) || c[s] && !(i = c[s](i)) || (o = i.shift(), r.push({
                        value: o,
                        type: s,
                        matches: i
                    }), a = a.slice(o.length));
                    if (!o) break
                }
                return n ? a.length : a ? t.error(e) : B(e, l).slice(0)
            }, S = t.compile = function(e, t) {
                var n, o = [],
                    i = [],
                    r = U[e + " "];
                if (!r) {
                    for (t || (t = T(e)), n = t.length; n--;) r = y(t[n]), r[F] ? o.push(r) : i.push(r);
                    r = U(e, w(i, o)), r.selector = e
                }
                return r
            }, $ = t.select = function(e, t, n, o) {
                var i, r, s, a, l, c = "function" == typeof e && e,
                    u = !o && T(e = c.selector || e);
                if (n = n || [], 1 === u.length) {
                    if (r = u[0] = u[0].slice(0), r.length > 2 && "ID" === (s = r[0]).type && _.getById && 9 === t.nodeType && j && x.relative[r[1].type]) {
                        if (t = (x.find.ID(s.matches[0].replace(_e, xe), t) || [])[0], !t) return n;
                        c && (t = t.parentNode), e = e.slice(r.shift().value.length)
                    }
                    for (i = he.needsContext.test(e) ? 0 : r.length; i-- && (s = r[i], !x.relative[a = s.type]);)
                        if ((l = x.find[a]) && (o = l(s.matches[0].replace(_e, xe), we.test(r[0].type) && d(t.parentNode) || t))) {
                            if (r.splice(i, 1), e = o.length && p(r), !e) return J.apply(n, o), n;
                            break
                        }
                }
                return (c || S(e, u))(o, t, !j, n, we.test(e) && d(t.parentNode) || t), n
            }, _.sortStable = F.split("").sort(Q).join("") === F, _.detectDuplicates = !!R, A(), _.sortDetached = i(function(e) {
                return 1 & e.compareDocumentPosition(D.createElement("div"))
            }), i(function(e) {
                return e.innerHTML = "<a href='#'></a>", "#" === e.firstChild.getAttribute("href")
            }) || r("type|href|height|width", function(e, t, n) {
                return n ? void 0 : e.getAttribute(t, "type" === t.toLowerCase() ? 1 : 2)
            }), _.attributes && i(function(e) {
                return e.innerHTML = "<input/>", e.firstChild.setAttribute("value", ""), "" === e.firstChild.getAttribute("value")
            }) || r("value", function(e, t, n) {
                return n || "input" !== e.nodeName.toLowerCase() ? void 0 : e.defaultValue
            }), i(function(e) {
                return null == e.getAttribute("disabled")
            }) || r(te, function(e, t, n) {
                var o;
                return n ? void 0 : e[t] === !0 ? t.toLowerCase() : (o = e.getAttributeNode(t)) && o.specified ? o.value : null
            }), t
        }(e);
        Z.find = ie, Z.expr = ie.selectors, Z.expr[":"] = Z.expr.pseudos, Z.unique = ie.uniqueSort, Z.text = ie.getText, Z.isXMLDoc = ie.isXML, Z.contains = ie.contains;
        var re = Z.expr.match.needsContext,
            se = /^<(\w+)\s*\/?>(?:<\/\1>|)$/,
            ae = /^.[^:#\[\.,]*$/;
        Z.filter = function(e, t, n) {
            var o = t[0];
            return n && (e = ":not(" + e + ")"), 1 === t.length && 1 === o.nodeType ? Z.find.matchesSelector(o, e) ? [o] : [] : Z.find.matches(e, Z.grep(t, function(e) {
                return 1 === e.nodeType
            }))
        }, Z.fn.extend({
            find: function(e) {
                var t, n = this.length,
                    o = [],
                    i = this;
                if ("string" != typeof e) return this.pushStack(Z(e).filter(function() {
                    for (t = 0; n > t; t++)
                        if (Z.contains(i[t], this)) return !0
                }));
                for (t = 0; n > t; t++) Z.find(e, i[t], o);
                return o = this.pushStack(n > 1 ? Z.unique(o) : o), o.selector = this.selector ? this.selector + " " + e : e, o
            },
            filter: function(e) {
                return this.pushStack(o(this, e || [], !1))
            },
            not: function(e) {
                return this.pushStack(o(this, e || [], !0))
            },
            is: function(e) {
                return !!o(this, "string" == typeof e && re.test(e) ? Z(e) : e || [], !1).length
            }
        });
        var le, ce = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,
            de = Z.fn.init = function(e, t) {
                var n, o;
                if (!e) return this;
                if ("string" == typeof e) {
                    if (n = "<" === e[0] && ">" === e[e.length - 1] && e.length >= 3 ? [null, e, null] : ce.exec(e), !n || !n[1] && t) return !t || t.jquery ? (t || le).find(e) : this.constructor(t).find(e);
                    if (n[1]) {
                        if (t = t instanceof Z ? t[0] : t, Z.merge(this, Z.parseHTML(n[1], t && t.nodeType ? t.ownerDocument || t : K, !0)), se.test(n[1]) && Z.isPlainObject(t))
                            for (n in t) Z.isFunction(this[n]) ? this[n](t[n]) : this.attr(n, t[n]);
                        return this
                    }
                    return o = K.getElementById(n[2]), o && o.parentNode && (this.length = 1, this[0] = o), this.context = K, this.selector = e, this
                }
                return e.nodeType ? (this.context = this[0] = e, this.length = 1, this) : Z.isFunction(e) ? "undefined" != typeof le.ready ? le.ready(e) : e(Z) : (void 0 !== e.selector && (this.selector = e.selector, this.context = e.context), Z.makeArray(e, this))
            };
        de.prototype = Z.fn, le = Z(K);
        var ue = /^(?:parents|prev(?:Until|All))/,
            pe = {
                children: !0,
                contents: !0,
                next: !0,
                prev: !0
            };
        Z.extend({
            dir: function(e, t, n) {
                for (var o = [], i = void 0 !== n;
                    (e = e[t]) && 9 !== e.nodeType;)
                    if (1 === e.nodeType) {
                        if (i && Z(e).is(n)) break;
                        o.push(e)
                    }
                return o
            },
            sibling: function(e, t) {
                for (var n = []; e; e = e.nextSibling) 1 === e.nodeType && e !== t && n.push(e);
                return n
            }
        }), Z.fn.extend({
            has: function(e) {
                var t = Z(e, this),
                    n = t.length;
                return this.filter(function() {
                    for (var e = 0; n > e; e++)
                        if (Z.contains(this, t[e])) return !0
                })
            },
            closest: function(e, t) {
                for (var n, o = 0, i = this.length, r = [], s = re.test(e) || "string" != typeof e ? Z(e, t || this.context) : 0; i > o; o++)
                    for (n = this[o]; n && n !== t; n = n.parentNode)
                        if (n.nodeType < 11 && (s ? s.index(n) > -1 : 1 === n.nodeType && Z.find.matchesSelector(n, e))) {
                            r.push(n);
                            break
                        }
                return this.pushStack(r.length > 1 ? Z.unique(r) : r)
            },
            index: function(e) {
                return e ? "string" == typeof e ? Q.call(Z(e), this[0]) : Q.call(this, e.jquery ? e[0] : e) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
            },
            add: function(e, t) {
                return this.pushStack(Z.unique(Z.merge(this.get(), Z(e, t))))
            },
            addBack: function(e) {
                return this.add(null == e ? this.prevObject : this.prevObject.filter(e))
            }
        }), Z.each({
            parent: function(e) {
                var t = e.parentNode;
                return t && 11 !== t.nodeType ? t : null
            },
            parents: function(e) {
                return Z.dir(e, "parentNode")
            },
            parentsUntil: function(e, t, n) {
                return Z.dir(e, "parentNode", n)
            },
            next: function(e) {
                return i(e, "nextSibling")
            },
            prev: function(e) {
                return i(e, "previousSibling")
            },
            nextAll: function(e) {
                return Z.dir(e, "nextSibling")
            },
            prevAll: function(e) {
                return Z.dir(e, "previousSibling")
            },
            nextUntil: function(e, t, n) {
                return Z.dir(e, "nextSibling", n)
            },
            prevUntil: function(e, t, n) {
                return Z.dir(e, "previousSibling", n)
            },
            siblings: function(e) {
                return Z.sibling((e.parentNode || {}).firstChild, e)
            },
            children: function(e) {
                return Z.sibling(e.firstChild)
            },
            contents: function(e) {
                return e.contentDocument || Z.merge([], e.childNodes)
            }
        }, function(e, t) {
            Z.fn[e] = function(n, o) {
                var i = Z.map(this, t, n);
                return "Until" !== e.slice(-5) && (o = n), o && "string" == typeof o && (i = Z.filter(o, i)), this.length > 1 && (pe[e] || Z.unique(i), ue.test(e) && i.reverse()), this.pushStack(i)
            }
        });
        var fe = /\S+/g,
            he = {};
        Z.Callbacks = function(e) {
            e = "string" == typeof e ? he[e] || r(e) : Z.extend({}, e);
            var t, n, o, i, s, a, l = [],
                c = !e.once && [],
                d = function(r) {
                    for (t = e.memory && r, n = !0, a = i || 0, i = 0, s = l.length, o = !0; l && s > a; a++)
                        if (l[a].apply(r[0], r[1]) === !1 && e.stopOnFalse) {
                            t = !1;
                            break
                        }
                    o = !1, l && (c ? c.length && d(c.shift()) : t ? l = [] : u.disable())
                },
                u = {
                    add: function() {
                        if (l) {
                            var n = l.length;
                            ! function r(t) {
                                Z.each(t, function(t, n) {
                                    var o = Z.type(n);
                                    "function" === o ? e.unique && u.has(n) || l.push(n) : n && n.length && "string" !== o && r(n)
                                })
                            }(arguments), o ? s = l.length : t && (i = n, d(t))
                        }
                        return this
                    },
                    remove: function() {
                        return l && Z.each(arguments, function(e, t) {
                            for (var n;
                                (n = Z.inArray(t, l, n)) > -1;) l.splice(n, 1), o && (s >= n && s--, a >= n && a--)
                        }), this
                    },
                    has: function(e) {
                        return e ? Z.inArray(e, l) > -1 : !(!l || !l.length)
                    },
                    empty: function() {
                        return l = [], s = 0, this
                    },
                    disable: function() {
                        return l = c = t = void 0, this
                    },
                    disabled: function() {
                        return !l
                    },
                    lock: function() {
                        return c = void 0, t || u.disable(), this
                    },
                    locked: function() {
                        return !c
                    },
                    fireWith: function(e, t) {
                        return !l || n && !c || (t = t || [], t = [e, t.slice ? t.slice() : t], o ? c.push(t) : d(t)), this
                    },
                    fire: function() {
                        return u.fireWith(this, arguments), this
                    },
                    fired: function() {
                        return !!n
                    }
                };
            return u
        }, Z.extend({
            Deferred: function(e) {
                var t = [
                        ["resolve", "done", Z.Callbacks("once memory"), "resolved"],
                        ["reject", "fail", Z.Callbacks("once memory"), "rejected"],
                        ["notify", "progress", Z.Callbacks("memory")]
                    ],
                    n = "pending",
                    o = {
                        state: function() {
                            return n
                        },
                        always: function() {
                            return i.done(arguments).fail(arguments), this
                        },
                        then: function() {
                            var e = arguments;
                            return Z.Deferred(function(n) {
                                Z.each(t, function(t, r) {
                                    var s = Z.isFunction(e[t]) && e[t];
                                    i[r[1]](function() {
                                        var e = s && s.apply(this, arguments);
                                        e && Z.isFunction(e.promise) ? e.promise().done(n.resolve).fail(n.reject).progress(n.notify) : n[r[0] + "With"](this === o ? n.promise() : this, s ? [e] : arguments)
                                    })
                                }), e = null
                            }).promise()
                        },
                        promise: function(e) {
                            return null != e ? Z.extend(e, o) : o
                        }
                    },
                    i = {};
                return o.pipe = o.then, Z.each(t, function(e, r) {
                    var s = r[2],
                        a = r[3];
                    o[r[1]] = s.add, a && s.add(function() {
                        n = a
                    }, t[1 ^ e][2].disable, t[2][2].lock), i[r[0]] = function() {
                        return i[r[0] + "With"](this === i ? o : this, arguments), this
                    }, i[r[0] + "With"] = s.fireWith
                }), o.promise(i), e && e.call(i, i), i
            },
            when: function(e) {
                var t, n, o, i = 0,
                    r = q.call(arguments),
                    s = r.length,
                    a = 1 !== s || e && Z.isFunction(e.promise) ? s : 0,
                    l = 1 === a ? e : Z.Deferred(),
                    c = function(e, n, o) {
                        return function(i) {
                            n[e] = this, o[e] = arguments.length > 1 ? q.call(arguments) : i, o === t ? l.notifyWith(n, o) : --a || l.resolveWith(n, o)
                        }
                    };
                if (s > 1)
                    for (t = new Array(s), n = new Array(s), o = new Array(s); s > i; i++) r[i] && Z.isFunction(r[i].promise) ? r[i].promise().done(c(i, o, r)).fail(l.reject).progress(c(i, n, t)) : --a;
                return a || l.resolveWith(o, r), l.promise()
            }
        });
        var me;
        Z.fn.ready = function(e) {
            return Z.ready.promise().done(e), this
        }, Z.extend({
            isReady: !1,
            readyWait: 1,
            holdReady: function(e) {
                e ? Z.readyWait++ : Z.ready(!0)
            },
            ready: function(e) {
                (e === !0 ? --Z.readyWait : Z.isReady) || (Z.isReady = !0, e !== !0 && --Z.readyWait > 0 || (me.resolveWith(K, [Z]), Z.fn.triggerHandler && (Z(K).triggerHandler("ready"), Z(K).off("ready"))))
            }
        }), Z.ready.promise = function(t) {
            return me || (me = Z.Deferred(), "complete" === K.readyState ? setTimeout(Z.ready) : (K.addEventListener("DOMContentLoaded", s, !1), e.addEventListener("load", s, !1))), me.promise(t)
        }, Z.ready.promise();
        var ge = Z.access = function(e, t, n, o, i, r, s) {
            var a = 0,
                l = e.length,
                c = null == n;
            if ("object" === Z.type(n)) {
                i = !0;
                for (a in n) Z.access(e, t, a, n[a], !0, r, s)
            } else if (void 0 !== o && (i = !0, Z.isFunction(o) || (s = !0), c && (s ? (t.call(e, o), t = null) : (c = t, t = function(e, t, n) {
                    return c.call(Z(e), n)
                })), t))
                for (; l > a; a++) t(e[a], n, s ? o : o.call(e[a], a, t(e[a], n)));
            return i ? e : c ? t.call(e) : l ? t(e[0], n) : r
        };
        Z.acceptData = function(e) {
            return 1 === e.nodeType || 9 === e.nodeType || !+e.nodeType
        }, a.uid = 1, a.accepts = Z.acceptData, a.prototype = {
            key: function(e) {
                if (!a.accepts(e)) return 0;
                var t = {},
                    n = e[this.expando];
                if (!n) {
                    n = a.uid++;
                    try {
                        t[this.expando] = {
                            value: n
                        }, Object.defineProperties(e, t)
                    } catch (o) {
                        t[this.expando] = n, Z.extend(e, t)
                    }
                }
                return this.cache[n] || (this.cache[n] = {}), n
            },
            set: function(e, t, n) {
                var o, i = this.key(e),
                    r = this.cache[i];
                if ("string" == typeof t) r[t] = n;
                else if (Z.isEmptyObject(r)) Z.extend(this.cache[i], t);
                else
                    for (o in t) r[o] = t[o];
                return r
            },
            get: function(e, t) {
                var n = this.cache[this.key(e)];
                return void 0 === t ? n : n[t]
            },
            access: function(e, t, n) {
                var o;
                return void 0 === t || t && "string" == typeof t && void 0 === n ? (o = this.get(e, t), void 0 !== o ? o : this.get(e, Z.camelCase(t))) : (this.set(e, t, n), void 0 !== n ? n : t)
            },
            remove: function(e, t) {
                var n, o, i, r = this.key(e),
                    s = this.cache[r];
                if (void 0 === t) this.cache[r] = {};
                else {
                    Z.isArray(t) ? o = t.concat(t.map(Z.camelCase)) : (i = Z.camelCase(t), t in s ? o = [t, i] : (o = i, o = o in s ? [o] : o.match(fe) || [])), n = o.length;
                    for (; n--;) delete s[o[n]]
                }
            },
            hasData: function(e) {
                return !Z.isEmptyObject(this.cache[e[this.expando]] || {})
            },
            discard: function(e) {
                e[this.expando] && delete this.cache[e[this.expando]]
            }
        };
        var ve = new a,
            ye = new a,
            we = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
            be = /([A-Z])/g;
        Z.extend({
            hasData: function(e) {
                return ye.hasData(e) || ve.hasData(e)
            },
            data: function(e, t, n) {
                return ye.access(e, t, n)
            },
            removeData: function(e, t) {
                ye.remove(e, t)
            },
            _data: function(e, t, n) {
                return ve.access(e, t, n)
            },
            _removeData: function(e, t) {
                ve.remove(e, t)
            }
        }), Z.fn.extend({
            data: function(e, t) {
                var n, o, i, r = this[0],
                    s = r && r.attributes;
                if (void 0 === e) {
                    if (this.length && (i = ye.get(r), 1 === r.nodeType && !ve.get(r, "hasDataAttrs"))) {
                        for (n = s.length; n--;) s[n] && (o = s[n].name, 0 === o.indexOf("data-") && (o = Z.camelCase(o.slice(5)), l(r, o, i[o])));
                        ve.set(r, "hasDataAttrs", !0)
                    }
                    return i
                }
                return "object" == typeof e ? this.each(function() {
                    ye.set(this, e)
                }) : ge(this, function(t) {
                    var n, o = Z.camelCase(e);
                    if (r && void 0 === t) {
                        if (n = ye.get(r, e), void 0 !== n) return n;
                        if (n = ye.get(r, o), void 0 !== n) return n;
                        if (n = l(r, o, void 0), void 0 !== n) return n
                    } else this.each(function() {
                        var n = ye.get(this, o);
                        ye.set(this, o, t), -1 !== e.indexOf("-") && void 0 !== n && ye.set(this, e, t)
                    })
                }, null, t, arguments.length > 1, null, !0)
            },
            removeData: function(e) {
                return this.each(function() {
                    ye.remove(this, e)
                })
            }
        }), Z.extend({
            queue: function(e, t, n) {
                var o;
                return e ? (t = (t || "fx") + "queue", o = ve.get(e, t), n && (!o || Z.isArray(n) ? o = ve.access(e, t, Z.makeArray(n)) : o.push(n)), o || []) : void 0
            },
            dequeue: function(e, t) {
                t = t || "fx";
                var n = Z.queue(e, t),
                    o = n.length,
                    i = n.shift(),
                    r = Z._queueHooks(e, t),
                    s = function() {
                        Z.dequeue(e, t)
                    };
                "inprogress" === i && (i = n.shift(), o--), i && ("fx" === t && n.unshift("inprogress"), delete r.stop, i.call(e, s, r)), !o && r && r.empty.fire()
            },
            _queueHooks: function(e, t) {
                var n = t + "queueHooks";
                return ve.get(e, n) || ve.access(e, n, {
                    empty: Z.Callbacks("once memory").add(function() {
                        ve.remove(e, [t + "queue", n])
                    })
                })
            }
        }), Z.fn.extend({
            queue: function(e, t) {
                var n = 2;
                return "string" != typeof e && (t = e, e = "fx", n--), arguments.length < n ? Z.queue(this[0], e) : void 0 === t ? this : this.each(function() {
                    var n = Z.queue(this, e, t);
                    Z._queueHooks(this, e), "fx" === e && "inprogress" !== n[0] && Z.dequeue(this, e)
                })
            },
            dequeue: function(e) {
                return this.each(function() {
                    Z.dequeue(this, e)
                })
            },
            clearQueue: function(e) {
                return this.queue(e || "fx", [])
            },
            promise: function(e, t) {
                var n, o = 1,
                    i = Z.Deferred(),
                    r = this,
                    s = this.length,
                    a = function() {
                        --o || i.resolveWith(r, [r])
                    };
                for ("string" != typeof e && (t = e, e = void 0), e = e || "fx"; s--;) n = ve.get(r[s], e + "queueHooks"), n && n.empty && (o++, n.empty.add(a));
                return a(), i.promise(t)
            }
        });
        var _e = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
            xe = ["Top", "Right", "Bottom", "Left"],
            Ce = function(e, t) {
                return e = t || e, "none" === Z.css(e, "display") || !Z.contains(e.ownerDocument, e)
            },
            ke = /^(?:checkbox|radio)$/i;
        ! function() {
            var e = K.createDocumentFragment(),
                t = e.appendChild(K.createElement("div")),
                n = K.createElement("input");
            n.setAttribute("type", "radio"), n.setAttribute("checked", "checked"), n.setAttribute("name", "t"), t.appendChild(n), G.checkClone = t.cloneNode(!0).cloneNode(!0).lastChild.checked, t.innerHTML = "<textarea>x</textarea>", G.noCloneChecked = !!t.cloneNode(!0).lastChild.defaultValue
        }();
        var Te = "undefined";
        G.focusinBubbles = "onfocusin" in e;
        var Se = /^key/,
            $e = /^(?:mouse|pointer|contextmenu)|click/,
            Ee = /^(?:focusinfocus|focusoutblur)$/,
            Ne = /^([^.]*)(?:\.(.+)|)$/;
        Z.event = {
            global: {},
            add: function(e, t, n, o, i) {
                var r, s, a, l, c, d, u, p, f, h, m, g = ve.get(e);
                if (g)
                    for (n.handler && (r = n, n = r.handler, i = r.selector), n.guid || (n.guid = Z.guid++), (l = g.events) || (l = g.events = {}), (s = g.handle) || (s = g.handle = function(t) {
                            return typeof Z !== Te && Z.event.triggered !== t.type ? Z.event.dispatch.apply(e, arguments) : void 0
                        }), t = (t || "").match(fe) || [""], c = t.length; c--;) a = Ne.exec(t[c]) || [], f = m = a[1], h = (a[2] || "").split(".").sort(), f && (u = Z.event.special[f] || {}, f = (i ? u.delegateType : u.bindType) || f, u = Z.event.special[f] || {}, d = Z.extend({
                        type: f,
                        origType: m,
                        data: o,
                        handler: n,
                        guid: n.guid,
                        selector: i,
                        needsContext: i && Z.expr.match.needsContext.test(i),
                        namespace: h.join(".")
                    }, r), (p = l[f]) || (p = l[f] = [], p.delegateCount = 0, u.setup && u.setup.call(e, o, h, s) !== !1 || e.addEventListener && e.addEventListener(f, s, !1)), u.add && (u.add.call(e, d), d.handler.guid || (d.handler.guid = n.guid)), i ? p.splice(p.delegateCount++, 0, d) : p.push(d), Z.event.global[f] = !0)
            },
            remove: function(e, t, n, o, i) {
                var r, s, a, l, c, d, u, p, f, h, m, g = ve.hasData(e) && ve.get(e);
                if (g && (l = g.events)) {
                    for (t = (t || "").match(fe) || [""], c = t.length; c--;)
                        if (a = Ne.exec(t[c]) || [], f = m = a[1], h = (a[2] || "").split(".").sort(), f) {
                            for (u = Z.event.special[f] || {}, f = (o ? u.delegateType : u.bindType) || f, p = l[f] || [], a = a[2] && new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)"), s = r = p.length; r--;) d = p[r], !i && m !== d.origType || n && n.guid !== d.guid || a && !a.test(d.namespace) || o && o !== d.selector && ("**" !== o || !d.selector) || (p.splice(r, 1), d.selector && p.delegateCount--, u.remove && u.remove.call(e, d));
                            s && !p.length && (u.teardown && u.teardown.call(e, h, g.handle) !== !1 || Z.removeEvent(e, f, g.handle), delete l[f])
                        } else
                            for (f in l) Z.event.remove(e, f + t[c], n, o, !0);
                    Z.isEmptyObject(l) && (delete g.handle, ve.remove(e, "events"))
                }
            },
            trigger: function(t, n, o, i) {
                var r, s, a, l, c, d, u, p = [o || K],
                    f = Y.call(t, "type") ? t.type : t,
                    h = Y.call(t, "namespace") ? t.namespace.split(".") : [];
                if (s = a = o = o || K, 3 !== o.nodeType && 8 !== o.nodeType && !Ee.test(f + Z.event.triggered) && (f.indexOf(".") >= 0 && (h = f.split("."), f = h.shift(), h.sort()), c = f.indexOf(":") < 0 && "on" + f, t = t[Z.expando] ? t : new Z.Event(f, "object" == typeof t && t), t.isTrigger = i ? 2 : 3, t.namespace = h.join("."), t.namespace_re = t.namespace ? new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, t.result = void 0, t.target || (t.target = o), n = null == n ? [t] : Z.makeArray(n, [t]), u = Z.event.special[f] || {}, i || !u.trigger || u.trigger.apply(o, n) !== !1)) {
                    if (!i && !u.noBubble && !Z.isWindow(o)) {
                        for (l = u.delegateType || f, Ee.test(l + f) || (s = s.parentNode); s; s = s.parentNode) p.push(s), a = s;
                        a === (o.ownerDocument || K) && p.push(a.defaultView || a.parentWindow || e)
                    }
                    for (r = 0;
                        (s = p[r++]) && !t.isPropagationStopped();) t.type = r > 1 ? l : u.bindType || f, d = (ve.get(s, "events") || {})[t.type] && ve.get(s, "handle"), d && d.apply(s, n), d = c && s[c], d && d.apply && Z.acceptData(s) && (t.result = d.apply(s, n), t.result === !1 && t.preventDefault());
                    return t.type = f, i || t.isDefaultPrevented() || u._default && u._default.apply(p.pop(), n) !== !1 || !Z.acceptData(o) || c && Z.isFunction(o[f]) && !Z.isWindow(o) && (a = o[c], a && (o[c] = null), Z.event.triggered = f, o[f](), Z.event.triggered = void 0, a && (o[c] = a)), t.result
                }
            },
            dispatch: function(e) {
                e = Z.event.fix(e);
                var t, n, o, i, r, s = [],
                    a = q.call(arguments),
                    l = (ve.get(this, "events") || {})[e.type] || [],
                    c = Z.event.special[e.type] || {};
                if (a[0] = e, e.delegateTarget = this, !c.preDispatch || c.preDispatch.call(this, e) !== !1) {
                    for (s = Z.event.handlers.call(this, e, l), t = 0;
                        (i = s[t++]) && !e.isPropagationStopped();)
                        for (e.currentTarget = i.elem, n = 0;
                            (r = i.handlers[n++]) && !e.isImmediatePropagationStopped();)(!e.namespace_re || e.namespace_re.test(r.namespace)) && (e.handleObj = r, e.data = r.data, o = ((Z.event.special[r.origType] || {}).handle || r.handler).apply(i.elem, a), void 0 !== o && (e.result = o) === !1 && (e.preventDefault(), e.stopPropagation()));
                    return c.postDispatch && c.postDispatch.call(this, e), e.result
                }
            },
            handlers: function(e, t) {
                var n, o, i, r, s = [],
                    a = t.delegateCount,
                    l = e.target;
                if (a && l.nodeType && (!e.button || "click" !== e.type))
                    for (; l !== this; l = l.parentNode || this)
                        if (l.disabled !== !0 || "click" !== e.type) {
                            for (o = [], n = 0; a > n; n++) r = t[n], i = r.selector + " ", void 0 === o[i] && (o[i] = r.needsContext ? Z(i, this).index(l) >= 0 : Z.find(i, this, null, [l]).length), o[i] && o.push(r);
                            o.length && s.push({
                                elem: l,
                                handlers: o
                            })
                        }
                return a < t.length && s.push({
                    elem: this,
                    handlers: t.slice(a)
                }), s
            },
            props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
            fixHooks: {},
            keyHooks: {
                props: "char charCode key keyCode".split(" "),
                filter: function(e, t) {
                    return null == e.which && (e.which = null != t.charCode ? t.charCode : t.keyCode), e
                }
            },
            mouseHooks: {
                props: "button buttons clientX clientY offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
                filter: function(e, t) {
                    var n, o, i, r = t.button;
                    return null == e.pageX && null != t.clientX && (n = e.target.ownerDocument || K, o = n.documentElement, i = n.body, e.pageX = t.clientX + (o && o.scrollLeft || i && i.scrollLeft || 0) - (o && o.clientLeft || i && i.clientLeft || 0), e.pageY = t.clientY + (o && o.scrollTop || i && i.scrollTop || 0) - (o && o.clientTop || i && i.clientTop || 0)), e.which || void 0 === r || (e.which = 1 & r ? 1 : 2 & r ? 3 : 4 & r ? 2 : 0), e
                }
            },
            fix: function(e) {
                if (e[Z.expando]) return e;
                var t, n, o, i = e.type,
                    r = e,
                    s = this.fixHooks[i];
                for (s || (this.fixHooks[i] = s = $e.test(i) ? this.mouseHooks : Se.test(i) ? this.keyHooks : {}), o = s.props ? this.props.concat(s.props) : this.props, e = new Z.Event(r), t = o.length; t--;) n = o[t], e[n] = r[n];
                return e.target || (e.target = K), 3 === e.target.nodeType && (e.target = e.target.parentNode), s.filter ? s.filter(e, r) : e
            },
            special: {
                load: {
                    noBubble: !0
                },
                focus: {
                    trigger: function() {
                        return this !== u() && this.focus ? (this.focus(), !1) : void 0
                    },
                    delegateType: "focusin"
                },
                blur: {
                    trigger: function() {
                        return this === u() && this.blur ? (this.blur(), !1) : void 0
                    },
                    delegateType: "focusout"
                },
                click: {
                    trigger: function() {
                        return "checkbox" === this.type && this.click && Z.nodeName(this, "input") ? (this.click(), !1) : void 0
                    },
                    _default: function(e) {
                        return Z.nodeName(e.target, "a")
                    }
                },
                beforeunload: {
                    postDispatch: function(e) {
                        void 0 !== e.result && e.originalEvent && (e.originalEvent.returnValue = e.result)
                    }
                }
            },
            simulate: function(e, t, n, o) {
                var i = Z.extend(new Z.Event, n, {
                    type: e,
                    isSimulated: !0,
                    originalEvent: {}
                });
                o ? Z.event.trigger(i, null, t) : Z.event.dispatch.call(t, i), i.isDefaultPrevented() && n.preventDefault()
            }
        }, Z.removeEvent = function(e, t, n) {
            e.removeEventListener && e.removeEventListener(t, n, !1)
        }, Z.Event = function(e, t) {
            return this instanceof Z.Event ? (e && e.type ? (this.originalEvent = e, this.type = e.type, this.isDefaultPrevented = e.defaultPrevented || void 0 === e.defaultPrevented && e.returnValue === !1 ? c : d) : this.type = e, t && Z.extend(this, t), this.timeStamp = e && e.timeStamp || Z.now(), void(this[Z.expando] = !0)) : new Z.Event(e, t)
        }, Z.Event.prototype = {
            isDefaultPrevented: d,
            isPropagationStopped: d,
            isImmediatePropagationStopped: d,
            preventDefault: function() {
                var e = this.originalEvent;
                this.isDefaultPrevented = c, e && e.preventDefault && e.preventDefault()
            },
            stopPropagation: function() {
                var e = this.originalEvent;
                this.isPropagationStopped = c, e && e.stopPropagation && e.stopPropagation()
            },
            stopImmediatePropagation: function() {
                var e = this.originalEvent;
                this.isImmediatePropagationStopped = c, e && e.stopImmediatePropagation && e.stopImmediatePropagation(), this.stopPropagation()
            }
        }, Z.each({
            mouseenter: "mouseover",
            mouseleave: "mouseout",
            pointerenter: "pointerover",
            pointerleave: "pointerout"
        }, function(e, t) {
            Z.event.special[e] = {
                delegateType: t,
                bindType: t,
                handle: function(e) {
                    var n, o = this,
                        i = e.relatedTarget,
                        r = e.handleObj;
                    return (!i || i !== o && !Z.contains(o, i)) && (e.type = r.origType, n = r.handler.apply(this, arguments), e.type = t), n
                }
            }
        }), G.focusinBubbles || Z.each({
            focus: "focusin",
            blur: "focusout"
        }, function(e, t) {
            var n = function(e) {
                Z.event.simulate(t, e.target, Z.event.fix(e), !0)
            };
            Z.event.special[t] = {
                setup: function() {
                    var o = this.ownerDocument || this,
                        i = ve.access(o, t);
                    i || o.addEventListener(e, n, !0), ve.access(o, t, (i || 0) + 1)
                },
                teardown: function() {
                    var o = this.ownerDocument || this,
                        i = ve.access(o, t) - 1;
                    i ? ve.access(o, t, i) : (o.removeEventListener(e, n, !0), ve.remove(o, t))
                }
            }
        }), Z.fn.extend({
            on: function(e, t, n, o, i) {
                var r, s;
                if ("object" == typeof e) {
                    "string" != typeof t && (n = n || t, t = void 0);
                    for (s in e) this.on(s, t, n, e[s], i);
                    return this
                }
                if (null == n && null == o ? (o = t, n = t = void 0) : null == o && ("string" == typeof t ? (o = n, n = void 0) : (o = n, n = t, t = void 0)), o === !1) o = d;
                else if (!o) return this;
                return 1 === i && (r = o, o = function(e) {
                    return Z().off(e), r.apply(this, arguments)
                }, o.guid = r.guid || (r.guid = Z.guid++)), this.each(function() {
                    Z.event.add(this, e, o, n, t)
                })
            },
            one: function(e, t, n, o) {
                return this.on(e, t, n, o, 1)
            },
            off: function(e, t, n) {
                var o, i;
                if (e && e.preventDefault && e.handleObj) return o = e.handleObj, Z(e.delegateTarget).off(o.namespace ? o.origType + "." + o.namespace : o.origType, o.selector, o.handler), this;
                if ("object" == typeof e) {
                    for (i in e) this.off(i, t, e[i]);
                    return this
                }
                return (t === !1 || "function" == typeof t) && (n = t, t = void 0), n === !1 && (n = d), this.each(function() {
                    Z.event.remove(this, e, n, t)
                })
            },
            trigger: function(e, t) {
                return this.each(function() {
                    Z.event.trigger(e, t, this)
                })
            },
            triggerHandler: function(e, t) {
                var n = this[0];
                return n ? Z.event.trigger(e, t, n, !0) : void 0
            }
        });
        var Re = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,
            Ae = /<([\w:]+)/,
            De = /<|&#?\w+;/,
            Oe = /<(?:script|style|link)/i,
            je = /checked\s*(?:[^=]|=\s*.checked.)/i,
            Ie = /^$|\/(?:java|ecma)script/i,
            Pe = /^true\/(.*)/,
            Le = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,
            He = {
                option: [1, "<select multiple='multiple'>", "</select>"],
                thead: [1, "<table>", "</table>"],
                col: [2, "<table><colgroup>", "</colgroup></table>"],
                tr: [2, "<table><tbody>", "</tbody></table>"],
                td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
                _default: [0, "", ""]
            };
        He.optgroup = He.option, He.tbody = He.tfoot = He.colgroup = He.caption = He.thead, He.th = He.td, Z.extend({
            clone: function(e, t, n) {
                var o, i, r, s, a = e.cloneNode(!0),
                    l = Z.contains(e.ownerDocument, e);
                if (!(G.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || Z.isXMLDoc(e)))
                    for (s = v(a), r = v(e), o = 0, i = r.length; i > o; o++) y(r[o], s[o]);
                if (t)
                    if (n)
                        for (r = r || v(e), s = s || v(a), o = 0, i = r.length; i > o; o++) g(r[o], s[o]);
                    else g(e, a);
                return s = v(a, "script"), s.length > 0 && m(s, !l && v(e, "script")), a
            },
            buildFragment: function(e, t, n, o) {
                for (var i, r, s, a, l, c, d = t.createDocumentFragment(), u = [], p = 0, f = e.length; f > p; p++)
                    if (i = e[p], i || 0 === i)
                        if ("object" === Z.type(i)) Z.merge(u, i.nodeType ? [i] : i);
                        else if (De.test(i)) {
                    for (r = r || d.appendChild(t.createElement("div")), s = (Ae.exec(i) || ["", ""])[1].toLowerCase(), a = He[s] || He._default, r.innerHTML = a[1] + i.replace(Re, "<$1></$2>") + a[2], c = a[0]; c--;) r = r.lastChild;
                    Z.merge(u, r.childNodes), r = d.firstChild, r.textContent = ""
                } else u.push(t.createTextNode(i));
                for (d.textContent = "", p = 0; i = u[p++];)
                    if ((!o || -1 === Z.inArray(i, o)) && (l = Z.contains(i.ownerDocument, i), r = v(d.appendChild(i), "script"), l && m(r), n))
                        for (c = 0; i = r[c++];) Ie.test(i.type || "") && n.push(i);
                return d
            },
            cleanData: function(e) {
                for (var t, n, o, i, r = Z.event.special, s = 0; void 0 !== (n = e[s]); s++) {
                    if (Z.acceptData(n) && (i = n[ve.expando], i && (t = ve.cache[i]))) {
                        if (t.events)
                            for (o in t.events) r[o] ? Z.event.remove(n, o) : Z.removeEvent(n, o, t.handle);
                        ve.cache[i] && delete ve.cache[i]
                    }
                    delete ye.cache[n[ye.expando]]
                }
            }
        }), Z.fn.extend({
            text: function(e) {
                return ge(this, function(e) {
                    return void 0 === e ? Z.text(this) : this.empty().each(function() {
                        (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) && (this.textContent = e)
                    })
                }, null, e, arguments.length)
            },
            append: function() {
                return this.domManip(arguments, function(e) {
                    if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                        var t = p(this, e);
                        t.appendChild(e)
                    }
                })
            },
            prepend: function() {
                return this.domManip(arguments, function(e) {
                    if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                        var t = p(this, e);
                        t.insertBefore(e, t.firstChild)
                    }
                })
            },
            before: function() {
                return this.domManip(arguments, function(e) {
                    this.parentNode && this.parentNode.insertBefore(e, this)
                })
            },
            after: function() {
                return this.domManip(arguments, function(e) {
                    this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
                })
            },
            remove: function(e, t) {
                for (var n, o = e ? Z.filter(e, this) : this, i = 0; null != (n = o[i]); i++) t || 1 !== n.nodeType || Z.cleanData(v(n)), n.parentNode && (t && Z.contains(n.ownerDocument, n) && m(v(n, "script")), n.parentNode.removeChild(n));
                return this
            },
            empty: function() {
                for (var e, t = 0; null != (e = this[t]); t++) 1 === e.nodeType && (Z.cleanData(v(e, !1)), e.textContent = "");
                return this
            },
            clone: function(e, t) {
                return e = null == e ? !1 : e, t = null == t ? e : t, this.map(function() {
                    return Z.clone(this, e, t)
                })
            },
            html: function(e) {
                return ge(this, function(e) {
                    var t = this[0] || {},
                        n = 0,
                        o = this.length;
                    if (void 0 === e && 1 === t.nodeType) return t.innerHTML;
                    if ("string" == typeof e && !Oe.test(e) && !He[(Ae.exec(e) || ["", ""])[1].toLowerCase()]) {
                        e = e.replace(Re, "<$1></$2>");
                        try {
                            for (; o > n; n++) t = this[n] || {}, 1 === t.nodeType && (Z.cleanData(v(t, !1)), t.innerHTML = e);
                            t = 0
                        } catch (i) {}
                    }
                    t && this.empty().append(e)
                }, null, e, arguments.length)
            },
            replaceWith: function() {
                var e = arguments[0];
                return this.domManip(arguments, function(t) {
                    e = this.parentNode, Z.cleanData(v(this)), e && e.replaceChild(t, this)
                }), e && (e.length || e.nodeType) ? this : this.remove()
            },
            detach: function(e) {
                return this.remove(e, !0)
            },
            domManip: function(e, t) {
                e = B.apply([], e);
                var n, o, i, r, s, a, l = 0,
                    c = this.length,
                    d = this,
                    u = c - 1,
                    p = e[0],
                    m = Z.isFunction(p);
                if (m || c > 1 && "string" == typeof p && !G.checkClone && je.test(p)) return this.each(function(n) {
                    var o = d.eq(n);
                    m && (e[0] = p.call(this, n, o.html())), o.domManip(e, t)
                });
                if (c && (n = Z.buildFragment(e, this[0].ownerDocument, !1, this), o = n.firstChild, 1 === n.childNodes.length && (n = o), o)) {
                    for (i = Z.map(v(n, "script"), f), r = i.length; c > l; l++) s = n, l !== u && (s = Z.clone(s, !0, !0), r && Z.merge(i, v(s, "script"))), t.call(this[l], s, l);
                    if (r)
                        for (a = i[i.length - 1].ownerDocument, Z.map(i, h), l = 0; r > l; l++) s = i[l], Ie.test(s.type || "") && !ve.access(s, "globalEval") && Z.contains(a, s) && (s.src ? Z._evalUrl && Z._evalUrl(s.src) : Z.globalEval(s.textContent.replace(Le, "")))
                }
                return this
            }
        }), Z.each({
            appendTo: "append",
            prependTo: "prepend",
            insertBefore: "before",
            insertAfter: "after",
            replaceAll: "replaceWith"
        }, function(e, t) {
            Z.fn[e] = function(e) {
                for (var n, o = [], i = Z(e), r = i.length - 1, s = 0; r >= s; s++) n = s === r ? this : this.clone(!0), Z(i[s])[t](n), U.apply(o, n.get());
                return this.pushStack(o)
            }
        });
        var Fe, Me = {},
            ze = /^margin/,
            We = new RegExp("^(" + _e + ")(?!px)[a-z%]+$", "i"),
            qe = function(t) {
                return t.ownerDocument.defaultView.opener ? t.ownerDocument.defaultView.getComputedStyle(t, null) : e.getComputedStyle(t, null)
            };
        ! function() {
            function t() {
                s.style.cssText = "-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;margin-top:1%;top:1%;border:1px;padding:1px;width:4px;position:absolute", s.innerHTML = "", i.appendChild(r);
                var t = e.getComputedStyle(s, null);
                n = "1%" !== t.top, o = "4px" === t.width, i.removeChild(r)
            }
            var n, o, i = K.documentElement,
                r = K.createElement("div"),
                s = K.createElement("div");
            s.style && (s.style.backgroundClip = "content-box", s.cloneNode(!0).style.backgroundClip = "", G.clearCloneStyle = "content-box" === s.style.backgroundClip, r.style.cssText = "border:0;width:0;height:0;top:0;left:-9999px;margin-top:1px;position:absolute", r.appendChild(s), e.getComputedStyle && Z.extend(G, {
                pixelPosition: function() {
                    return t(), n
                },
                boxSizingReliable: function() {
                    return null == o && t(), o
                },
                reliableMarginRight: function() {
                    var t, n = s.appendChild(K.createElement("div"));
                    return n.style.cssText = s.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0", n.style.marginRight = n.style.width = "0", s.style.width = "1px", i.appendChild(r), t = !parseFloat(e.getComputedStyle(n, null).marginRight), i.removeChild(r), s.removeChild(n), t
                }
            }))
        }(), Z.swap = function(e, t, n, o) {
            var i, r, s = {};
            for (r in t) s[r] = e.style[r], e.style[r] = t[r];
            i = n.apply(e, o || []);
            for (r in t) e.style[r] = s[r];
            return i
        };
        var Be = /^(none|table(?!-c[ea]).+)/,
            Ue = new RegExp("^(" + _e + ")(.*)$", "i"),
            Qe = new RegExp("^([+-])=(" + _e + ")", "i"),
            Ve = {
                position: "absolute",
                visibility: "hidden",
                display: "block"
            },
            Xe = {
                letterSpacing: "0",
                fontWeight: "400"
            },
            Ye = ["Webkit", "O", "Moz", "ms"];
        Z.extend({
            cssHooks: {
                opacity: {
                    get: function(e, t) {
                        if (t) {
                            var n = _(e, "opacity");
                            return "" === n ? "1" : n
                        }
                    }
                }
            },
            cssNumber: {
                columnCount: !0,
                fillOpacity: !0,
                flexGrow: !0,
                flexShrink: !0,
                fontWeight: !0,
                lineHeight: !0,
                opacity: !0,
                order: !0,
                orphans: !0,
                widows: !0,
                zIndex: !0,
                zoom: !0
            },
            cssProps: {
                "float": "cssFloat"
            },
            style: function(e, t, n, o) {
                if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
                    var i, r, s, a = Z.camelCase(t),
                        l = e.style;
                    return t = Z.cssProps[a] || (Z.cssProps[a] = C(l, a)), s = Z.cssHooks[t] || Z.cssHooks[a], void 0 === n ? s && "get" in s && void 0 !== (i = s.get(e, !1, o)) ? i : l[t] : (r = typeof n, "string" === r && (i = Qe.exec(n)) && (n = (i[1] + 1) * i[2] + parseFloat(Z.css(e, t)), r = "number"), null != n && n === n && ("number" !== r || Z.cssNumber[a] || (n += "px"), G.clearCloneStyle || "" !== n || 0 !== t.indexOf("background") || (l[t] = "inherit"), s && "set" in s && void 0 === (n = s.set(e, n, o)) || (l[t] = n)), void 0)
                }
            },
            css: function(e, t, n, o) {
                var i, r, s, a = Z.camelCase(t);
                return t = Z.cssProps[a] || (Z.cssProps[a] = C(e.style, a)), s = Z.cssHooks[t] || Z.cssHooks[a], s && "get" in s && (i = s.get(e, !0, n)), void 0 === i && (i = _(e, t, o)), "normal" === i && t in Xe && (i = Xe[t]), "" === n || n ? (r = parseFloat(i), n === !0 || Z.isNumeric(r) ? r || 0 : i) : i
            }
        }), Z.each(["height", "width"], function(e, t) {
            Z.cssHooks[t] = {
                get: function(e, n, o) {
                    return n ? Be.test(Z.css(e, "display")) && 0 === e.offsetWidth ? Z.swap(e, Ve, function() {
                        return S(e, t, o)
                    }) : S(e, t, o) : void 0
                },
                set: function(e, n, o) {
                    var i = o && qe(e);
                    return k(e, n, o ? T(e, t, o, "border-box" === Z.css(e, "boxSizing", !1, i), i) : 0)
                }
            }
        }), Z.cssHooks.marginRight = x(G.reliableMarginRight, function(e, t) {
            return t ? Z.swap(e, {
                display: "inline-block"
            }, _, [e, "marginRight"]) : void 0
        }), Z.each({
            margin: "",
            padding: "",
            border: "Width"
        }, function(e, t) {
            Z.cssHooks[e + t] = {
                expand: function(n) {
                    for (var o = 0, i = {}, r = "string" == typeof n ? n.split(" ") : [n]; 4 > o; o++) i[e + xe[o] + t] = r[o] || r[o - 2] || r[0];
                    return i
                }
            }, ze.test(e) || (Z.cssHooks[e + t].set = k)
        }), Z.fn.extend({
            css: function(e, t) {
                return ge(this, function(e, t, n) {
                    var o, i, r = {},
                        s = 0;
                    if (Z.isArray(t)) {
                        for (o = qe(e), i = t.length; i > s; s++) r[t[s]] = Z.css(e, t[s], !1, o);
                        return r
                    }
                    return void 0 !== n ? Z.style(e, t, n) : Z.css(e, t)
                }, e, t, arguments.length > 1)
            },
            show: function() {
                return $(this, !0)
            },
            hide: function() {
                return $(this)
            },
            toggle: function(e) {
                return "boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function() {
                    Ce(this) ? Z(this).show() : Z(this).hide()
                })
            }
        }), Z.Tween = E, E.prototype = {
            constructor: E,
            init: function(e, t, n, o, i, r) {
                this.elem = e, this.prop = n, this.easing = i || "swing", this.options = t, this.start = this.now = this.cur(), this.end = o, this.unit = r || (Z.cssNumber[n] ? "" : "px")
            },
            cur: function() {
                var e = E.propHooks[this.prop];
                return e && e.get ? e.get(this) : E.propHooks._default.get(this)
            },
            run: function(e) {
                var t, n = E.propHooks[this.prop];
                return this.options.duration ? this.pos = t = Z.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : this.pos = t = e, this.now = (this.end - this.start) * t + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), n && n.set ? n.set(this) : E.propHooks._default.set(this), this
            }
        }, E.prototype.init.prototype = E.prototype, E.propHooks = {
            _default: {
                get: function(e) {
                    var t;
                    return null == e.elem[e.prop] || e.elem.style && null != e.elem.style[e.prop] ? (t = Z.css(e.elem, e.prop, ""), t && "auto" !== t ? t : 0) : e.elem[e.prop]
                },
                set: function(e) {
                    Z.fx.step[e.prop] ? Z.fx.step[e.prop](e) : e.elem.style && (null != e.elem.style[Z.cssProps[e.prop]] || Z.cssHooks[e.prop]) ? Z.style(e.elem, e.prop, e.now + e.unit) : e.elem[e.prop] = e.now
                }
            }
        }, E.propHooks.scrollTop = E.propHooks.scrollLeft = {
            set: function(e) {
                e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
            }
        }, Z.easing = {
            linear: function(e) {
                return e
            },
            swing: function(e) {
                return .5 - Math.cos(e * Math.PI) / 2
            }
        }, Z.fx = E.prototype.init, Z.fx.step = {};
        var Ge, Ke, Je = /^(?:toggle|show|hide)$/,
            Ze = new RegExp("^(?:([+-])=|)(" + _e + ")([a-z%]*)$", "i"),
            et = /queueHooks$/,
            tt = [D],
            nt = {
                "*": [function(e, t) {
                    var n = this.createTween(e, t),
                        o = n.cur(),
                        i = Ze.exec(t),
                        r = i && i[3] || (Z.cssNumber[e] ? "" : "px"),
                        s = (Z.cssNumber[e] || "px" !== r && +o) && Ze.exec(Z.css(n.elem, e)),
                        a = 1,
                        l = 20;
                    if (s && s[3] !== r) {
                        r = r || s[3], i = i || [], s = +o || 1;
                        do a = a || ".5", s /= a, Z.style(n.elem, e, s + r); while (a !== (a = n.cur() / o) && 1 !== a && --l)
                    }
                    return i && (s = n.start = +s || +o || 0, n.unit = r, n.end = i[1] ? s + (i[1] + 1) * i[2] : +i[2]), n
                }]
            };
        Z.Animation = Z.extend(j, {
                tweener: function(e, t) {
                    Z.isFunction(e) ? (t = e, e = ["*"]) : e = e.split(" ");
                    for (var n, o = 0, i = e.length; i > o; o++) n = e[o], nt[n] = nt[n] || [], nt[n].unshift(t)
                },
                prefilter: function(e, t) {
                    t ? tt.unshift(e) : tt.push(e)
                }
            }), Z.speed = function(e, t, n) {
                var o = e && "object" == typeof e ? Z.extend({}, e) : {
                    complete: n || !n && t || Z.isFunction(e) && e,
                    duration: e,
                    easing: n && t || t && !Z.isFunction(t) && t
                };
                return o.duration = Z.fx.off ? 0 : "number" == typeof o.duration ? o.duration : o.duration in Z.fx.speeds ? Z.fx.speeds[o.duration] : Z.fx.speeds._default, (null == o.queue || o.queue === !0) && (o.queue = "fx"), o.old = o.complete, o.complete = function() {
                    Z.isFunction(o.old) && o.old.call(this), o.queue && Z.dequeue(this, o.queue)
                }, o
            }, Z.fn.extend({
                fadeTo: function(e, t, n, o) {
                    return this.filter(Ce).css("opacity", 0).show().end().animate({
                        opacity: t
                    }, e, n, o)
                },
                animate: function(e, t, n, o) {
                    var i = Z.isEmptyObject(e),
                        r = Z.speed(t, n, o),
                        s = function() {
                            var t = j(this, Z.extend({}, e), r);
                            (i || ve.get(this, "finish")) && t.stop(!0)
                        };
                    return s.finish = s, i || r.queue === !1 ? this.each(s) : this.queue(r.queue, s)
                },
                stop: function(e, t, n) {
                    var o = function(e) {
                        var t = e.stop;
                        delete e.stop, t(n)
                    };
                    return "string" != typeof e && (n = t, t = e, e = void 0), t && e !== !1 && this.queue(e || "fx", []), this.each(function() {
                        var t = !0,
                            i = null != e && e + "queueHooks",
                            r = Z.timers,
                            s = ve.get(this);
                        if (i) s[i] && s[i].stop && o(s[i]);
                        else
                            for (i in s) s[i] && s[i].stop && et.test(i) && o(s[i]);
                        for (i = r.length; i--;) r[i].elem !== this || null != e && r[i].queue !== e || (r[i].anim.stop(n), t = !1, r.splice(i, 1));
                        (t || !n) && Z.dequeue(this, e)
                    })
                },
                finish: function(e) {
                    return e !== !1 && (e = e || "fx"), this.each(function() {
                        var t, n = ve.get(this),
                            o = n[e + "queue"],
                            i = n[e + "queueHooks"],
                            r = Z.timers,
                            s = o ? o.length : 0;
                        for (n.finish = !0, Z.queue(this, e, []), i && i.stop && i.stop.call(this, !0), t = r.length; t--;) r[t].elem === this && r[t].queue === e && (r[t].anim.stop(!0), r.splice(t, 1));
                        for (t = 0; s > t; t++) o[t] && o[t].finish && o[t].finish.call(this);
                        delete n.finish
                    })
                }
            }), Z.each(["toggle", "show", "hide"], function(e, t) {
                var n = Z.fn[t];
                Z.fn[t] = function(e, o, i) {
                    return null == e || "boolean" == typeof e ? n.apply(this, arguments) : this.animate(R(t, !0), e, o, i)
                }
            }), Z.each({
                slideDown: R("show"),
                slideUp: R("hide"),
                slideToggle: R("toggle"),
                fadeIn: {
                    opacity: "show"
                },
                fadeOut: {
                    opacity: "hide"
                },
                fadeToggle: {
                    opacity: "toggle"
                }
            }, function(e, t) {
                Z.fn[e] = function(e, n, o) {
                    return this.animate(t, e, n, o)
                }
            }), Z.timers = [], Z.fx.tick = function() {
                var e, t = 0,
                    n = Z.timers;
                for (Ge = Z.now(); t < n.length; t++) e = n[t], e() || n[t] !== e || n.splice(t--, 1);
                n.length || Z.fx.stop(), Ge = void 0
            }, Z.fx.timer = function(e) {
                Z.timers.push(e), e() ? Z.fx.start() : Z.timers.pop()
            }, Z.fx.interval = 13, Z.fx.start = function() {
                Ke || (Ke = setInterval(Z.fx.tick, Z.fx.interval))
            }, Z.fx.stop = function() {
                clearInterval(Ke), Ke = null
            }, Z.fx.speeds = {
                slow: 600,
                fast: 200,
                _default: 400
            }, Z.fn.delay = function(e, t) {
                return e = Z.fx ? Z.fx.speeds[e] || e : e, t = t || "fx", this.queue(t, function(t, n) {
                    var o = setTimeout(t, e);
                    n.stop = function() {
                        clearTimeout(o)
                    }
                })
            },
            function() {
                var e = K.createElement("input"),
                    t = K.createElement("select"),
                    n = t.appendChild(K.createElement("option"));
                e.type = "checkbox", G.checkOn = "" !== e.value, G.optSelected = n.selected, t.disabled = !0, G.optDisabled = !n.disabled, e = K.createElement("input"), e.value = "t", e.type = "radio", G.radioValue = "t" === e.value
            }();
        var ot, it, rt = Z.expr.attrHandle;
        Z.fn.extend({
            attr: function(e, t) {
                return ge(this, Z.attr, e, t, arguments.length > 1)
            },
            removeAttr: function(e) {
                return this.each(function() {
                    Z.removeAttr(this, e)
                })
            }
        }), Z.extend({
            attr: function(e, t, n) {
                var o, i, r = e.nodeType;
                if (e && 3 !== r && 8 !== r && 2 !== r) return typeof e.getAttribute === Te ? Z.prop(e, t, n) : (1 === r && Z.isXMLDoc(e) || (t = t.toLowerCase(), o = Z.attrHooks[t] || (Z.expr.match.bool.test(t) ? it : ot)), void 0 === n ? o && "get" in o && null !== (i = o.get(e, t)) ? i : (i = Z.find.attr(e, t), null == i ? void 0 : i) : null !== n ? o && "set" in o && void 0 !== (i = o.set(e, n, t)) ? i : (e.setAttribute(t, n + ""), n) : void Z.removeAttr(e, t))
            },
            removeAttr: function(e, t) {
                var n, o, i = 0,
                    r = t && t.match(fe);
                if (r && 1 === e.nodeType)
                    for (; n = r[i++];) o = Z.propFix[n] || n, Z.expr.match.bool.test(n) && (e[o] = !1), e.removeAttribute(n)
            },
            attrHooks: {
                type: {
                    set: function(e, t) {
                        if (!G.radioValue && "radio" === t && Z.nodeName(e, "input")) {
                            var n = e.value;
                            return e.setAttribute("type", t), n && (e.value = n), t
                        }
                    }
                }
            }
        }), it = {
            set: function(e, t, n) {
                return t === !1 ? Z.removeAttr(e, n) : e.setAttribute(n, n), n
            }
        }, Z.each(Z.expr.match.bool.source.match(/\w+/g), function(e, t) {
            var n = rt[t] || Z.find.attr;
            rt[t] = function(e, t, o) {
                var i, r;
                return o || (r = rt[t], rt[t] = i, i = null != n(e, t, o) ? t.toLowerCase() : null, rt[t] = r), i
            }
        });
        var st = /^(?:input|select|textarea|button)$/i;
        Z.fn.extend({
            prop: function(e, t) {
                return ge(this, Z.prop, e, t, arguments.length > 1)
            },
            removeProp: function(e) {
                return this.each(function() {
                    delete this[Z.propFix[e] || e]
                })
            }
        }), Z.extend({
            propFix: {
                "for": "htmlFor",
                "class": "className"
            },
            prop: function(e, t, n) {
                var o, i, r, s = e.nodeType;
                if (e && 3 !== s && 8 !== s && 2 !== s) return r = 1 !== s || !Z.isXMLDoc(e), r && (t = Z.propFix[t] || t, i = Z.propHooks[t]), void 0 !== n ? i && "set" in i && void 0 !== (o = i.set(e, n, t)) ? o : e[t] = n : i && "get" in i && null !== (o = i.get(e, t)) ? o : e[t]
            },
            propHooks: {
                tabIndex: {
                    get: function(e) {
                        return e.hasAttribute("tabindex") || st.test(e.nodeName) || e.href ? e.tabIndex : -1
                    }
                }
            }
        }), G.optSelected || (Z.propHooks.selected = {
            get: function(e) {
                var t = e.parentNode;
                return t && t.parentNode && t.parentNode.selectedIndex, null
            }
        }), Z.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function() {
            Z.propFix[this.toLowerCase()] = this
        });
        var at = /[\t\r\n\f]/g;
        Z.fn.extend({
            addClass: function(e) {
                var t, n, o, i, r, s, a = "string" == typeof e && e,
                    l = 0,
                    c = this.length;
                if (Z.isFunction(e)) return this.each(function(t) {
                    Z(this).addClass(e.call(this, t, this.className))
                });
                if (a)
                    for (t = (e || "").match(fe) || []; c > l; l++)
                        if (n = this[l], o = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace(at, " ") : " ")) {
                            for (r = 0; i = t[r++];) o.indexOf(" " + i + " ") < 0 && (o += i + " ");
                            s = Z.trim(o), n.className !== s && (n.className = s)
                        }
                return this
            },
            removeClass: function(e) {
                var t, n, o, i, r, s, a = 0 === arguments.length || "string" == typeof e && e,
                    l = 0,
                    c = this.length;
                if (Z.isFunction(e)) return this.each(function(t) {
                    Z(this).removeClass(e.call(this, t, this.className))
                });
                if (a)
                    for (t = (e || "").match(fe) || []; c > l; l++)
                        if (n = this[l], o = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace(at, " ") : "")) {
                            for (r = 0; i = t[r++];)
                                for (; o.indexOf(" " + i + " ") >= 0;) o = o.replace(" " + i + " ", " ");
                            s = e ? Z.trim(o) : "", n.className !== s && (n.className = s)
                        }
                return this
            },
            toggleClass: function(e, t) {
                var n = typeof e;
                return "boolean" == typeof t && "string" === n ? t ? this.addClass(e) : this.removeClass(e) : Z.isFunction(e) ? this.each(function(n) {
                    Z(this).toggleClass(e.call(this, n, this.className, t), t)
                }) : this.each(function() {
                    if ("string" === n)
                        for (var t, o = 0, i = Z(this), r = e.match(fe) || []; t = r[o++];) i.hasClass(t) ? i.removeClass(t) : i.addClass(t);
                    else(n === Te || "boolean" === n) && (this.className && ve.set(this, "__className__", this.className), this.className = this.className || e === !1 ? "" : ve.get(this, "__className__") || "")
                })
            },
            hasClass: function(e) {
                for (var t = " " + e + " ", n = 0, o = this.length; o > n; n++)
                    if (1 === this[n].nodeType && (" " + this[n].className + " ").replace(at, " ").indexOf(t) >= 0) return !0;
                return !1
            }
        });
        var lt = /\r/g;
        Z.fn.extend({
            val: function(e) {
                var t, n, o, i = this[0]; {
                    if (arguments.length) return o = Z.isFunction(e), this.each(function(n) {
                        var i;
                        1 === this.nodeType && (i = o ? e.call(this, n, Z(this).val()) : e, null == i ? i = "" : "number" == typeof i ? i += "" : Z.isArray(i) && (i = Z.map(i, function(e) {
                            return null == e ? "" : e + ""
                        })), t = Z.valHooks[this.type] || Z.valHooks[this.nodeName.toLowerCase()], t && "set" in t && void 0 !== t.set(this, i, "value") || (this.value = i))
                    });
                    if (i) return t = Z.valHooks[i.type] || Z.valHooks[i.nodeName.toLowerCase()], t && "get" in t && void 0 !== (n = t.get(i, "value")) ? n : (n = i.value, "string" == typeof n ? n.replace(lt, "") : null == n ? "" : n)
                }
            }
        }), Z.extend({
            valHooks: {
                option: {
                    get: function(e) {
                        var t = Z.find.attr(e, "value");
                        return null != t ? t : Z.trim(Z.text(e))
                    }
                },
                select: {
                    get: function(e) {
                        for (var t, n, o = e.options, i = e.selectedIndex, r = "select-one" === e.type || 0 > i, s = r ? null : [], a = r ? i + 1 : o.length, l = 0 > i ? a : r ? i : 0; a > l; l++)
                            if (n = o[l], (n.selected || l === i) && (G.optDisabled ? !n.disabled : null === n.getAttribute("disabled")) && (!n.parentNode.disabled || !Z.nodeName(n.parentNode, "optgroup"))) {
                                if (t = Z(n).val(), r) return t;
                                s.push(t)
                            }
                        return s
                    },
                    set: function(e, t) {
                        for (var n, o, i = e.options, r = Z.makeArray(t), s = i.length; s--;) o = i[s], (o.selected = Z.inArray(o.value, r) >= 0) && (n = !0);
                        return n || (e.selectedIndex = -1), r
                    }
                }
            }
        }), Z.each(["radio", "checkbox"], function() {
            Z.valHooks[this] = {
                set: function(e, t) {
                    return Z.isArray(t) ? e.checked = Z.inArray(Z(e).val(), t) >= 0 : void 0
                }
            }, G.checkOn || (Z.valHooks[this].get = function(e) {
                return null === e.getAttribute("value") ? "on" : e.value
            })
        }), Z.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function(e, t) {
            Z.fn[t] = function(e, n) {
                return arguments.length > 0 ? this.on(t, null, e, n) : this.trigger(t)
            }
        }), Z.fn.extend({
            hover: function(e, t) {
                return this.mouseenter(e).mouseleave(t || e)
            },
            bind: function(e, t, n) {
                return this.on(e, null, t, n)
            },
            unbind: function(e, t) {
                return this.off(e, null, t)
            },
            delegate: function(e, t, n, o) {
                return this.on(t, e, n, o)
            },
            undelegate: function(e, t, n) {
                return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
            }
        });
        var ct = Z.now(),
            dt = /\?/;
        Z.parseJSON = function(e) {
            return JSON.parse(e + "")
        }, Z.parseXML = function(e) {
            var t, n;
            if (!e || "string" != typeof e) return null;
            try {
                n = new DOMParser, t = n.parseFromString(e, "text/xml")
            } catch (o) {
                t = void 0
            }
            return (!t || t.getElementsByTagName("parsererror").length) && Z.error("Invalid XML: " + e), t
        };
        var ut = /#.*$/,
            pt = /([?&])_=[^&]*/,
            ft = /^(.*?):[ \t]*([^\r\n]*)$/gm,
            ht = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/,
            mt = /^(?:GET|HEAD)$/,
            gt = /^\/\//,
            vt = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,
            yt = {},
            wt = {},
            bt = "*/".concat("*"),
            _t = e.location.href,
            xt = vt.exec(_t.toLowerCase()) || [];
        Z.extend({
            active: 0,
            lastModified: {},
            etag: {},
            ajaxSettings: {
                url: _t,
                type: "GET",
                isLocal: ht.test(xt[1]),
                global: !0,
                processData: !0,
                async: !0,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                accepts: {
                    "*": bt,
                    text: "text/plain",
                    html: "text/html",
                    xml: "application/xml, text/xml",
                    json: "application/json, text/javascript"
                },
                contents: {
                    xml: /xml/,
                    html: /html/,
                    json: /json/
                },
                responseFields: {
                    xml: "responseXML",
                    text: "responseText",
                    json: "responseJSON"
                },
                converters: {
                    "* text": String,
                    "text html": !0,
                    "text json": Z.parseJSON,
                    "text xml": Z.parseXML
                },
                flatOptions: {
                    url: !0,
                    context: !0
                }
            },
            ajaxSetup: function(e, t) {
                return t ? L(L(e, Z.ajaxSettings), t) : L(Z.ajaxSettings, e)
            },
            ajaxPrefilter: I(yt),
            ajaxTransport: I(wt),
            ajax: function(e, t) {
                function n(e, t, n, s) {
                    var l, d, v, y, b, x = t;
                    2 !== w && (w = 2, a && clearTimeout(a), o = void 0, r = s || "", _.readyState = e > 0 ? 4 : 0, l = e >= 200 && 300 > e || 304 === e, n && (y = H(u, _, n)), y = F(u, y, _, l), l ? (u.ifModified && (b = _.getResponseHeader("Last-Modified"), b && (Z.lastModified[i] = b), b = _.getResponseHeader("etag"), b && (Z.etag[i] = b)), 204 === e || "HEAD" === u.type ? x = "nocontent" : 304 === e ? x = "notmodified" : (x = y.state, d = y.data, v = y.error, l = !v)) : (v = x, (e || !x) && (x = "error", 0 > e && (e = 0))), _.status = e, _.statusText = (t || x) + "", l ? h.resolveWith(p, [d, x, _]) : h.rejectWith(p, [_, x, v]), _.statusCode(g), g = void 0, c && f.trigger(l ? "ajaxSuccess" : "ajaxError", [_, u, l ? d : v]), m.fireWith(p, [_, x]), c && (f.trigger("ajaxComplete", [_, u]), --Z.active || Z.event.trigger("ajaxStop")))
                }
                "object" == typeof e && (t = e, e = void 0), t = t || {};
                var o, i, r, s, a, l, c, d, u = Z.ajaxSetup({}, t),
                    p = u.context || u,
                    f = u.context && (p.nodeType || p.jquery) ? Z(p) : Z.event,
                    h = Z.Deferred(),
                    m = Z.Callbacks("once memory"),
                    g = u.statusCode || {},
                    v = {},
                    y = {},
                    w = 0,
                    b = "canceled",
                    _ = {
                        readyState: 0,
                        getResponseHeader: function(e) {
                            var t;
                            if (2 === w) {
                                if (!s)
                                    for (s = {}; t = ft.exec(r);) s[t[1].toLowerCase()] = t[2];
                                t = s[e.toLowerCase()]
                            }
                            return null == t ? null : t
                        },
                        getAllResponseHeaders: function() {
                            return 2 === w ? r : null
                        },
                        setRequestHeader: function(e, t) {
                            var n = e.toLowerCase();
                            return w || (e = y[n] = y[n] || e, v[e] = t), this
                        },
                        overrideMimeType: function(e) {
                            return w || (u.mimeType = e), this
                        },
                        statusCode: function(e) {
                            var t;
                            if (e)
                                if (2 > w)
                                    for (t in e) g[t] = [g[t], e[t]];
                                else _.always(e[_.status]);
                            return this
                        },
                        abort: function(e) {
                            var t = e || b;
                            return o && o.abort(t), n(0, t), this
                        }
                    };
                if (h.promise(_).complete = m.add, _.success = _.done, _.error = _.fail, u.url = ((e || u.url || _t) + "").replace(ut, "").replace(gt, xt[1] + "//"), u.type = t.method || t.type || u.method || u.type, u.dataTypes = Z.trim(u.dataType || "*").toLowerCase().match(fe) || [""], null == u.crossDomain && (l = vt.exec(u.url.toLowerCase()), u.crossDomain = !(!l || l[1] === xt[1] && l[2] === xt[2] && (l[3] || ("http:" === l[1] ? "80" : "443")) === (xt[3] || ("http:" === xt[1] ? "80" : "443")))), u.data && u.processData && "string" != typeof u.data && (u.data = Z.param(u.data, u.traditional)), P(yt, u, t, _), 2 === w) return _;
                c = Z.event && u.global, c && 0 === Z.active++ && Z.event.trigger("ajaxStart"), u.type = u.type.toUpperCase(), u.hasContent = !mt.test(u.type), i = u.url, u.hasContent || (u.data && (i = u.url += (dt.test(i) ? "&" : "?") + u.data, delete u.data), u.cache === !1 && (u.url = pt.test(i) ? i.replace(pt, "$1_=" + ct++) : i + (dt.test(i) ? "&" : "?") + "_=" + ct++)), u.ifModified && (Z.lastModified[i] && _.setRequestHeader("If-Modified-Since", Z.lastModified[i]), Z.etag[i] && _.setRequestHeader("If-None-Match", Z.etag[i])), (u.data && u.hasContent && u.contentType !== !1 || t.contentType) && _.setRequestHeader("Content-Type", u.contentType), _.setRequestHeader("Accept", u.dataTypes[0] && u.accepts[u.dataTypes[0]] ? u.accepts[u.dataTypes[0]] + ("*" !== u.dataTypes[0] ? ", " + bt + "; q=0.01" : "") : u.accepts["*"]);
                for (d in u.headers) _.setRequestHeader(d, u.headers[d]);
                if (u.beforeSend && (u.beforeSend.call(p, _, u) === !1 || 2 === w)) return _.abort();
                b = "abort";
                for (d in {
                        success: 1,
                        error: 1,
                        complete: 1
                    }) _[d](u[d]);
                if (o = P(wt, u, t, _)) {
                    _.readyState = 1, c && f.trigger("ajaxSend", [_, u]), u.async && u.timeout > 0 && (a = setTimeout(function() {
                        _.abort("timeout")
                    }, u.timeout));
                    try {
                        w = 1, o.send(v, n)
                    } catch (x) {
                        if (!(2 > w)) throw x;
                        n(-1, x)
                    }
                } else n(-1, "No Transport");
                return _
            },
            getJSON: function(e, t, n) {
                return Z.get(e, t, n, "json")
            },
            getScript: function(e, t) {
                return Z.get(e, void 0, t, "script")
            }
        }), Z.each(["get", "post"], function(e, t) {
            Z[t] = function(e, n, o, i) {
                return Z.isFunction(n) && (i = i || o, o = n, n = void 0), Z.ajax({
                    url: e,
                    type: t,
                    dataType: i,
                    data: n,
                    success: o
                })
            }
        }), Z._evalUrl = function(e) {
            return Z.ajax({
                url: e,
                type: "GET",
                dataType: "script",
                async: !1,
                global: !1,
                "throws": !0
            })
        }, Z.fn.extend({
            wrapAll: function(e) {
                var t;
                return Z.isFunction(e) ? this.each(function(t) {
                    Z(this).wrapAll(e.call(this, t))
                }) : (this[0] && (t = Z(e, this[0].ownerDocument).eq(0).clone(!0), this[0].parentNode && t.insertBefore(this[0]), t.map(function() {
                    for (var e = this; e.firstElementChild;) e = e.firstElementChild;
                    return e
                }).append(this)), this)
            },
            wrapInner: function(e) {
                return Z.isFunction(e) ? this.each(function(t) {
                    Z(this).wrapInner(e.call(this, t))
                }) : this.each(function() {
                    var t = Z(this),
                        n = t.contents();
                    n.length ? n.wrapAll(e) : t.append(e)
                })
            },
            wrap: function(e) {
                var t = Z.isFunction(e);
                return this.each(function(n) {
                    Z(this).wrapAll(t ? e.call(this, n) : e)
                })
            },
            unwrap: function() {
                return this.parent().each(function() {
                    Z.nodeName(this, "body") || Z(this).replaceWith(this.childNodes)
                }).end()
            }
        }), Z.expr.filters.hidden = function(e) {
            return e.offsetWidth <= 0 && e.offsetHeight <= 0
        }, Z.expr.filters.visible = function(e) {
            return !Z.expr.filters.hidden(e)
        };
        var Ct = /%20/g,
            kt = /\[\]$/,
            Tt = /\r?\n/g,
            St = /^(?:submit|button|image|reset|file)$/i,
            $t = /^(?:input|select|textarea|keygen)/i;
        Z.param = function(e, t) {
            var n, o = [],
                i = function(e, t) {
                    t = Z.isFunction(t) ? t() : null == t ? "" : t, o[o.length] = encodeURIComponent(e) + "=" + encodeURIComponent(t)
                };
            if (void 0 === t && (t = Z.ajaxSettings && Z.ajaxSettings.traditional), Z.isArray(e) || e.jquery && !Z.isPlainObject(e)) Z.each(e, function() {
                i(this.name, this.value)
            });
            else
                for (n in e) M(n, e[n], t, i);
            return o.join("&").replace(Ct, "+")
        }, Z.fn.extend({
            serialize: function() {
                return Z.param(this.serializeArray())
            },
            serializeArray: function() {
                return this.map(function() {
                    var e = Z.prop(this, "elements");
                    return e ? Z.makeArray(e) : this
                }).filter(function() {
                    var e = this.type;
                    return this.name && !Z(this).is(":disabled") && $t.test(this.nodeName) && !St.test(e) && (this.checked || !ke.test(e))
                }).map(function(e, t) {
                    var n = Z(this).val();
                    return null == n ? null : Z.isArray(n) ? Z.map(n, function(e) {
                        return {
                            name: t.name,
                            value: e.replace(Tt, "\r\n")
                        }
                    }) : {
                        name: t.name,
                        value: n.replace(Tt, "\r\n")
                    }
                }).get()
            }
        }), Z.ajaxSettings.xhr = function() {
            try {
                return new XMLHttpRequest
            } catch (e) {}
        };
        var Et = 0,
            Nt = {},
            Rt = {
                0: 200,
                1223: 204
            },
            At = Z.ajaxSettings.xhr();
        e.attachEvent && e.attachEvent("onunload", function() {
            for (var e in Nt) Nt[e]()
        }), G.cors = !!At && "withCredentials" in At, G.ajax = At = !!At, Z.ajaxTransport(function(e) {
            var t;
            return G.cors || At && !e.crossDomain ? {
                send: function(n, o) {
                    var i, r = e.xhr(),
                        s = ++Et;
                    if (r.open(e.type, e.url, e.async, e.username, e.password), e.xhrFields)
                        for (i in e.xhrFields) r[i] = e.xhrFields[i];
                    e.mimeType && r.overrideMimeType && r.overrideMimeType(e.mimeType), e.crossDomain || n["X-Requested-With"] || (n["X-Requested-With"] = "XMLHttpRequest");
                    for (i in n) r.setRequestHeader(i, n[i]);
                    t = function(e) {
                        return function() {
                            t && (delete Nt[s], t = r.onload = r.onerror = null, "abort" === e ? r.abort() : "error" === e ? o(r.status, r.statusText) : o(Rt[r.status] || r.status, r.statusText, "string" == typeof r.responseText ? {
                                text: r.responseText
                            } : void 0, r.getAllResponseHeaders()))
                        }
                    }, r.onload = t(), r.onerror = t("error"), t = Nt[s] = t("abort");
                    try {
                        r.send(e.hasContent && e.data || null)
                    } catch (a) {
                        if (t) throw a
                    }
                },
                abort: function() {
                    t && t()
                }
            } : void 0
        }), Z.ajaxSetup({
            accepts: {
                script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
            },
            contents: {
                script: /(?:java|ecma)script/
            },
            converters: {
                "text script": function(e) {
                    return Z.globalEval(e), e
                }
            }
        }), Z.ajaxPrefilter("script", function(e) {
            void 0 === e.cache && (e.cache = !1), e.crossDomain && (e.type = "GET")
        }), Z.ajaxTransport("script", function(e) {
            if (e.crossDomain) {
                var t, n;
                return {
                    send: function(o, i) {
                        t = Z("<script>").prop({
                            async: !0,
                            charset: e.scriptCharset,
                            src: e.url
                        }).on("load error", n = function(e) {
                            t.remove(), n = null, e && i("error" === e.type ? 404 : 200, e.type)
                        }), K.head.appendChild(t[0])
                    },
                    abort: function() {
                        n && n()
                    }
                }
            }
        });
        var Dt = [],
            Ot = /(=)\?(?=&|$)|\?\?/;
        Z.ajaxSetup({
            jsonp: "callback",
            jsonpCallback: function() {
                var e = Dt.pop() || Z.expando + "_" + ct++;
                return this[e] = !0, e
            }
        }), Z.ajaxPrefilter("json jsonp", function(t, n, o) {
            var i, r, s, a = t.jsonp !== !1 && (Ot.test(t.url) ? "url" : "string" == typeof t.data && !(t.contentType || "").indexOf("application/x-www-form-urlencoded") && Ot.test(t.data) && "data");
            return a || "jsonp" === t.dataTypes[0] ? (i = t.jsonpCallback = Z.isFunction(t.jsonpCallback) ? t.jsonpCallback() : t.jsonpCallback, a ? t[a] = t[a].replace(Ot, "$1" + i) : t.jsonp !== !1 && (t.url += (dt.test(t.url) ? "&" : "?") + t.jsonp + "=" + i), t.converters["script json"] = function() {
                return s || Z.error(i + " was not called"), s[0]
            }, t.dataTypes[0] = "json", r = e[i], e[i] = function() {
                s = arguments
            }, o.always(function() {
                e[i] = r, t[i] && (t.jsonpCallback = n.jsonpCallback, Dt.push(i)), s && Z.isFunction(r) && r(s[0]), s = r = void 0
            }), "script") : void 0
        }), Z.parseHTML = function(e, t, n) {
            if (!e || "string" != typeof e) return null;
            "boolean" == typeof t && (n = t, t = !1), t = t || K;
            var o = se.exec(e),
                i = !n && [];
            return o ? [t.createElement(o[1])] : (o = Z.buildFragment([e], t, i), i && i.length && Z(i).remove(), Z.merge([], o.childNodes))
        };
        var jt = Z.fn.load;
        Z.fn.load = function(e, t, n) {
            if ("string" != typeof e && jt) return jt.apply(this, arguments);
            var o, i, r, s = this,
                a = e.indexOf(" ");
            return a >= 0 && (o = Z.trim(e.slice(a)), e = e.slice(0, a)), Z.isFunction(t) ? (n = t, t = void 0) : t && "object" == typeof t && (i = "POST"), s.length > 0 && Z.ajax({
                url: e,
                type: i,
                dataType: "html",
                data: t
            }).done(function(e) {
                r = arguments, s.html(o ? Z("<div>").append(Z.parseHTML(e)).find(o) : e)
            }).complete(n && function(e, t) {
                s.each(n, r || [e.responseText, t, e])
            }), this
        }, Z.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function(e, t) {
            Z.fn[t] = function(e) {
                return this.on(t, e)
            }
        }), Z.expr.filters.animated = function(e) {
            return Z.grep(Z.timers, function(t) {
                return e === t.elem
            }).length
        };
        var It = e.document.documentElement;
        Z.offset = {
            setOffset: function(e, t, n) {
                var o, i, r, s, a, l, c, d = Z.css(e, "position"),
                    u = Z(e),
                    p = {};
                "static" === d && (e.style.position = "relative"), a = u.offset(), r = Z.css(e, "top"), l = Z.css(e, "left"), c = ("absolute" === d || "fixed" === d) && (r + l).indexOf("auto") > -1, c ? (o = u.position(), s = o.top, i = o.left) : (s = parseFloat(r) || 0, i = parseFloat(l) || 0), Z.isFunction(t) && (t = t.call(e, n, a)), null != t.top && (p.top = t.top - a.top + s), null != t.left && (p.left = t.left - a.left + i), "using" in t ? t.using.call(e, p) : u.css(p)
            }
        }, Z.fn.extend({
            offset: function(e) {
                if (arguments.length) return void 0 === e ? this : this.each(function(t) {
                    Z.offset.setOffset(this, e, t)
                });
                var t, n, o = this[0],
                    i = {
                        top: 0,
                        left: 0
                    },
                    r = o && o.ownerDocument;
                if (r) return t = r.documentElement, Z.contains(t, o) ? (typeof o.getBoundingClientRect !== Te && (i = o.getBoundingClientRect()), n = z(r), {
                    top: i.top + n.pageYOffset - t.clientTop,
                    left: i.left + n.pageXOffset - t.clientLeft
                }) : i
            },
            position: function() {
                if (this[0]) {
                    var e, t, n = this[0],
                        o = {
                            top: 0,
                            left: 0
                        };
                    return "fixed" === Z.css(n, "position") ? t = n.getBoundingClientRect() : (e = this.offsetParent(), t = this.offset(), Z.nodeName(e[0], "html") || (o = e.offset()), o.top += Z.css(e[0], "borderTopWidth", !0), o.left += Z.css(e[0], "borderLeftWidth", !0)), {
                        top: t.top - o.top - Z.css(n, "marginTop", !0),
                        left: t.left - o.left - Z.css(n, "marginLeft", !0)
                    }
                }
            },
            offsetParent: function() {
                return this.map(function() {
                    for (var e = this.offsetParent || It; e && !Z.nodeName(e, "html") && "static" === Z.css(e, "position");) e = e.offsetParent;
                    return e || It
                })
            }
        }), Z.each({
            scrollLeft: "pageXOffset",
            scrollTop: "pageYOffset"
        }, function(t, n) {
            var o = "pageYOffset" === n;
            Z.fn[t] = function(i) {
                return ge(this, function(t, i, r) {
                    var s = z(t);
                    return void 0 === r ? s ? s[n] : t[i] : void(s ? s.scrollTo(o ? e.pageXOffset : r, o ? r : e.pageYOffset) : t[i] = r)
                }, t, i, arguments.length, null)
            }
        }), Z.each(["top", "left"], function(e, t) {
            Z.cssHooks[t] = x(G.pixelPosition, function(e, n) {
                return n ? (n = _(e, t), We.test(n) ? Z(e).position()[t] + "px" : n) : void 0
            })
        }), Z.each({
            Height: "height",
            Width: "width"
        }, function(e, t) {
            Z.each({
                padding: "inner" + e,
                content: t,
                "": "outer" + e
            }, function(n, o) {
                Z.fn[o] = function(o, i) {
                    var r = arguments.length && (n || "boolean" != typeof o),
                        s = n || (o === !0 || i === !0 ? "margin" : "border");
                    return ge(this, function(t, n, o) {
                        var i;
                        return Z.isWindow(t) ? t.document.documentElement["client" + e] : 9 === t.nodeType ? (i = t.documentElement, Math.max(t.body["scroll" + e], i["scroll" + e], t.body["offset" + e], i["offset" + e], i["client" + e])) : void 0 === o ? Z.css(t, n, s) : Z.style(t, n, o, s)
                    }, t, r ? o : void 0, r, null)
                }
            })
        }), Z.fn.size = function() {
            return this.length
        }, Z.fn.andSelf = Z.fn.addBack, "function" == typeof define && define.amd && define("jquery", [], function() {
            return Z
        });
        var Pt = e.jQuery,
            Lt = e.$;
        return Z.noConflict = function(t) {
            return e.$ === Z && (e.$ = Lt), t && e.jQuery === Z && (e.jQuery = Pt), Z
        }, typeof t === Te && (e.jQuery = e.$ = Z), Z
    }), function(e, t) {
        "use strict";
        e.rails !== t && e.error("jquery-ujs has already been loaded!");
        var n, o = e(document);
        e.rails = n = {
            linkClickSelector: "a[data-confirm], a[data-method], a[data-remote], a[data-disable-with], a[data-disable]",
            buttonClickSelector: "button[data-remote]:not(form button), button[data-confirm]:not(form button)",
            inputChangeSelector: "select[data-remote], input[data-remote], textarea[data-remote]",
            formSubmitSelector: "form",
            formInputClickSelector: "form input[type=submit], form input[type=image], form button[type=submit], form button:not([type]), input[type=submit][form], input[type=image][form], button[type=submit][form], button[form]:not([type])",
            disableSelector: "input[data-disable-with]:enabled, button[data-disable-with]:enabled, textarea[data-disable-with]:enabled, input[data-disable]:enabled, button[data-disable]:enabled, textarea[data-disable]:enabled",
            enableSelector: "input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled, input[data-disable]:disabled, button[data-disable]:disabled, textarea[data-disable]:disabled",
            requiredInputSelector: "input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",
            fileInputSelector: "input[type=file]:not([disabled])",
            linkDisableSelector: "a[data-disable-with], a[data-disable]",
            buttonDisableSelector: "button[data-remote][data-disable-with], button[data-remote][data-disable]",
            csrfToken: function() {
                return e("meta[name=csrf-token]").attr("content")
            },
            csrfParam: function() {
                return e("meta[name=csrf-param]").attr("content")
            },
            CSRFProtection: function(e) {
                var t = n.csrfToken();
                t && e.setRequestHeader("X-CSRF-Token", t)
            },
            refreshCSRFTokens: function() {
                e('form input[name="' + n.csrfParam() + '"]').val(n.csrfToken())
            },
            fire: function(t, n, o) {
                var i = e.Event(n);
                return t.trigger(i, o), i.result !== !1
            },
            confirm: function(e) {
                return confirm(e)
            },
            ajax: function(t) {
                return e.ajax(t)
            },
            href: function(e) {
                return e[0].href
            },
            isRemote: function(e) {
                return e.data("remote") !== t && e.data("remote") !== !1
            },
            handleRemote: function(o) {
                var i, r, s, a, l, c;
                if (n.fire(o, "ajax:before")) {
                    if (a = o.data("with-credentials") || null, l = o.data("type") || e.ajaxSettings && e.ajaxSettings.dataType, o.is("form")) {
                        i = o.attr("method"), r = o.attr("action"), s = o.serializeArray();
                        var d = o.data("ujs:submit-button");
                        d && (s.push(d), o.data("ujs:submit-button", null))
                    } else o.is(n.inputChangeSelector) ? (i = o.data("method"), r = o.data("url"), s = o.serialize(), o.data("params") && (s = s + "&" + o.data("params"))) : o.is(n.buttonClickSelector) ? (i = o.data("method") || "get", r = o.data("url"), s = o.serialize(), o.data("params") && (s = s + "&" + o.data("params"))) : (i = o.data("method"), r = n.href(o), s = o.data("params") || null);
                    return c = {
                        type: i || "GET",
                        data: s,
                        dataType: l,
                        beforeSend: function(e, i) {
                            return i.dataType === t && e.setRequestHeader("accept", "*/*;q=0.5, " + i.accepts.script), n.fire(o, "ajax:beforeSend", [e, i]) ? void o.trigger("ajax:send", e) : !1
                        },
                        success: function(e, t, n) {
                            o.trigger("ajax:success", [e, t, n])
                        },
                        complete: function(e, t) {
                            o.trigger("ajax:complete", [e, t])
                        },
                        error: function(e, t, n) {
                            o.trigger("ajax:error", [e, t, n])
                        },
                        crossDomain: n.isCrossDomain(r)
                    }, a && (c.xhrFields = {
                        withCredentials: a
                    }), r && (c.url = r), n.ajax(c)
                }
                return !1
            },
            isCrossDomain: function(e) {
                var t = document.createElement("a");
                t.href = location.href;
                var n = document.createElement("a");
                try {
                    return n.href = e, n.href = n.href, !((!n.protocol || ":" === n.protocol) && !n.host || t.protocol + "//" + t.host == n.protocol + "//" + n.host)
                } catch (o) {
                    return !0
                }
            },
            handleMethod: function(o) {
                var i = n.href(o),
                    r = o.data("method"),
                    s = o.attr("target"),
                    a = n.csrfToken(),
                    l = n.csrfParam(),
                    c = e('<form method="post" action="' + i + '"></form>'),
                    d = '<input name="_method" value="' + r + '" type="hidden" />';
                l === t || a === t || n.isCrossDomain(i) || (d += '<input name="' + l + '" value="' + a + '" type="hidden" />'), s && c.attr("target", s), c.hide().append(d).appendTo("body"), c.submit()
            },
            formElements: function(t, n) {
                return t.is("form") ? e(t[0].elements).filter(n) : t.find(n)
            },
            disableFormElements: function(t) {
                n.formElements(t, n.disableSelector).each(function() {
                    n.disableFormElement(e(this))
                })
            },
            disableFormElement: function(e) {
                var n, o;
                n = e.is("button") ? "html" : "val", o = e.data("disable-with"), e.data("ujs:enable-with", e[n]()), o !== t && e[n](o), e.prop("disabled", !0)
            },
            enableFormElements: function(t) {
                n.formElements(t, n.enableSelector).each(function() {
                    n.enableFormElement(e(this))
                })
            },
            enableFormElement: function(e) {
                var t = e.is("button") ? "html" : "val";
                "undefined" != typeof e.data("ujs:enable-with") && e[t](e.data("ujs:enable-with")), e.prop("disabled", !1)
            },
            allowAction: function(e) {
                var t, o = e.data("confirm"),
                    i = !1;
                if (!o) return !0;
                if (n.fire(e, "confirm")) {
                    try {
                        i = n.confirm(o)
                    } catch (r) {
                        (console.error || console.log).call(console, r.stack || r)
                    }
                    t = n.fire(e, "confirm:complete", [i])
                }
                return i && t
            },
            blankInputs: function(t, n, o) {
                var i, r, s = e(),
                    a = n || "input,textarea",
                    l = t.find(a);
                return l.each(function() {
                    if (i = e(this), r = i.is("input[type=checkbox],input[type=radio]") ? i.is(":checked") : !!i.val(), r === o) {
                        if (i.is("input[type=radio]") && l.filter('input[type=radio]:checked[name="' + i.attr("name") + '"]').length) return !0;
                        s = s.add(i)
                    }
                }), s.length ? s : !1
            },
            nonBlankInputs: function(e, t) {
                return n.blankInputs(e, t, !0)
            },
            stopEverything: function(t) {
                return e(t.target).trigger("ujs:everythingStopped"), t.stopImmediatePropagation(), !1
            },
            disableElement: function(e) {
                var o = e.data("disable-with");
                e.data("ujs:enable-with", e.html()), o !== t && e.html(o), e.bind("click.railsDisable", function(e) {
                    return n.stopEverything(e)
                })
            },
            enableElement: function(e) {
                e.data("ujs:enable-with") !== t && (e.html(e.data("ujs:enable-with")), e.removeData("ujs:enable-with")), e.unbind("click.railsDisable")
            }
        }, n.fire(o, "rails:attachBindings") && (e.ajaxPrefilter(function(e, t, o) {
            e.crossDomain || n.CSRFProtection(o)
        }), e(window).on("pageshow.rails", function() {
            e(e.rails.enableSelector).each(function() {
                var t = e(this);
                t.data("ujs:enable-with") && e.rails.enableFormElement(t)
            }), e(e.rails.linkDisableSelector).each(function() {
                var t = e(this);
                t.data("ujs:enable-with") && e.rails.enableElement(t)
            })
        }), o.delegate(n.linkDisableSelector, "ajax:complete", function() {
            n.enableElement(e(this))
        }), o.delegate(n.buttonDisableSelector, "ajax:complete", function() {
            n.enableFormElement(e(this))
        }), o.delegate(n.linkClickSelector, "click.rails", function(t) {
            var o = e(this),
                i = o.data("method"),
                r = o.data("params"),
                s = t.metaKey || t.ctrlKey;
            if (!n.allowAction(o)) return n.stopEverything(t);
            if (!s && o.is(n.linkDisableSelector) && n.disableElement(o), n.isRemote(o)) {
                if (s && (!i || "GET" === i) && !r) return !0;
                var a = n.handleRemote(o);
                return a === !1 ? n.enableElement(o) : a.fail(function() {
                    n.enableElement(o)
                }), !1
            }
            return i ? (n.handleMethod(o), !1) : void 0
        }), o.delegate(n.buttonClickSelector, "click.rails", function(t) {
            var o = e(this);
            if (!n.allowAction(o) || !n.isRemote(o)) return n.stopEverything(t);
            o.is(n.buttonDisableSelector) && n.disableFormElement(o);
            var i = n.handleRemote(o);
            return i === !1 ? n.enableFormElement(o) : i.fail(function() {
                n.enableFormElement(o)
            }), !1
        }), o.delegate(n.inputChangeSelector, "change.rails", function(t) {
            var o = e(this);
            return n.allowAction(o) && n.isRemote(o) ? (n.handleRemote(o), !1) : n.stopEverything(t)
        }), o.delegate(n.formSubmitSelector, "submit.rails", function(o) {
            var i, r, s = e(this),
                a = n.isRemote(s);
            if (!n.allowAction(s)) return n.stopEverything(o);
            if (s.attr("novalidate") === t && (i = n.blankInputs(s, n.requiredInputSelector, !1), i && n.fire(s, "ajax:aborted:required", [i]))) return n.stopEverything(o);
            if (a) {
                if (r = n.nonBlankInputs(s, n.fileInputSelector)) {
                    setTimeout(function() {
                        n.disableFormElements(s)
                    }, 13);
                    var l = n.fire(s, "ajax:aborted:file", [r]);
                    return l || setTimeout(function() {
                        n.enableFormElements(s)
                    }, 13), l
                }
                return n.handleRemote(s), !1
            }
            setTimeout(function() {
                n.disableFormElements(s)
            }, 13)
        }), o.delegate(n.formInputClickSelector, "click.rails", function(t) {
            var o = e(this);
            if (!n.allowAction(o)) return n.stopEverything(t);
            var i = o.attr("name"),
                r = i ? {
                    name: i,
                    value: o.val()
                } : null;
            o.closest("form").data("ujs:submit-button", r)
        }), o.delegate(n.formSubmitSelector, "ajax:send.rails", function(t) {
            this === t.target && n.disableFormElements(e(this))
        }), o.delegate(n.formSubmitSelector, "ajax:complete.rails", function(t) {
            this === t.target && n.enableFormElements(e(this))
        }), e(function() {
            n.refreshCSRFTokens()
        }))
    }(jQuery), function() {
        var e, t;
        e = window.jQuery || ("function" == typeof require ? require("jquery") : void 0), t = e(document), e.turbo = {
            version: "2.0.2",
            isReady: !1,
            use: function(e, n) {
                return t.off(".turbo").on("" + e + ".turbo", this.onLoad).on("" + n + ".turbo", this.onFetch)
            },
            addCallback: function(n) {
                return e.turbo.isReady ? n(e) : t.on("turbo:ready", function() {
                    return n(e)
                })
            },
            onLoad: function() {
                return e.turbo.isReady = !0, t.trigger("turbo:ready")
            },
            onFetch: function() {
                return e.turbo.isReady = !1
            },
            register: function() {
                return e(this.onLoad), e.fn.ready = this.addCallback
            }
        }, e.turbo.register(), e.turbo.use("page:load", "page:fetch")
    }.call(this), function(e, t) {
        "function" == typeof define && define.amd ? define(t) : "object" == typeof exports ? module.exports = t() : e.NProgress = t()
    }(this, function() {
        function e(e, t, n) {
            return t > e ? t : e > n ? n : e
        }

        function t(e) {
            return 100 * (-1 + e)
        }

        function n(e, n, o) {
            var i;
            return i = "translate3d" === c.positionUsing ? {
                transform: "translate3d(" + t(e) + "%,0,0)"
            } : "translate" === c.positionUsing ? {
                transform: "translate(" + t(e) + "%,0)"
            } : {
                "margin-left": t(e) + "%"
            }, i.transition = "all " + n + "ms " + o, i
        }

        function o(e, t) {
            var n = "string" == typeof e ? e : s(e);
            return n.indexOf(" " + t + " ") >= 0
        }

        function i(e, t) {
            var n = s(e),
                i = n + t;
            o(n, t) || (e.className = i.substring(1))
        }

        function r(e, t) {
            var n, i = s(e);
            o(e, t) && (n = i.replace(" " + t + " ", " "), e.className = n.substring(1, n.length - 1))
        }

        function s(e) {
            return (" " + (e.className || "") + " ").replace(/\s+/gi, " ")
        }

        function a(e) {
            e && e.parentNode && e.parentNode.removeChild(e)
        }
        var l = {};
        l.version = "0.2.0";
        var c = l.settings = {
            minimum: .08,
            easing: "ease",
            positionUsing: "",
            speed: 200,
            trickle: !0,
            trickleRate: .02,
            trickleSpeed: 800,
            showSpinner: !0,
            barSelector: '[role="bar"]',
            spinnerSelector: '[role="spinner"]',
            parent: "body",
            template: '<div class="bar" role="bar"><div class="peg"></div></div><div class="spinner" role="spinner"><div class="spinner-icon"></div></div>'
        };
        l.configure = function(e) {
                var t, n;
                for (t in e) n = e[t], void 0 !== n && e.hasOwnProperty(t) && (c[t] = n);
                return this
            }, l.status = null, l.set = function(t) {
                var o = l.isStarted();
                t = e(t, c.minimum, 1), l.status = 1 === t ? null : t;
                var i = l.render(!o),
                    r = i.querySelector(c.barSelector),
                    s = c.speed,
                    a = c.easing;
                return i.offsetWidth, d(function(e) {
                    "" === c.positionUsing && (c.positionUsing = l.getPositioningCSS()), u(r, n(t, s, a)), 1 === t ? (u(i, {
                        transition: "none",
                        opacity: 1
                    }), i.offsetWidth, setTimeout(function() {
                        u(i, {
                            transition: "all " + s + "ms linear",
                            opacity: 0
                        }), setTimeout(function() {
                            l.remove(), e()
                        }, s)
                    }, s)) : setTimeout(e, s)
                }), this
            }, l.isStarted = function() {
                return "number" == typeof l.status
            }, l.start = function() {
                l.status || l.set(0);
                var e = function() {
                    setTimeout(function() {
                        l.status && (l.trickle(), e())
                    }, c.trickleSpeed)
                };
                return c.trickle && e(), this
            }, l.done = function(e) {
                return e || l.status ? l.inc(.3 + .5 * Math.random()).set(1) : this
            }, l.inc = function(t) {
                var n = l.status;
                return n ? ("number" != typeof t && (t = (1 - n) * e(Math.random() * n, .1, .95)), n = e(n + t, 0, .994), l.set(n)) : l.start()
            }, l.trickle = function() {
                return l.inc(Math.random() * c.trickleRate)
            },
            function() {
                var e = 0,
                    t = 0;
                l.promise = function(n) {
                    return n && "resolved" !== n.state() ? (0 === t && l.start(), e++, t++, n.always(function() {
                        t--, 0 === t ? (e = 0, l.done()) : l.set((e - t) / e)
                    }), this) : this
                }
            }(), l.render = function(e) {
                if (l.isRendered()) return document.getElementById("nprogress");
                i(document.documentElement, "nprogress-busy");
                var n = document.createElement("div");
                n.id = "nprogress", n.innerHTML = c.template;
                var o, r = n.querySelector(c.barSelector),
                    s = e ? "-100" : t(l.status || 0),
                    d = document.querySelector(c.parent);
                return u(r, {
                    transition: "all 0 linear",
                    transform: "translate3d(" + s + "%,0,0)"
                }), c.showSpinner || (o = n.querySelector(c.spinnerSelector), o && a(o)), d != document.body && i(d, "nprogress-custom-parent"), d.appendChild(n), n
            }, l.remove = function() {
                r(document.documentElement, "nprogress-busy"), r(document.querySelector(c.parent), "nprogress-custom-parent");
                var e = document.getElementById("nprogress");
                e && a(e)
            }, l.isRendered = function() {
                return !!document.getElementById("nprogress")
            }, l.getPositioningCSS = function() {
                var e = document.body.style,
                    t = "WebkitTransform" in e ? "Webkit" : "MozTransform" in e ? "Moz" : "msTransform" in e ? "ms" : "OTransform" in e ? "O" : "";
                return t + "Perspective" in e ? "translate3d" : t + "Transform" in e ? "translate" : "margin"
            };
        var d = function() {
                function e() {
                    var n = t.shift();
                    n && n(e)
                }
                var t = [];
                return function(n) {
                    t.push(n), 1 == t.length && e()
                }
            }(),
            u = function() {
                function e(e) {
                    return e.replace(/^-ms-/, "ms-").replace(/-([\da-z])/gi, function(e, t) {
                        return t.toUpperCase()
                    })
                }

                function t(e) {
                    var t = document.body.style;
                    if (e in t) return e;
                    for (var n, o = i.length, r = e.charAt(0).toUpperCase() + e.slice(1); o--;)
                        if (n = i[o] + r, n in t) return n;
                    return e
                }

                function n(n) {
                    return n = e(n), r[n] || (r[n] = t(n))
                }

                function o(e, t, o) {
                    t = n(t), e.style[t] = o
                }
                var i = ["Webkit", "O", "Moz", "ms"],
                    r = {};
                return function(e, t) {
                    var n, i, r = arguments;
                    if (2 == r.length)
                        for (n in t) i = t[n], void 0 !== i && t.hasOwnProperty(n) && o(e, n, i);
                    else o(e, r[1], r[2])
                }
            }();
        return l
    }), "undefined" == typeof jQuery) throw new Error("Bootstrap's JavaScript requires jQuery"); + function(e) {
    "use strict";

    function t() {
        var e = document.createElement("bootstrap"),
            t = {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd otransitionend",
                transition: "transitionend"
            };
        for (var n in t)
            if (void 0 !== e.style[n]) return {
                end: t[n]
            };
        return !1
    }
    e.fn.emulateTransitionEnd = function(t) {
        var n = !1,
            o = this;
        e(this).one(e.support.transition.end, function() {
            n = !0
        });
        var i = function() {
            n || e(o).trigger(e.support.transition.end)
        };
        return setTimeout(i, t), this
    }, e(function() {
        e.support.transition = t()
    })
}(jQuery), + function(e) {
    "use strict";
    var t = '[data-dismiss="alert"]',
        n = function(n) {
            e(n).on("click", t, this.close)
        };
    n.prototype.close = function(t) {
        function n() {
            r.trigger("closed.bs.alert").remove()
        }
        var o = e(this),
            i = o.attr("data-target");
        i || (i = o.attr("href"), i = i && i.replace(/.*(?=#[^\s]*$)/, ""));
        var r = e(i);
        t && t.preventDefault(), r.length || (r = o.hasClass("alert") ? o : o.parent()), r.trigger(t = e.Event("close.bs.alert")), t.isDefaultPrevented() || (r.removeClass("in"), e.support.transition && r.hasClass("fade") ? r.one(e.support.transition.end, n).emulateTransitionEnd(150) : n())
    };
    var o = e.fn.alert;
    e.fn.alert = function(t) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.alert");
            i || o.data("bs.alert", i = new n(this)), "string" == typeof t && i[t].call(o)
        })
    }, e.fn.alert.Constructor = n, e.fn.alert.noConflict = function() {
        return e.fn.alert = o, this
    }, e(document).on("click.bs.alert.data-api", t, n.prototype.close)
}(jQuery), + function(e) {
    "use strict";
    var t = function(n, o) {
        this.$element = e(n), this.options = e.extend({}, t.DEFAULTS, o), this.isLoading = !1
    };
    t.DEFAULTS = {
        loadingText: "loading..."
    }, t.prototype.setState = function(t) {
        var n = "disabled",
            o = this.$element,
            i = o.is("input") ? "val" : "html",
            r = o.data();
        t += "Text", r.resetText || o.data("resetText", o[i]()), o[i](r[t] || this.options[t]), setTimeout(e.proxy(function() {
            "loadingText" == t ? (this.isLoading = !0, o.addClass(n).attr(n, n)) : this.isLoading && (this.isLoading = !1, o.removeClass(n).removeAttr(n))
        }, this), 0)
    }, t.prototype.toggle = function() {
        var e = !0,
            t = this.$element.closest('[data-toggle="buttons"]');
        if (t.length) {
            var n = this.$element.find("input");
            "radio" == n.prop("type") && (n.prop("checked") && this.$element.hasClass("active") ? e = !1 : t.find(".active").removeClass("active")), e && n.prop("checked", !this.$element.hasClass("active")).trigger("change")
        }
        e && this.$element.toggleClass("active")
    };
    var n = e.fn.button;
    e.fn.button = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.button"),
                r = "object" == typeof n && n;
            i || o.data("bs.button", i = new t(this, r)), "toggle" == n ? i.toggle() : n && i.setState(n)
        })
    }, e.fn.button.Constructor = t, e.fn.button.noConflict = function() {
        return e.fn.button = n, this
    }, e(document).on("click.bs.button.data-api", "[data-toggle^=button]", function(t) {
        var n = e(t.target);
        n.hasClass("btn") || (n = n.closest(".btn")), n.button("toggle"), t.preventDefault()
    })
}(jQuery), + function(e) {
    "use strict";
    var t = function(t, n) {
        this.$element = e(t), this.$indicators = this.$element.find(".carousel-indicators"), this.options = n, this.paused = this.sliding = this.interval = this.$active = this.$items = null, "hover" == this.options.pause && this.$element.on("mouseenter", e.proxy(this.pause, this)).on("mouseleave", e.proxy(this.cycle, this))
    };
    t.DEFAULTS = {
        interval: 5e3,
        pause: "hover",
        wrap: !0
    }, t.prototype.cycle = function(t) {
        return t || (this.paused = !1), this.interval && clearInterval(this.interval), this.options.interval && !this.paused && (this.interval = setInterval(e.proxy(this.next, this), this.options.interval)), this
    }, t.prototype.getActiveIndex = function() {
        return this.$active = this.$element.find(".item.active"), this.$items = this.$active.parent().children(), this.$items.index(this.$active)
    }, t.prototype.to = function(t) {
        var n = this,
            o = this.getActiveIndex();
        return t > this.$items.length - 1 || 0 > t ? void 0 : this.sliding ? this.$element.one("slid.bs.carousel", function() {
            n.to(t)
        }) : o == t ? this.pause().cycle() : this.slide(t > o ? "next" : "prev", e(this.$items[t]))
    }, t.prototype.pause = function(t) {
        return t || (this.paused = !0), this.$element.find(".next, .prev").length && e.support.transition && (this.$element.trigger(e.support.transition.end), this.cycle(!0)), this.interval = clearInterval(this.interval), this
    }, t.prototype.next = function() {
        return this.sliding ? void 0 : this.slide("next")
    }, t.prototype.prev = function() {
        return this.sliding ? void 0 : this.slide("prev")
    }, t.prototype.slide = function(t, n) {
        var o = this.$element.find(".item.active"),
            i = n || o[t](),
            r = this.interval,
            s = "next" == t ? "left" : "right",
            a = "next" == t ? "first" : "last",
            l = this;
        if (!i.length) {
            if (!this.options.wrap) return;
            i = this.$element.find(".item")[a]()
        }
        if (i.hasClass("active")) return this.sliding = !1;
        var c = e.Event("slide.bs.carousel", {
            relatedTarget: i[0],
            direction: s
        });
        return this.$element.trigger(c), c.isDefaultPrevented() ? void 0 : (this.sliding = !0, r && this.pause(), this.$indicators.length && (this.$indicators.find(".active").removeClass("active"), this.$element.one("slid.bs.carousel", function() {
            var t = e(l.$indicators.children()[l.getActiveIndex()]);
            t && t.addClass("active")
        })), e.support.transition && this.$element.hasClass("slide") ? (i.addClass(t), i[0].offsetWidth, o.addClass(s), i.addClass(s), o.one(e.support.transition.end, function() {
            i.removeClass([t, s].join(" ")).addClass("active"), o.removeClass(["active", s].join(" ")), l.sliding = !1, setTimeout(function() {
                l.$element.trigger("slid.bs.carousel")
            }, 0)
        }).emulateTransitionEnd(1e3 * o.css("transition-duration").slice(0, -1))) : (o.removeClass("active"), i.addClass("active"), this.sliding = !1, this.$element.trigger("slid.bs.carousel")), r && this.cycle(), this)
    };
    var n = e.fn.carousel;
    e.fn.carousel = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.carousel"),
                r = e.extend({}, t.DEFAULTS, o.data(), "object" == typeof n && n),
                s = "string" == typeof n ? n : r.slide;
            i || o.data("bs.carousel", i = new t(this, r)), "number" == typeof n ? i.to(n) : s ? i[s]() : r.interval && i.pause().cycle()
        })
    }, e.fn.carousel.Constructor = t, e.fn.carousel.noConflict = function() {
        return e.fn.carousel = n, this
    }, e(document).on("click.bs.carousel.data-api", "[data-slide], [data-slide-to]", function(t) {
        var n, o = e(this),
            i = e(o.attr("data-target") || (n = o.attr("href")) && n.replace(/.*(?=#[^\s]+$)/, "")),
            r = e.extend({}, i.data(), o.data()),
            s = o.attr("data-slide-to");
        s && (r.interval = !1), i.carousel(r), (s = o.attr("data-slide-to")) && i.data("bs.carousel").to(s), t.preventDefault()
    }), e(window).on("load", function() {
        e('[data-ride="carousel"]').each(function() {
            var t = e(this);
            t.carousel(t.data())
        })
    })
}(jQuery), + function(e) {
    "use strict";
    var t = function(n, o) {
        this.$element = e(n), this.options = e.extend({}, t.DEFAULTS, o), this.transitioning = null, this.options.parent && (this.$parent = e(this.options.parent)), this.options.toggle && this.toggle()
    };
    t.DEFAULTS = {
        toggle: !0
    }, t.prototype.dimension = function() {
        var e = this.$element.hasClass("width");
        return e ? "width" : "height"
    }, t.prototype.show = function() {
        if (!this.transitioning && !this.$element.hasClass("in")) {
            var t = e.Event("show.bs.collapse");
            if (this.$element.trigger(t), !t.isDefaultPrevented()) {
                var n = this.$parent && this.$parent.find("> .panel > .in");
                if (n && n.length) {
                    var o = n.data("bs.collapse");
                    if (o && o.transitioning) return;
                    n.collapse("hide"), o || n.data("bs.collapse", null)
                }
                var i = this.dimension();
                this.$element.removeClass("collapse").addClass("collapsing")[i](0), this.transitioning = 1;
                var r = function() {
                    this.$element.removeClass("collapsing").addClass("collapse in")[i]("auto"), this.transitioning = 0, this.$element.trigger("shown.bs.collapse")
                };
                if (!e.support.transition) return r.call(this);
                var s = e.camelCase(["scroll", i].join("-"));
                this.$element.one(e.support.transition.end, e.proxy(r, this)).emulateTransitionEnd(350)[i](this.$element[0][s])
            }
        }
    }, t.prototype.hide = function() {
        if (!this.transitioning && this.$element.hasClass("in")) {
            var t = e.Event("hide.bs.collapse");
            if (this.$element.trigger(t), !t.isDefaultPrevented()) {
                var n = this.dimension();
                this.$element[n](this.$element[n]())[0].offsetHeight, this.$element.addClass("collapsing").removeClass("collapse").removeClass("in"), this.transitioning = 1;
                var o = function() {
                    this.transitioning = 0, this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")
                };
                return e.support.transition ? void this.$element[n](0).one(e.support.transition.end, e.proxy(o, this)).emulateTransitionEnd(350) : o.call(this)
            }
        }
    }, t.prototype.toggle = function() {
        this[this.$element.hasClass("in") ? "hide" : "show"]()
    };
    var n = e.fn.collapse;
    e.fn.collapse = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.collapse"),
                r = e.extend({}, t.DEFAULTS, o.data(), "object" == typeof n && n);
            !i && r.toggle && "show" == n && (n = !n), i || o.data("bs.collapse", i = new t(this, r)), "string" == typeof n && i[n]()
        })
    }, e.fn.collapse.Constructor = t, e.fn.collapse.noConflict = function() {
        return e.fn.collapse = n, this
    }, e(document).on("click.bs.collapse.data-api", "[data-toggle=collapse]", function(t) {
        var n, o = e(this),
            i = o.attr("data-target") || t.preventDefault() || (n = o.attr("href")) && n.replace(/.*(?=#[^\s]+$)/, ""),
            r = e(i),
            s = r.data("bs.collapse"),
            a = s ? "toggle" : o.data(),
            l = o.attr("data-parent"),
            c = l && e(l);
        s && s.transitioning || (c && c.find('[data-toggle=collapse][data-parent="' + l + '"]').not(o).addClass("collapsed"), o[r.hasClass("in") ? "addClass" : "removeClass"]("collapsed")), r.collapse(a)
    })
}(jQuery), + function(e) {
    "use strict";

    function t(t) {
        e(o).remove(), e(i).each(function() {
            var o = n(e(this)),
                i = {
                    relatedTarget: this
                };
            o.hasClass("open") && (o.trigger(t = e.Event("hide.bs.dropdown", i)), t.isDefaultPrevented() || o.removeClass("open").trigger("hidden.bs.dropdown", i))
        })
    }

    function n(t) {
        var n = t.attr("data-target");
        n || (n = t.attr("href"), n = n && /#[A-Za-z]/.test(n) && n.replace(/.*(?=#[^\s]*$)/, ""));
        var o = n && e(n);
        return o && o.length ? o : t.parent()
    }
    var o = ".dropdown-backdrop",
        i = "[data-toggle=dropdown]",
        r = function(t) {
            e(t).on("click.bs.dropdown", this.toggle)
        };
    r.prototype.toggle = function(o) {
        var i = e(this);
        if (!i.is(".disabled, :disabled")) {
            var r = n(i),
                s = r.hasClass("open");
            if (t(), !s) {
                "ontouchstart" in document.documentElement && !r.closest(".navbar-nav").length && e('<div class="dropdown-backdrop"/>').insertAfter(e(this)).on("click", t);
                var a = {
                    relatedTarget: this
                };
                if (r.trigger(o = e.Event("show.bs.dropdown", a)), o.isDefaultPrevented()) return;
                r.toggleClass("open").trigger("shown.bs.dropdown", a), i.focus()
            }
            return !1
        }
    }, r.prototype.keydown = function(t) {
        if (/(38|40|27)/.test(t.keyCode)) {
            var o = e(this);
            if (t.preventDefault(), t.stopPropagation(), !o.is(".disabled, :disabled")) {
                var r = n(o),
                    s = r.hasClass("open");
                if (!s || s && 27 == t.keyCode) return 27 == t.which && r.find(i).focus(), o.click();
                var a = " li:not(.divider):visible a",
                    l = r.find("[role=menu]" + a + ", [role=listbox]" + a);
                if (l.length) {
                    var c = l.index(l.filter(":focus"));
                    38 == t.keyCode && c > 0 && c--, 40 == t.keyCode && c < l.length - 1 && c++, ~c || (c = 0), l.eq(c).focus()
                }
            }
        }
    };
    var s = e.fn.dropdown;
    e.fn.dropdown = function(t) {
        return this.each(function() {
            var n = e(this),
                o = n.data("bs.dropdown");
            o || n.data("bs.dropdown", o = new r(this)), "string" == typeof t && o[t].call(n)
        })
    }, e.fn.dropdown.Constructor = r, e.fn.dropdown.noConflict = function() {
        return e.fn.dropdown = s, this
    }, e(document).on("click.bs.dropdown.data-api", t).on("click.bs.dropdown.data-api", ".dropdown form", function(e) {
        e.stopPropagation()
    }).on("click.bs.dropdown.data-api", i, r.prototype.toggle).on("keydown.bs.dropdown.data-api", i + ", [role=menu], [role=listbox]", r.prototype.keydown)
}(jQuery), + function(e) {
    "use strict";
    var t = function(t, n) {
        this.options = n, this.$element = e(t), this.$backdrop = this.isShown = null, this.options.remote && this.$element.find(".modal-content").load(this.options.remote, e.proxy(function() {
            this.$element.trigger("loaded.bs.modal")
        }, this))
    };
    t.DEFAULTS = {
        backdrop: !0,
        keyboard: !0,
        show: !0
    }, t.prototype.toggle = function(e) {
        return this[this.isShown ? "hide" : "show"](e)
    }, t.prototype.show = function(t) {
        var n = this,
            o = e.Event("show.bs.modal", {
                relatedTarget: t
            });
        this.$element.trigger(o), this.isShown || o.isDefaultPrevented() || (this.isShown = !0, this.escape(), this.$element.on("click.dismiss.bs.modal", '[data-dismiss="modal"]', e.proxy(this.hide, this)), this.backdrop(function() {
            var o = e.support.transition && n.$element.hasClass("fade");
            n.$element.parent().length || n.$element.appendTo(document.body), n.$element.show().scrollTop(0), o && n.$element[0].offsetWidth, n.$element.addClass("in").attr("aria-hidden", !1), n.enforceFocus();
            var i = e.Event("shown.bs.modal", {
                relatedTarget: t
            });
            o ? n.$element.find(".modal-dialog").one(e.support.transition.end, function() {
                n.$element.focus().trigger(i)
            }).emulateTransitionEnd(300) : n.$element.focus().trigger(i)
        }))
    }, t.prototype.hide = function(t) {
        t && t.preventDefault(), t = e.Event("hide.bs.modal"), this.$element.trigger(t), this.isShown && !t.isDefaultPrevented() && (this.isShown = !1, this.escape(), e(document).off("focusin.bs.modal"), this.$element.removeClass("in").attr("aria-hidden", !0).off("click.dismiss.bs.modal"), e.support.transition && this.$element.hasClass("fade") ? this.$element.one(e.support.transition.end, e.proxy(this.hideModal, this)).emulateTransitionEnd(300) : this.hideModal())
    }, t.prototype.enforceFocus = function() {
        e(document).off("focusin.bs.modal").on("focusin.bs.modal", e.proxy(function(e) {
            this.$element[0] === e.target || this.$element.has(e.target).length || this.$element.focus()
        }, this))
    }, t.prototype.escape = function() {
        this.isShown && this.options.keyboard ? this.$element.on("keyup.dismiss.bs.modal", e.proxy(function(e) {
            27 == e.which && this.hide()
        }, this)) : this.isShown || this.$element.off("keyup.dismiss.bs.modal")
    }, t.prototype.hideModal = function() {
        var e = this;
        this.$element.hide(), this.backdrop(function() {
            e.removeBackdrop(), e.$element.trigger("hidden.bs.modal")
        })
    }, t.prototype.removeBackdrop = function() {
        this.$backdrop && this.$backdrop.remove(), this.$backdrop = null
    }, t.prototype.backdrop = function(t) {
        var n = this.$element.hasClass("fade") ? "fade" : "";
        if (this.isShown && this.options.backdrop) {
            var o = e.support.transition && n;
            if (this.$backdrop = e('<div class="modal-backdrop ' + n + '" />').appendTo(document.body), this.$element.on("click.dismiss.bs.modal", e.proxy(function(e) {
                    e.target === e.currentTarget && ("static" == this.options.backdrop ? this.$element[0].focus.call(this.$element[0]) : this.hide.call(this))
                }, this)), o && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !t) return;
            o ? this.$backdrop.one(e.support.transition.end, t).emulateTransitionEnd(150) : t()
        } else !this.isShown && this.$backdrop ? (this.$backdrop.removeClass("in"), e.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one(e.support.transition.end, t).emulateTransitionEnd(150) : t()) : t && t()
    };
    var n = e.fn.modal;
    e.fn.modal = function(n, o) {
        return this.each(function() {
            var i = e(this),
                r = i.data("bs.modal"),
                s = e.extend({}, t.DEFAULTS, i.data(), "object" == typeof n && n);
            r || i.data("bs.modal", r = new t(this, s)), "string" == typeof n ? r[n](o) : s.show && r.show(o)
        })
    }, e.fn.modal.Constructor = t, e.fn.modal.noConflict = function() {
        return e.fn.modal = n, this
    }, e(document).on("click.bs.modal.data-api", '[data-toggle="modal"]', function(t) {
        var n = e(this),
            o = n.attr("href"),
            i = e(n.attr("data-target") || o && o.replace(/.*(?=#[^\s]+$)/, "")),
            r = i.data("bs.modal") ? "toggle" : e.extend({
                remote: !/#/.test(o) && o
            }, i.data(), n.data());
        n.is("a") && t.preventDefault(), i.modal(r, this).one("hide", function() {
            n.is(":visible") && n.focus()
        })
    }), e(document).on("show.bs.modal", ".modal", function() {
        e(document.body).addClass("modal-open")
    }).on("hidden.bs.modal", ".modal", function() {
        e(document.body).removeClass("modal-open")
    })
}(jQuery), + function(e) {
    "use strict";
    var t = function(e, t) {
        this.type = this.options = this.enabled = this.timeout = this.hoverState = this.$element = null, this.init("tooltip", e, t)
    };
    t.DEFAULTS = {
        animation: !0,
        placement: "top",
        selector: !1,
        template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
        trigger: "hover focus",
        title: "",
        delay: 0,
        html: !1,
        container: !1
    }, t.prototype.init = function(t, n, o) {
        this.enabled = !0, this.type = t, this.$element = e(n), this.options = this.getOptions(o);
        for (var i = this.options.trigger.split(" "), r = i.length; r--;) {
            var s = i[r];
            if ("click" == s) this.$element.on("click." + this.type, this.options.selector, e.proxy(this.toggle, this));
            else if ("manual" != s) {
                var a = "hover" == s ? "mouseenter" : "focusin",
                    l = "hover" == s ? "mouseleave" : "focusout";
                this.$element.on(a + "." + this.type, this.options.selector, e.proxy(this.enter, this)), this.$element.on(l + "." + this.type, this.options.selector, e.proxy(this.leave, this))
            }
        }
        this.options.selector ? this._options = e.extend({}, this.options, {
            trigger: "manual",
            selector: ""
        }) : this.fixTitle()
    }, t.prototype.getDefaults = function() {
        return t.DEFAULTS
    }, t.prototype.getOptions = function(t) {
        return t = e.extend({}, this.getDefaults(), this.$element.data(), t), t.delay && "number" == typeof t.delay && (t.delay = {
            show: t.delay,
            hide: t.delay
        }), t
    }, t.prototype.getDelegateOptions = function() {
        var t = {},
            n = this.getDefaults();
        return this._options && e.each(this._options, function(e, o) {
            n[e] != o && (t[e] = o)
        }), t
    }, t.prototype.enter = function(t) {
        var n = t instanceof this.constructor ? t : e(t.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        return clearTimeout(n.timeout), n.hoverState = "in", n.options.delay && n.options.delay.show ? void(n.timeout = setTimeout(function() {
            "in" == n.hoverState && n.show()
        }, n.options.delay.show)) : n.show()
    }, t.prototype.leave = function(t) {
        var n = t instanceof this.constructor ? t : e(t.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        return clearTimeout(n.timeout), n.hoverState = "out", n.options.delay && n.options.delay.hide ? void(n.timeout = setTimeout(function() {
            "out" == n.hoverState && n.hide()
        }, n.options.delay.hide)) : n.hide()
    }, t.prototype.show = function() {
        var t = e.Event("show.bs." + this.type);
        if (this.hasContent() && this.enabled) {
            if (this.$element.trigger(t), t.isDefaultPrevented()) return;
            var n = this,
                o = this.tip();
            this.setContent(), this.options.animation && o.addClass("fade");
            var i = "function" == typeof this.options.placement ? this.options.placement.call(this, o[0], this.$element[0]) : this.options.placement,
                r = /\s?auto?\s?/i,
                s = r.test(i);
            s && (i = i.replace(r, "") || "top"), o.detach().css({
                top: 0,
                left: 0,
                display: "block"
            }).addClass(i), this.options.container ? o.appendTo(this.options.container) : o.insertAfter(this.$element);
            var a = this.getPosition(),
                l = o[0].offsetWidth,
                c = o[0].offsetHeight;
            if (s) {
                var d = this.$element.parent(),
                    u = i,
                    p = document.documentElement.scrollTop || document.body.scrollTop,
                    f = "body" == this.options.container ? window.innerWidth : d.outerWidth(),
                    h = "body" == this.options.container ? window.innerHeight : d.outerHeight(),
                    m = "body" == this.options.container ? 0 : d.offset().left;
                i = "bottom" == i && a.top + a.height + c - p > h ? "top" : "top" == i && a.top - p - c < 0 ? "bottom" : "right" == i && a.right + l > f ? "left" : "left" == i && a.left - l < m ? "right" : i, o.removeClass(u).addClass(i)
            }
            var g = this.getCalculatedOffset(i, a, l, c);
            this.applyPlacement(g, i), this.hoverState = null;
            var v = function() {
                n.$element.trigger("shown.bs." + n.type)
            };
            e.support.transition && this.$tip.hasClass("fade") ? o.one(e.support.transition.end, v).emulateTransitionEnd(150) : v()
        }
    }, t.prototype.applyPlacement = function(t, n) {
        var o, i = this.tip(),
            r = i[0].offsetWidth,
            s = i[0].offsetHeight,
            a = parseInt(i.css("margin-top"), 10),
            l = parseInt(i.css("margin-left"), 10);
        isNaN(a) && (a = 0), isNaN(l) && (l = 0), t.top = t.top + a, t.left = t.left + l, e.offset.setOffset(i[0], e.extend({
            using: function(e) {
                i.css({
                    top: Math.round(e.top),
                    left: Math.round(e.left)
                })
            }
        }, t), 0), i.addClass("in");
        var c = i[0].offsetWidth,
            d = i[0].offsetHeight;
        if ("top" == n && d != s && (o = !0, t.top = t.top + s - d), /bottom|top/.test(n)) {
            var u = 0;
            t.left < 0 && (u = -2 * t.left, t.left = 0, i.offset(t), c = i[0].offsetWidth, d = i[0].offsetHeight), this.replaceArrow(u - r + c, c, "left")
        } else this.replaceArrow(d - s, d, "top");
        o && i.offset(t)
    }, t.prototype.replaceArrow = function(e, t, n) {
        this.arrow().css(n, e ? 50 * (1 - e / t) + "%" : "")
    }, t.prototype.setContent = function() {
        var e = this.tip(),
            t = this.getTitle();
        e.find(".tooltip-inner")[this.options.html ? "html" : "text"](t), e.removeClass("fade in top bottom left right")
    }, t.prototype.hide = function() {
        function t() {
            "in" != n.hoverState && o.detach(), n.$element.trigger("hidden.bs." + n.type)
        }
        var n = this,
            o = this.tip(),
            i = e.Event("hide.bs." + this.type);
        return this.$element.trigger(i), i.isDefaultPrevented() ? void 0 : (o.removeClass("in"), e.support.transition && this.$tip.hasClass("fade") ? o.one(e.support.transition.end, t).emulateTransitionEnd(150) : t(), this.hoverState = null, this)
    }, t.prototype.fixTitle = function() {
        var e = this.$element;
        (e.attr("title") || "string" != typeof e.attr("data-original-title")) && e.attr("data-original-title", e.attr("title") || "").attr("title", "")
    }, t.prototype.hasContent = function() {
        return this.getTitle()
    }, t.prototype.getPosition = function() {
        var t = this.$element[0];
        return e.extend({}, "function" == typeof t.getBoundingClientRect ? t.getBoundingClientRect() : {
            width: t.offsetWidth,
            height: t.offsetHeight
        }, this.$element.offset())
    }, t.prototype.getCalculatedOffset = function(e, t, n, o) {
        return "bottom" == e ? {
            top: t.top + t.height,
            left: t.left + t.width / 2 - n / 2
        } : "top" == e ? {
            top: t.top - o,
            left: t.left + t.width / 2 - n / 2
        } : "left" == e ? {
            top: t.top + t.height / 2 - o / 2,
            left: t.left - n
        } : {
            top: t.top + t.height / 2 - o / 2,
            left: t.left + t.width
        }
    }, t.prototype.getTitle = function() {
        var e, t = this.$element,
            n = this.options;
        return e = t.attr("data-original-title") || ("function" == typeof n.title ? n.title.call(t[0]) : n.title)
    }, t.prototype.tip = function() {
        return this.$tip = this.$tip || e(this.options.template)
    }, t.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    }, t.prototype.validate = function() {
        this.$element[0].parentNode || (this.hide(), this.$element = null, this.options = null)
    }, t.prototype.enable = function() {
        this.enabled = !0
    }, t.prototype.disable = function() {
        this.enabled = !1
    }, t.prototype.toggleEnabled = function() {
        this.enabled = !this.enabled
    }, t.prototype.toggle = function(t) {
        var n = t ? e(t.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type) : this;
        n.tip().hasClass("in") ? n.leave(n) : n.enter(n)
    }, t.prototype.destroy = function() {
        clearTimeout(this.timeout), this.hide().$element.off("." + this.type).removeData("bs." + this.type)
    };
    var n = e.fn.tooltip;
    e.fn.tooltip = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.tooltip"),
                r = "object" == typeof n && n;
            (i || "destroy" != n) && (i || o.data("bs.tooltip", i = new t(this, r)), "string" == typeof n && i[n]())
        })
    }, e.fn.tooltip.Constructor = t, e.fn.tooltip.noConflict = function() {
        return e.fn.tooltip = n, this
    }
}(jQuery), + function(e) {
    "use strict";
    var t = function(e, t) {
        this.init("popover", e, t)
    };
    if (!e.fn.tooltip) throw new Error("Popover requires tooltip.js");
    t.DEFAULTS = e.extend({}, e.fn.tooltip.Constructor.DEFAULTS, {
        placement: "right",
        trigger: "click",
        content: "",
        template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
    }), t.prototype = e.extend({}, e.fn.tooltip.Constructor.prototype), t.prototype.constructor = t, t.prototype.getDefaults = function() {
        return t.DEFAULTS
    }, t.prototype.setContent = function() {
        var e = this.tip(),
            t = this.getTitle(),
            n = this.getContent();
        e.find(".popover-title")[this.options.html ? "html" : "text"](t), e.find(".popover-content")[this.options.html ? "string" == typeof n ? "html" : "append" : "text"](n), e.removeClass("fade top bottom left right in"), e.find(".popover-title").html() || e.find(".popover-title").hide()
    }, t.prototype.hasContent = function() {
        return this.getTitle() || this.getContent()
    }, t.prototype.getContent = function() {
        var e = this.$element,
            t = this.options;
        return e.attr("data-content") || ("function" == typeof t.content ? t.content.call(e[0]) : t.content)
    }, t.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".arrow")
    }, t.prototype.tip = function() {
        return this.$tip || (this.$tip = e(this.options.template)), this.$tip
    };
    var n = e.fn.popover;
    e.fn.popover = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.popover"),
                r = "object" == typeof n && n;
            (i || "destroy" != n) && (i || o.data("bs.popover", i = new t(this, r)), "string" == typeof n && i[n]())
        })
    }, e.fn.popover.Constructor = t, e.fn.popover.noConflict = function() {
        return e.fn.popover = n, this
    }
}(jQuery), + function(e) {
    "use strict";

    function t(n, o) {
        var i, r = e.proxy(this.process, this);
        this.$element = e(e(n).is("body") ? window : n), this.$body = e("body"), this.$scrollElement = this.$element.on("scroll.bs.scroll-spy.data-api", r), this.options = e.extend({}, t.DEFAULTS, o), this.selector = (this.options.target || (i = e(n).attr("href")) && i.replace(/.*(?=#[^\s]+$)/, "") || "") + " .nav li > a", this.offsets = e([]), this.targets = e([]), this.activeTarget = null, this.refresh(), this.process()
    }
    t.DEFAULTS = {
        offset: 10
    }, t.prototype.refresh = function() {
        var t = this.$element[0] == window ? "offset" : "position";
        this.offsets = e([]), this.targets = e([]);
        var n = this;
        this.$body.find(this.selector).map(function() {
            var o = e(this),
                i = o.data("target") || o.attr("href"),
                r = /^#./.test(i) && e(i);
            return r && r.length && r.is(":visible") && [
                [r[t]().top + (!e.isWindow(n.$scrollElement.get(0)) && n.$scrollElement.scrollTop()), i]
            ] || null
        }).sort(function(e, t) {
            return e[0] - t[0]
        }).each(function() {
            n.offsets.push(this[0]),
                n.targets.push(this[1])
        })
    }, t.prototype.process = function() {
        var e, t = this.$scrollElement.scrollTop() + this.options.offset,
            n = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight,
            o = n - this.$scrollElement.height(),
            i = this.offsets,
            r = this.targets,
            s = this.activeTarget;
        if (t >= o) return s != (e = r.last()[0]) && this.activate(e);
        if (s && t <= i[0]) return s != (e = r[0]) && this.activate(e);
        for (e = i.length; e--;) s != r[e] && t >= i[e] && (!i[e + 1] || t <= i[e + 1]) && this.activate(r[e])
    }, t.prototype.activate = function(t) {
        this.activeTarget = t, e(this.selector).parentsUntil(this.options.target, ".active").removeClass("active");
        var n = this.selector + '[data-target="' + t + '"],' + this.selector + '[href="' + t + '"]',
            o = e(n).parents("li").addClass("active");
        o.parent(".dropdown-menu").length && (o = o.closest("li.dropdown").addClass("active")), o.trigger("activate.bs.scrollspy")
    };
    var n = e.fn.scrollspy;
    e.fn.scrollspy = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.scrollspy"),
                r = "object" == typeof n && n;
            i || o.data("bs.scrollspy", i = new t(this, r)), "string" == typeof n && i[n]()
        })
    }, e.fn.scrollspy.Constructor = t, e.fn.scrollspy.noConflict = function() {
        return e.fn.scrollspy = n, this
    }, e(window).on("load", function() {
        e('[data-spy="scroll"]').each(function() {
            var t = e(this);
            t.scrollspy(t.data())
        })
    })
}(jQuery), + function(e) {
    "use strict";
    var t = function(t) {
        this.element = e(t)
    };
    t.prototype.show = function() {
        var t = this.element,
            n = t.closest("ul:not(.dropdown-menu)"),
            o = t.data("target");
        if (o || (o = t.attr("href"), o = o && o.replace(/.*(?=#[^\s]*$)/, "")), !t.parent("li").hasClass("active")) {
            var i = n.find(".active:last a")[0],
                r = e.Event("show.bs.tab", {
                    relatedTarget: i
                });
            if (t.trigger(r), !r.isDefaultPrevented()) {
                var s = e(o);
                this.activate(t.parent("li"), n), this.activate(s, s.parent(), function() {
                    t.trigger({
                        type: "shown.bs.tab",
                        relatedTarget: i
                    })
                })
            }
        }
    }, t.prototype.activate = function(t, n, o) {
        function i() {
            r.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"), t.addClass("active"), s ? (t[0].offsetWidth, t.addClass("in")) : t.removeClass("fade"), t.parent(".dropdown-menu") && t.closest("li.dropdown").addClass("active"), o && o()
        }
        var r = n.find("> .active"),
            s = o && e.support.transition && r.hasClass("fade");
        s ? r.one(e.support.transition.end, i).emulateTransitionEnd(150) : i(), r.removeClass("in")
    };
    var n = e.fn.tab;
    e.fn.tab = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.tab");
            i || o.data("bs.tab", i = new t(this)), "string" == typeof n && i[n]()
        })
    }, e.fn.tab.Constructor = t, e.fn.tab.noConflict = function() {
        return e.fn.tab = n, this
    }, e(document).on("click.bs.tab.data-api", '[data-toggle="tab"], [data-toggle="pill"]', function(t) {
        t.preventDefault(), e(this).tab("show")
    })
}(jQuery), + function(e) {
    "use strict";
    var t = function(n, o) {
        this.options = e.extend({}, t.DEFAULTS, o), this.$window = e(window).on("scroll.bs.affix.data-api", e.proxy(this.checkPosition, this)).on("click.bs.affix.data-api", e.proxy(this.checkPositionWithEventLoop, this)), this.$element = e(n), this.affixed = this.unpin = this.pinnedOffset = null, this.checkPosition()
    };
    t.RESET = "affix affix-top affix-bottom", t.DEFAULTS = {
        offset: 0
    }, t.prototype.getPinnedOffset = function() {
        if (this.pinnedOffset) return this.pinnedOffset;
        this.$element.removeClass(t.RESET).addClass("affix");
        var e = this.$window.scrollTop(),
            n = this.$element.offset();
        return this.pinnedOffset = n.top - e
    }, t.prototype.checkPositionWithEventLoop = function() {
        setTimeout(e.proxy(this.checkPosition, this), 1)
    }, t.prototype.checkPosition = function() {
        if (this.$element.is(":visible")) {
            var n = e(document).height(),
                o = this.$window.scrollTop(),
                i = this.$element.offset(),
                r = this.options.offset,
                s = r.top,
                a = r.bottom;
            "top" == this.affixed && (i.top += o), "object" != typeof r && (a = s = r), "function" == typeof s && (s = r.top(this.$element)), "function" == typeof a && (a = r.bottom(this.$element));
            var l = null != this.unpin && o + this.unpin <= i.top ? !1 : null != a && i.top + this.$element.height() >= n - a ? "bottom" : null != s && s >= o ? "top" : !1;
            if (this.affixed !== l) {
                this.unpin && this.$element.css("top", "");
                var c = "affix" + (l ? "-" + l : ""),
                    d = e.Event(c + ".bs.affix");
                this.$element.trigger(d), d.isDefaultPrevented() || (this.affixed = l, this.unpin = "bottom" == l ? this.getPinnedOffset() : null, this.$element.removeClass(t.RESET).addClass(c).trigger(e.Event(c.replace("affix", "affixed"))), "bottom" == l && this.$element.offset({
                    top: n - a - this.$element.height()
                }))
            }
        }
    };
    var n = e.fn.affix;
    e.fn.affix = function(n) {
        return this.each(function() {
            var o = e(this),
                i = o.data("bs.affix"),
                r = "object" == typeof n && n;
            i || o.data("bs.affix", i = new t(this, r)), "string" == typeof n && i[n]()
        })
    }, e.fn.affix.Constructor = t, e.fn.affix.noConflict = function() {
        return e.fn.affix = n, this
    }, e(window).on("load", function() {
        e('[data-spy="affix"]').each(function() {
            var t = e(this),
                n = t.data();
            n.offset = n.offset || {}, n.offsetBottom && (n.offset.bottom = n.offsetBottom), n.offsetTop && (n.offset.top = n.offsetTop), t.affix(n)
        })
    })
}(jQuery),
function(e, t) {
    var n = function() {
        function n(t, n) {
            "dot" == t ? (n = '<ol class="dots">', e.each(o.li, function(e) {
                n += '<li class="' + (e == o.i ? t + " active" : t) + '">' + ++e + "</li>"
            }), n += "</ol>") : (n = '<div class="', n = n + t + 's">' + n + t + ' prev">' + o.o.prev + "</div>" + n + t + ' next">' + o.o.next + "</div></div>"), o.el.addClass("has-" + t + "s").append(n).find("." + t).click(function() {
                var t = e(this);
                t.hasClass("dot") ? o.stop().to(t.index()) : t.hasClass("prev") ? o.prev() : o.next()
            })
        }
        var o = this;
        o.o = {
            speed: 500,
            delay: 3e3,
            init: 0,
            pause: !t,
            loop: !t,
            keys: t,
            dots: t,
            arrows: t,
            prev: "\u2190",
            next: "\u2192",
            fluid: t,
            starting: t,
            complete: t,
            items: ">ul",
            item: ">li",
            easing: "swing",
            autoplay: !0
        }, o.init = function(t, i) {
            o.o = e.extend(o.o, i), o.el = t, o.ul = t.find(o.o.items), o.max = [0 | t.outerWidth(), 0 | t.outerHeight()], o.li = o.ul.find(o.o.item).each(function(t) {
                var n = e(this),
                    i = n.outerWidth(),
                    r = n.outerHeight();
                i > o.max[0] && (o.max[0] = i), r > o.max[1] && (o.max[1] = r)
            });
            var i = o.o,
                r = o.ul,
                s = o.li,
                a = s.length;
            return o.i = 0, t.css({
                width: o.max[0],
                height: s.first().outerHeight(),
                overflow: "hidden"
            }), r.css({
                position: "relative",
                left: 0,
                width: 100 * a + "%"
            }), s.css({
                "float": "left",
                width: o.max[0] + "px"
            }), i.autoplay && setTimeout(function() {
                0 | i.delay && (o.play(), i.pause && t.on("mouseover mouseout", function(e) {
                    o.stop(), "mouseout" == e.type && o.play()
                }))
            }, 0 | i.init), i.keys && e(document).keydown(function(e) {
                var t = e.which;
                37 == t ? o.prev() : 39 == t ? o.next() : 27 == t && o.stop()
            }), i.dots && n("dot"), i.arrows && n("arrow"), i.fluid && e(window).resize(function() {
                o.r && clearTimeout(o.r), o.r = setTimeout(function() {
                    var e = {
                            height: s.eq(o.i).outerHeight()
                        },
                        n = t.outerWidth();
                    r.css(e), e.width = Math.min(Math.round(n / t.parent().width() * 100), 100) + "%", t.css(e)
                }, 50)
            }).resize(), (e.event.special.swipe || e.Event("swipe")) && t.on("swipeleft swiperight swipeLeft swipeRight", function(e) {
                "swipeleft" == e.type.toLowerCase() ? o.next() : o.prev()
            }), o
        }, o.to = function(n, i) {
            o.t && (o.stop(), o.play());
            var r = o.o,
                s = o.el,
                a = o.ul,
                l = o.li,
                c = o.i,
                d = l.eq(n);
            if (e.isFunction(r.starting) && !i && r.starting(s, l.eq(c)), d.length && !(0 > n) || r.loop != t) {
                d.length || (n = 0), 0 > n && (n = l.length - 1), d = l.eq(n);
                var u = i ? 5 : 0 | r.speed,
                    p = r.easing,
                    f = {
                        height: d.outerHeight()
                    };
                a.queue("fx").length || (s.find(".dot").eq(n).addClass("active").siblings().removeClass("active"), s.animate(f, u, p) && a.animate(e.extend({
                    left: "-" + n + "00%"
                }, f), u, p, function(t) {
                    o.i = n, e.isFunction(r.complete) && !i && r.complete(s, d)
                }))
            }
        }, o.play = function() {
            o.t = setInterval(function() {
                o.to(o.i + 1)
            }, 0 | o.o.delay)
        }, o.stop = function() {
            return o.t = clearInterval(o.t), o
        }, o.next = function() {
            return o.stop().to(o.i + 1)
        }, o.prev = function() {
            return o.stop().to(o.i - 1)
        }
    };
    e.fn.unslider = function(t) {
        var o = this.length;
        return this.each(function(i) {
            var r = e(this),
                s = "unslider" + (o > 1 ? "-" + ++i : ""),
                a = (new n).init(r, t);
            r.data(s, a).data("key", s)
        })
    }, n.version = "1.0.0"
}(jQuery, !1),
function(e) {
    "use strict";

    function t(e) {
        return new RegExp("(^|\\s+)" + e + "(\\s+|$)")
    }

    function n(e, t) {
        var n = o(e, t) ? r : i;
        n(e, t)
    }
    var o, i, r;
    "classList" in document.documentElement ? (o = function(e, t) {
        return e.classList.contains(t)
    }, i = function(e, t) {
        e.classList.add(t)
    }, r = function(e, t) {
        e.classList.remove(t)
    }) : (o = function(e, n) {
        return t(n).test(e.className)
    }, i = function(e, t) {
        o(e, t) || (e.className = e.className + " " + t)
    }, r = function(e, n) {
        e.className = e.className.replace(t(n), " ")
    });
    var s = {
        hasClass: o,
        addClass: i,
        removeClass: r,
        toggleClass: n,
        has: o,
        add: i,
        remove: r,
        toggle: n
    };
    "function" == typeof define && define.amd ? define(s) : "object" == typeof exports ? module.exports = s : e.classie = s
}(window);
var ModalEffects = function() {
    function e() {
        function e(e, t) {
            function n(t) {
                classie.remove(e, "md-show"), t && classie.remove(document.documentElement, "md-perspective")
            }

            function o(n) {
                var o = document.querySelector(".md-overlay");
                classie.add(e, "md-show"), o.removeEventListener("click", i), o.addEventListener("click", i), classie.has(t, "md-setperspective") && setTimeout(function() {
                    classie.add(document.documentElement, "md-perspective")
                }, 25)
            }

            function i() {
                n(classie.has(t, "md-setperspective"))
            }
            var r = e.querySelector(".md-close");
            t.addEventListener("click", o), e.addEventListener("show", o), e.addEventListener("hide", i), r.addEventListener("click", function(e) {
                e.stopPropagation(), i()
            })
        }[].slice.call(document.querySelectorAll(".md-trigger")).forEach(function(t, n) {
            var o = document.querySelector("#" + t.getAttribute("data-modal"));
            e(o, t)
        })
    }
    jQuery(e)
}();
(function() {
    var e, t, n, o, i, r, s, a, l = [].slice,
        c = {}.hasOwnProperty,
        d = function(e, t) {
            function n() {
                this.constructor = e
            }
            for (var o in t) c.call(t, o) && (e[o] = t[o]);
            return n.prototype = t.prototype, e.prototype = new n, e.__super__ = t.prototype, e
        };
    s = function() {}, t = function() {
        function e() {}
        return e.prototype.addEventListener = e.prototype.on, e.prototype.on = function(e, t) {
            return this._callbacks = this._callbacks || {}, this._callbacks[e] || (this._callbacks[e] = []), this._callbacks[e].push(t), this
        }, e.prototype.emit = function() {
            var e, t, n, o, i, r;
            if (o = arguments[0], e = 2 <= arguments.length ? l.call(arguments, 1) : [], this._callbacks = this._callbacks || {}, n = this._callbacks[o])
                for (i = 0, r = n.length; r > i; i++) t = n[i], t.apply(this, e);
            return this
        }, e.prototype.removeListener = e.prototype.off, e.prototype.removeAllListeners = e.prototype.off, e.prototype.removeEventListener = e.prototype.off, e.prototype.off = function(e, t) {
            var n, o, i, r, s;
            if (!this._callbacks || 0 === arguments.length) return this._callbacks = {}, this;
            if (o = this._callbacks[e], !o) return this;
            if (1 === arguments.length) return delete this._callbacks[e], this;
            for (i = r = 0, s = o.length; s > r; i = ++r)
                if (n = o[i], n === t) {
                    o.splice(i, 1);
                    break
                }
            return this
        }, e
    }(), e = function(e) {
        function n(e, t) {
            var i, r, s;
            if (this.element = e, this.version = n.version, this.defaultOptions.previewTemplate = this.defaultOptions.previewTemplate.replace(/\n*/g, ""), this.clickableElements = [], this.listeners = [], this.files = [], "string" == typeof this.element && (this.element = document.querySelector(this.element)), !this.element || null == this.element.nodeType) throw new Error("Invalid dropzone element.");
            if (this.element.dropzone) throw new Error("Dropzone already attached.");
            if (n.instances.push(this), this.element.dropzone = this, i = null != (s = n.optionsForElement(this.element)) ? s : {}, this.options = o({}, this.defaultOptions, i, null != t ? t : {}), this.options.forceFallback || !n.isBrowserSupported()) return this.options.fallback.call(this);
            if (null == this.options.url && (this.options.url = this.element.getAttribute("action")), !this.options.url) throw new Error("No URL provided.");
            if (this.options.acceptedFiles && this.options.acceptedMimeTypes) throw new Error("You can't provide both 'acceptedFiles' and 'acceptedMimeTypes'. 'acceptedMimeTypes' is deprecated.");
            this.options.acceptedMimeTypes && (this.options.acceptedFiles = this.options.acceptedMimeTypes, delete this.options.acceptedMimeTypes), this.options.method = this.options.method.toUpperCase(), (r = this.getExistingFallback()) && r.parentNode && r.parentNode.removeChild(r), this.options.previewsContainer !== !1 && (this.previewsContainer = this.options.previewsContainer ? n.getElement(this.options.previewsContainer, "previewsContainer") : this.element), this.options.clickable && (this.clickableElements = this.options.clickable === !0 ? [this.element] : n.getElements(this.options.clickable, "clickable")), this.init()
        }
        var o, i;
        return d(n, e), n.prototype.Emitter = t, n.prototype.events = ["drop", "dragstart", "dragend", "dragenter", "dragover", "dragleave", "addedfile", "removedfile", "thumbnail", "error", "errormultiple", "processing", "processingmultiple", "uploadprogress", "totaluploadprogress", "sending", "sendingmultiple", "success", "successmultiple", "canceled", "canceledmultiple", "complete", "completemultiple", "reset", "maxfilesexceeded", "maxfilesreached", "queuecomplete"], n.prototype.defaultOptions = {
            url: null,
            method: "post",
            withCredentials: !1,
            parallelUploads: 2,
            uploadMultiple: !1,
            maxFilesize: 256,
            paramName: "file",
            createImageThumbnails: !0,
            maxThumbnailFilesize: 10,
            thumbnailWidth: 120,
            thumbnailHeight: 120,
            filesizeBase: 1e3,
            maxFiles: null,
            filesizeBase: 1e3,
            params: {},
            clickable: !0,
            ignoreHiddenFiles: !0,
            acceptedFiles: null,
            acceptedMimeTypes: null,
            autoProcessQueue: !0,
            autoQueue: !0,
            addRemoveLinks: !1,
            previewsContainer: null,
            capture: null,
            dictDefaultMessage: "Drop files here to upload",
            dictFallbackMessage: "Your browser does not support drag'n'drop file uploads.",
            dictFallbackText: "Please use the fallback form below to upload your files like in the olden days.",
            dictFileTooBig: "File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.",
            dictInvalidFileType: "You can't upload files of this type.",
            dictResponseError: "Server responded with {{statusCode}} code.",
            dictCancelUpload: "Cancel upload",
            dictCancelUploadConfirmation: "Are you sure you want to cancel this upload?",
            dictRemoveFile: "Remove file",
            dictRemoveFileConfirmation: null,
            dictMaxFilesExceeded: "You can not upload any more files.",
            accept: function(e, t) {
                return t()
            },
            init: function() {
                return s
            },
            forceFallback: !1,
            fallback: function() {
                var e, t, o, i, r, s;
                for (this.element.className = "" + this.element.className + " dz-browser-not-supported", s = this.element.getElementsByTagName("div"), i = 0, r = s.length; r > i; i++) e = s[i], /(^| )dz-message($| )/.test(e.className) && (t = e, e.className = "dz-message");
                return t || (t = n.createElement('<div class="dz-message"><span></span></div>'), this.element.appendChild(t)), o = t.getElementsByTagName("span")[0], o && (o.textContent = this.options.dictFallbackMessage), this.element.appendChild(this.getFallbackForm())
            },
            resize: function(e) {
                var t, n, o;
                return t = {
                    srcX: 0,
                    srcY: 0,
                    srcWidth: e.width,
                    srcHeight: e.height
                }, n = e.width / e.height, t.optWidth = this.options.thumbnailWidth, t.optHeight = this.options.thumbnailHeight, null == t.optWidth && null == t.optHeight ? (t.optWidth = t.srcWidth, t.optHeight = t.srcHeight) : null == t.optWidth ? t.optWidth = n * t.optHeight : null == t.optHeight && (t.optHeight = 1 / n * t.optWidth), o = t.optWidth / t.optHeight, e.height < t.optHeight || e.width < t.optWidth ? (t.trgHeight = t.srcHeight, t.trgWidth = t.srcWidth) : n > o ? (t.srcHeight = e.height, t.srcWidth = t.srcHeight * o) : (t.srcWidth = e.width, t.srcHeight = t.srcWidth / o), t.srcX = (e.width - t.srcWidth) / 2, t.srcY = (e.height - t.srcHeight) / 2, t
            },
            drop: function() {
                return this.element.classList.remove("dz-drag-hover")
            },
            dragstart: s,
            dragend: function() {
                return this.element.classList.remove("dz-drag-hover")
            },
            dragenter: function() {
                return this.element.classList.add("dz-drag-hover")
            },
            dragover: function() {
                return this.element.classList.add("dz-drag-hover")
            },
            dragleave: function() {
                return this.element.classList.remove("dz-drag-hover")
            },
            paste: s,
            reset: function() {
                return this.element.classList.remove("dz-started")
            },
            addedfile: function(e) {
                var t, o, i, r, s, a, l, c, d, u, p, f, h;
                if (this.element === this.previewsContainer && this.element.classList.add("dz-started"), this.previewsContainer) {
                    for (e.previewElement = n.createElement(this.options.previewTemplate.trim()), e.previewTemplate = e.previewElement, this.previewsContainer.appendChild(e.previewElement), u = e.previewElement.querySelectorAll("[data-dz-name]"), r = 0, l = u.length; l > r; r++) t = u[r], t.textContent = e.name;
                    for (p = e.previewElement.querySelectorAll("[data-dz-size]"), s = 0, c = p.length; c > s; s++) t = p[s], t.innerHTML = this.filesize(e.size);
                    for (this.options.addRemoveLinks && (e._removeLink = n.createElement('<a class="dz-remove" href="javascript:undefined;" data-dz-remove>' + this.options.dictRemoveFile + "</a>"), e.previewElement.appendChild(e._removeLink)), o = function(t) {
                            return function(o) {
                                return o.preventDefault(), o.stopPropagation(), e.status === n.UPLOADING ? n.confirm(t.options.dictCancelUploadConfirmation, function() {
                                    return t.removeFile(e)
                                }) : t.options.dictRemoveFileConfirmation ? n.confirm(t.options.dictRemoveFileConfirmation, function() {
                                    return t.removeFile(e)
                                }) : t.removeFile(e)
                            }
                        }(this), f = e.previewElement.querySelectorAll("[data-dz-remove]"), h = [], a = 0, d = f.length; d > a; a++) i = f[a], h.push(i.addEventListener("click", o));
                    return h
                }
            },
            removedfile: function(e) {
                var t;
                return e.previewElement && null != (t = e.previewElement) && t.parentNode.removeChild(e.previewElement), this._updateMaxFilesReachedClass()
            },
            thumbnail: function(e, t) {
                var n, o, i, r;
                if (e.previewElement) {
                    for (e.previewElement.classList.remove("dz-file-preview"), r = e.previewElement.querySelectorAll("[data-dz-thumbnail]"), o = 0, i = r.length; i > o; o++) n = r[o], n.alt = e.name, n.src = t;
                    return setTimeout(function() {
                        return function() {
                            return e.previewElement.classList.add("dz-image-preview")
                        }
                    }(this), 1)
                }
            },
            error: function(e, t) {
                var n, o, i, r, s;
                if (e.previewElement) {
                    for (e.previewElement.classList.add("dz-error"), "String" != typeof t && t.error && (t = t.error), r = e.previewElement.querySelectorAll("[data-dz-errormessage]"), s = [], o = 0, i = r.length; i > o; o++) n = r[o], s.push(n.textContent = t);
                    return s
                }
            },
            errormultiple: s,
            processing: function(e) {
                return e.previewElement && (e.previewElement.classList.add("dz-processing"), e._removeLink) ? e._removeLink.textContent = this.options.dictCancelUpload : void 0
            },
            processingmultiple: s,
            uploadprogress: function(e, t) {
                var n, o, i, r, s;
                if (e.previewElement) {
                    for (r = e.previewElement.querySelectorAll("[data-dz-uploadprogress]"), s = [], o = 0, i = r.length; i > o; o++) n = r[o], s.push("PROGRESS" === n.nodeName ? n.value = t : n.style.width = "" + t + "%");
                    return s
                }
            },
            totaluploadprogress: s,
            sending: s,
            sendingmultiple: s,
            success: function(e) {
                return e.previewElement ? e.previewElement.classList.add("dz-success") : void 0
            },
            successmultiple: s,
            canceled: function(e) {
                return this.emit("error", e, "Upload canceled.")
            },
            canceledmultiple: s,
            complete: function(e) {
                return e._removeLink && (e._removeLink.textContent = this.options.dictRemoveFile), e.previewElement ? e.previewElement.classList.add("dz-complete") : void 0
            },
            completemultiple: s,
            maxfilesexceeded: s,
            maxfilesreached: s,
            queuecomplete: s,
            previewTemplate: '<div class="dz-preview dz-file-preview">\n  <div class="dz-image"><img data-dz-thumbnail /></div>\n  <div class="dz-details">\n    <div class="dz-size"><span data-dz-size></span></div>\n    <div class="dz-filename"><span data-dz-name></span></div>\n  </div>\n  <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div>\n  <div class="dz-error-message"><span data-dz-errormessage></span></div>\n  <div class="dz-success-mark">\n    <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">\n      <title>Check</title>\n      <defs></defs>\n      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">\n        <path d="M23.5,31.8431458 L17.5852419,25.9283877 C16.0248253,24.3679711 13.4910294,24.366835 11.9289322,25.9289322 C10.3700136,27.4878508 10.3665912,30.0234455 11.9283877,31.5852419 L20.4147581,40.0716123 C20.5133999,40.1702541 20.6159315,40.2626649 20.7218615,40.3488435 C22.2835669,41.8725651 24.794234,41.8626202 26.3461564,40.3106978 L43.3106978,23.3461564 C44.8771021,21.7797521 44.8758057,19.2483887 43.3137085,17.6862915 C41.7547899,16.1273729 39.2176035,16.1255422 37.6538436,17.6893022 L23.5,31.8431458 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z" id="Oval-2" stroke-opacity="0.198794158" stroke="#747474" fill-opacity="0.816519475" fill="#FFFFFF" sketch:type="MSShapeGroup"></path>\n      </g>\n    </svg>\n  </div>\n  <div class="dz-error-mark">\n    <svg width="54px" height="54px" viewBox="0 0 54 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">\n      <title>Error</title>\n      <defs></defs>\n      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">\n        <g id="Check-+-Oval-2" sketch:type="MSLayerGroup" stroke="#747474" stroke-opacity="0.198794158" fill="#FFFFFF" fill-opacity="0.816519475">\n          <path d="M32.6568542,29 L38.3106978,23.3461564 C39.8771021,21.7797521 39.8758057,19.2483887 38.3137085,17.6862915 C36.7547899,16.1273729 34.2176035,16.1255422 32.6538436,17.6893022 L27,23.3431458 L21.3461564,17.6893022 C19.7823965,16.1255422 17.2452101,16.1273729 15.6862915,17.6862915 C14.1241943,19.2483887 14.1228979,21.7797521 15.6893022,23.3461564 L21.3431458,29 L15.6893022,34.6538436 C14.1228979,36.2202479 14.1241943,38.7516113 15.6862915,40.3137085 C17.2452101,41.8726271 19.7823965,41.8744578 21.3461564,40.3106978 L27,34.6568542 L32.6538436,40.3106978 C34.2176035,41.8744578 36.7547899,41.8726271 38.3137085,40.3137085 C39.8758057,38.7516113 39.8771021,36.2202479 38.3106978,34.6538436 L32.6568542,29 Z M27,53 C41.3594035,53 53,41.3594035 53,27 C53,12.6405965 41.3594035,1 27,1 C12.6405965,1 1,12.6405965 1,27 C1,41.3594035 12.6405965,53 27,53 Z" id="Oval-2" sketch:type="MSShapeGroup"></path>\n        </g>\n      </g>\n    </svg>\n  </div>\n</div>'
        }, o = function() {
            var e, t, n, o, i, r, s;
            for (o = arguments[0], n = 2 <= arguments.length ? l.call(arguments, 1) : [], r = 0, s = n.length; s > r; r++) {
                t = n[r];
                for (e in t) i = t[e], o[e] = i
            }
            return o
        }, n.prototype.getAcceptedFiles = function() {
            var e, t, n, o, i;
            for (o = this.files, i = [], t = 0, n = o.length; n > t; t++) e = o[t], e.accepted && i.push(e);
            return i
        }, n.prototype.getRejectedFiles = function() {
            var e, t, n, o, i;
            for (o = this.files, i = [], t = 0, n = o.length; n > t; t++) e = o[t], e.accepted || i.push(e);
            return i
        }, n.prototype.getFilesWithStatus = function(e) {
            var t, n, o, i, r;
            for (i = this.files, r = [], n = 0, o = i.length; o > n; n++) t = i[n], t.status === e && r.push(t);
            return r
        }, n.prototype.getQueuedFiles = function() {
            return this.getFilesWithStatus(n.QUEUED)
        }, n.prototype.getUploadingFiles = function() {
            return this.getFilesWithStatus(n.UPLOADING)
        }, n.prototype.getActiveFiles = function() {
            var e, t, o, i, r;
            for (i = this.files, r = [], t = 0, o = i.length; o > t; t++) e = i[t], (e.status === n.UPLOADING || e.status === n.QUEUED) && r.push(e);
            return r
        }, n.prototype.init = function() {
            var e, t, o, i, r, s, a;
            for ("form" === this.element.tagName && this.element.setAttribute("enctype", "multipart/form-data"), this.element.classList.contains("dropzone") && !this.element.querySelector(".dz-message") && this.element.appendChild(n.createElement('<div class="dz-default dz-message"><span>' + this.options.dictDefaultMessage + "</span></div>")), this.clickableElements.length && (o = function(e) {
                    return function() {
                        return e.hiddenFileInput && document.body.removeChild(e.hiddenFileInput), e.hiddenFileInput = document.createElement("input"), e.hiddenFileInput.setAttribute("type", "file"), (null == e.options.maxFiles || e.options.maxFiles > 1) && e.hiddenFileInput.setAttribute("multiple", "multiple"), e.hiddenFileInput.className = "dz-hidden-input", null != e.options.acceptedFiles && e.hiddenFileInput.setAttribute("accept", e.options.acceptedFiles), null != e.options.capture && e.hiddenFileInput.setAttribute("capture", e.options.capture), e.hiddenFileInput.style.visibility = "hidden", e.hiddenFileInput.style.position = "absolute", e.hiddenFileInput.style.top = "0", e.hiddenFileInput.style.left = "0", e.hiddenFileInput.style.height = "0", e.hiddenFileInput.style.width = "0", document.body.appendChild(e.hiddenFileInput), e.hiddenFileInput.addEventListener("change", function() {
                            var t, n, i, r;
                            if (n = e.hiddenFileInput.files, n.length)
                                for (i = 0, r = n.length; r > i; i++) t = n[i], e.addFile(t);
                            return o()
                        })
                    }
                }(this))(), this.URL = null != (s = window.URL) ? s : window.webkitURL, a = this.events, i = 0, r = a.length; r > i; i++) e = a[i], this.on(e, this.options[e]);
            return this.on("uploadprogress", function(e) {
                return function() {
                    return e.updateTotalUploadProgress()
                }
            }(this)), this.on("removedfile", function(e) {
                return function() {
                    return e.updateTotalUploadProgress()
                }
            }(this)), this.on("canceled", function(e) {
                return function(t) {
                    return e.emit("complete", t)
                }
            }(this)), this.on("complete", function(e) {
                return function() {
                    return 0 === e.getUploadingFiles().length && 0 === e.getQueuedFiles().length ? setTimeout(function() {
                        return e.emit("queuecomplete")
                    }, 0) : void 0
                }
            }(this)), t = function(e) {
                return e.stopPropagation(), e.preventDefault ? e.preventDefault() : e.returnValue = !1
            }, this.listeners = [{
                element: this.element,
                events: {
                    dragstart: function(e) {
                        return function(t) {
                            return e.emit("dragstart", t)
                        }
                    }(this),
                    dragenter: function(e) {
                        return function(n) {
                            return t(n), e.emit("dragenter", n)
                        }
                    }(this),
                    dragover: function(e) {
                        return function(n) {
                            var o;
                            try {
                                o = n.dataTransfer.effectAllowed
                            } catch (i) {}
                            return n.dataTransfer.dropEffect = "move" === o || "linkMove" === o ? "move" : "copy", t(n), e.emit("dragover", n)
                        }
                    }(this),
                    dragleave: function(e) {
                        return function(t) {
                            return e.emit("dragleave", t)
                        }
                    }(this),
                    drop: function(e) {
                        return function(n) {
                            return t(n), e.drop(n)
                        }
                    }(this),
                    dragend: function(e) {
                        return function(t) {
                            return e.emit("dragend", t)
                        }
                    }(this)
                }
            }], this.clickableElements.forEach(function(e) {
                return function(t) {
                    return e.listeners.push({
                        element: t,
                        events: {
                            click: function(o) {
                                return t !== e.element || o.target === e.element || n.elementInside(o.target, e.element.querySelector(".dz-message")) ? e.hiddenFileInput.click() : void 0
                            }
                        }
                    })
                }
            }(this)), this.enable(), this.options.init.call(this)
        }, n.prototype.destroy = function() {
            var e;
            return this.disable(), this.removeAllFiles(!0), (null != (e = this.hiddenFileInput) ? e.parentNode : void 0) && (this.hiddenFileInput.parentNode.removeChild(this.hiddenFileInput), this.hiddenFileInput = null), delete this.element.dropzone, n.instances.splice(n.instances.indexOf(this), 1)
        }, n.prototype.updateTotalUploadProgress = function() {
            var e, t, n, o, i, r, s, a;
            if (o = 0, n = 0, e = this.getActiveFiles(), e.length) {
                for (a = this.getActiveFiles(), r = 0, s = a.length; s > r; r++) t = a[r], o += t.upload.bytesSent, n += t.upload.total;
                i = 100 * o / n
            } else i = 100;
            return this.emit("totaluploadprogress", i, n, o)
        }, n.prototype._getParamName = function(e) {
            return "function" == typeof this.options.paramName ? this.options.paramName(e) : "" + this.options.paramName + (this.options.uploadMultiple ? "[" + e + "]" : "")
        }, n.prototype.getFallbackForm = function() {
            var e, t, o, i;
            return (e = this.getExistingFallback()) ? e : (o = '<div class="dz-fallback">', this.options.dictFallbackText && (o += "<p>" + this.options.dictFallbackText + "</p>"), o += '<input type="file" name="' + this._getParamName(0) + '" ' + (this.options.uploadMultiple ? 'multiple="multiple"' : void 0) + ' /><input type="submit" value="Upload!"></div>', t = n.createElement(o), "FORM" !== this.element.tagName ? (i = n.createElement('<form action="' + this.options.url + '" enctype="multipart/form-data" method="' + this.options.method + '"></form>'), i.appendChild(t)) : (this.element.setAttribute("enctype", "multipart/form-data"), this.element.setAttribute("method", this.options.method)), null != i ? i : t)
        }, n.prototype.getExistingFallback = function() {
            var e, t, n, o, i, r;
            for (t = function(e) {
                    var t, n, o;
                    for (n = 0, o = e.length; o > n; n++)
                        if (t = e[n], /(^| )fallback($| )/.test(t.className)) return t
                }, r = ["div", "form"], o = 0, i = r.length; i > o; o++)
                if (n = r[o], e = t(this.element.getElementsByTagName(n))) return e
        }, n.prototype.setupEventListeners = function() {
            var e, t, n, o, i, r, s;
            for (r = this.listeners, s = [], o = 0, i = r.length; i > o; o++) e = r[o], s.push(function() {
                var o, i;
                o = e.events, i = [];
                for (t in o) n = o[t], i.push(e.element.addEventListener(t, n, !1));
                return i
            }());
            return s
        }, n.prototype.removeEventListeners = function() {
            var e, t, n, o, i, r, s;
            for (r = this.listeners, s = [], o = 0, i = r.length; i > o; o++) e = r[o], s.push(function() {
                var o, i;
                o = e.events, i = [];
                for (t in o) n = o[t], i.push(e.element.removeEventListener(t, n, !1));
                return i
            }());
            return s
        }, n.prototype.disable = function() {
            var e, t, n, o, i;
            for (this.clickableElements.forEach(function(e) {
                    return e.classList.remove("dz-clickable")
                }), this.removeEventListeners(), o = this.files, i = [], t = 0, n = o.length; n > t; t++) e = o[t], i.push(this.cancelUpload(e));
            return i
        }, n.prototype.enable = function() {
            return this.clickableElements.forEach(function(e) {
                return e.classList.add("dz-clickable")
            }), this.setupEventListeners()
        }, n.prototype.filesize = function(e) {
            var t, n, o, i, r, s, a, l;
            for (s = ["TB", "GB", "MB", "KB", "b"], o = i = null, n = a = 0, l = s.length; l > a; n = ++a)
                if (r = s[n], t = Math.pow(this.options.filesizeBase, 4 - n) / 10, e >= t) {
                    o = e / Math.pow(this.options.filesizeBase, 4 - n), i = r;
                    break
                }
            return o = Math.round(10 * o) / 10, "<strong>" + o + "</strong> " + i
        }, n.prototype._updateMaxFilesReachedClass = function() {
            return null != this.options.maxFiles && this.getAcceptedFiles().length >= this.options.maxFiles ? (this.getAcceptedFiles().length === this.options.maxFiles && this.emit("maxfilesreached", this.files), this.element.classList.add("dz-max-files-reached")) : this.element.classList.remove("dz-max-files-reached")
        }, n.prototype.drop = function(e) {
            var t, n;
            e.dataTransfer && (this.emit("drop", e), t = e.dataTransfer.files, t.length && (n = e.dataTransfer.items, n && n.length && null != n[0].webkitGetAsEntry ? this._addFilesFromItems(n) : this.handleFiles(t)))
        }, n.prototype.paste = function(e) {
            var t, n;
            return null != (null != e && null != (n = e.clipboardData) ? n.items : void 0) ? (this.emit("paste", e), t = e.clipboardData.items, t.length ? this._addFilesFromItems(t) : void 0) : void 0
        }, n.prototype.handleFiles = function(e) {
            var t, n, o, i;
            for (i = [], n = 0, o = e.length; o > n; n++) t = e[n], i.push(this.addFile(t));
            return i
        }, n.prototype._addFilesFromItems = function(e) {
            var t, n, o, i, r;
            for (r = [], o = 0, i = e.length; i > o; o++) n = e[o], r.push(null != n.webkitGetAsEntry && (t = n.webkitGetAsEntry()) ? t.isFile ? this.addFile(n.getAsFile()) : t.isDirectory ? this._addFilesFromDirectory(t, t.name) : void 0 : null != n.getAsFile && (null == n.kind || "file" === n.kind) ? this.addFile(n.getAsFile()) : void 0);
            return r
        }, n.prototype._addFilesFromDirectory = function(e, t) {
            var n, o;
            return n = e.createReader(), o = function(e) {
                return function(n) {
                    var o, i, r;
                    for (i = 0, r = n.length; r > i; i++) o = n[i], o.isFile ? o.file(function(n) {
                        return e.options.ignoreHiddenFiles && "." === n.name.substring(0, 1) ? void 0 : (n.fullPath = "" + t + "/" + n.name, e.addFile(n))
                    }) : o.isDirectory && e._addFilesFromDirectory(o, "" + t + "/" + o.name)
                }
            }(this), n.readEntries(o, function(e) {
                return "undefined" != typeof console && null !== console && "function" == typeof console.log ? console.log(e) : void 0
            })
        }, n.prototype.accept = function(e, t) {
            return e.size > 1024 * this.options.maxFilesize * 1024 ? t(this.options.dictFileTooBig.replace("{{filesize}}", Math.round(e.size / 1024 / 10.24) / 100).replace("{{maxFilesize}}", this.options.maxFilesize)) : n.isValidFile(e, this.options.acceptedFiles) ? null != this.options.maxFiles && this.getAcceptedFiles().length >= this.options.maxFiles ? (t(this.options.dictMaxFilesExceeded.replace("{{maxFiles}}", this.options.maxFiles)), this.emit("maxfilesexceeded", e)) : this.options.accept.call(this, e, t) : t(this.options.dictInvalidFileType)
        }, n.prototype.addFile = function(e) {
            return e.upload = {
                progress: 0,
                total: e.size,
                bytesSent: 0
            }, this.files.push(e), e.status = n.ADDED, this.emit("addedfile", e), this._enqueueThumbnail(e), this.accept(e, function(t) {
                return function(n) {
                    return n ? (e.accepted = !1, t._errorProcessing([e], n)) : (e.accepted = !0, t.options.autoQueue && t.enqueueFile(e)), t._updateMaxFilesReachedClass()
                }
            }(this))
        }, n.prototype.enqueueFiles = function(e) {
            var t, n, o;
            for (n = 0, o = e.length; o > n; n++) t = e[n], this.enqueueFile(t);
            return null
        }, n.prototype.enqueueFile = function(e) {
            if (e.status !== n.ADDED || e.accepted !== !0) throw new Error("This file can't be queued because it has already been processed or was rejected.");
            return e.status = n.QUEUED, this.options.autoProcessQueue ? setTimeout(function(e) {
                return function() {
                    return e.processQueue()
                }
            }(this), 0) : void 0
        }, n.prototype._thumbnailQueue = [], n.prototype._processingThumbnail = !1, n.prototype._enqueueThumbnail = function(e) {
            return this.options.createImageThumbnails && e.type.match(/image.*/) && e.size <= 1024 * this.options.maxThumbnailFilesize * 1024 ? (this._thumbnailQueue.push(e), setTimeout(function(e) {
                return function() {
                    return e._processThumbnailQueue()
                }
            }(this), 0)) : void 0
        }, n.prototype._processThumbnailQueue = function() {
            return this._processingThumbnail || 0 === this._thumbnailQueue.length ? void 0 : (this._processingThumbnail = !0, this.createThumbnail(this._thumbnailQueue.shift(), function(e) {
                return function() {
                    return e._processingThumbnail = !1, e._processThumbnailQueue()
                }
            }(this)))
        }, n.prototype.removeFile = function(e) {
            return e.status === n.UPLOADING && this.cancelUpload(e), this.files = a(this.files, e), this.emit("removedfile", e), 0 === this.files.length ? this.emit("reset") : void 0
        }, n.prototype.removeAllFiles = function(e) {
            var t, o, i, r;
            for (null == e && (e = !1), r = this.files.slice(), o = 0, i = r.length; i > o; o++) t = r[o], (t.status !== n.UPLOADING || e) && this.removeFile(t);
            return null
        }, n.prototype.createThumbnail = function(e, t) {
            var n;
            return n = new FileReader, n.onload = function(o) {
                return function() {
                    var i;
                    return "image/svg+xml" === e.type ? (o.emit("thumbnail", e, n.result), void(null != t && t())) : (i = document.createElement("img"), i.onload = function() {
                        var n, s, a, l, c, d, u, p;
                        return e.width = i.width, e.height = i.height, a = o.options.resize.call(o, e), null == a.trgWidth && (a.trgWidth = a.optWidth), null == a.trgHeight && (a.trgHeight = a.optHeight), n = document.createElement("canvas"), s = n.getContext("2d"), n.width = a.trgWidth, n.height = a.trgHeight, r(s, i, null != (c = a.srcX) ? c : 0, null != (d = a.srcY) ? d : 0, a.srcWidth, a.srcHeight, null != (u = a.trgX) ? u : 0, null != (p = a.trgY) ? p : 0, a.trgWidth, a.trgHeight), l = n.toDataURL("image/png"), o.emit("thumbnail", e, l), null != t ? t() : void 0
                    }, i.onerror = t, i.src = n.result)
                }
            }(this), n.readAsDataURL(e);
        }, n.prototype.processQueue = function() {
            var e, t, n, o;
            if (t = this.options.parallelUploads, n = this.getUploadingFiles().length, e = n, !(n >= t) && (o = this.getQueuedFiles(), o.length > 0)) {
                if (this.options.uploadMultiple) return this.processFiles(o.slice(0, t - n));
                for (; t > e;) {
                    if (!o.length) return;
                    this.processFile(o.shift()), e++
                }
            }
        }, n.prototype.processFile = function(e) {
            return this.processFiles([e])
        }, n.prototype.processFiles = function(e) {
            var t, o, i;
            for (o = 0, i = e.length; i > o; o++) t = e[o], t.processing = !0, t.status = n.UPLOADING, this.emit("processing", t);
            return this.options.uploadMultiple && this.emit("processingmultiple", e), this.uploadFiles(e)
        }, n.prototype._getFilesWithXhr = function(e) {
            var t, n;
            return n = function() {
                var n, o, i, r;
                for (i = this.files, r = [], n = 0, o = i.length; o > n; n++) t = i[n], t.xhr === e && r.push(t);
                return r
            }.call(this)
        }, n.prototype.cancelUpload = function(e) {
            var t, o, i, r, s, a, l;
            if (e.status === n.UPLOADING) {
                for (o = this._getFilesWithXhr(e.xhr), i = 0, s = o.length; s > i; i++) t = o[i], t.status = n.CANCELED;
                for (e.xhr.abort(), r = 0, a = o.length; a > r; r++) t = o[r], this.emit("canceled", t);
                this.options.uploadMultiple && this.emit("canceledmultiple", o)
            } else((l = e.status) === n.ADDED || l === n.QUEUED) && (e.status = n.CANCELED, this.emit("canceled", e), this.options.uploadMultiple && this.emit("canceledmultiple", [e]));
            return this.options.autoProcessQueue ? this.processQueue() : void 0
        }, i = function() {
            var e, t;
            return t = arguments[0], e = 2 <= arguments.length ? l.call(arguments, 1) : [], "function" == typeof t ? t.apply(this, e) : t
        }, n.prototype.uploadFile = function(e) {
            return this.uploadFiles([e])
        }, n.prototype.uploadFiles = function(e) {
            var t, r, s, a, l, c, d, u, p, f, h, m, g, v, y, w, b, _, x, C, k, T, S, $, E, N, R, A, D, O, j, I, P, L;
            for (x = new XMLHttpRequest, C = 0, $ = e.length; $ > C; C++) t = e[C], t.xhr = x;
            m = i(this.options.method, e), b = i(this.options.url, e), x.open(m, b, !0), x.withCredentials = !!this.options.withCredentials, y = null, s = function(n) {
                return function() {
                    var o, i, r;
                    for (r = [], o = 0, i = e.length; i > o; o++) t = e[o], r.push(n._errorProcessing(e, y || n.options.dictResponseError.replace("{{statusCode}}", x.status), x));
                    return r
                }
            }(this), w = function(n) {
                return function(o) {
                    var i, r, s, a, l, c, d, u, p;
                    if (null != o)
                        for (r = 100 * o.loaded / o.total, s = 0, c = e.length; c > s; s++) t = e[s], t.upload = {
                            progress: r,
                            total: o.total,
                            bytesSent: o.loaded
                        };
                    else {
                        for (i = !0, r = 100, a = 0, d = e.length; d > a; a++) t = e[a], (100 !== t.upload.progress || t.upload.bytesSent !== t.upload.total) && (i = !1), t.upload.progress = r, t.upload.bytesSent = t.upload.total;
                        if (i) return
                    }
                    for (p = [], l = 0, u = e.length; u > l; l++) t = e[l], p.push(n.emit("uploadprogress", t, r, t.upload.bytesSent));
                    return p
                }
            }(this), x.onload = function(t) {
                return function(o) {
                    var i;
                    if (e[0].status !== n.CANCELED && 4 === x.readyState) {
                        if (y = x.responseText, x.getResponseHeader("content-type") && ~x.getResponseHeader("content-type").indexOf("application/json")) try {
                            y = JSON.parse(y)
                        } catch (r) {
                            o = r, y = "Invalid JSON response from server."
                        }
                        return w(), 200 <= (i = x.status) && 300 > i ? t._finished(e, y, o) : s()
                    }
                }
            }(this), x.onerror = function() {
                return function() {
                    return e[0].status !== n.CANCELED ? s() : void 0
                }
            }(this), v = null != (D = x.upload) ? D : x, v.onprogress = w, c = {
                Accept: "application/json",
                "Cache-Control": "no-cache",
                "X-Requested-With": "XMLHttpRequest"
            }, this.options.headers && o(c, this.options.headers);
            for (a in c) l = c[a], x.setRequestHeader(a, l);
            if (r = new FormData, this.options.params) {
                O = this.options.params;
                for (h in O) _ = O[h], r.append(h, _)
            }
            for (k = 0, E = e.length; E > k; k++) t = e[k], this.emit("sending", t, x, r);
            if (this.options.uploadMultiple && this.emit("sendingmultiple", e, x, r), "FORM" === this.element.tagName)
                for (j = this.element.querySelectorAll("input, textarea, select, button"), T = 0, N = j.length; N > T; T++)
                    if (u = j[T], p = u.getAttribute("name"), f = u.getAttribute("type"), "SELECT" === u.tagName && u.hasAttribute("multiple"))
                        for (I = u.options, S = 0, R = I.length; R > S; S++) g = I[S], g.selected && r.append(p, g.value);
                    else(!f || "checkbox" !== (P = f.toLowerCase()) && "radio" !== P || u.checked) && r.append(p, u.value);
            for (d = A = 0, L = e.length - 1; L >= 0 ? L >= A : A >= L; d = L >= 0 ? ++A : --A) r.append(this._getParamName(d), e[d], e[d].name);
            return x.send(r)
        }, n.prototype._finished = function(e, t, o) {
            var i, r, s;
            for (r = 0, s = e.length; s > r; r++) i = e[r], i.status = n.SUCCESS, this.emit("success", i, t, o), this.emit("complete", i);
            return this.options.uploadMultiple && (this.emit("successmultiple", e, t, o), this.emit("completemultiple", e)), this.options.autoProcessQueue ? this.processQueue() : void 0
        }, n.prototype._errorProcessing = function(e, t, o) {
            var i, r, s;
            for (r = 0, s = e.length; s > r; r++) i = e[r], i.status = n.ERROR, this.emit("error", i, t, o), this.emit("complete", i);
            return this.options.uploadMultiple && (this.emit("errormultiple", e, t, o), this.emit("completemultiple", e)), this.options.autoProcessQueue ? this.processQueue() : void 0
        }, n
    }(t), e.version = "4.0.1", e.options = {}, e.optionsForElement = function(t) {
        return t.getAttribute("id") ? e.options[n(t.getAttribute("id"))] : void 0
    }, e.instances = [], e.forElement = function(e) {
        if ("string" == typeof e && (e = document.querySelector(e)), null == (null != e ? e.dropzone : void 0)) throw new Error("No Dropzone found for given element. This is probably because you're trying to access it before Dropzone had the time to initialize. Use the `init` option to setup any additional observers on your Dropzone.");
        return e.dropzone
    }, e.autoDiscover = !0, e.discover = function() {
        var t, n, o, i, r, s;
        for (document.querySelectorAll ? o = document.querySelectorAll(".dropzone") : (o = [], t = function(e) {
                var t, n, i, r;
                for (r = [], n = 0, i = e.length; i > n; n++) t = e[n], r.push(/(^| )dropzone($| )/.test(t.className) ? o.push(t) : void 0);
                return r
            }, t(document.getElementsByTagName("div")), t(document.getElementsByTagName("form"))), s = [], i = 0, r = o.length; r > i; i++) n = o[i], s.push(e.optionsForElement(n) !== !1 ? new e(n) : void 0);
        return s
    }, e.blacklistedBrowsers = [/opera.*Macintosh.*version\/12/i], e.isBrowserSupported = function() {
        var t, n, o, i, r;
        if (t = !0, window.File && window.FileReader && window.FileList && window.Blob && window.FormData && document.querySelector)
            if ("classList" in document.createElement("a"))
                for (r = e.blacklistedBrowsers, o = 0, i = r.length; i > o; o++) n = r[o], n.test(navigator.userAgent) && (t = !1);
            else t = !1;
        else t = !1;
        return t
    }, a = function(e, t) {
        var n, o, i, r;
        for (r = [], o = 0, i = e.length; i > o; o++) n = e[o], n !== t && r.push(n);
        return r
    }, n = function(e) {
        return e.replace(/[\-_](\w)/g, function(e) {
            return e.charAt(1).toUpperCase()
        })
    }, e.createElement = function(e) {
        var t;
        return t = document.createElement("div"), t.innerHTML = e, t.childNodes[0]
    }, e.elementInside = function(e, t) {
        if (e === t) return !0;
        for (; e = e.parentNode;)
            if (e === t) return !0;
        return !1
    }, e.getElement = function(e, t) {
        var n;
        if ("string" == typeof e ? n = document.querySelector(e) : null != e.nodeType && (n = e), null == n) throw new Error("Invalid `" + t + "` option provided. Please provide a CSS selector or a plain HTML element.");
        return n
    }, e.getElements = function(e, t) {
        var n, o, i, r, s, a, l, c;
        if (e instanceof Array) {
            i = [];
            try {
                for (r = 0, a = e.length; a > r; r++) o = e[r], i.push(this.getElement(o, t))
            } catch (d) {
                n = d, i = null
            }
        } else if ("string" == typeof e)
            for (i = [], c = document.querySelectorAll(e), s = 0, l = c.length; l > s; s++) o = c[s], i.push(o);
        else null != e.nodeType && (i = [e]);
        if (null == i || !i.length) throw new Error("Invalid `" + t + "` option provided. Please provide a CSS selector, a plain HTML element or a list of those.");
        return i
    }, e.confirm = function(e, t, n) {
        return window.confirm(e) ? t() : null != n ? n() : void 0
    }, e.isValidFile = function(e, t) {
        var n, o, i, r, s;
        if (!t) return !0;
        for (t = t.split(","), o = e.type, n = o.replace(/\/.*$/, ""), r = 0, s = t.length; s > r; r++)
            if (i = t[r], i = i.trim(), "." === i.charAt(0)) {
                if (-1 !== e.name.toLowerCase().indexOf(i.toLowerCase(), e.name.length - i.length)) return !0
            } else if (/\/\*$/.test(i)) {
            if (n === i.replace(/\/.*$/, "")) return !0
        } else if (o === i) return !0;
        return !1
    }, "undefined" != typeof jQuery && null !== jQuery && (jQuery.fn.dropzone = function(t) {
        return this.each(function() {
            return new e(this, t)
        })
    }), "undefined" != typeof module && null !== module ? module.exports = e : window.Dropzone = e, e.ADDED = "added", e.QUEUED = "queued", e.ACCEPTED = e.QUEUED, e.UPLOADING = "uploading", e.PROCESSING = e.UPLOADING, e.CANCELED = "canceled", e.ERROR = "error", e.SUCCESS = "success", i = function(e) {
        var t, n, o, i, r, s, a, l, c, d;
        for (a = e.naturalWidth, s = e.naturalHeight, n = document.createElement("canvas"), n.width = 1, n.height = s, o = n.getContext("2d"), o.drawImage(e, 0, 0), i = o.getImageData(0, 0, 1, s).data, d = 0, r = s, l = s; l > d;) t = i[4 * (l - 1) + 3], 0 === t ? r = l : d = l, l = r + d >> 1;
        return c = l / s, 0 === c ? 1 : c
    }, r = function(e, t, n, o, r, s, a, l, c, d) {
        var u;
        return u = i(t), e.drawImage(t, n, o, r, s, a, l, c, d / u)
    }, o = function(e, t) {
        var n, o, i, r, s, a, l, c, d;
        if (i = !1, d = !0, o = e.document, c = o.documentElement, n = o.addEventListener ? "addEventListener" : "attachEvent", l = o.addEventListener ? "removeEventListener" : "detachEvent", a = o.addEventListener ? "" : "on", r = function(n) {
                return "readystatechange" !== n.type || "complete" === o.readyState ? (("load" === n.type ? e : o)[l](a + n.type, r, !1), !i && (i = !0) ? t.call(e, n.type || n) : void 0) : void 0
            }, s = function() {
                var e;
                try {
                    c.doScroll("left")
                } catch (t) {
                    return e = t, void setTimeout(s, 50)
                }
                return r("poll")
            }, "complete" !== o.readyState) {
            if (o.createEventObject && c.doScroll) {
                try {
                    d = !e.frameElement
                } catch (u) {}
                d && s()
            }
            return o[n](a + "DOMContentLoaded", r, !1), o[n](a + "readystatechange", r, !1), e[n](a + "load", r, !1)
        }
    }, e._autoDiscoverFunction = function() {
        return e.autoDiscover ? e.discover() : void 0
    }, o(window, e._autoDiscoverFunction)
}).call(this),
    function() {
        var e, t, n, o, i, r, s = {}.hasOwnProperty;
        r = "undefined" != typeof exports && null !== exports ? exports : this, t = function(e) {
            this.message = e
        }, t.prototype = new Error, i = {
            prefix: "",
            default_url_options: {}
        }, e = {
            GROUP: 1,
            CAT: 2,
            SYMBOL: 3,
            OR: 4,
            STAR: 5,
            LITERAL: 6,
            SLASH: 7,
            DOT: 8
        }, n = {
            default_serializer: function(e, t) {
                var n, o, i, r, a, l, c;
                if (null == t && (t = null), null == e) return "";
                if (!t && "object" !== this.get_object_type(e)) throw new Error("Url parameters should be a javascript hash");
                switch (c = [], this.get_object_type(e)) {
                    case "array":
                        for (o = i = 0, a = e.length; a > i; o = ++i) n = e[o], c.push(this.default_serializer(n, t + "[]"));
                        break;
                    case "object":
                        for (r in e) s.call(e, r) && (l = e[r], null == l && null != t && (l = ""), null != l && (null != t && (r = t + "[" + r + "]"), c.push(this.default_serializer(l, r))));
                        break;
                    default:
                        null != e && c.push(encodeURIComponent(t.toString()) + "=" + encodeURIComponent(e.toString()))
                }
                return c.length ? c.join("&") : ""
            },
            custom_serializer: null,
            serialize: function(e) {
                return null != this.custom_serializer && "function" === this.get_object_type(this.custom_serializer) ? this.custom_serializer(e) : this.default_serializer(e)
            },
            clean_path: function(e) {
                var t;
                return e = e.split("://"), t = e.length - 1, e[t] = e[t].replace(/\/+/g, "/"), e.join("://")
            },
            set_default_url_options: function(e, t) {
                var n, o, r, s, a;
                for (a = [], n = o = 0, r = e.length; r > o; n = ++o) s = e[n], !t.hasOwnProperty(s) && i.default_url_options.hasOwnProperty(s) && a.push(t[s] = i.default_url_options[s]);
                return a
            },
            extract_anchor: function(e) {
                var t;
                return t = "", e.hasOwnProperty("anchor") && (t = "#" + e.anchor, delete e.anchor), t
            },
            extract_trailing_slash: function(e) {
                var t;
                return t = !1, i.default_url_options.hasOwnProperty("trailing_slash") && (t = i.default_url_options.trailing_slash), e.hasOwnProperty("trailing_slash") && (t = e.trailing_slash, delete e.trailing_slash), t
            },
            extract_options: function(e, t) {
                var n;
                return n = t[t.length - 1], t.length > e || null != n && "object" === this.get_object_type(n) && !this.look_like_serialized_model(n) ? t.pop() : {}
            },
            look_like_serialized_model: function(e) {
                return "id" in e || "to_param" in e
            },
            path_identifier: function(e) {
                var t;
                return 0 === e ? "0" : e ? (t = e, "object" === this.get_object_type(e) && (t = "to_param" in e ? e.to_param : "id" in e ? e.id : e, "function" === this.get_object_type(t) && (t = t.call(e))), t.toString()) : ""
            },
            clone: function(e) {
                var t, n, o;
                if (null == e || "object" !== this.get_object_type(e)) return e;
                n = e.constructor();
                for (o in e) s.call(e, o) && (t = e[o], n[o] = t);
                return n
            },
            prepare_parameters: function(e, t, n) {
                var o, i, r, s, a;
                for (s = this.clone(n) || {}, o = i = 0, r = e.length; r > i; o = ++i) a = e[o], o < t.length && (s[a] = t[o]);
                return s
            },
            build_path: function(e, t, o, i) {
                var r, s, a, l, c, d, u;
                if (i = Array.prototype.slice.call(i), s = this.extract_options(e.length, i), i.length > e.length) throw new Error("Too many parameters provided for path");
                return a = this.prepare_parameters(e, i, s), this.set_default_url_options(t, a), r = this.extract_anchor(a), c = this.extract_trailing_slash(a), l = "" + this.get_prefix() + this.visit(o, a), d = n.clean_path("" + l), c === !0 && (d = d.replace(/(.*?)[\/]?$/, "$1/")), (u = this.serialize(a)).length && (d += "?" + u), d += r
            },
            visit: function(n, o, i) {
                var r, s, a, l, c, d;
                switch (null == i && (i = !1), c = n[0], r = n[1], a = n[2], c) {
                    case e.GROUP:
                        return this.visit(r, o, !0);
                    case e.STAR:
                        return this.visit_globbing(r, o, !0);
                    case e.LITERAL:
                    case e.SLASH:
                    case e.DOT:
                        return r;
                    case e.CAT:
                        return s = this.visit(r, o, i), l = this.visit(a, o, i), !i || (r[0] !== e.SYMBOL && r[0] !== e.CAT || s) && (a[0] !== e.SYMBOL && a[0] !== e.CAT || l) ? "" + s + l : "";
                    case e.SYMBOL:
                        if (d = o[r], null != d) return delete o[r], this.path_identifier(d);
                        if (i) return "";
                        throw new t("Route parameter missing: " + r);
                    default:
                        throw new Error("Unknown Rails node type")
                }
            },
            build_path_spec: function(t, n) {
                var o, i, r;
                switch (null == n && (n = !1), r = t[0], o = t[1], i = t[2], r) {
                    case e.GROUP:
                        return "(" + this.build_path_spec(o) + ")";
                    case e.CAT:
                        return "" + this.build_path_spec(o) + this.build_path_spec(i);
                    case e.STAR:
                        return this.build_path_spec(o, !0);
                    case e.SYMBOL:
                        return n === !0 ? "" + ("*" === o[0] ? "" : "*") + o : ":" + o;
                    case e.SLASH:
                    case e.DOT:
                    case e.LITERAL:
                        return o;
                    default:
                        throw new Error("Unknown Rails node type")
                }
            },
            visit_globbing: function(e, t, n) {
                var o, i, r, s;
                return r = e[0], o = e[1], i = e[2], o.replace(/^\*/i, "") !== o && (e[1] = o = o.replace(/^\*/i, "")), s = t[o], null == s ? this.visit(e, t, n) : (t[o] = function() {
                    switch (this.get_object_type(s)) {
                        case "array":
                            return s.join("/");
                        default:
                            return s
                    }
                }.call(this), this.visit(e, t, n))
            },
            get_prefix: function() {
                var e;
                return e = i.prefix, "" !== e && (e = e.match("/$") ? e : e + "/"), e
            },
            route: function(e, t, o) {
                var i;
                return i = function() {
                    return n.build_path(e, t, o, arguments)
                }, i.required_params = e, i.toString = function() {
                    return n.build_path_spec(o)
                }, i
            },
            _classToTypeCache: null,
            _classToType: function() {
                var e, t, n, o;
                if (null != this._classToTypeCache) return this._classToTypeCache;
                for (this._classToTypeCache = {}, o = "Boolean Number String Function Array Date RegExp Object Error".split(" "), e = 0, t = o.length; t > e; e++) n = o[e], this._classToTypeCache["[object " + n + "]"] = n.toLowerCase();
                return this._classToTypeCache
            },
            get_object_type: function(e) {
                return r.jQuery && null != r.jQuery.type ? r.jQuery.type(e) : null == e ? "" + e : "object" == typeof e || "function" == typeof e ? this._classToType()[Object.prototype.toString.call(e)] || "object" : typeof e
            }
        }, o = function() {
            var e;
            return e = function(t, n) {
                var o, i;
                return i = n ? n.split(".") : [], i.length ? (o = i.shift(), t[o] = t[o] || {}, e(t[o], i.join("."))) : void 0
            }, e(r, "Routes"), r.Routes = {
                about_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "about", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                add_notes_admin_note_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "add_notes", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                add_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "add", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                add_to_collection_api_v1_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "add_to_collection", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_activities_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "activities", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_activity_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "activities", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_app_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "apps", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_apps_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "apps", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_comment_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "comments", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_comments_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "comments", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_email_template_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "email_templates", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_email_templates_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "email_templates", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_feature_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "features", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_features_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "features", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_feeds_feed_recommendation_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_feeds_feed_recommendation_feed_recommendation_item_path: n.route(["feed_recommendation_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "feed_recommendation_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "items", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_feeds_feed_recommendation_feed_recommendation_items_path: n.route(["feed_recommendation_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "feed_recommendation_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "items", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_feeds_feed_recommendations_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_fragment_template_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "fragment_templates", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_fragment_templates_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "fragment_templates", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_news_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "news", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_news_index_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "news", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collection_item_path: n.route(["note_collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "items", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collection_items_path: n.route(["note_collection_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "items", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collections_note_collection_theme_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "themes", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collections_note_collection_themes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "themes", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collections_pin_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "pins", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_collections_pins_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "pins", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_note_maker_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "makers", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_note_makers_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "makers", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_note_mark_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "note_marks", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_note_marks_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "note_marks", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_publish_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "publish", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_score_log_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "score_logs", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_score_logs_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "score_logs", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_voter_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voters", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_note_voters_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voters", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_notes_attachment_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "attachments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_notes_attachments_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "attachments", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_notes_statistic_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "statistics", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_notes_statistics_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "statistics", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_root_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                admin_sidekiq_web_path: n.route([], [], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [6, "sidekiq", !1]
                        ]
                    ]
                ], arguments),
                admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_weekly_trending_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weekly_trendings", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_weekly_trendings_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weekly_trendings", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                admin_weixin_qr_code_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weixin_qr_codes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                admin_weixin_qr_codes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weixin_qr_codes", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_image_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "images", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_images_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "images", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_note_comments_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_user_collection_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "collections", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [3, "id", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_user_collections_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "collections", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_user_note_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_users_notification_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                api_v1_users_notifications_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                authorizations_admin_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "authorizations", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                cancel_timer_admin_note_publish_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "publish", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "cancel_timer", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                categories_notes_path: n.route(["category"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "categories", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "category", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                check_similars_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "check_similars", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                clear_notifications_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "notifications", !1],
                        [2, [7, "/", !1],
                            [2, [6, "clear", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                commend_admin_note_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "commend", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                confirm_admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "confirm", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                contributed_api_v1_user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "contributed", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                contributed_user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "contributed", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                daily_api_v1_notes_path: n.route(["year", "month", "day"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "year", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "month", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "day", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                daily_notes_path: n.route(["year", "month", "day"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "year", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "month", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "day", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                destroy_multi_admin_note_voters_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voters", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "destroy_multi", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                destroy_user_session_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "sign_out", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                disable_admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "disable", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                discommend_admin_note_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "discommend", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                dislike_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "dislike", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_activity_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "activities", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_app_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "apps", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_comment_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "comments", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_email_template_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "email_templates", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_feature_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "features", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_feeds_feed_recommendation_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_feeds_feed_recommendation_feed_recommendation_item_path: n.route(["feed_recommendation_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "feed_recommendation_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "items", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "edit", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_fragment_template_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "fragment_templates", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_news_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "news", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_collection_item_path: n.route(["note_collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "items", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_collections_note_collection_theme_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "themes", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_collections_pin_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "pins", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_note_maker_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "makers", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_note_mark_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "note_marks", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_publish_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "publish", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_score_log_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "score_logs", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_note_voter_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voters", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_notes_attachment_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "attachments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_notes_statistic_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "statistics", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_weekly_trending_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weekly_trendings", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_admin_weixin_qr_code_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weixin_qr_codes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_image_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "images", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "edit", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_user_collection_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "collections", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [3, "id", !1],
                                                                        [2, [7, "/", !1],
                                                                            [2, [6, "edit", !1],
                                                                                [1, [2, [8, ".", !1],
                                                                                    [3, "format", !1]
                                                                                ], !1]
                                                                            ]
                                                                        ]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_user_note_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "edit", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_api_v1_users_notification_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "edit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_note_note_maker_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "makers", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_note_note_mark_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "marks", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_notes_collection_comment_path: n.route(["collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_notification_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "notifications", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "edit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_subscription_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "subscriptions", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "edit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "edit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_user_comment_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_user_note_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "edit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_user_note_collection_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "edit", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_users_authorizations_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "authorizations", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "edit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_users_feed_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "edit", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                edit_utility_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "utilities", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "edit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                enable_admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "enable", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                favorite_api_v1_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "favorite", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                favorites_api_v1_user_collections_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "collections", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "favorites", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                favorites_user_note_collections_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "favorites", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                features_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "features", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                feed_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "feed", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                feedback_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "feedback", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                find_by_authorization_api_v1_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "find_by_authorization", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                find_by_email_api_v1_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "find_by_email", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                follow_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "follow", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                followers_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "followers", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                following_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "following", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                help_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "help", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                hit_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "hit", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                hit_note_note_mark_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "marks", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "hit", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                hot_api_v1_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "hot", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                images_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "images", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                latest_api_v1_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "latest", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                latest_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "latest", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                like_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "like", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                load_screenshots_admin_note_note_marks_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "note_marks", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "load_screenshots", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                made_user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "made", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                makers_verifying_admin_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "makers", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "verifying", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                mark_maker_concerned_admin_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "mark_maker_concerned", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                markdown_preview_utilities_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "utilities", !1],
                        [2, [7, "/", !1],
                            [2, [6, "markdown", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "preview", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_activity_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "activities", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_app_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "apps", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_comment_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "comments", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_email_template_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "email_templates", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_feature_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "features", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_feeds_feed_recommendation_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_feeds_feed_recommendation_feed_recommendation_item_path: n.route(["feed_recommendation_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "feed_recommendations", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "feed_recommendation_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "items", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "new", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_fragment_template_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "fragment_templates", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_news_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "news", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_collection_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_collection_item_path: n.route(["note_collection_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "items", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_collections_note_collection_theme_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "themes", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_collections_pin_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "pins", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_note_maker_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "makers", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_note_mark_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "note_marks", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_publish_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "publish", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_score_log_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "score_logs", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_note_voter_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voters", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_notes_attachment_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "attachments", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_notes_statistic_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "statistics", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_user_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_weekly_trending_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weekly_trendings", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_admin_weixin_qr_code_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "weixin_qr_codes", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_image_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "images", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_note_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_note_comment_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "new", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_notes_collection_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_user_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_user_collection_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "collections", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "new", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_user_note_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "new", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_api_v1_users_notification_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_note_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "new", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                new_note_comment_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_note_note_maker_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "makers", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_note_note_mark_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "marks", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_notes_collection_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_notes_collection_comment_path: n.route(["collection_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_notification_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "notifications", !1],
                        [2, [7, "/", !1],
                            [2, [6, "new", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                new_subscription_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "subscriptions", !1],
                        [2, [7, "/", !1],
                            [2, [6, "new", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                new_user_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "new", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                new_user_comment_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_user_note_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "new", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_user_note_collection_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "new", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_user_session_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "sign_in", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                new_user_unlock_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "unlock", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_users_authorizations_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "authorizations", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_users_feed_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "new", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                new_utility_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "utilities", !1],
                        [2, [7, "/", !1],
                            [2, [6, "new", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                note_comments_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                note_note_maker_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "makers", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                note_note_makers_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "makers", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                note_note_mark_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "marks", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                note_note_marks_path: n.route(["note_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "marks", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                notes_collection_comment_path: n.route(["collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                notes_collection_comments_path: n.route(["collection_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                notification_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "notifications", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                notifications_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "notifications", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                oauth_revoke_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "oauth", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "revoke", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                oauth_token_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "oauth", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "token", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                owned_user_note_collections_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "owned", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                pending_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "pending", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                publish_admin_note_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "publish", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                read_all_api_v1_users_notifications_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "read_all", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                read_api_v1_users_notification_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "read", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                read_notification_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "notifications", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "read", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                remind_me_later_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "remind_me_later", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                remove_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "remove", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                remove_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "remove", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                reply_api_v1_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "reply", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                reply_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "reply", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                reply_notes_collection_comment_path: n.route(["collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "reply", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                root_path: n.route([], [], [7, "/", !1], arguments),
                search_admin_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "search", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_api_v1_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "search", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_api_v1_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "search", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_api_v1_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "search", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_by_ids_admin_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "search_by_ids", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_notes_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "search", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                search_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "search", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "search", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                search_users_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "search_users", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                search_users_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "search_users", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                send_confirmation_instructions_api_v1_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "send_confirmation_instructions", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                send_reset_password_instructions_api_v1_users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "send_reset_password_instructions", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                shutup_admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "shutup", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                skip_features_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "features", !1],
                        [2, [7, "/", !1],
                            [2, [6, "skip", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                sort_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "sort", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                speak_admin_user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "users", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "speak", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                stick_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "stick", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                stick_notes_collection_comment_path: n.route(["collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "stick", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                subscription_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "subscriptions", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                subscriptions_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "subscriptions", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                themes_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "themes", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                to_add_notes_collections_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "to_add", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unfavorite_api_v1_notes_collection_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "unfavorite", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unmark_maker_concerned_admin_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "unmark_maker_concerned", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unread_api_v1_users_notifications_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "notifications", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "unread", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unstick_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "unstick", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unstick_notes_collection_comment_path: n.route(["collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "unstick", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unsubscribe_subscription_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "subscriptions", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "unsubscribe", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unvote_api_v1_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "unvote", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                unvote_api_v1_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "unvote", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                update_screenshots_admin_note_note_mark_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "notes", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "note_marks", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "update_screenshots", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                user_comment_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_comments_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_note_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_note_collection_path: n.route(["user_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_note_collections_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "collections", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_omniauth_authorize_path: n.route(["provider"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "auth", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "provider", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_omniauth_callback_path: n.route(["action"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "auth", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "action", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "callback", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                user_session_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "sign_in", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                user_unlock_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "unlock", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                users_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                users_authorizations_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "authorizations", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                users_feed_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "id", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                users_feeds_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [6, "feeds", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                utilities_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "utilities", !1],
                        [1, [2, [8, ".", !1],
                            [3, "format", !1]
                        ], !1]
                    ]
                ], arguments),
                utility_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "utilities", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                verify_admin_note_collection_item_path: n.route(["note_collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "admin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "note_collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "note_collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "items", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "verify", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                vote_api_v1_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "vote", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                vote_api_v1_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "note_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "comments", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [3, "id", !1],
                                                                [2, [7, "/", !1],
                                                                    [2, [6, "vote", !1],
                                                                        [1, [2, [8, ".", !1],
                                                                            [3, "format", !1]
                                                                        ], !1]
                                                                    ]
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                vote_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "vote", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                vote_note_comment_path: n.route(["note_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "note_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "vote", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                vote_notes_collection_comment_path: n.route(["collection_id", "id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [6, "collections", !1],
                                [2, [7, "/", !1],
                                    [2, [3, "collection_id", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "comments", !1],
                                                [2, [7, "/", !1],
                                                    [2, [3, "id", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "vote", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                voted_api_v1_user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "users", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "user_id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "posts", !1],
                                                        [2, [7, "/", !1],
                                                            [2, [6, "voted", !1],
                                                                [1, [2, [8, ".", !1],
                                                                    [3, "format", !1]
                                                                ], !1]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                voted_user_comments_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "comments", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voted", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                voted_user_notes_path: n.route(["user_id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "users", !1],
                        [2, [7, "/", !1],
                            [2, [3, "user_id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [6, "voted", !1],
                                                [1, [2, [8, ".", !1],
                                                    [3, "format", !1]
                                                ], !1]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                voters_api_v1_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "api", !1],
                        [2, [7, "/", !1],
                            [2, [6, "v1", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "posts", !1],
                                        [2, [7, "/", !1],
                                            [2, [3, "id", !1],
                                                [2, [7, "/", !1],
                                                    [2, [6, "voters", !1],
                                                        [1, [2, [8, ".", !1],
                                                            [3, "format", !1]
                                                        ], !1]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                voters_note_path: n.route(["id"], ["format"], [2, [7, "/", !1],
                    [2, [6, "posts", !1],
                        [2, [7, "/", !1],
                            [2, [3, "id", !1],
                                [2, [7, "/", !1],
                                    [2, [6, "voters", !1],
                                        [1, [2, [8, ".", !1],
                                            [3, "format", !1]
                                        ], !1]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ], arguments),
                weixin_messages_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "weixin", !1],
                        [2, [7, "/", !1],
                            [2, [6, "messages", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments),
                welcome_index_path: n.route([], ["format"], [2, [7, "/", !1],
                    [2, [6, "welcome", !1],
                        [2, [7, "/", !1],
                            [2, [6, "index", !1],
                                [1, [2, [8, ".", !1],
                                    [3, "format", !1]
                                ], !1]
                            ]
                        ]
                    ]
                ], arguments)
            }, r.Routes.options = i, r.Routes.default_serializer = function(e, t) {
                return n.default_serializer(e, t)
            }, r.Routes
        }, "function" == typeof define && define.amd ? define([], function() {
            return o()
        }) : o()
    }.call(this),
    function(e) {
        "function" == typeof define && define.amd ? define(["jquery"], e) : e("object" == typeof exports ? require("jquery") : jQuery)
    }(function(e) {
        function t(e) {
            return a.raw ? e : encodeURIComponent(e)
        }

        function n(e) {
            return a.raw ? e : decodeURIComponent(e)
        }

        function o(e) {
            return t(a.json ? JSON.stringify(e) : String(e))
        }

        function i(e) {
            0 === e.indexOf('"') && (e = e.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, "\\"));
            try {
                return e = decodeURIComponent(e.replace(s, " ")), a.json ? JSON.parse(e) : e
            } catch (t) {}
        }

        function r(t, n) {
            var o = a.raw ? t : i(t);
            return e.isFunction(n) ? n(o) : o
        }
        var s = /\+/g,
            a = e.cookie = function(i, s, l) {
                if (void 0 !== s && !e.isFunction(s)) {
                    if (l = e.extend({}, a.defaults, l), "number" == typeof l.expires) {
                        var c = l.expires,
                            d = l.expires = new Date;
                        d.setTime(+d + 864e5 * c)
                    }
                    return document.cookie = [t(i), "=", o(s), l.expires ? "; expires=" + l.expires.toUTCString() : "", l.path ? "; path=" + l.path : "", l.domain ? "; domain=" + l.domain : "", l.secure ? "; secure" : ""].join("")
                }
                for (var u = i ? void 0 : {}, p = document.cookie ? document.cookie.split("; ") : [], f = 0, h = p.length; h > f; f++) {
                    var m = p[f].split("="),
                        g = n(m.shift()),
                        v = m.join("=");
                    if (i && i === g) {
                        u = r(v, s);
                        break
                    }
                    i || void 0 === (v = r(v)) || (u[g] = v)
                }
                return u
            };
        a.defaults = {}, e.removeCookie = function(t, n) {
            return void 0 === e.cookie(t) ? !1 : (e.cookie(t, "", e.extend({}, n, {
                expires: -1
            })), !e.cookie(t))
        }
    }),
    function(e) {
        "use strict";
        e(["jquery"], function(e) {
            function t(t) {
                return e.isFunction(t) || e.isPlainObject(t) ? t : {
                    top: t,
                    left: t
                }
            }
            var n = e.scrollTo = function(t, n, o) {
                return e(window).scrollTo(t, n, o)
            };
            return n.defaults = {
                axis: "xy",
                duration: 0,
                limit: !0
            }, n.window = function(t) {
                return e(window)._scrollable()
            }, e.fn._scrollable = function() {
                return this.map(function() {
                    var t = this,
                        n = !t.nodeName || -1 != e.inArray(t.nodeName.toLowerCase(), ["iframe", "#document", "html", "body"]);
                    if (!n) return t;
                    var o = (t.contentWindow || t).document || t.ownerDocument || t;
                    return /webkit/i.test(navigator.userAgent) || "BackCompat" == o.compatMode ? o.body : o.documentElement
                })
            }, e.fn.scrollTo = function(o, i, r) {
                return "object" == typeof i && (r = i, i = 0), "function" == typeof r && (r = {
                    onAfter: r
                }), "max" == o && (o = 9e9), r = e.extend({}, n.defaults, r), i = i || r.duration, r.queue = r.queue && r.axis.length > 1, r.queue && (i /= 2), r.offset = t(r.offset), r.over = t(r.over), this._scrollable().each(function() {
                    function s(e) {
                        c.animate(u, i, r.easing, e && function() {
                            e.call(this, d, r)
                        })
                    }
                    if (null != o) {
                        var a, l = this,
                            c = e(l),
                            d = o,
                            u = {},
                            p = c.is("html,body");
                        switch (typeof d) {
                            case "number":
                            case "string":
                                if (/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(d)) {
                                    d = t(d);
                                    break
                                }
                                if (d = p ? e(d) : e(d, this), !d.length) return;
                            case "object":
                                (d.is || d.style) && (a = (d = e(d)).offset())
                        }
                        var f = e.isFunction(r.offset) && r.offset(l, d) || r.offset;
                        e.each(r.axis.split(""), function(e, t) {
                            var o = "x" == t ? "Left" : "Top",
                                i = o.toLowerCase(),
                                h = "scroll" + o,
                                m = l[h],
                                g = n.max(l, t);
                            if (a) u[h] = a[i] + (p ? 0 : m - c.offset()[i]), r.margin && (u[h] -= parseInt(d.css("margin" + o)) || 0, u[h] -= parseInt(d.css("border" + o + "Width")) || 0), u[h] += f[i] || 0, r.over[i] && (u[h] += d["x" == t ? "width" : "height"]() * r.over[i]);
                            else {
                                var v = d[i];
                                u[h] = v.slice && "%" == v.slice(-1) ? parseFloat(v) / 100 * g : v
                            }
                            r.limit && /^\d+$/.test(u[h]) && (u[h] = u[h] <= 0 ? 0 : Math.min(u[h], g)), !e && r.queue && (m != u[h] && s(r.onAfterFirst), delete u[h])
                        }), s(r.onAfter)
                    }
                }).end()
            }, n.max = function(t, n) {
                var o = "x" == n ? "Width" : "Height",
                    i = "scroll" + o;
                if (!e(t).is("html,body")) return t[i] - e(t)[o.toLowerCase()]();
                var r = "client" + o,
                    s = t.ownerDocument.documentElement,
                    a = t.ownerDocument.body;
                return Math.max(s[i], a[i]) - Math.min(s[r], a[r])
            }, n
        })
    }("function" == typeof define && define.amd ? define : function(e, t) {
        "undefined" != typeof module && module.exports ? module.exports = t(require("jquery")) : t(jQuery)
    }),
    function(e) {
        "use strict";
        "function" == typeof define && define.amd ? define(["jquery"], e) : e("object" == typeof exports && "function" == typeof require ? require("jquery") : jQuery)
    }(function(e) {
        "use strict";

        function t(n, o) {
            var i = function() {},
                r = this,
                s = {
                    ajaxSettings: {},
                    autoSelectFirst: !1,
                    appendTo: document.body,
                    serviceUrl: null,
                    lookup: null,
                    onSelect: null,
                    width: "auto",
                    minChars: 1,
                    maxHeight: 300,
                    deferRequestBy: 0,
                    params: {},
                    formatResult: t.formatResult,
                    delimiter: null,
                    zIndex: 9999,
                    type: "GET",
                    noCache: !1,
                    onSearchStart: i,
                    onSearchComplete: i,
                    onSearchError: i,
                    containerClass: "autocomplete-suggestions",
                    tabDisabled: !1,
                    dataType: "text",
                    currentRequest: null,
                    triggerSelectOnValidInput: !0,
                    preventBadQueries: !0,
                    lookupFilter: function(e, t, n) {
                        return -1 !== e.value.toLowerCase().indexOf(n)
                    },
                    paramName: "query",
                    transformResult: function(t) {
                        return "string" == typeof t ? e.parseJSON(t) : t
                    },
                    showNoSuggestionNotice: !1,
                    noSuggestionNotice: "No results",
                    orientation: "bottom",
                    forceFixPosition: !1
                };
            r.element = n, r.el = e(n), r.suggestions = [], r.badQueries = [], r.selectedIndex = -1, r.currentValue = r.element.value, r.intervalId = 0, r.cachedResponse = {}, r.onChangeInterval = null, r.onChange = null, r.isLocal = !1, r.suggestionsContainer = null, r.noSuggestionsContainer = null, r.options = e.extend({}, s, o), r.classes = {
                selected: "autocomplete-selected",
                suggestion: "autocomplete-suggestion"
            }, r.hint = null, r.hintValue = "", r.selection = null, r.initialize(), r.setOptions(o)
        }
        var n = function() {
                return {
                    escapeRegExChars: function(e) {
                        return e.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")
                    },
                    createNode: function(e) {
                        var t = document.createElement("div");
                        return t.className = e, t.style.position = "absolute", t.style.display = "none", t
                    }
                }
            }(),
            o = {
                ESC: 27,
                TAB: 9,
                RETURN: 13,
                LEFT: 37,
                UP: 38,
                RIGHT: 39,
                DOWN: 40
            };
        t.utils = n, e.Autocomplete = t, t.formatResult = function(e, t) {
            var o = "(" + n.escapeRegExChars(t) + ")";
            return e.value.replace(new RegExp(o, "gi"), "<strong>$1</strong>")
        }, t.prototype = {
            killerFn: null,
            initialize: function() {
                var n, o = this,
                    i = "." + o.classes.suggestion,
                    r = o.classes.selected,
                    s = o.options;
                o.element.setAttribute("autocomplete", "off"), o.killerFn = function(t) {
                    0 === e(t.target).closest("." + o.options.containerClass).length && (o.killSuggestions(), o.disableKillerFn())
                }, o.noSuggestionsContainer = e('<div class="autocomplete-no-suggestion"></div>').html(this.options.noSuggestionNotice).get(0), o.suggestionsContainer = t.utils.createNode(s.containerClass), n = e(o.suggestionsContainer), n.appendTo(s.appendTo), "auto" !== s.width && n.width(s.width), n.on("mouseover.autocomplete", i, function() {
                    o.activate(e(this).data("index"))
                }), n.on("mouseout.autocomplete", function() {
                    o.selectedIndex = -1, n.children("." + r).removeClass(r)
                }), n.on("click.autocomplete", i, function() {
                    o.select(e(this).data("index"))
                }), o.fixPositionCapture = function() {
                    o.visible && o.fixPosition()
                }, e(window).on("resize.autocomplete", o.fixPositionCapture), o.el.on("keydown.autocomplete", function(e) {
                    o.onKeyPress(e)
                }), o.el.on("keyup.autocomplete", function(e) {
                    o.onKeyUp(e)
                }), o.el.on("blur.autocomplete", function() {
                    o.onBlur()
                }), o.el.on("focus.autocomplete", function() {
                    o.onFocus()
                }), o.el.on("change.autocomplete", function(e) {
                    o.onKeyUp(e)
                })
            },
            onFocus: function() {
                var e = this;
                e.fixPosition(), e.options.minChars <= e.el.val().length && e.onValueChange()
            },
            onBlur: function() {
                this.enableKillerFn()
            },
            setOptions: function(t) {
                var n = this,
                    o = n.options;
                e.extend(o, t), n.isLocal = e.isArray(o.lookup), n.isLocal && (o.lookup = n.verifySuggestionsFormat(o.lookup)), o.orientation = n.validateOrientation(o.orientation, "bottom"), e(n.suggestionsContainer).css({
                    "max-height": o.maxHeight + "px",
                    width: o.width + "px",
                    "z-index": o.zIndex
                })
            },
            clearCache: function() {
                this.cachedResponse = {}, this.badQueries = []
            },
            clear: function() {
                this.clearCache(), this.currentValue = "", this.suggestions = []
            },
            disable: function() {
                var e = this;
                e.disabled = !0, clearInterval(e.onChangeInterval), e.currentRequest && e.currentRequest.abort()
            },
            enable: function() {
                this.disabled = !1
            },
            fixPosition: function() {
                var t = this,
                    n = e(t.suggestionsContainer),
                    o = n.parent().get(0);
                if (o === document.body || t.options.forceFixPosition) {
                    var i = t.options.orientation,
                        r = n.outerHeight(),
                        s = t.el.outerHeight(),
                        a = t.el.offset(),
                        l = {
                            top: a.top,
                            left: a.left
                        };
                    if ("auto" == i) {
                        var c = e(window).height(),
                            d = e(window).scrollTop(),
                            u = -d + a.top - r,
                            p = d + c - (a.top + s + r);
                        i = Math.max(u, p) === u ? "top" : "bottom"
                    }
                    if ("top" === i ? l.top += -r : l.top += s, o !== document.body) {
                        var f, h = n.css("opacity");
                        t.visible || n.css("opacity", 0).show(), f = n.offsetParent().offset(), l.top -= f.top, l.left -= f.left, t.visible || n.css("opacity", h).hide()
                    }
                    "auto" === t.options.width && (l.width = t.el.outerWidth() - 2 + "px"), n.css(l)
                }
            },
            enableKillerFn: function() {
                var t = this;
                e(document).on("click.autocomplete", t.killerFn)
            },
            disableKillerFn: function() {
                var t = this;
                e(document).off("click.autocomplete", t.killerFn)
            },
            killSuggestions: function() {
                var e = this;
                e.stopKillSuggestions(), e.intervalId = window.setInterval(function() {
                    e.hide(), e.stopKillSuggestions()
                }, 50)
            },
            stopKillSuggestions: function() {
                window.clearInterval(this.intervalId)
            },
            isCursorAtEnd: function() {
                var e, t = this,
                    n = t.el.val().length,
                    o = t.element.selectionStart;
                return "number" == typeof o ? o === n : document.selection ? (e = document.selection.createRange(), e.moveStart("character", -n), n === e.text.length) : !0
            },
            onKeyPress: function(e) {
                var t = this;
                if (!t.disabled && !t.visible && e.which === o.DOWN && t.currentValue) return void t.suggest();
                if (!t.disabled && t.visible) {
                    switch (e.which) {
                        case o.ESC:
                            t.el.val(t.currentValue), t.hide();
                            break;
                        case o.RIGHT:
                            if (t.hint && t.options.onHint && t.isCursorAtEnd()) {
                                t.selectHint();
                                break
                            }
                            return;
                        case o.TAB:
                            if (t.hint && t.options.onHint) return void t.selectHint();
                        case o.RETURN:
                            if (-1 === t.selectedIndex) return void t.hide();
                            if (t.select(t.selectedIndex), e.which === o.TAB && t.options.tabDisabled === !1) return;
                            break;
                        case o.UP:
                            t.moveUp();
                            break;
                        case o.DOWN:
                            t.moveDown();
                            break;
                        default:
                            return
                    }
                    e.stopImmediatePropagation(), e.preventDefault()
                }
            },
            onKeyUp: function(e) {
                var t = this;
                if (!t.disabled) {
                    switch (e.which) {
                        case o.UP:
                        case o.DOWN:
                            return
                    }
                    clearInterval(t.onChangeInterval), t.currentValue !== t.el.val() && (t.findBestHint(), t.options.deferRequestBy > 0 ? t.onChangeInterval = setInterval(function() {
                        t.onValueChange()
                    }, t.options.deferRequestBy) : t.onValueChange())
                }
            },
            onValueChange: function() {
                var t, n = this,
                    o = n.options,
                    i = n.el.val(),
                    r = n.getQuery(i);
                return n.selection && n.currentValue !== r && (n.selection = null, (o.onInvalidateSelection || e.noop).call(n.element)), clearInterval(n.onChangeInterval), n.currentValue = i, n.selectedIndex = -1, o.triggerSelectOnValidInput && (t = n.findSuggestionIndex(r), -1 !== t) ? void n.select(t) : void(r.length < o.minChars ? n.hide() : n.getSuggestions(r))
            },
            findSuggestionIndex: function(t) {
                var n = this,
                    o = -1,
                    i = t.toLowerCase();
                return e.each(n.suggestions, function(e, t) {
                    return t.value.toLowerCase() === i ? (o = e, !1) : void 0
                }), o
            },
            getQuery: function(t) {
                var n, o = this.options.delimiter;
                return o ? (n = t.split(o), e.trim(n[n.length - 1])) : t
            },
            getSuggestionsLocal: function(t) {
                var n, o = this,
                    i = o.options,
                    r = t.toLowerCase(),
                    s = i.lookupFilter,
                    a = parseInt(i.lookupLimit, 10);
                return n = {
                    suggestions: e.grep(i.lookup, function(e) {
                        return s(e, t, r)
                    })
                }, a && n.suggestions.length > a && (n.suggestions = n.suggestions.slice(0, a)), n
            },
            getSuggestions: function(t) {
                var n, o, i, r, s = this,
                    a = s.options,
                    l = a.serviceUrl;
                a.params[a.paramName] = t, o = a.ignoreParams ? null : a.params, a.onSearchStart.call(s.element, a.params) !== !1 && (s.isLocal ? n = s.getSuggestionsLocal(t) : (e.isFunction(l) && (l = l.call(s.element, t)), i = l + "?" + e.param(o || {}), n = s.cachedResponse[i]), n && e.isArray(n.suggestions) ? (s.suggestions = n.suggestions, s.suggest(), a.onSearchComplete.call(s.element, t, n.suggestions)) : s.isBadQuery(t) ? a.onSearchComplete.call(s.element, t, []) : (s.currentRequest && s.currentRequest.abort(), r = {
                    url: l,
                    data: o,
                    type: a.type,
                    dataType: a.dataType
                }, e.extend(r, a.ajaxSettings), s.currentRequest = e.ajax(r).done(function(e) {
                    var n;
                    s.currentRequest = null, n = a.transformResult(e), s.processResponse(n, t, i), a.onSearchComplete.call(s.element, t, n.suggestions)
                }).fail(function(e, n, o) {
                    a.onSearchError.call(s.element, t, e, n, o)
                })))
            },
            isBadQuery: function(e) {
                if (!this.options.preventBadQueries) return !1;
                for (var t = this.badQueries, n = t.length; n--;)
                    if (0 === e.indexOf(t[n])) return !0;
                return !1
            },
            hide: function() {
                var t = this;
                t.visible = !1, t.selectedIndex = -1, clearInterval(t.onChangeInterval), e(t.suggestionsContainer).hide(), t.signalHint(null)
            },
            suggest: function() {
                if (0 === this.suggestions.length) return void(this.options.showNoSuggestionNotice ? this.noSuggestions() : this.hide());
                var t, n, o = this,
                    i = o.options,
                    r = i.groupBy,
                    s = i.formatResult,
                    a = o.getQuery(o.currentValue),
                    l = o.classes.suggestion,
                    c = o.classes.selected,
                    d = e(o.suggestionsContainer),
                    u = e(o.noSuggestionsContainer),
                    p = i.beforeRender,
                    f = "",
                    h = function(e, n) {
                        var o = e.data[r];
                        return t === o ? "" : (t = o, '<div class="autocomplete-group"><strong>' + t + "</strong></div>")
                    };
                return i.triggerSelectOnValidInput && (n = o.findSuggestionIndex(a), -1 !== n) ? void o.select(n) : (e.each(o.suggestions, function(e, t) {
                    r && (f += h(t, a, e)), f += '<div class="' + l + '" data-index="' + e + '">' + s(t, a) + "</div>"
                }), this.adjustContainerWidth(), u.detach(), d.html(f), i.autoSelectFirst && (o.selectedIndex = 0, d.children().first().addClass(c)), e.isFunction(p) && p.call(o.element, d), o.fixPosition(), d.show(), o.visible = !0, void o.findBestHint())
            },
            noSuggestions: function() {
                var t = this,
                    n = e(t.suggestionsContainer),
                    o = e(t.noSuggestionsContainer);
                this.adjustContainerWidth(), o.detach(), n.empty(), n.append(o), t.fixPosition(), n.show(), t.visible = !0
            },
            adjustContainerWidth: function() {
                var t, n = this,
                    o = n.options,
                    i = e(n.suggestionsContainer);
                "auto" === o.width && (t = n.el.outerWidth() - 2, i.width(t > 0 ? t : 300))
            },
            findBestHint: function() {
                var t = this,
                    n = t.el.val().toLowerCase(),
                    o = null;
                n && (e.each(t.suggestions, function(e, t) {
                    var i = 0 === t.value.toLowerCase().indexOf(n);
                    return i && (o = t), !i
                }), t.signalHint(o))
            },
            signalHint: function(t) {
                var n = "",
                    o = this;
                t && (n = o.currentValue + t.value.substr(o.currentValue.length)), o.hintValue !== n && (o.hintValue = n, o.hint = t, (this.options.onHint || e.noop)(n))
            },
            verifySuggestionsFormat: function(t) {
                return t.length && "string" == typeof t[0] ? e.map(t, function(e) {
                    return {
                        value: e,
                        data: null
                    }
                }) : t
            },
            validateOrientation: function(t, n) {
                return t = e.trim(t || "").toLowerCase(), -1 === e.inArray(t, ["auto", "bottom", "top"]) && (t = n), t
            },
            processResponse: function(e, t, n) {
                var o = this,
                    i = o.options;
                e.suggestions = o.verifySuggestionsFormat(e.suggestions), i.noCache || (o.cachedResponse[n] = e, i.preventBadQueries && 0 === e.suggestions.length && o.badQueries.push(t)), t === o.getQuery(o.currentValue) && (o.suggestions = e.suggestions, o.suggest())
            },
            activate: function(t) {
                var n, o = this,
                    i = o.classes.selected,
                    r = e(o.suggestionsContainer),
                    s = r.find("." + o.classes.suggestion);
                return r.find("." + i).removeClass(i), o.selectedIndex = t, -1 !== o.selectedIndex && s.length > o.selectedIndex ? (n = s.get(o.selectedIndex), e(n).addClass(i), n) : null
            },
            selectHint: function() {
                var t = this,
                    n = e.inArray(t.hint, t.suggestions);
                t.select(n)
            },
            select: function(e) {
                var t = this;
                t.hide(), t.onSelect(e)
            },
            moveUp: function() {
                var t = this;
                if (-1 !== t.selectedIndex) return 0 === t.selectedIndex ? (e(t.suggestionsContainer).children().first().removeClass(t.classes.selected),
                    t.selectedIndex = -1, t.el.val(t.currentValue), void t.findBestHint()) : void t.adjustScroll(t.selectedIndex - 1)
            },
            moveDown: function() {
                var e = this;
                e.selectedIndex !== e.suggestions.length - 1 && e.adjustScroll(e.selectedIndex + 1)
            },
            adjustScroll: function(t) {
                var n, o, i, r = this,
                    s = r.activate(t),
                    a = 25;
                s && (n = s.offsetTop, o = e(r.suggestionsContainer).scrollTop(), i = o + r.options.maxHeight - a, o > n ? e(r.suggestionsContainer).scrollTop(n) : n > i && e(r.suggestionsContainer).scrollTop(n - r.options.maxHeight + a), r.el.val(r.getValue(r.suggestions[t].value)), r.signalHint(null))
            },
            onSelect: function(t) {
                var n = this,
                    o = n.options.onSelect,
                    i = n.suggestions[t];
                n.currentValue = n.getValue(i.value), n.currentValue !== n.el.val() && n.el.val(n.currentValue), n.signalHint(null), n.suggestions = [], n.selection = i, e.isFunction(o) && o.call(n.element, i)
            },
            getValue: function(e) {
                var t, n, o = this,
                    i = o.options.delimiter;
                return i ? (t = o.currentValue, n = t.split(i), 1 === n.length ? e : t.substr(0, t.length - n[n.length - 1].length) + e) : e
            },
            dispose: function() {
                var t = this;
                t.el.off(".autocomplete").removeData("autocomplete"), t.disableKillerFn(), e(window).off("resize.autocomplete", t.fixPositionCapture), e(t.suggestionsContainer).remove()
            }
        }, e.fn.autocomplete = e.fn.devbridgeAutocomplete = function(n, o) {
            var i = "autocomplete";
            return 0 === arguments.length ? this.first().data(i) : this.each(function() {
                var r = e(this),
                    s = r.data(i);
                "string" == typeof n ? s && "function" == typeof s[n] && s[n](o) : (s && s.dispose && s.dispose(), s = new t(this, n), r.data(i, s))
            })
        }
    }), window.rangy = function() {
        function e(e, t) {
            var n = typeof e[t];
            return "function" == n || !("object" != n || !e[t]) || "unknown" == n
        }

        function t(e, t) {
            return !("object" != typeof e[t] || !e[t])
        }

        function n(e, t) {
            return "undefined" != typeof e[t]
        }

        function o(e) {
            return function(t, n) {
                for (var o = n.length; o--;)
                    if (!e(t, n[o])) return !1;
                return !0
            }
        }

        function i(e) {
            return e && p(e, u) && h(e, d)
        }

        function r(e) {
            window.alert("Rangy not supported in your browser. Reason: " + e), m.initialized = !0, m.supported = !1
        }

        function s() {
            if (!m.initialized) {
                var n, o = !1,
                    s = !1;
                for (e(document, "createRange") && (n = document.createRange(), p(n, c) && h(n, l) && (o = !0), n.detach()), (n = t(document, "body") ? document.body : document.getElementsByTagName("body")[0]) && e(n, "createTextRange") && (n = n.createTextRange(), i(n) && (s = !0)), !o && !s && r("Neither Range nor TextRange are implemented"), m.initialized = !0, m.features = {
                        implementsDomRange: o,
                        implementsTextRange: s
                    }, o = v.concat(g), s = 0, n = o.length; n > s; ++s) try {
                    o[s](m)
                } catch (a) {
                    t(window, "console") && e(window.console, "log") && window.console.log("Init listener threw an exception. Continuing.", a)
                }
            }
        }

        function a(e) {
            this.name = e, this.supported = this.initialized = !1
        }
        var l = ["startContainer", "startOffset", "endContainer", "endOffset", "collapsed", "commonAncestorContainer", "START_TO_START", "START_TO_END", "END_TO_START", "END_TO_END"],
            c = ["setStart", "setStartBefore", "setStartAfter", "setEnd", "setEndBefore", "setEndAfter", "collapse", "selectNode", "selectNodeContents", "compareBoundaryPoints", "deleteContents", "extractContents", "cloneContents", "insertNode", "surroundContents", "cloneRange", "toString", "detach"],
            d = ["boundingHeight", "boundingLeft", "boundingTop", "boundingWidth", "htmlText", "text"],
            u = ["collapse", "compareEndPoints", "duplicate", "getBookmark", "moveToBookmark", "moveToElementText", "parentElement", "pasteHTML", "select", "setEndPoint", "getBoundingClientRect"],
            p = o(e),
            f = o(t),
            h = o(n),
            m = {
                version: "1.2.3",
                initialized: !1,
                supported: !0,
                util: {
                    isHostMethod: e,
                    isHostObject: t,
                    isHostProperty: n,
                    areHostMethods: p,
                    areHostObjects: f,
                    areHostProperties: h,
                    isTextRange: i
                },
                features: {},
                modules: {},
                config: {
                    alertOnWarn: !1,
                    preferTextRange: !1
                }
            };
        m.fail = r, m.warn = function(e) {
            e = "Rangy warning: " + e, m.config.alertOnWarn ? window.alert(e) : "undefined" != typeof window.console && "undefined" != typeof window.console.log && window.console.log(e)
        }, {}.hasOwnProperty ? m.util.extend = function(e, t) {
            for (var n in t) t.hasOwnProperty(n) && (e[n] = t[n])
        } : r("hasOwnProperty not supported");
        var g = [],
            v = [];
        m.init = s, m.addInitListener = function(e) {
            m.initialized ? e(m) : g.push(e)
        };
        var y = [];
        m.addCreateMissingNativeApiListener = function(e) {
            y.push(e)
        }, m.createMissingNativeApi = function(e) {
            e = e || window, s();
            for (var t = 0, n = y.length; n > t; ++t) y[t](e)
        }, a.prototype.fail = function(e) {
            throw this.initialized = !0, this.supported = !1, Error("Module '" + this.name + "' failed to load: " + e)
        }, a.prototype.warn = function(e) {
            m.warn("Module " + this.name + ": " + e)
        }, a.prototype.createError = function(e) {
            return Error("Error in Rangy " + this.name + " module: " + e)
        }, m.createModule = function(e, t) {
            var n = new a(e);
            m.modules[e] = n, v.push(function(e) {
                t(e, n), n.initialized = !0, n.supported = !0
            })
        }, m.requireModules = function(e) {
            for (var t, n, o = 0, i = e.length; i > o; ++o) {
                if (n = e[o], t = m.modules[n], !(t && t instanceof a)) throw Error("Module '" + n + "' not found");
                if (!t.supported) throw Error("Module '" + n + "' not supported")
            }
        };
        var w = !1;
        if (f = function() {
                w || (w = !0, m.initialized || s())
            }, "undefined" == typeof window) r("No window found");
        else {
            if ("undefined" != typeof document) return e(document, "addEventListener") && document.addEventListener("DOMContentLoaded", f, !1), e(window, "addEventListener") ? window.addEventListener("load", f, !1) : e(window, "attachEvent") ? window.attachEvent("onload", f) : r("Window does not have required addEventListener or attachEvent method"), m;
            r("No document found")
        }
    }(), rangy.createModule("DomUtil", function(e, t) {
        function n(e) {
            for (var t = 0; e = e.previousSibling;) t++;
            return t
        }

        function o(e, t) {
            var n, o = [];
            for (n = e; n; n = n.parentNode) o.push(n);
            for (n = t; n; n = n.parentNode)
                if (h(o, n)) return n;
            return null
        }

        function i(e, t, n) {
            for (n = n ? e : e.parentNode; n;) {
                if (e = n.parentNode, e === t) return n;
                n = e
            }
            return null
        }

        function r(e) {
            return e = e.nodeType, 3 == e || 4 == e || 8 == e
        }

        function s(e, t) {
            var n = t.nextSibling,
                o = t.parentNode;
            return n ? o.insertBefore(e, n) : o.appendChild(e), e
        }

        function a(e) {
            if (9 == e.nodeType) return e;
            if ("undefined" != typeof e.ownerDocument) return e.ownerDocument;
            if ("undefined" != typeof e.document) return e.document;
            if (e.parentNode) return a(e.parentNode);
            throw Error("getDocument: no document found for node")
        }

        function l(e) {
            return e ? r(e) ? '"' + e.data + '"' : 1 == e.nodeType ? "<" + e.nodeName + (e.id ? ' id="' + e.id + '"' : "") + ">[" + e.childNodes.length + "]" : e.nodeName : "[No node]"
        }

        function c(e) {
            this._next = this.root = e
        }

        function d(e, t) {
            this.node = e, this.offset = t
        }

        function u(e) {
            this.code = this[e], this.codeName = e, this.message = "DOMException: " + this.codeName
        }
        var p = e.util;
        p.areHostMethods(document, ["createDocumentFragment", "createElement", "createTextNode"]) || t.fail("document missing a Node creation method"), p.isHostMethod(document, "getElementsByTagName") || t.fail("document missing getElementsByTagName method");
        var f = document.createElement("div");
        p.areHostMethods(f, ["insertBefore", "appendChild", "cloneNode"]) || t.fail("Incomplete Element implementation"), p.isHostProperty(f, "innerHTML") || t.fail("Element is missing innerHTML property"), f = document.createTextNode("test"), p.areHostMethods(f, ["splitText", "deleteData", "insertData", "appendData", "cloneNode"]) || t.fail("Incomplete Text Node implementation");
        var h = function(e, t) {
            for (var n = e.length; n--;)
                if (e[n] === t) return !0;
            return !1
        };
        c.prototype = {
            _current: null,
            hasNext: function() {
                return !!this._next
            },
            next: function() {
                var e, t = this._current = this._next;
                if (this._current)
                    if (e = t.firstChild) this._next = e;
                    else {
                        for (e = null; t !== this.root && !(e = t.nextSibling);) t = t.parentNode;
                        this._next = e
                    }
                return this._current
            },
            detach: function() {
                this._current = this._next = this.root = null
            }
        }, d.prototype = {
            equals: function(e) {
                return this.node === e.node & this.offset == e.offset
            },
            inspect: function() {
                return "[DomPosition(" + l(this.node) + ":" + this.offset + ")]"
            }
        }, u.prototype = {
            INDEX_SIZE_ERR: 1,
            HIERARCHY_REQUEST_ERR: 3,
            WRONG_DOCUMENT_ERR: 4,
            NO_MODIFICATION_ALLOWED_ERR: 7,
            NOT_FOUND_ERR: 8,
            NOT_SUPPORTED_ERR: 9,
            INVALID_STATE_ERR: 11
        }, u.prototype.toString = function() {
            return this.message
        }, e.dom = {
            arrayContains: h,
            isHtmlNamespace: function(e) {
                var t;
                return "undefined" == typeof e.namespaceURI || null === (t = e.namespaceURI) || "http://www.w3.org/1999/xhtml" == t
            },
            parentElement: function(e) {
                return e = e.parentNode, 1 == e.nodeType ? e : null
            },
            getNodeIndex: n,
            getNodeLength: function(e) {
                var t;
                return r(e) ? e.length : (t = e.childNodes) ? t.length : 0
            },
            getCommonAncestor: o,
            isAncestorOf: function(e, t, n) {
                for (t = n ? t : t.parentNode; t;) {
                    if (t === e) return !0;
                    t = t.parentNode
                }
                return !1
            },
            getClosestAncestorIn: i,
            isCharacterDataNode: r,
            insertAfter: s,
            splitDataNode: function(e, t) {
                var n = e.cloneNode(!1);
                return n.deleteData(0, t), e.deleteData(t, e.length - t), s(n, e), n
            },
            getDocument: a,
            getWindow: function(e) {
                if (e = a(e), "undefined" != typeof e.defaultView) return e.defaultView;
                if ("undefined" != typeof e.parentWindow) return e.parentWindow;
                throw Error("Cannot get a window object for node")
            },
            getIframeWindow: function(e) {
                if ("undefined" != typeof e.contentWindow) return e.contentWindow;
                if ("undefined" != typeof e.contentDocument) return e.contentDocument.defaultView;
                throw Error("getIframeWindow: No Window object found for iframe element")
            },
            getIframeDocument: function(e) {
                if ("undefined" != typeof e.contentDocument) return e.contentDocument;
                if ("undefined" != typeof e.contentWindow) return e.contentWindow.document;
                throw Error("getIframeWindow: No Document object found for iframe element")
            },
            getBody: function(e) {
                return p.isHostObject(e, "body") ? e.body : e.getElementsByTagName("body")[0]
            },
            getRootContainer: function(e) {
                for (var t; t = e.parentNode;) e = t;
                return e
            },
            comparePoints: function(e, t, r, s) {
                var a;
                if (e == r) return t === s ? 0 : s > t ? -1 : 1;
                if (a = i(r, e, !0)) return t <= n(a) ? -1 : 1;
                if (a = i(e, r, !0)) return n(a) < s ? -1 : 1;
                if (t = o(e, r), e = e === t ? t : i(e, t, !0), r = r === t ? t : i(r, t, !0), e === r) throw Error("comparePoints got to case 4 and childA and childB are the same!");
                for (t = t.firstChild; t;) {
                    if (t === e) return -1;
                    if (t === r) return 1;
                    t = t.nextSibling
                }
                throw Error("Should not be here!")
            },
            inspectNode: l,
            fragmentFromNodeChildren: function(e) {
                for (var t, n = a(e).createDocumentFragment(); t = e.firstChild;) n.appendChild(t);
                return n
            },
            createIterator: function(e) {
                return new c(e)
            },
            DomPosition: d
        }, e.DOMException = u
    }), rangy.createModule("DomRange", function(e) {
        function t(e, t) {
            return 3 != e.nodeType && (j.isAncestorOf(e, t.startContainer, !0) || j.isAncestorOf(e, t.endContainer, !0))
        }

        function n(e) {
            return j.getDocument(e.startContainer)
        }

        function o(e, t, n) {
            if (t = e._listeners[t])
                for (var o = 0, i = t.length; i > o; ++o) t[o].call(e, {
                    target: e,
                    args: n
                })
        }

        function i(e) {
            return new I(e.parentNode, j.getNodeIndex(e))
        }

        function r(e) {
            return new I(e.parentNode, j.getNodeIndex(e) + 1)
        }

        function s(e, t, n) {
            var o = 11 == e.nodeType ? e.firstChild : e;
            return j.isCharacterDataNode(t) ? n == t.length ? j.insertAfter(e, t) : t.parentNode.insertBefore(e, 0 == n ? t : j.splitDataNode(t, n)) : n >= t.childNodes.length ? t.appendChild(e) : t.insertBefore(e, t.childNodes[n]), o
        }

        function a(e) {
            for (var t, o, i = n(e.range).createDocumentFragment(); o = e.next();) {
                if (t = e.isPartiallySelectedSubtree(), o = o.cloneNode(!t), t && (t = e.getSubtreeIterator(), o.appendChild(a(t)), t.detach(!0)), 10 == o.nodeType) throw new P("HIERARCHY_REQUEST_ERR");
                i.appendChild(o)
            }
            return i
        }

        function l(e, t, n) {
            var o, i;
            for (n = n || {
                    stop: !1
                }; o = e.next();)
                if (e.isPartiallySelectedSubtree()) {
                    if (t(o) === !1) return void(n.stop = !0);
                    if (o = e.getSubtreeIterator(), l(o, t, n), o.detach(!0), n.stop) return
                } else
                    for (o = j.createIterator(o); i = o.next();)
                        if (t(i) === !1) return void(n.stop = !0)
        }

        function c(e) {
            for (var t; e.next();) e.isPartiallySelectedSubtree() ? (t = e.getSubtreeIterator(), c(t), t.detach(!0)) : e.remove()
        }

        function d(e) {
            for (var t, o, i = n(e.range).createDocumentFragment(); t = e.next();) {
                if (e.isPartiallySelectedSubtree() ? (t = t.cloneNode(!1), o = e.getSubtreeIterator(), t.appendChild(d(o)), o.detach(!0)) : e.remove(), 10 == t.nodeType) throw new P("HIERARCHY_REQUEST_ERR");
                i.appendChild(t)
            }
            return i
        }

        function u(e, t, n) {
            var o, i = !(!t || !t.length),
                r = !!n;
            i && (o = RegExp("^(" + t.join("|") + ")$"));
            var s = [];
            return l(new f(e, !1), function(e) {
                i && !o.test(e.nodeType) || r && !n(e) || s.push(e)
            }), s
        }

        function p(e) {
            return "[" + ("undefined" == typeof e.getName ? "Range" : e.getName()) + "(" + j.inspectNode(e.startContainer) + ":" + e.startOffset + ", " + j.inspectNode(e.endContainer) + ":" + e.endOffset + ")]"
        }

        function f(e, t) {
            if (this.range = e, this.clonePartiallySelectedTextNodes = t, !e.collapsed) {
                this.sc = e.startContainer, this.so = e.startOffset, this.ec = e.endContainer, this.eo = e.endOffset;
                var n = e.commonAncestorContainer;
                this.sc === this.ec && j.isCharacterDataNode(this.sc) ? (this.isSingleCharacterDataNode = !0, this._first = this._last = this._next = this.sc) : (this._first = this._next = this.sc !== n || j.isCharacterDataNode(this.sc) ? j.getClosestAncestorIn(this.sc, n, !0) : this.sc.childNodes[this.so], this._last = this.ec !== n || j.isCharacterDataNode(this.ec) ? j.getClosestAncestorIn(this.ec, n, !0) : this.ec.childNodes[this.eo - 1])
            }
        }

        function h(e) {
            this.code = this[e], this.codeName = e, this.message = "RangeException: " + this.codeName
        }

        function m(e, t, n) {
            this.nodes = u(e, t, n), this._next = this.nodes[0], this._position = 0
        }

        function g(e) {
            return function(t, n) {
                for (var o, i = n ? t : t.parentNode; i;) {
                    if (o = i.nodeType, j.arrayContains(e, o)) return i;
                    i = i.parentNode
                }
                return null
            }
        }

        function v(e, t) {
            if (B(e, t)) throw new h("INVALID_NODE_TYPE_ERR")
        }

        function y(e) {
            if (!e.startContainer) throw new P("INVALID_STATE_ERR")
        }

        function w(e, t) {
            if (!j.arrayContains(t, e.nodeType)) throw new h("INVALID_NODE_TYPE_ERR")
        }

        function b(e, t) {
            if (0 > t || t > (j.isCharacterDataNode(e) ? e.length : e.childNodes.length)) throw new P("INDEX_SIZE_ERR")
        }

        function _(e, t) {
            if (W(e, !0) !== W(t, !0)) throw new P("WRONG_DOCUMENT_ERR")
        }

        function x(e) {
            if (q(e, !0)) throw new P("NO_MODIFICATION_ALLOWED_ERR")
        }

        function C(e, t) {
            if (!e) throw new P(t)
        }

        function k(e) {
            return !!e.startContainer && !!e.endContainer && !(!j.arrayContains(H, e.startContainer.nodeType) && !W(e.startContainer, !0)) && !(!j.arrayContains(H, e.endContainer.nodeType) && !W(e.endContainer, !0)) && e.startOffset <= (j.isCharacterDataNode(e.startContainer) ? e.startContainer.length : e.startContainer.childNodes.length) && e.endOffset <= (j.isCharacterDataNode(e.endContainer) ? e.endContainer.length : e.endContainer.childNodes.length)
        }

        function T(e) {
            if (y(e), !k(e)) throw Error("Range error: Range is no longer valid after DOM mutation (" + e.inspect() + ")")
        }

        function S() {}

        function $(e) {
            e.START_TO_START = Y, e.START_TO_END = G, e.END_TO_END = K, e.END_TO_START = J, e.NODE_BEFORE = Z, e.NODE_AFTER = ee, e.NODE_BEFORE_AND_AFTER = te, e.NODE_INSIDE = ne
        }

        function E(e) {
            $(e), $(e.prototype)
        }

        function N(e, t) {
            return function() {
                T(this);
                var n = this.startContainer,
                    o = this.startOffset,
                    i = this.commonAncestorContainer,
                    s = new f(this, !0);
                return n !== i && (n = j.getClosestAncestorIn(n, i, !0), o = r(n), n = o.node, o = o.offset), l(s, x), s.reset(), i = e(s), s.detach(), t(this, n, o, n, o), i
            }
        }

        function R(n, o, s) {
            function a(e, t) {
                return function(n) {
                    y(this), w(n, L), w(z(n), H), n = (e ? i : r)(n), (t ? l : u)(this, n.node, n.offset)
                }
            }

            function l(e, t, n) {
                var i = e.endContainer,
                    r = e.endOffset;
                (t !== e.startContainer || n !== e.startOffset) && ((z(t) != z(i) || 1 == j.comparePoints(t, n, i, r)) && (i = t, r = n), o(e, t, n, i, r))
            }

            function u(e, t, n) {
                var i = e.startContainer,
                    r = e.startOffset;
                (t !== e.endContainer || n !== e.endOffset) && ((z(t) != z(i) || -1 == j.comparePoints(t, n, i, r)) && (i = t, r = n), o(e, i, r, t, n))
            }
            n.prototype = new S, e.util.extend(n.prototype, {
                setStart: function(e, t) {
                    y(this), v(e, !0), b(e, t), l(this, e, t)
                },
                setEnd: function(e, t) {
                    y(this), v(e, !0), b(e, t), u(this, e, t)
                },
                setStartBefore: a(!0, !0),
                setStartAfter: a(!1, !0),
                setEndBefore: a(!0, !1),
                setEndAfter: a(!1, !1),
                collapse: function(e) {
                    T(this), e ? o(this, this.startContainer, this.startOffset, this.startContainer, this.startOffset) : o(this, this.endContainer, this.endOffset, this.endContainer, this.endOffset)
                },
                selectNodeContents: function(e) {
                    y(this), v(e, !0), o(this, e, 0, e, j.getNodeLength(e))
                },
                selectNode: function(e) {
                    y(this), v(e, !1), w(e, L);
                    var t = i(e);
                    e = r(e), o(this, t.node, t.offset, e.node, e.offset)
                },
                extractContents: N(d, o),
                deleteContents: N(c, o),
                canSurroundContents: function() {
                    T(this), x(this.startContainer), x(this.endContainer);
                    var e = new f(this, !0),
                        n = e._first && t(e._first, this) || e._last && t(e._last, this);
                    return e.detach(), !n
                },
                detach: function() {
                    s(this)
                },
                splitBoundaries: function() {
                    T(this);
                    var e = this.startContainer,
                        t = this.startOffset,
                        n = this.endContainer,
                        i = this.endOffset,
                        r = e === n;
                    j.isCharacterDataNode(n) && i > 0 && i < n.length && j.splitDataNode(n, i), j.isCharacterDataNode(e) && t > 0 && t < e.length && (e = j.splitDataNode(e, t), r ? (i -= t, n = e) : n == e.parentNode && i >= j.getNodeIndex(e) && i++, t = 0), o(this, e, t, n, i)
                },
                normalizeBoundaries: function() {
                    T(this);
                    var e = this.startContainer,
                        t = this.startOffset,
                        n = this.endContainer,
                        i = this.endOffset,
                        r = function(e) {
                            var t = e.nextSibling;
                            t && t.nodeType == e.nodeType && (n = e, i = e.length, e.appendData(t.data), t.parentNode.removeChild(t))
                        },
                        s = function(o) {
                            var r = o.previousSibling;
                            if (r && r.nodeType == o.nodeType) {
                                e = o;
                                var s = o.length;
                                t = r.length, o.insertData(0, r.data), r.parentNode.removeChild(r), e == n ? (i += t, n = e) : n == o.parentNode && (r = j.getNodeIndex(o), i == r ? (n = o, i = s) : i > r && i--)
                            }
                        },
                        a = !0;
                    j.isCharacterDataNode(n) ? n.length == i && r(n) : (i > 0 && (a = n.childNodes[i - 1]) && j.isCharacterDataNode(a) && r(a), a = !this.collapsed), a ? j.isCharacterDataNode(e) ? 0 == t && s(e) : t < e.childNodes.length && (r = e.childNodes[t]) && j.isCharacterDataNode(r) && s(r) : (e = n, t = i), o(this, e, t, n, i)
                },
                collapseToPoint: function(e, t) {
                    y(this), v(e, !0), b(e, t), (e !== this.startContainer || t !== this.startOffset || e !== this.endContainer || t !== this.endOffset) && o(this, e, t, e, t)
                }
            }), E(n)
        }

        function A(e) {
            e.collapsed = e.startContainer === e.endContainer && e.startOffset === e.endOffset, e.commonAncestorContainer = e.collapsed ? e.startContainer : j.getCommonAncestor(e.startContainer, e.endContainer)
        }

        function D(e, t, n, i, r) {
            var s = e.startContainer !== t || e.startOffset !== n,
                a = e.endContainer !== i || e.endOffset !== r;
            e.startContainer = t, e.startOffset = n, e.endContainer = i, e.endOffset = r, A(e), o(e, "boundarychange", {
                startMoved: s,
                endMoved: a
            })
        }

        function O(e) {
            this.startContainer = e, this.startOffset = 0, this.endContainer = e, this.endOffset = 0, this._listeners = {
                boundarychange: [],
                detach: []
            }, A(this)
        }
        e.requireModules(["DomUtil"]);
        var j = e.dom,
            I = j.DomPosition,
            P = e.DOMException;
        f.prototype = {
            _current: null,
            _next: null,
            _first: null,
            _last: null,
            isSingleCharacterDataNode: !1,
            reset: function() {
                this._current = null, this._next = this._first
            },
            hasNext: function() {
                return !!this._next
            },
            next: function() {
                var e = this._current = this._next;
                return e && (this._next = e !== this._last ? e.nextSibling : null, j.isCharacterDataNode(e) && this.clonePartiallySelectedTextNodes && (e === this.ec && (e = e.cloneNode(!0)).deleteData(this.eo, e.length - this.eo), this._current === this.sc && (e = e.cloneNode(!0)).deleteData(0, this.so))), e
            },
            remove: function() {
                var e, t, n = this._current;
                !j.isCharacterDataNode(n) || n !== this.sc && n !== this.ec ? n.parentNode && n.parentNode.removeChild(n) : (e = n === this.sc ? this.so : 0, t = n === this.ec ? this.eo : n.length, e != t && n.deleteData(e, t - e))
            },
            isPartiallySelectedSubtree: function() {
                return t(this._current, this.range)
            },
            getSubtreeIterator: function() {
                var e;
                if (this.isSingleCharacterDataNode) e = this.range.cloneRange(), e.collapse();
                else {
                    e = new O(n(this.range));
                    var t = this._current,
                        o = t,
                        i = 0,
                        r = t,
                        s = j.getNodeLength(t);
                    j.isAncestorOf(t, this.sc, !0) && (o = this.sc, i = this.so), j.isAncestorOf(t, this.ec, !0) && (r = this.ec, s = this.eo), D(e, o, i, r, s)
                }
                return new f(e, this.clonePartiallySelectedTextNodes)
            },
            detach: function(e) {
                e && this.range.detach(), this.range = this._current = this._next = this._first = this._last = this.sc = this.so = this.ec = this.eo = null
            }
        }, h.prototype = {
            BAD_BOUNDARYPOINTS_ERR: 1,
            INVALID_NODE_TYPE_ERR: 2
        }, h.prototype.toString = function() {
            return this.message
        }, m.prototype = {
            _current: null,
            hasNext: function() {
                return !!this._next
            },
            next: function() {
                return this._current = this._next, this._next = this.nodes[++this._position], this._current
            },
            detach: function() {
                this._current = this._next = this.nodes = null
            }
        };
        var L = [1, 3, 4, 5, 7, 8, 10],
            H = [2, 9, 11],
            F = [1, 3, 4, 5, 7, 8, 10, 11],
            M = [1, 3, 4, 5, 7, 8],
            z = j.getRootContainer,
            W = g([9, 11]),
            q = g([5, 6, 10, 12]),
            B = g([6, 10, 12]),
            U = document.createElement("style"),
            Q = !1;
        try {
            U.innerHTML = "<b>x</b>", Q = 3 == U.firstChild.nodeType
        } catch (V) {}
        e.features.htmlParsingConforms = Q;
        var X = ["startContainer", "startOffset", "endContainer", "endOffset", "collapsed", "commonAncestorContainer"],
            Y = 0,
            G = 1,
            K = 2,
            J = 3,
            Z = 0,
            ee = 1,
            te = 2,
            ne = 3;
        S.prototype = {
            attachListener: function(e, t) {
                this._listeners[e].push(t)
            },
            compareBoundaryPoints: function(e, t) {
                T(this), _(this.startContainer, t.startContainer);
                var n = e == J || e == Y ? "start" : "end",
                    o = e == G || e == Y ? "start" : "end";
                return j.comparePoints(this[n + "Container"], this[n + "Offset"], t[o + "Container"], t[o + "Offset"])
            },
            insertNode: function(e) {
                if (T(this), w(e, F), x(this.startContainer), j.isAncestorOf(e, this.startContainer, !0)) throw new P("HIERARCHY_REQUEST_ERR");
                this.setStartBefore(s(e, this.startContainer, this.startOffset))
            },
            cloneContents: function() {
                T(this);
                var e, t;
                return this.collapsed ? n(this).createDocumentFragment() : this.startContainer === this.endContainer && j.isCharacterDataNode(this.startContainer) ? (e = this.startContainer.cloneNode(!0), e.data = e.data.slice(this.startOffset, this.endOffset), t = n(this).createDocumentFragment(), t.appendChild(e), t) : (t = new f(this, !0), e = a(t), t.detach(), e)
            },
            canSurroundContents: function() {
                T(this), x(this.startContainer), x(this.endContainer);
                var e = new f(this, !0),
                    n = e._first && t(e._first, this) || e._last && t(e._last, this);
                return e.detach(), !n
            },
            surroundContents: function(e) {
                if (w(e, M), !this.canSurroundContents()) throw new h("BAD_BOUNDARYPOINTS_ERR");
                var t = this.extractContents();
                if (e.hasChildNodes())
                    for (; e.lastChild;) e.removeChild(e.lastChild);
                s(e, this.startContainer, this.startOffset), e.appendChild(t), this.selectNode(e)
            },
            cloneRange: function() {
                T(this);
                for (var e, t = new O(n(this)), o = X.length; o--;) e = X[o], t[e] = this[e];
                return t
            },
            toString: function() {
                T(this);
                var e = this.startContainer;
                if (e === this.endContainer && j.isCharacterDataNode(e)) return 3 == e.nodeType || 4 == e.nodeType ? e.data.slice(this.startOffset, this.endOffset) : "";
                var t = [];
                return e = new f(this, !0), l(e, function(e) {
                    (3 == e.nodeType || 4 == e.nodeType) && t.push(e.data)
                }), e.detach(), t.join("")
            },
            compareNode: function(e) {
                T(this);
                var t = e.parentNode,
                    n = j.getNodeIndex(e);
                if (!t) throw new P("NOT_FOUND_ERR");
                return e = this.comparePoint(t, n), t = this.comparePoint(t, n + 1), 0 > e ? t > 0 ? te : Z : t > 0 ? ee : ne
            },
            comparePoint: function(e, t) {
                return T(this), C(e, "HIERARCHY_REQUEST_ERR"), _(e, this.startContainer), j.comparePoints(e, t, this.startContainer, this.startOffset) < 0 ? -1 : j.comparePoints(e, t, this.endContainer, this.endOffset) > 0 ? 1 : 0
            },
            createContextualFragment: Q ? function(e) {
                var t = this.startContainer,
                    n = j.getDocument(t);
                if (!t) throw new P("INVALID_STATE_ERR");
                var o = null;
                return 1 == t.nodeType ? o = t : j.isCharacterDataNode(t) && (o = j.parentElement(t)), o = null === o || "HTML" == o.nodeName && j.isHtmlNamespace(j.getDocument(o).documentElement) && j.isHtmlNamespace(o) ? n.createElement("body") : o.cloneNode(!1), o.innerHTML = e, j.fragmentFromNodeChildren(o)
            } : function(e) {
                y(this);
                var t = n(this).createElement("body");
                return t.innerHTML = e, j.fragmentFromNodeChildren(t)
            },
            toHtml: function() {
                T(this);
                var e = n(this).createElement("div");
                return e.appendChild(this.cloneContents()), e.innerHTML
            },
            intersectsNode: function(e, t) {
                if (T(this), C(e, "NOT_FOUND_ERR"), j.getDocument(e) !== n(this)) return !1;
                var o = e.parentNode,
                    i = j.getNodeIndex(e);
                C(o, "NOT_FOUND_ERR");
                var r = j.comparePoints(o, i, this.endContainer, this.endOffset);
                return o = j.comparePoints(o, i + 1, this.startContainer, this.startOffset), t ? 0 >= r && o >= 0 : 0 > r && o > 0
            },
            isPointInRange: function(e, t) {
                return T(this), C(e, "HIERARCHY_REQUEST_ERR"), _(e, this.startContainer), j.comparePoints(e, t, this.startContainer, this.startOffset) >= 0 && j.comparePoints(e, t, this.endContainer, this.endOffset) <= 0
            },
            intersectsRange: function(e, t) {
                if (T(this), n(e) != n(this)) throw new P("WRONG_DOCUMENT_ERR");
                var o = j.comparePoints(this.startContainer, this.startOffset, e.endContainer, e.endOffset),
                    i = j.comparePoints(this.endContainer, this.endOffset, e.startContainer, e.startOffset);
                return t ? 0 >= o && i >= 0 : 0 > o && i > 0
            },
            intersection: function(e) {
                if (this.intersectsRange(e)) {
                    var t = j.comparePoints(this.startContainer, this.startOffset, e.startContainer, e.startOffset),
                        n = j.comparePoints(this.endContainer, this.endOffset, e.endContainer, e.endOffset),
                        o = this.cloneRange();
                    return -1 == t && o.setStart(e.startContainer, e.startOffset), 1 == n && o.setEnd(e.endContainer, e.endOffset), o
                }
                return null
            },
            union: function(e) {
                if (this.intersectsRange(e, !0)) {
                    var t = this.cloneRange();
                    return -1 == j.comparePoints(e.startContainer, e.startOffset, this.startContainer, this.startOffset) && t.setStart(e.startContainer, e.startOffset), 1 == j.comparePoints(e.endContainer, e.endOffset, this.endContainer, this.endOffset) && t.setEnd(e.endContainer, e.endOffset), t
                }
                throw new h("Ranges do not intersect")
            },
            containsNode: function(e, t) {
                return t ? this.intersectsNode(e, !1) : this.compareNode(e) == ne
            },
            containsNodeContents: function(e) {
                return this.comparePoint(e, 0) >= 0 && this.comparePoint(e, j.getNodeLength(e)) <= 0
            },
            containsRange: function(e) {
                return this.intersection(e).equals(e)
            },
            containsNodeText: function(e) {
                var t = this.cloneRange();
                t.selectNode(e);
                var n = t.getNodes([3]);
                return n.length > 0 ? (t.setStart(n[0], 0), e = n.pop(), t.setEnd(e, e.length), e = this.containsRange(t), t.detach(), e) : this.containsNodeContents(e)
            },
            createNodeIterator: function(e, t) {
                return T(this), new m(this, e, t)
            },
            getNodes: function(e, t) {
                return T(this), u(this, e, t)
            },
            getDocument: function() {
                return n(this)
            },
            collapseBefore: function(e) {
                y(this), this.setEndBefore(e), this.collapse(!1)
            },
            collapseAfter: function(e) {
                y(this), this.setStartAfter(e), this.collapse(!0)
            },
            getName: function() {
                return "DomRange"
            },
            equals: function(e) {
                return O.rangesEqual(this, e)
            },
            isValid: function() {
                return k(this)
            },
            inspect: function() {
                return p(this)
            }
        }, R(O, D, function(e) {
            y(e), e.startContainer = e.startOffset = e.endContainer = e.endOffset = null, e.collapsed = e.commonAncestorContainer = null, o(e, "detach", null), e._listeners = null
        }), e.rangePrototype = S.prototype, O.rangeProperties = X, O.RangeIterator = f, O.copyComparisonConstants = E, O.createPrototypeRange = R, O.inspect = p, O.getRangeDocument = n, O.rangesEqual = function(e, t) {
            return e.startContainer === t.startContainer && e.startOffset === t.startOffset && e.endContainer === t.endContainer && e.endOffset === t.endOffset
        }, e.DomRange = O, e.RangeException = h
    }), rangy.createModule("WrappedRange", function(e) {
        function t(e, t, n, o) {
            var s = e.duplicate();
            s.collapse(n);
            var a = s.parentElement();
            if (i.isAncestorOf(t, a, !0) || (a = t), !a.canHaveHTML) return new r(a.parentNode, i.getNodeIndex(a));
            t = i.getDocument(a).createElement("span");
            var l, c = n ? "StartToStart" : "StartToEnd";
            do a.insertBefore(t, t.previousSibling), s.moveToElementText(t); while ((l = s.compareEndPoints(c, e)) > 0 && t.previousSibling);
            if (c = t.nextSibling, -1 == l && c && i.isCharacterDataNode(c)) {
                if (s.setEndPoint(n ? "EndToStart" : "EndToEnd", e), /[\r\n]/.test(c.data))
                    for (a = s.duplicate(), n = a.text.replace(/\r\n/g, "\r").length, n = a.moveStart("character", n); - 1 == a.compareEndPoints("StartToEnd", a);) n++, a.moveStart("character", 1);
                else n = s.text.length;
                a = new r(c, n)
            } else c = (o || !n) && t.previousSibling, a = (n = (o || n) && t.nextSibling) && i.isCharacterDataNode(n) ? new r(n, 0) : c && i.isCharacterDataNode(c) ? new r(c, c.length) : new r(a, i.getNodeIndex(t));
            return t.parentNode.removeChild(t), a
        }

        function n(e, t) {
            var n, o, r = e.offset,
                s = i.getDocument(e.node),
                a = s.body.createTextRange(),
                l = i.isCharacterDataNode(e.node);
            return l ? (n = e.node, o = n.parentNode) : (n = e.node.childNodes, n = r < n.length ? n[r] : null, o = e.node), s = s.createElement("span"), s.innerHTML = "&#feff;", n ? o.insertBefore(s, n) : o.appendChild(s), a.moveToElementText(s), a.collapse(!t), o.removeChild(s), l && a[t ? "moveStart" : "moveEnd"]("character", r), a
        }
        e.requireModules(["DomUtil", "DomRange"]);
        var o, i = e.dom,
            r = i.DomPosition,
            s = e.DomRange;
        if (!e.features.implementsDomRange || e.features.implementsTextRange && e.config.preferTextRange) {
            if (e.features.implementsTextRange) {
                o = function(e) {
                    this.textRange = e, this.refresh()
                }, o.prototype = new s(document), o.prototype.refresh = function() {
                    var e, n, o = this.textRange;
                    e = o.parentElement();
                    var r = o.duplicate();
                    r.collapse(!0), n = r.parentElement(), r = o.duplicate(), r.collapse(!1), o = r.parentElement(), n = n == o ? n : i.getCommonAncestor(n, o), n = n == e ? n : i.getCommonAncestor(e, n), 0 == this.textRange.compareEndPoints("StartToEnd", this.textRange) ? n = e = t(this.textRange, n, !0, !0) : (e = t(this.textRange, n, !0, !1), n = t(this.textRange, n, !1, !1)), this.setStart(e.node, e.offset), this.setEnd(n.node, n.offset)
                }, s.copyComparisonConstants(o);
                var a = function() {
                    return this
                }();
                "undefined" == typeof a.Range && (a.Range = o), e.createNativeRange = function(e) {
                    return e = e || document, e.body.createTextRange()
                }
            }
        } else ! function() {
            function t(e) {
                for (var t, n = l.length; n--;) t = l[n], e[t] = e.nativeRange[t]
            }
            var n, r, a, l = s.rangeProperties;
            o = function(e) {
                if (!e) throw Error("Range must be specified");
                this.nativeRange = e, t(this)
            }, s.createPrototypeRange(o, function(e, t, n, o, i) {
                var r = e.endContainer !== o || e.endOffset != i;
                (e.startContainer !== t || e.startOffset != n || r) && (e.setEnd(o, i), e.setStart(t, n))
            }, function(e) {
                e.nativeRange.detach(), e.detached = !0;
                for (var t, n = l.length; n--;) t = l[n], e[t] = null
            }), n = o.prototype, n.selectNode = function(e) {
                this.nativeRange.selectNode(e), t(this)
            }, n.deleteContents = function() {
                this.nativeRange.deleteContents(), t(this)
            }, n.extractContents = function() {
                var e = this.nativeRange.extractContents();
                return t(this), e
            }, n.cloneContents = function() {
                return this.nativeRange.cloneContents()
            }, n.surroundContents = function(e) {
                this.nativeRange.surroundContents(e), t(this)
            }, n.collapse = function(e) {
                this.nativeRange.collapse(e), t(this)
            }, n.cloneRange = function() {
                return new o(this.nativeRange.cloneRange())
            }, n.refresh = function() {
                t(this)
            }, n.toString = function() {
                return this.nativeRange.toString()
            };
            var c = document.createTextNode("test");
            i.getBody(document).appendChild(c);
            var d = document.createRange();
            d.setStart(c, 0), d.setEnd(c, 0);
            try {
                d.setStart(c, 1), r = !0, n.setStart = function(e, n) {
                    this.nativeRange.setStart(e, n), t(this)
                }, n.setEnd = function(e, n) {
                    this.nativeRange.setEnd(e, n), t(this)
                }, a = function(e) {
                    return function(n) {
                        this.nativeRange[e](n), t(this)
                    }
                }
            } catch (u) {
                r = !1, n.setStart = function(e, n) {
                    try {
                        this.nativeRange.setStart(e, n)
                    } catch (o) {
                        this.nativeRange.setEnd(e, n), this.nativeRange.setStart(e, n)
                    }
                    t(this)
                }, n.setEnd = function(e, n) {
                    try {
                        this.nativeRange.setEnd(e, n)
                    } catch (o) {
                        this.nativeRange.setStart(e, n), this.nativeRange.setEnd(e, n)
                    }
                    t(this)
                }, a = function(e, n) {
                    return function(o) {
                        try {
                            this.nativeRange[e](o)
                        } catch (i) {
                            this.nativeRange[n](o), this.nativeRange[e](o)
                        }
                        t(this)
                    }
                }
            }
            n.setStartBefore = a("setStartBefore", "setEndBefore"), n.setStartAfter = a("setStartAfter", "setEndAfter"), n.setEndBefore = a("setEndBefore", "setStartBefore"), n.setEndAfter = a("setEndAfter", "setStartAfter"), d.selectNodeContents(c), n.selectNodeContents = d.startContainer == c && d.endContainer == c && 0 == d.startOffset && d.endOffset == c.length ? function(e) {
                this.nativeRange.selectNodeContents(e), t(this)
            } : function(e) {
                this.setStart(e, 0), this.setEnd(e, s.getEndOffset(e))
            }, d.selectNodeContents(c), d.setEnd(c, 3), r = document.createRange(), r.selectNodeContents(c), r.setEnd(c, 4), r.setStart(c, 2), n.compareBoundaryPoints = -1 == d.compareBoundaryPoints(d.START_TO_END, r) & 1 == d.compareBoundaryPoints(d.END_TO_START, r) ? function(e, t) {
                return t = t.nativeRange || t, e == t.START_TO_END ? e = t.END_TO_START : e == t.END_TO_START && (e = t.START_TO_END), this.nativeRange.compareBoundaryPoints(e, t)
            } : function(e, t) {
                return this.nativeRange.compareBoundaryPoints(e, t.nativeRange || t)
            }, e.util.isHostMethod(d, "createContextualFragment") && (n.createContextualFragment = function(e) {
                return this.nativeRange.createContextualFragment(e)
            }), i.getBody(document).removeChild(c), d.detach(), r.detach()
        }(), e.createNativeRange = function(e) {
            return e = e || document, e.createRange()
        };
        e.features.implementsTextRange && (o.rangeToTextRange = function(e) {
            if (e.collapsed) return n(new r(e.startContainer, e.startOffset), !0);
            var t = n(new r(e.startContainer, e.startOffset), !0),
                o = n(new r(e.endContainer, e.endOffset), !1);
            return e = i.getDocument(e.startContainer).body.createTextRange(), e.setEndPoint("StartToStart", t), e.setEndPoint("EndToEnd", o), e
        }), o.prototype.getName = function() {
            return "WrappedRange"
        }, e.WrappedRange = o, e.createRange = function(t) {
            return t = t || document, new o(e.createNativeRange(t))
        }, e.createRangyRange = function(e) {
            return e = e || document, new s(e)
        }, e.createIframeRange = function(t) {
            return e.createRange(i.getIframeDocument(t))
        }, e.createIframeRangyRange = function(t) {
            return e.createRangyRange(i.getIframeDocument(t))
        }, e.addCreateMissingNativeApiListener(function(t) {
            t = t.document, "undefined" == typeof t.createRange && (t.createRange = function() {
                return e.createRange(this)
            }), t = t = null
        })
    }), rangy.createModule("WrappedSelection", function(e, t) {
        function n(e) {
            return (e || window).getSelection()
        }

        function o(e) {
            return (e || window).document.selection
        }

        function i(e, t, n) {
            var o = n ? "end" : "start";
            n = n ? "start" : "end", e.anchorNode = t[o + "Container"], e.anchorOffset = t[o + "Offset"], e.focusNode = t[n + "Container"], e.focusOffset = t[n + "Offset"]
        }

        function r(e) {
            e.anchorNode = e.focusNode = null, e.anchorOffset = e.focusOffset = 0, e.rangeCount = 0, e.isCollapsed = !0, e._ranges.length = 0
        }

        function s(t) {
            var n;
            return t instanceof w ? (n = t._selectionNativeRange, n || (n = e.createNativeRange(v.getDocument(t.startContainer)), n.setEnd(t.endContainer, t.endOffset), n.setStart(t.startContainer, t.startOffset), t._selectionNativeRange = n, t.attachListener("detach", function() {
                this._selectionNativeRange = null
            }))) : t instanceof b ? n = t.nativeRange : e.features.implementsDomRange && t instanceof v.getWindow(t.startContainer).Range && (n = t), n
        }

        function a(e) {
            var t, n = e.getNodes();
            e: if (n.length && 1 == n[0].nodeType) {
                t = 1;
                for (var o = n.length; o > t; ++t)
                    if (!v.isAncestorOf(n[0], n[t])) {
                        t = !1;
                        break e
                    }
                t = !0
            } else t = !1;
            if (!t) throw Error("getSingleElementFromRange: range " + e.inspect() + " did not consist of a single element");
            return n[0]
        }

        function l(e, t) {
            var n = new b(t);
            e._ranges = [n], i(e, n, !1), e.rangeCount = 1, e.isCollapsed = n.collapsed
        }

        function c(t) {
            if (t._ranges.length = 0, "None" == t.docSelection.type) r(t);
            else {
                var n = t.docSelection.createRange();
                if (n && "undefined" != typeof n.text) l(t, n);
                else {
                    t.rangeCount = n.length;
                    for (var o, s = v.getDocument(n.item(0)), a = 0; a < t.rangeCount; ++a) o = e.createRange(s),
                        o.selectNode(n.item(a)), t._ranges.push(o);
                    t.isCollapsed = 1 == t.rangeCount && t._ranges[0].collapsed, i(t, t._ranges[t.rangeCount - 1], !1)
                }
            }
        }

        function d(e, t) {
            var n = e.docSelection.createRange(),
                o = a(t),
                i = v.getDocument(n.item(0));
            i = v.getBody(i).createControlRange();
            for (var r = 0, s = n.length; s > r; ++r) i.add(n.item(r));
            try {
                i.add(o)
            } catch (l) {
                throw Error("addRange(): Element within the specified Range could not be added to control selection (does it have layout?)")
            }
            i.select(), c(e)
        }

        function u(e, t, n) {
            this.nativeSelection = e, this.docSelection = t, this._ranges = [], this.win = n, this.refresh()
        }

        function p(e, t) {
            var n = v.getDocument(t[0].startContainer);
            n = v.getBody(n).createControlRange();
            for (var o, i = 0; i < rangeCount; ++i) {
                o = a(t[i]);
                try {
                    n.add(o)
                } catch (r) {
                    throw Error("setRanges(): Element within the one of the specified Ranges could not be added to control selection (does it have layout?)")
                }
            }
            n.select(), c(e)
        }

        function f(e, t) {
            if (e.anchorNode && v.getDocument(e.anchorNode) !== v.getDocument(t)) throw new _("WRONG_DOCUMENT_ERR")
        }

        function h(e) {
            var t = [],
                n = new x(e.anchorNode, e.anchorOffset),
                o = new x(e.focusNode, e.focusOffset),
                i = "function" == typeof e.getName ? e.getName() : "Selection";
            if ("undefined" != typeof e.rangeCount)
                for (var r = 0, s = e.rangeCount; s > r; ++r) t[r] = w.inspect(e.getRangeAt(r));
            return "[" + i + "(Ranges: " + t.join(", ") + ")(anchor: " + n.inspect() + ", focus: " + o.inspect() + "]"
        }
        e.requireModules(["DomUtil", "DomRange", "WrappedRange"]), e.config.checkSelectionRanges = !0;
        var m, g, v = e.dom,
            y = e.util,
            w = e.DomRange,
            b = e.WrappedRange,
            _ = e.DOMException,
            x = v.DomPosition,
            C = e.util.isHostMethod(window, "getSelection"),
            k = e.util.isHostObject(document, "selection"),
            T = k && (!C || e.config.preferTextRange);
        T ? (m = o, e.isSelectionValid = function(e) {
            e = (e || window).document;
            var t = e.selection;
            return "None" != t.type || v.getDocument(t.createRange().parentElement()) == e
        }) : C ? (m = n, e.isSelectionValid = function() {
            return !0
        }) : t.fail("Neither document.selection or window.getSelection() detected."), e.getNativeSelection = m, C = m();
        var S = e.createNativeRange(document),
            $ = v.getBody(document),
            E = y.areHostObjects(C, y.areHostProperties(C, ["anchorOffset", "focusOffset"]));
        e.features.selectionHasAnchorAndFocus = E;
        var N = y.isHostMethod(C, "extend");
        e.features.selectionHasExtend = N;
        var R = "number" == typeof C.rangeCount;
        e.features.selectionHasRangeCount = R;
        var A = !1,
            D = !0;
        y.areHostMethods(C, ["addRange", "getRangeAt", "removeAllRanges"]) && "number" == typeof C.rangeCount && e.features.implementsDomRange && function() {
            var e = document.createElement("iframe");
            e.frameBorder = 0, e.style.position = "absolute", e.style.left = "-10000px", $.appendChild(e);
            var t = v.getIframeDocument(e);
            t.open(), t.write("<html><head></head><body>12</body></html>"), t.close();
            var n = v.getIframeWindow(e).getSelection(),
                o = t.documentElement.lastChild.firstChild;
            t = t.createRange(), t.setStart(o, 1), t.collapse(!0), n.addRange(t), D = 1 == n.rangeCount, n.removeAllRanges();
            var i = t.cloneRange();
            t.setStart(o, 0), i.setEnd(o, 2), n.addRange(t), n.addRange(i), A = 2 == n.rangeCount, t.detach(), i.detach(), $.removeChild(e)
        }(), e.features.selectionSupportsMultipleRanges = A, e.features.collapsedNonEditableSelectionsSupported = D;
        var O, j = !1;
        $ && y.isHostMethod($, "createControlRange") && (O = $.createControlRange(), y.areHostProperties(O, ["item", "add"]) && (j = !0)), e.features.implementsControlRange = j, g = E ? function(e) {
            return e.anchorNode === e.focusNode && e.anchorOffset === e.focusOffset
        } : function(e) {
            return e.rangeCount ? e.getRangeAt(e.rangeCount - 1).collapsed : !1
        };
        var I;
        if (y.isHostMethod(C, "getRangeAt") ? I = function(e, t) {
                try {
                    return e.getRangeAt(t)
                } catch (n) {
                    return null
                }
            } : E && (I = function(t) {
                var n = v.getDocument(t.anchorNode);
                return n = e.createRange(n), n.setStart(t.anchorNode, t.anchorOffset), n.setEnd(t.focusNode, t.focusOffset), n.collapsed !== this.isCollapsed && (n.setStart(t.focusNode, t.focusOffset), n.setEnd(t.anchorNode, t.anchorOffset)), n
            }), e.getSelection = function(e) {
                e = e || window;
                var t = e._rangySelection,
                    n = m(e),
                    i = k ? o(e) : null;
                return t ? (t.nativeSelection = n, t.docSelection = i, t.refresh(e)) : (t = new u(n, i, e), e._rangySelection = t), t
            }, e.getIframeSelection = function(t) {
                return e.getSelection(v.getIframeWindow(t))
            }, O = u.prototype, !T && E && y.areHostMethods(C, ["removeAllRanges", "addRange"])) {
            O.removeAllRanges = function() {
                this.nativeSelection.removeAllRanges(), r(this)
            };
            var P = function(t, n) {
                var o = w.getRangeDocument(n);
                o = e.createRange(o), o.collapseToPoint(n.endContainer, n.endOffset), t.nativeSelection.addRange(s(o)), t.nativeSelection.extend(n.startContainer, n.startOffset), t.refresh()
            };
            O.addRange = R ? function(t, n) {
                if (j && k && "Control" == this.docSelection.type) d(this, t);
                else if (n && N) P(this, t);
                else {
                    var o;
                    A ? o = this.rangeCount : (this.removeAllRanges(), o = 0), this.nativeSelection.addRange(s(t)), this.rangeCount = this.nativeSelection.rangeCount, this.rangeCount == o + 1 ? (e.config.checkSelectionRanges && (o = I(this.nativeSelection, this.rangeCount - 1)) && !w.rangesEqual(o, t) && (t = new b(o)), this._ranges[this.rangeCount - 1] = t, i(this, t, F(this.nativeSelection)), this.isCollapsed = g(this)) : this.refresh()
                }
            } : function(e, t) {
                t && N ? P(this, e) : (this.nativeSelection.addRange(s(e)), this.refresh())
            }, O.setRanges = function(e) {
                if (j && e.length > 1) p(this, e);
                else {
                    this.removeAllRanges();
                    for (var t = 0, n = e.length; n > t; ++t) this.addRange(e[t])
                }
            }
        } else {
            if (!(y.isHostMethod(C, "empty") && y.isHostMethod(S, "select") && j && T)) return t.fail("No means of selecting a Range or TextRange was found"), !1;
            O.removeAllRanges = function() {
                try {
                    if (this.docSelection.empty(), "None" != this.docSelection.type) {
                        var e;
                        if (this.anchorNode) e = v.getDocument(this.anchorNode);
                        else if ("Control" == this.docSelection.type) {
                            var t = this.docSelection.createRange();
                            t.length && (e = v.getDocument(t.item(0)).body.createTextRange())
                        }
                        e && (e.body.createTextRange().select(), this.docSelection.empty())
                    }
                } catch (n) {}
                r(this)
            }, O.addRange = function(e) {
                "Control" == this.docSelection.type ? d(this, e) : (b.rangeToTextRange(e).select(), this._ranges[0] = e, this.rangeCount = 1, this.isCollapsed = this._ranges[0].collapsed, i(this, e, !1))
            }, O.setRanges = function(e) {
                this.removeAllRanges();
                var t = e.length;
                t > 1 ? p(this, e) : t && this.addRange(e[0])
            }
        }
        O.getRangeAt = function(e) {
            if (0 > e || e >= this.rangeCount) throw new _("INDEX_SIZE_ERR");
            return this._ranges[e]
        };
        var L;
        if (T) L = function(t) {
            var n;
            e.isSelectionValid(t.win) ? n = t.docSelection.createRange() : (n = v.getBody(t.win.document).createTextRange(), n.collapse(!0)), "Control" == t.docSelection.type ? c(t) : n && "undefined" != typeof n.text ? l(t, n) : r(t)
        };
        else if (y.isHostMethod(C, "getRangeAt") && "number" == typeof C.rangeCount) L = function(t) {
            if (j && k && "Control" == t.docSelection.type) c(t);
            else if (t._ranges.length = t.rangeCount = t.nativeSelection.rangeCount, t.rangeCount) {
                for (var n = 0, o = t.rangeCount; o > n; ++n) t._ranges[n] = new e.WrappedRange(t.nativeSelection.getRangeAt(n));
                i(t, t._ranges[t.rangeCount - 1], F(t.nativeSelection)), t.isCollapsed = g(t)
            } else r(t)
        };
        else {
            if (!E || "boolean" != typeof C.isCollapsed || "boolean" != typeof S.collapsed || !e.features.implementsDomRange) return t.fail("No means of obtaining a Range or TextRange from the user's selection was found"), !1;
            L = function(e) {
                var t;
                t = e.nativeSelection, t.anchorNode ? (t = I(t, 0), e._ranges = [t], e.rangeCount = 1, t = e.nativeSelection, e.anchorNode = t.anchorNode, e.anchorOffset = t.anchorOffset, e.focusNode = t.focusNode, e.focusOffset = t.focusOffset, e.isCollapsed = g(e)) : r(e)
            }
        }
        O.refresh = function(e) {
            var t = e ? this._ranges.slice(0) : null;
            if (L(this), e) {
                if (e = t.length, e != this._ranges.length) return !1;
                for (; e--;)
                    if (!w.rangesEqual(t[e], this._ranges[e])) return !1;
                return !0
            }
        };
        var H = function(e, t) {
            var n = e.getAllRanges(),
                o = !1;
            e.removeAllRanges();
            for (var i = 0, s = n.length; s > i; ++i) o || t !== n[i] ? e.addRange(n[i]) : o = !0;
            e.rangeCount || r(e)
        };
        O.removeRange = j ? function(e) {
            if ("Control" == this.docSelection.type) {
                var t = this.docSelection.createRange();
                e = a(e);
                var n = v.getDocument(t.item(0));
                n = v.getBody(n).createControlRange();
                for (var o, i = !1, r = 0, s = t.length; s > r; ++r) o = t.item(r), o !== e || i ? n.add(t.item(r)) : i = !0;
                n.select(), c(this)
            } else H(this, e)
        } : function(e) {
            H(this, e)
        };
        var F;
        !T && E && e.features.implementsDomRange ? (F = function(e) {
            var t = !1;
            return e.anchorNode && (t = 1 == v.comparePoints(e.anchorNode, e.anchorOffset, e.focusNode, e.focusOffset)), t
        }, O.isBackwards = function() {
            return F(this)
        }) : F = O.isBackwards = function() {
            return !1
        }, O.toString = function() {
            for (var e = [], t = 0, n = this.rangeCount; n > t; ++t) e[t] = "" + this._ranges[t];
            return e.join("")
        }, O.collapse = function(t, n) {
            f(this, t);
            var o = e.createRange(v.getDocument(t));
            o.collapseToPoint(t, n), this.removeAllRanges(), this.addRange(o), this.isCollapsed = !0
        }, O.collapseToStart = function() {
            if (!this.rangeCount) throw new _("INVALID_STATE_ERR");
            var e = this._ranges[0];
            this.collapse(e.startContainer, e.startOffset)
        }, O.collapseToEnd = function() {
            if (!this.rangeCount) throw new _("INVALID_STATE_ERR");
            var e = this._ranges[this.rangeCount - 1];
            this.collapse(e.endContainer, e.endOffset)
        }, O.selectAllChildren = function(t) {
            f(this, t);
            var n = e.createRange(v.getDocument(t));
            n.selectNodeContents(t), this.removeAllRanges(), this.addRange(n)
        }, O.deleteFromDocument = function() {
            if (j && k && "Control" == this.docSelection.type) {
                for (var e, t = this.docSelection.createRange(); t.length;) e = t.item(0), t.remove(e), e.parentNode.removeChild(e);
                this.refresh()
            } else if (this.rangeCount) {
                t = this.getAllRanges(), this.removeAllRanges(), e = 0;
                for (var n = t.length; n > e; ++e) t[e].deleteContents();
                this.addRange(t[n - 1])
            }
        }, O.getAllRanges = function() {
            return this._ranges.slice(0)
        }, O.setSingleRange = function(e) {
            this.setRanges([e])
        }, O.containsNode = function(e, t) {
            for (var n = 0, o = this._ranges.length; o > n; ++n)
                if (this._ranges[n].containsNode(e, t)) return !0;
            return !1
        }, O.toHtml = function() {
            var e = "";
            if (this.rangeCount) {
                e = w.getRangeDocument(this._ranges[0]).createElement("div");
                for (var t = 0, n = this._ranges.length; n > t; ++t) e.appendChild(this._ranges[t].cloneContents());
                e = e.innerHTML
            }
            return e
        }, O.getName = function() {
            return "WrappedSelection"
        }, O.inspect = function() {
            return h(this)
        }, O.detach = function() {
            this.win = this.anchorNode = this.focusNode = this.win._rangySelection = null
        }, u.inspect = h, e.Selection = u, e.selectionPrototype = O, e.addCreateMissingNativeApiListener(function(t) {
            "undefined" == typeof t.getSelection && (t.getSelection = function() {
                return e.getSelection(this)
            }), t = null
        })
    }), rangy.createModule("CssClassApplier", function(e, t) {
        function n(e, t) {
            return e.className && RegExp("(?:^|\\s)" + t + "(?:\\s|$)").test(e.className)
        }

        function o(e, t) {
            e.className ? n(e, t) || (e.className += " " + t) : e.className = t
        }

        function i(e) {
            return e.split(/\s+/).sort().join(" ")
        }

        function r(e, t) {
            return i(e.className) == i(t.className)
        }

        function s(e) {
            for (var t = e.parentNode; e.hasChildNodes();) t.insertBefore(e.firstChild, e);
            t.removeChild(e)
        }

        function a(e, t) {
            var n = e.cloneRange();
            n.selectNodeContents(t);
            var o = n.intersection(e);
            return o = o ? o.toString() : "", n.detach(), "" != o
        }

        function l(e) {
            return e.getNodes([3], function(t) {
                return a(e, t)
            })
        }

        function c(e, t) {
            if (e.attributes.length != t.attributes.length) return !1;
            for (var n, o, i = 0, r = e.attributes.length; r > i; ++i)
                if (n = e.attributes[i], o = n.name, "class" != o) {
                    if (o = t.attributes.getNamedItem(o), n.specified != o.specified) return !1;
                    if (n.specified && n.nodeValue !== o.nodeValue) return !1
                }
            return !0
        }

        function d(e, t) {
            for (var n, o = 0, i = e.attributes.length; i > o; ++o)
                if (n = e.attributes[o].name, (!t || !b.arrayContains(t, n)) && e.attributes[o].specified && "class" != n) return !0;
            return !1
        }

        function u(e) {
            var t;
            return e && 1 == e.nodeType && ((t = e.parentNode) && 9 == t.nodeType && "on" == t.designMode || x(e) && !x(e.parentNode))
        }

        function p(e) {
            return (x(e) || 1 != e.nodeType && x(e.parentNode)) && !u(e)
        }

        function f(e) {
            return e && 1 == e.nodeType && !C.test(w(e, "display"))
        }

        function h(e) {
            if (0 == e.data.length) return !0;
            if (k.test(e.data)) return !1;
            switch (w(e.parentNode, "whiteSpace")) {
                case "pre":
                case "pre-wrap":
                case "-moz-pre-wrap":
                    return !1;
                case "pre-line":
                    if (/[\r\n]/.test(e.data)) return !1
            }
            return f(e.previousSibling) || f(e.nextSibling)
        }

        function m(e, n, o, i) {
            var r, s = 0 == o;
            if (b.isAncestorOf(n, e)) return e;
            if (b.isCharacterDataNode(n))
                if (0 == o) o = b.getNodeIndex(n), n = n.parentNode;
                else {
                    if (o != n.length) throw t.createError("splitNodeAt should not be called with offset in the middle of a data node (" + o + " in " + n.data);
                    o = b.getNodeIndex(n) + 1, n = n.parentNode
                }
            var a;
            a = n;
            var l = o;
            if (a = b.isCharacterDataNode(a) ? 0 == l ? !!a.previousSibling : l == a.length ? !!a.nextSibling : !0 : l > 0 && l < a.childNodes.length) {
                if (!r) {
                    for (r = n.cloneNode(!1), r.id && r.removeAttribute("id"); s = n.childNodes[o];) r.appendChild(s);
                    b.insertAfter(r, n)
                }
                return n == e ? r : m(e, r.parentNode, b.getNodeIndex(r), i)
            }
            return e != n ? (r = n.parentNode, n = b.getNodeIndex(n), s || n++, m(e, r, n, i)) : e
        }

        function g(e) {
            var t = e ? "nextSibling" : "previousSibling";
            return function(n, o) {
                var i = n.parentNode,
                    s = n[t];
                if (s) {
                    if (s && 3 == s.nodeType) return s
                } else if (o && (s = i[t]) && 1 == s.nodeType && i.tagName == s.tagName && r(i, s) && c(i, s)) return s[e ? "firstChild" : "lastChild"];
                return null
            }
        }

        function v(e) {
            this.firstTextNode = (this.isElementMerge = 1 == e.nodeType) ? e.lastChild : e, this.textNodes = [this.firstTextNode]
        }

        function y(e, t, n) {
            this.cssClass = e;
            var o, r, s = null;
            if ("object" == typeof t && null !== t) {
                for (n = t.tagNames, s = t.elementProperties, o = 0; r = $[o++];) t.hasOwnProperty(r) && (this[r] = t[r]);
                o = t.normalize
            } else o = t;
            this.normalize = "undefined" == typeof o ? !0 : o, this.attrExceptions = [], o = document.createElement(this.elementTagName), this.elementProperties = {};
            for (var a in s) s.hasOwnProperty(a) && (E.hasOwnProperty(a) && (a = E[a]), o[a] = s[a], this.elementProperties[a] = o[a], this.attrExceptions.push(a));
            if (this.elementSortedClassName = this.elementProperties.hasOwnProperty("className") ? i(this.elementProperties.className + " " + e) : e, this.applyToAnyTagName = !1, e = typeof n, "string" == e) "*" == n ? this.applyToAnyTagName = !0 : this.tagNames = n.toLowerCase().replace(/^\s\s*/, "").replace(/\s\s*$/, "").split(/\s*,\s*/);
            else if ("object" == e && "number" == typeof n.length)
                for (this.tagNames = [], o = 0, e = n.length; e > o; ++o) "*" == n[o] ? this.applyToAnyTagName = !0 : this.tagNames.push(n[o].toLowerCase());
            else this.tagNames = [this.elementTagName]
        }
        e.requireModules(["WrappedSelection", "WrappedRange"]);
        var w, b = e.dom,
            _ = function() {
                function e(e, t, n) {
                    return t && n ? " " : ""
                }
                return function(t, n) {
                    t.className && (t.className = t.className.replace(RegExp("(?:^|\\s)" + n + "(?:\\s|$)"), e))
                }
            }();
        "undefined" != typeof window.getComputedStyle ? w = function(e, t) {
            return b.getWindow(e).getComputedStyle(e, null)[t]
        } : "undefined" != typeof document.documentElement.currentStyle ? w = function(e, t) {
            return e.currentStyle[t]
        } : t.fail("No means of obtaining computed style properties found");
        var x;
        ! function() {
            x = "boolean" == typeof document.createElement("div").isContentEditable ? function(e) {
                return e && 1 == e.nodeType && e.isContentEditable
            } : function(e) {
                return e && 1 == e.nodeType && "false" != e.contentEditable ? "true" == e.contentEditable || x(e.parentNode) : !1
            }
        }();
        var C = /^inline(-block|-table)?$/i,
            k = /[^\r\n\t\f \u200B]/,
            T = g(!1),
            S = g(!0);
        v.prototype = {
            doMerge: function() {
                for (var e, t, n = [], o = 0, i = this.textNodes.length; i > o; ++o) e = this.textNodes[o], t = e.parentNode, n[o] = e.data, o && (t.removeChild(e), t.hasChildNodes() || t.parentNode.removeChild(t));
                return this.firstTextNode.data = n = n.join("")
            },
            getLength: function() {
                for (var e = this.textNodes.length, t = 0; e--;) t += this.textNodes[e].length;
                return t
            },
            toString: function() {
                for (var e = [], t = 0, n = this.textNodes.length; n > t; ++t) e[t] = "'" + this.textNodes[t].data + "'";
                return "[Merge(" + e.join(",") + ")]"
            }
        };
        var $ = ["elementTagName", "ignoreWhiteSpace", "applyToEditableOnly"],
            E = {
                "class": "className"
            };
        y.prototype = {
            elementTagName: "span",
            elementProperties: {},
            ignoreWhiteSpace: !0,
            applyToEditableOnly: !1,
            hasClass: function(e) {
                return 1 == e.nodeType && b.arrayContains(this.tagNames, e.tagName.toLowerCase()) && n(e, this.cssClass)
            },
            getSelfOrAncestorWithClass: function(e) {
                for (; e;) {
                    if (this.hasClass(e, this.cssClass)) return e;
                    e = e.parentNode
                }
                return null
            },
            isModifiable: function(e) {
                return !this.applyToEditableOnly || p(e)
            },
            isIgnorableWhiteSpaceNode: function(e) {
                return this.ignoreWhiteSpace && e && 3 == e.nodeType && h(e)
            },
            postApply: function(e, t, n) {
                for (var o, i, r, s = e[0], a = e[e.length - 1], l = [], c = s, d = a, u = 0, p = a.length, f = 0, h = e.length; h > f; ++f) i = e[f], (r = T(i, !n)) ? (o || (o = new v(r), l.push(o)), o.textNodes.push(i), i === s && (c = o.firstTextNode, u = c.length), i === a && (d = o.firstTextNode, p = o.getLength())) : o = null;
                if ((e = S(a, !n)) && (o || (o = new v(a), l.push(o)), o.textNodes.push(e)), l.length) {
                    for (f = 0, h = l.length; h > f; ++f) l[f].doMerge();
                    t.setStart(c, u), t.setEnd(d, p)
                }
            },
            createContainer: function(t) {
                return t = t.createElement(this.elementTagName), e.util.extend(t, this.elementProperties), o(t, this.cssClass), t
            },
            applyToTextNode: function(e) {
                var t = e.parentNode;
                1 == t.childNodes.length && b.arrayContains(this.tagNames, t.tagName.toLowerCase()) ? o(t, this.cssClass) : (t = this.createContainer(b.getDocument(e)), e.parentNode.insertBefore(t, e), t.appendChild(e))
            },
            isRemovable: function(e) {
                var t;
                if (t = e.tagName.toLowerCase() == this.elementTagName) {
                    if (t = i(e.className) == this.elementSortedClassName) {
                        var n;
                        e: {
                            t = this.elementProperties;
                            for (n in t)
                                if (t.hasOwnProperty(n) && e[n] !== t[n]) {
                                    n = !1;
                                    break e
                                }
                            n = !0
                        }
                        t = n && !d(e, this.attrExceptions) && this.isModifiable(e)
                    }
                    t = t
                }
                return t
            },
            undoToTextNode: function(e, t, n) {
                t.containsNode(n) || (e = t.cloneRange(), e.selectNode(n), e.isPointInRange(t.endContainer, t.endOffset) && (m(n, t.endContainer, t.endOffset, [t]), t.setEndAfter(n)), e.isPointInRange(t.startContainer, t.startOffset) && (n = m(n, t.startContainer, t.startOffset, [t]))), this.isRemovable(n) ? s(n) : _(n, this.cssClass)
            },
            applyToRange: function(e) {
                e.splitBoundaries();
                var t = l(e);
                if (t.length) {
                    for (var n, o = 0, i = t.length; i > o; ++o) n = t[o], !this.isIgnorableWhiteSpaceNode(n) && !this.getSelfOrAncestorWithClass(n) && this.isModifiable(n) && this.applyToTextNode(n);
                    e.setStart(t[0], 0), n = t[t.length - 1], e.setEnd(n, n.length), this.normalize && this.postApply(t, e, !1)
                }
            },
            applyToSelection: function(t) {
                t = t || window, t = e.getSelection(t);
                var n, o = t.getAllRanges();
                t.removeAllRanges();
                for (var i = o.length; i--;) n = o[i], this.applyToRange(n), t.addRange(n)
            },
            undoToRange: function(e) {
                e.splitBoundaries();
                var t, n, o = l(e),
                    i = o[o.length - 1];
                if (o.length) {
                    for (var r = 0, s = o.length; s > r; ++r) t = o[r], (n = this.getSelfOrAncestorWithClass(t)) && this.isModifiable(t) && this.undoToTextNode(t, e, n), e.setStart(o[0], 0), e.setEnd(i, i.length);
                    this.normalize && this.postApply(o, e, !0)
                }
            },
            undoToSelection: function(t) {
                t = t || window, t = e.getSelection(t);
                var n, o = t.getAllRanges();
                t.removeAllRanges();
                for (var i = 0, r = o.length; r > i; ++i) n = o[i], this.undoToRange(n), t.addRange(n)
            },
            getTextSelectedByRange: function(e, t) {
                var n = t.cloneRange();
                n.selectNodeContents(e);
                var o = n.intersection(t);
                return o = o ? o.toString() : "", n.detach(), o
            },
            isAppliedToRange: function(e) {
                if (e.collapsed) return !!this.getSelfOrAncestorWithClass(e.commonAncestorContainer);
                for (var t, n = e.getNodes([3]), o = 0; t = n[o++];)
                    if (!this.isIgnorableWhiteSpaceNode(t) && a(e, t) && this.isModifiable(t) && !this.getSelfOrAncestorWithClass(t)) return !1;
                return !0
            },
            isAppliedToSelection: function(t) {
                t = t || window, t = e.getSelection(t).getAllRanges();
                for (var n = t.length; n--;)
                    if (!this.isAppliedToRange(t[n])) return !1;
                return !0
            },
            toggleRange: function(e) {
                this.isAppliedToRange(e) ? this.undoToRange(e) : this.applyToRange(e)
            },
            toggleSelection: function(e) {
                this.isAppliedToSelection(e) ? this.undoToSelection(e) : this.applyToSelection(e)
            },
            detach: function() {}
        }, y.util = {
            hasClass: n,
            addClass: o,
            removeClass: _,
            hasSameClasses: r,
            replaceWithOwnChildren: s,
            elementsHaveSameNonClassAttributes: c,
            elementHasNonClassAttributes: d,
            splitNodeAt: m,
            isEditableElement: x,
            isEditingHost: u,
            isEditable: p
        }, e.CssClassApplier = y, e.createCssClassApplier = function(e, t, n) {
            return new y(e, t, n)
        }
    }), rangy.createModule("SaveRestore", function(e, t) {
        function n(e, t) {
            var n, o = "selectionBoundary_" + +new Date + "_" + ("" + Math.random()).slice(2),
                i = s.getDocument(e.startContainer),
                r = e.cloneRange();
            return r.collapse(t), n = i.createElement("span"), n.id = o, n.style.lineHeight = "0", n.style.display = "none", n.className = "rangySelectionBoundary", n.appendChild(i.createTextNode(a)), r.insertNode(n), r.detach(), n
        }

        function o(e, n, o, i) {
            (e = (e || document).getElementById(o)) ? (n[i ? "setStartBefore" : "setEndBefore"](e), e.parentNode.removeChild(e)) : t.warn("Marker element has been removed. Cannot restore selection.")
        }

        function i(e, t) {
            return t.compareBoundaryPoints(e.START_TO_START, e)
        }

        function r(e, t) {
            var n = (e || document).getElementById(t);
            n && n.parentNode.removeChild(n)
        }
        e.requireModules(["DomUtil", "DomRange", "WrappedRange"]);
        var s = e.dom,
            a = "\ufeff";
        e.saveSelection = function(o) {
            o = o || window;
            var r = o.document;
            if (e.isSelectionValid(o)) {
                var s, a, l = e.getSelection(o),
                    c = l.getAllRanges(),
                    d = [];
                c.sort(i);
                for (var u = 0, p = c.length; p > u; ++u) s = c[u], s.collapsed ? (a = n(s, !1), d.push({
                    markerId: a.id,
                    collapsed: !0
                })) : (a = n(s, !1), s = n(s, !0), d[u] = {
                    startMarkerId: s.id,
                    endMarkerId: a.id,
                    collapsed: !1,
                    backwards: 1 == c.length && l.isBackwards()
                });
                for (u = p - 1; u >= 0; --u) s = c[u], s.collapsed ? s.collapseBefore((r || document).getElementById(d[u].markerId)) : (s.setEndBefore((r || document).getElementById(d[u].endMarkerId)), s.setStartAfter((r || document).getElementById(d[u].startMarkerId)));
                return l.setRanges(c), {
                    win: o,
                    doc: r,
                    rangeInfos: d,
                    restored: !1
                }
            }
            t.warn("Cannot save selection. This usually happens when the selection is collapsed and the selection document has lost focus.")
        }, e.restoreSelection = function(n, i) {
            if (!n.restored) {
                for (var r, s, a = n.rangeInfos, l = e.getSelection(n.win), c = [], d = a.length, u = d - 1; u >= 0; --u) {
                    if (r = a[u], s = e.createRange(n.doc), r.collapsed)
                        if (r = (n.doc || document).getElementById(r.markerId)) {
                            r.style.display = "inline";
                            var p = r.previousSibling;
                            p && 3 == p.nodeType ? (r.parentNode.removeChild(r), s.collapseToPoint(p, p.length)) : (s.collapseBefore(r), r.parentNode.removeChild(r))
                        } else t.warn("Marker element has been removed. Cannot restore selection.");
                    else o(n.doc, s, r.startMarkerId, !0), o(n.doc, s, r.endMarkerId, !1);
                    1 == d && s.normalizeBoundaries(), c[u] = s
                }
                1 == d && i && e.features.selectionHasExtend && a[0].backwards ? (l.removeAllRanges(), l.addRange(c[0], !0)) : l.setRanges(c), n.restored = !0
            }
        }, e.removeMarkerElement = r, e.removeMarkers = function(e) {
            for (var t, n = e.rangeInfos, o = 0, i = n.length; i > o; ++o) t = n[o], t.collapsed ? r(e.doc, t.markerId) : (r(e.doc, t.startMarkerId), r(e.doc, t.endMarkerId))
        }
    }), rangy.createModule("Serializer", function(e, t) {
        function n(e, t) {
            t = t || [];
            var o = e.nodeType,
                i = e.childNodes,
                r = i.length,
                s = [o, e.nodeName, r].join(":"),
                a = "",
                l = "";
            switch (o) {
                case 3:
                    a = e.nodeValue.replace(/</g, "&lt;").replace(/>/g, "&gt;");
                    break;
                case 8:
                    a = "<!--" + e.nodeValue.replace(/</g, "&lt;").replace(/>/g, "&gt;") + "-->";
                    break;
                default:
                    a = "<" + s + ">", l = "</>"
            }
            for (a && t.push(a), o = 0; r > o; ++o) n(i[o], t);
            return l && t.push(l), t
        }

        function o(e) {
            return e = n(e).join(""), u(e).toString(16)
        }

        function i(e, t, n) {
            var o = [],
                i = e;
            for (n = n || p.getDocument(e).documentElement; i && i != n;) o.push(p.getNodeIndex(i, !0)), i = i.parentNode;
            return o.join("/") + ":" + t
        }

        function r(e, n, o) {
            n ? o || p.getDocument(n) : (o = o || document, n = o.documentElement), e = e.split(":"), n = n, o = e[0] ? e[0].split("/") : [];
            for (var i, r = o.length; r--;) {
                if (i = parseInt(o[r], 10), !(i < n.childNodes.length)) throw t.createError("deserializePosition failed: node " + p.inspectNode(n) + " has no child with index " + i + ", " + r);
                n = n.childNodes[parseInt(o[r], 10)]
            }
            return new p.DomPosition(n, parseInt(e[1], 10))
        }

        function s(t, n, r) {
            if (r = r || e.DomRange.getRangeDocument(t).documentElement, !p.isAncestorOf(r, t.commonAncestorContainer, !0)) throw Error("serializeRange: range is not wholly contained within specified root node");
            return t = i(t.startContainer, t.startOffset, r) + "," + i(t.endContainer, t.endOffset, r), n || (t += "{" + o(r) + "}"), t
        }

        function a(t, n, i) {
            n ? i = i || p.getDocument(n) : (i = i || document, n = i.documentElement), t = /^([^,]+),([^,\{]+)({([^}]+)})?$/.exec(t);
            var s = t[4],
                a = o(n);
            if (s && s !== o(n)) throw Error("deserializeRange: checksums of serialized range root node (" + s + ") and target root node (" + a + ") do not match");
            return s = r(t[1], n, i), n = r(t[2], n, i), i = e.createRange(i), i.setStart(s.node, s.offset), i.setEnd(n.node, n.offset), i
        }

        function l(e, t, n) {
            return t ? n || p.getDocument(t) : (n = n || document, t = n.documentElement), e = /^([^,]+),([^,]+)({([^}]+)})?$/.exec(e)[3], !e || e === o(t)
        }

        function c(t, n, o) {
            t = t || e.getSelection(), t = t.getAllRanges();
            for (var i = [], r = 0, a = t.length; a > r; ++r) i[r] = s(t[r], n, o);
            return i.join("|")
        }

        function d(t, n, o) {
            n ? o = o || p.getWindow(n) : (o = o || window, n = o.document.documentElement), t = t.split("|");
            for (var i = e.getSelection(o), r = [], s = 0, l = t.length; l > s; ++s) r[s] = a(t[s], n, o.document);
            return i.setRanges(r), i
        }
        e.requireModules(["WrappedSelection", "WrappedRange"]), ("undefined" == typeof encodeURIComponent || "undefined" == typeof decodeURIComponent) && t.fail("Global object is missing encodeURIComponent and/or decodeURIComponent method");
        var u = function() {
                var e = null;
                return function(t) {
                    for (var n, o = [], i = 0, r = t.length; r > i; ++i) n = t.charCodeAt(i), 128 > n ? o.push(n) : 2048 > n ? o.push(n >> 6 | 192, 63 & n | 128) : o.push(n >> 12 | 224, n >> 6 & 63 | 128, 63 & n | 128);
                    if (t = -1, !e) {
                        i = [], r = 0;
                        for (var s; 256 > r; ++r) {
                            for (s = r, n = 8; n--;) 1 == (1 & s) ? s = s >>> 1 ^ 3988292384 : s >>>= 1;
                            i[r] = s >>> 0
                        }
                        e = i
                    }
                    for (i = e, r = 0, n = o.length; n > r; ++r) s = 255 & (t ^ o[r]), t = t >>> 8 ^ i[s];
                    return (-1 ^ t) >>> 0
                }
            }(),
            p = e.dom;
        e.serializePosition = i, e.deserializePosition = r, e.serializeRange = s, e.deserializeRange = a, e.canDeserializeRange = l, e.serializeSelection = c, e.deserializeSelection = d, e.canDeserializeSelection = function(e, t, n) {
            var o;
            t ? o = n ? n.document : p.getDocument(t) : (n = n || window, t = n.document.documentElement), e = e.split("|"), n = 0;
            for (var i = e.length; i > n; ++n)
                if (!l(e[n], t, o)) return !1;
            return !0
        }, e.restoreSelectionFromCookie = function(e) {
            e = e || window;
            var t;
            e: {
                t = e.document.cookie.split(/[;,]/);
                for (var n, o = 0, i = t.length; i > o; ++o)
                    if (n = t[o].split("="), "rangySerializedSelection" == n[0].replace(/^\s+/, "") && (n = n[1])) {
                        t = decodeURIComponent(n.replace(/\s+$/, ""));
                        break e
                    }
                t = null
            }
            t && d(t, e.doc)
        }, e.saveSelectionCookie = function(t, n) {
            t = t || window, n = "object" == typeof n ? n : {};
            var o = n.expires ? ";expires=" + n.expires.toUTCString() : "",
                i = n.path ? ";path=" + n.path : "",
                r = n.domain ? ";domain=" + n.domain : "",
                s = n.secure ? ";secure" : "",
                a = c(e.getSelection(t));
            t.document.cookie = encodeURIComponent("rangySerializedSelection") + "=" + encodeURIComponent(a) + o + i + r + s
        }, e.getElementChecksum = o
    }),
    function(e, t) {
        "use strict";
        "function" == typeof define && define.amd ? define(function() {
            return t(e, e.document)
        }) : "undefined" != typeof module && module.exports ? module.exports = t(e, e.document) : e.Notify = t(e, e.document)
    }("undefined" != typeof window ? window : this, function(e, t) {
        "use strict";

        function n(e) {
            return "function" == typeof e
        }

        function o(e, t) {
            if ("string" != typeof e) throw new Error("Notify(): first arg (title) must be a string.");
            if (this.title = e, this.options = {
                    icon: "",
                    body: "",
                    tag: "",
                    lang: "en",
                    notifyShow: null,
                    notifyClose: null,
                    notifyClick: null,
                    notifyError: null,
                    timeout: null
                }, this.permission = null, "object" == typeof t) {
                for (var o in t) t.hasOwnProperty(o) && (this.options[o] = t[o]);
                n(this.options.notifyShow) && (this.onShowCallback = this.options.notifyShow), n(this.options.notifyClose) && (this.onCloseCallback = this.options.notifyClose), n(this.options.notifyClick) && (this.onClickCallback = this.options.notifyClick), n(this.options.notifyError) && (this.onErrorCallback = this.options.notifyError)
            }
        }
        var i = e.Notification;
        return o.isSupported = function(e) {
            if (!i || !i.requestPermission) return !1;
            if ("granted" === e || "granted" === i.permission) throw new Error("You must only call this before calling Notification.requestPermission(), otherwise this feature detect would trigger an actual notification!");
            try {
                new i("")
            } catch (t) {
                if ("TypeError" === t.name) return !1
            }
            return !0
        }, o.needsPermission = i && i.permission && "granted" === i.permission ? !1 : !0, o.requestPermission = function(e, t) {
            i.requestPermission(function(i) {
                switch (i) {
                    case "granted":
                        o.needsPermission = !1, n(e) && e();
                        break;
                    case "denied":
                        o.needsPermission = !0, n(t) && t()
                }
            })
        }, o.prototype.show = function() {
            this.myNotify = new i(this.title, {
                body: this.options.body,
                tag: this.options.tag,
                icon: this.options.icon,
                lang: this.options.lang
            }), this.options.timeout && !isNaN(this.options.timeout) && setTimeout(this.close.bind(this), 1e3 * this.options.timeout), this.myNotify.addEventListener("show", this, !1), this.myNotify.addEventListener("error", this, !1), this.myNotify.addEventListener("close", this, !1), this.myNotify.addEventListener("click", this, !1)
        }, o.prototype.onShowNotification = function(e) {
            this.onShowCallback && this.onShowCallback(e)
        }, o.prototype.onCloseNotification = function(e) {
            this.onCloseCallback && this.onCloseCallback(e), this.destroy()
        }, o.prototype.onClickNotification = function(e) {
            this.onClickCallback && this.onClickCallback(e)
        }, o.prototype.onErrorNotification = function(e) {
            this.onErrorCallback && this.onErrorCallback(e), this.destroy()
        }, o.prototype.destroy = function() {
            this.myNotify.removeEventListener("show", this, !1), this.myNotify.removeEventListener("error", this, !1), this.myNotify.removeEventListener("close", this, !1), this.myNotify.removeEventListener("click", this, !1)
        }, o.prototype.close = function() {
            this.myNotify.close()
        }, o.prototype.handleEvent = function(e) {
            switch (e.type) {
                case "show":
                    this.onShowNotification(e);
                    break;
                case "close":
                    this.onCloseNotification(e);
                    break;
                case "click":
                    this.onClickNotification(e);
                    break;
                case "error":
                    this.onErrorNotification(e)
            }
        }, o
    }), rangy.createModule("SaveRestore", function(e, t) {
        function n(e, t) {
            return (t || document).getElementById(e)
        }

        function o(e, t) {
            var n, o = "selectionBoundary_" + +new Date + "_" + ("" + Math.random()).slice(2),
                i = d.getDocument(e.startContainer),
                r = e.cloneRange();
            return r.collapse(t), n = i.createElement("span"), n.id = o, n.style.lineHeight = "0", n.style.display = "none", n.className = "rangySelectionBoundary", n.appendChild(i.createTextNode(u)), r.insertNode(n), r.detach(), n
        }

        function i(e, o, i, r) {
            var s = n(i, e);
            s ? (o[r ? "setStartBefore" : "setEndBefore"](s), s.parentNode.removeChild(s)) : t.warn("Marker element has been removed. Cannot restore selection.")
        }

        function r(e, t) {
            return t.compareBoundaryPoints(e.START_TO_START, e)
        }

        function s(i) {
            i = i || window;
            var s = i.document;
            if (!e.isSelectionValid(i)) return void t.warn("Cannot save selection. This usually happens when the selection is collapsed and the selection document has lost focus.");
            var a, l, c, d = e.getSelection(i),
                u = d.getAllRanges(),
                p = [];
            u.sort(r);
            for (var f = 0, h = u.length; h > f; ++f) c = u[f], c.collapsed ? (l = o(c, !1), p.push({
                markerId: l.id,
                collapsed: !0
            })) : (l = o(c, !1), a = o(c, !0), p[f] = {
                startMarkerId: a.id,
                endMarkerId: l.id,
                collapsed: !1,
                backwards: 1 == u.length && d.isBackwards()
            });
            for (f = h - 1; f >= 0; --f) c = u[f], c.collapsed ? c.collapseBefore(n(p[f].markerId, s)) : (c.setEndBefore(n(p[f].endMarkerId, s)), c.setStartAfter(n(p[f].startMarkerId, s)));
            return d.setRanges(u), {
                win: i,
                doc: s,
                rangeInfos: p,
                restored: !1
            }
        }

        function a(o, r) {
            if (!o.restored) {
                for (var s, a, l = o.rangeInfos, c = e.getSelection(o.win), d = [], u = l.length, p = u - 1; p >= 0; --p) {
                    if (s = l[p], a = e.createRange(o.doc), s.collapsed) {
                        var f = n(s.markerId, o.doc);
                        if (f) {
                            f.style.display = "inline";
                            var h = f.previousSibling;
                            h && 3 == h.nodeType ? (f.parentNode.removeChild(f), a.collapseToPoint(h, h.length)) : (a.collapseBefore(f), f.parentNode.removeChild(f))
                        } else t.warn("Marker element has been removed. Cannot restore selection.")
                    } else i(o.doc, a, s.startMarkerId, !0), i(o.doc, a, s.endMarkerId, !1);
                    1 == u && a.normalizeBoundaries(), d[p] = a
                }
                1 == u && r && e.features.selectionHasExtend && l[0].backwards ? (c.removeAllRanges(), c.addRange(d[0], !0)) : c.setRanges(d), o.restored = !0
            }
        }

        function l(e, t) {
            var o = n(t, e);
            o && o.parentNode.removeChild(o)
        }

        function c(e) {
            for (var t, n = e.rangeInfos, o = 0, i = n.length; i > o; ++o) t = n[o], t.collapsed ? l(e.doc, t.markerId) : (l(e.doc, t.startMarkerId), l(e.doc, t.endMarkerId))
        }
        e.requireModules(["DomUtil", "DomRange", "WrappedRange"]);
        var d = e.dom,
            u = "\ufeff";
        e.saveSelection = s, e.restoreSelection = a, e.removeMarkerElement = l, e.removeMarkers = c
    }), ! function(e, t) {
        var n = function(e, t, n) {
            var o;
            return function() {
                function i() {
                    n || e.apply(r, s), o = null
                }
                var r = this,
                    s = arguments;
                o ? clearTimeout(o) : n && e.apply(r, s), o = setTimeout(i, t || 100)
            }
        };
        jQuery.fn[t] = function(e) {
            return e ? this.bind("resize", n(e)) : this.trigger(t)
        }
    }(jQuery, "smartresize");
var customTransitionEnd = whichTransitionEvent();
! function(e) {
    var t = 0;
    e.fn.fluidbox = function(n) {
        var o = e.extend(!0, {
                viewportFill: .95,
                debounceResize: !0,
                stackIndex: 1e3,
                stackIndexDelta: 10,
                closeTrigger: [{
                    selector: ".fluidbox-overlay",
                    event: "click"
                }, {
                    selector: "document",
                    event: "keyup",
                    keyCode: 27
                }],
                immediateOpen: !1,
                loadingEle: !0
            }, n),
            i = ["keyup", "keydown", "keypress"];
        o.stackIndex < o.stackIndexDelta && (o.stackIndexDelta = o.stackIndex), $fbOverlay = e("<div />", {
            "class": "fluidbox-overlay",
            css: {
                "z-index": o.stackIndex
            }
        });
        var r, s = this,
            a = e(window),
            l = function(t) {
                e(t + ".fluidbox-opened").trigger("click")
            },
            c = function(t, n) {
                var i = t.find("img").first(),
                    s = t.find(".fluidbox-ghost"),
                    l = t.find(".fluidbox-loader"),
                    c = t.find(".fluidbox-wrap"),
                    d = t.data(),
                    u = 0,
                    p = 0;
                i.data().imgRatio = d.natWidth / d.natHeight, r > i.data().imgRatio ? (u = d.natHeight < a.height() * o.viewportFill ? d.natHeight : a.height() * o.viewportFill, d.imgScale = u / i.height(), d.imgScaleY = d.imgScale, d.imgScaleX = d.natWidth * (i.height() * d.imgScaleY / d.natHeight) / i.width()) : (p = d.natWidth < a.width() * o.viewportFill ? d.natWidth : a.width() * o.viewportFill, d.imgScale = p / i.width(), d.imgScaleX = d.imgScale, d.imgScaleY = d.natHeight * (i.width() * d.imgScaleX / d.natWidth) / i.height());
                var f = a.scrollTop() - i.offset().top + .5 * i.data("imgHeight") * (i.data("imgScale") - 1) + .5 * (a.height() - i.data("imgHeight") * i.data("imgScale")),
                    h = .5 * i.data("imgWidth") * (i.data("imgScale") - 1) + .5 * (a.width() - i.data("imgWidth") * i.data("imgScale")) - i.offset().left,
                    m = parseInt(1e3 * d.imgScaleX) / 1e3 + "," + parseInt(1e3 * d.imgScaleY) / 1e3;
                s.add(l).css({
                    transform: "translate(" + parseInt(10 * h) / 10 + "px," + parseInt(10 * f) / 10 + "px) scale(" + m + ")",
                    top: i.offset().top - c.offset().top,
                    left: i.offset().left - c.offset().left
                }), s.one(customTransitionEnd, function() {
                    e.each(n, function(e, n) {
                        t.trigger(n)
                    })
                })
            },
            d = function(e) {
                function t() {
                    c.imgWidth = n.width(), c.imgHeight = n.height(), c.imgRatio = n.width() / n.height(), i.add(s).css({
                        width: n.width(),
                        height: n.height(),
                        top: n.offset().top - l.offset().top + parseInt(n.css("borderTopWidth")) + parseInt(n.css("paddingTop")),
                        left: n.offset().left - l.offset().left + parseInt(n.css("borderLeftWidth")) + parseInt(n.css("paddingLeft"))
                    }), c.imgScale = r > c.imgRatio ? a.height() * o.viewportFill / n.height() : a.width() * o.viewportFill / n.width()
                }
                if (r = a.width() / a.height(), e.hasClass("fluidbox")) {
                    var n = e.find("img").first(),
                        i = e.find(".fluidbox-ghost"),
                        s = e.find(".fluidbox-loader"),
                        l = e.find(".fluidbox-wrap"),
                        c = n.data();
                    t(), n.load(t)
                }
            },
            u = function(t) {
                if (e(this).hasClass("fluidbox")) {
                    var n = e(this),
                        i = e(this).find("img").first(),
                        r = e(this).find(".fluidbox-ghost"),
                        s = e(this).find(".fluidbox-loader"),
                        a = e(this).find(".fluidbox-wrap"),
                        l = encodeURI(n.attr("href")),
                        d = {},
                        u = function() {
                            n.trigger("openstart"), n.append($fbOverlay).data("fluidbox-state", 1).removeClass("fluidbox-closed").addClass("fluidbox-opened"), d.close && window.clearTimeout(d.close), d.open = window.setTimeout(function() {
                                e(".fluidbox-overlay").css({
                                    opacity: 1
                                })
                            }, 10), e(".fluidbox-wrap").css({
                                zIndex: o.stackIndex - o.stackIndexDelta - 1
                            }), a.css({
                                "z-index": o.stackIndex + o.stackIndexDelta
                            })
                        },
                        p = function() {
                            n.trigger("closestart"), n.data("fluidbox-state", 0).removeClass("fluidbox-opened fluidbox-loaded fluidbox-loading").addClass("fluidbox-closed"), d.open && window.clearTimeout(d.open), d.close = window.setTimeout(function() {
                                e(".fluidbox-overlay").remove(), a.css({
                                    "z-index": o.stackIndex - o.stackIndexDelta
                                })
                            }, 10), e(".fluidbox-overlay").css({
                                opacity: 0
                            }), r.add(s).css({
                                transform: "translate(0,0) scale(1,1)",
                                opacity: 0,
                                top: i.offset().top - a.offset().top + parseInt(i.css("borderTopWidth")) + parseInt(i.css("paddingTop")),
                                left: i.offset().left - a.offset().left + parseInt(i.css("borderLeftWidth")) + parseInt(i.css("paddingLeft"))
                            }), r.one(customTransitionEnd, function() {
                                n.trigger("closeend")
                            }), i.css({
                                opacity: 1
                            })
                        };
                    0 !== e(this).data("fluidbox-state") && e(this).data("fluidbox-state") ? p() : (n.addClass("fluidbox-loading"), i.css({
                        opacity: 0
                    }), r.css({
                        "background-image": "url(" + i.attr("src") + ")",
                        opacity: 1
                    }), o.immediateOpen ? (n.data("natWidth", i[0].naturalWidth).data("natHeight", i[0].naturalHeight), u(), c(n, ["openend"]), e("<img />", {
                        src: l
                    }).load(function() {
                        n.trigger("imageloaddone").trigger("delayedloaddone").removeClass("fluidbox-loading").addClass("fluidbox-loaded").data("natWidth", e(this)[0].naturalWidth).data("natHeight", e(this)[0].naturalHeight), r.css({
                            "background-image": "url(" + l + ")"
                        }), c(n, ["delayedreposdone"])
                    }).error(function() {
                        n.trigger("imageloadfail"), p()
                    })) : e("<img />", {
                        src: l
                    }).load(function() {
                        n.trigger("imageloaddone").removeClass("fluidbox-loading").addClass("fluidbox-loaded").data("natWidth", e(this)[0].naturalWidth).data("natHeight", e(this)[0].naturalHeight), o.immediateOpen = !0, r.css({
                            "background-image": "url(" + l + ")"
                        }), u(), c(n, ["openend"])
                    }).error(function() {
                        n.trigger("imageloadfail"), p()
                    })), t.preventDefault()
                }
            },
            p = function(t) {
                t ? d(t) : s.each(function() {
                    d(e(this))
                });
                var n = e("a.fluidbox.fluidbox-opened");
                n.length > 0 && c(n, ["resizeend"])
            };
        return o.debounceResize ? e(window).smartresize(function() {
            p()
        }) : e(window).resize(function() {
            p()
        }), s.each(function() {
            if (e(this).is("a") && 1 === e(this).children().length && e(this).children().is("img") && "none" !== e(this).css("display") && "none" !== e(this).parents().css("display")) {
                var n = e("<div />", {
                        "class": "fluidbox-wrap",
                        css: {
                            "z-index": o.stackIndex - o.stackIndexDelta
                        }
                    }),
                    r = e("<div />", {
                        "class": "fluidbox-loader"
                    });
                t += 1;
                var s = e(this);
                s.addClass("fluidbox fluidbox-closed").attr("id", "fluidbox-" + t).wrapInner(n).find("img").first().css({
                    opacity: 1
                }).after('<div class="fluidbox-ghost" />').each(function() {
                    var t = e(this);
                    t.width() > 0 && t.height() > 0 ? (d(s), s.click(u)) : t.load(function() {
                        d(s), s.click(u), s.trigger("thumbloaddone")
                    }).error(function() {
                        s.trigger("thumbloadfail")
                    })
                }), o.loadingEle && s.find(".fluidbox-ghost").after(r), e(this).on("recompute", function() {
                    p(e(this)), e(this).trigger("recomputeend")
                });
                var c = "#fluidbox-" + t;
                o.closeTrigger && e.each(o.closeTrigger, function(t) {
                    var n = o.closeTrigger[t];
                    "window" != n.selector ? "document" == n.selector && (n.keyCode && i.indexOf(n.event) > -1 ? e(document).on(n.event, function(e) {
                        e.keyCode == n.keyCode && l(c)
                    }) : e(document).on(n.event, c, function() {
                        l(c)
                    })) : a.on(n.event, function() {
                        l(c)
                    })
                })
            }
        }), s
    }
}(jQuery),
function(e) {
    "use strict";
    e.fn.pin = function(t) {
        var n = 0,
            o = [],
            i = !1,
            r = e(window);
        t = t || {};
        var s = function() {
                for (var n = 0, s = o.length; s > n; n++) {
                    var a = o[n];
                    if (t.minWidth && r.width() <= t.minWidth) a.parent().is(".pin-wrapper") && a.unwrap(), a.css({
                        width: "",
                        left: "",
                        top: "",
                        position: ""
                    }), i = !0;
                    else {
                        i = !1;
                        var l = t.containerSelector ? a.closest(t.containerSelector) : e(document.body),
                            c = a.offset(),
                            d = l.offset(),
                            u = a.offsetParent().offset();
                        a.parent().is(".pin-wrapper") || a.wrap("<div class='pin-wrapper'>"), a.data("pin", {
                            from: t.containerSelector ? d.top : c.top,
                            to: d.top + l.height() - a.outerHeight(),
                            end: d.top + l.height(),
                            parentTop: u.top
                        }), a.css({
                            width: a.outerWidth()
                        }), a.parent().css("height", a.outerHeight())
                    }
                }
            },
            a = function() {
                if (!i) {
                    n = r.scrollTop();
                    for (var t = 0, s = o.length; s > t; t++) {
                        var a = e(o[t]),
                            l = a.data("pin"),
                            c = l.from,
                            d = l.to;
                        c + a.outerHeight() > l.end ? a.css("position", "") : n > c && d > n ? "fixed" != a.css("position") && a.css({
                            left: a.offset().left,
                            top: 0
                        }).css("position", "fixed") : n >= d ? a.css({
                            left: "auto",
                            top: d - l.parentTop
                        }).css("position", "absolute") : a.css({
                            position: "",
                            top: "",
                            left: ""
                        })
                    }
                }
            },
            l = function() {
                s(), a()
            };
        return this.each(function() {
            var t = e(this),
                n = e(this).data("pin") || {};
            n && n.update || (o.push(t), e("img", this).one("load", s), n.update = l, e(this).data("pin", n))
        }), r.scroll(a), r.resize(function() {
            s()
        }), s(), r.load(l), this
    }
}(jQuery),
function(e, t, n) {
    function o(n) {
        var o = t.console;
        r[n] || (r[n] = !0, e.migrateWarnings.push(n), o && o.warn && !e.migrateMute && (o.warn("JQMIGRATE: " + n), e.migrateTrace && o.trace && o.trace()))
    }

    function i(t, n, i, r) {
        if (Object.defineProperty) try {
            return void Object.defineProperty(t, n, {
                configurable: !0,
                enumerable: !0,
                get: function() {
                    return o(r), i
                },
                set: function(e) {
                    o(r), i = e
                }
            })
        } catch (s) {}
        e._definePropertyBroken = !0, t[n] = i
    }
    var r = {};
    e.migrateWarnings = [], !e.migrateMute && t.console && t.console.log && t.console.log("JQMIGRATE: Logging is active"), e.migrateTrace === n && (e.migrateTrace = !0), e.migrateReset = function() {
        r = {}, e.migrateWarnings.length = 0
    }, "BackCompat" === document.compatMode && o("jQuery is not compatible with Quirks Mode");
    var s = e("<input/>", {
            size: 1
        }).attr("size") && e.attrFn,
        a = e.attr,
        l = e.attrHooks.value && e.attrHooks.value.get || function() {
            return null
        },
        c = e.attrHooks.value && e.attrHooks.value.set || function() {
            return n
        },
        d = /^(?:input|button)$/i,
        u = /^[238]$/,
        p = /^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,
        f = /^(?:checked|selected)$/i;
    i(e, "attrFn", s || {}, "jQuery.attrFn is deprecated"), e.attr = function(t, i, r, l) {
        var c = i.toLowerCase(),
            h = t && t.nodeType;
        return l && (a.length < 4 && o("jQuery.fn.attr( props, pass ) is deprecated"), t && !u.test(h) && (s ? i in s : e.isFunction(e.fn[i]))) ? e(t)[i](r) : ("type" === i && r !== n && d.test(t.nodeName) && t.parentNode && o("Can't change the 'type' of an input or button in IE 6/7/8"), !e.attrHooks[c] && p.test(c) && (e.attrHooks[c] = {
            get: function(t, o) {
                var i, r = e.prop(t, o);
                return r === !0 || "boolean" != typeof r && (i = t.getAttributeNode(o)) && i.nodeValue !== !1 ? o.toLowerCase() : n
            },
            set: function(t, n, o) {
                var i;
                return n === !1 ? e.removeAttr(t, o) : (i = e.propFix[o] || o, i in t && (t[i] = !0), t.setAttribute(o, o.toLowerCase())), o
            }
        }, f.test(c) && o("jQuery.fn.attr('" + c + "') may use property instead of attribute")), a.call(e, t, i, r))
    }, e.attrHooks.value = {
        get: function(e, t) {
            var n = (e.nodeName || "").toLowerCase();
            return "button" === n ? l.apply(this, arguments) : ("input" !== n && "option" !== n && o("jQuery.fn.attr('value') no longer gets properties"), t in e ? e.value : null)
        },
        set: function(e, t) {
            var n = (e.nodeName || "").toLowerCase();
            return "button" === n ? c.apply(this, arguments) : ("input" !== n && "option" !== n && o("jQuery.fn.attr('value', val) no longer sets properties"), void(e.value = t))
        }
    };
    var h, m, g = e.fn.init,
        v = e.parseJSON,
        y = /^([^<]*)(<[\w\W]+>)([^>]*)$/;
    e.fn.init = function(t, n, i) {
        var r;
        return t && "string" == typeof t && !e.isPlainObject(n) && (r = y.exec(e.trim(t))) && r[0] && ("<" !== t.charAt(0) && o("$(html) HTML strings must start with '<' character"), r[3] && o("$(html) HTML text after last tag is ignored"), "#" === r[0].charAt(0) && (o("HTML string cannot start with a '#' character"), e.error("JQMIGRATE: Invalid selector string (XSS)")), n && n.context && (n = n.context), e.parseHTML) ? g.call(this, e.parseHTML(r[2], n, !0), n, i) : g.apply(this, arguments)
    }, e.fn.init.prototype = e.fn, e.parseJSON = function(e) {
        return e || null === e ? v.apply(this, arguments) : (o("jQuery.parseJSON requires a valid JSON string"), null)
    }, e.uaMatch = function(e) {
        e = e.toLowerCase();
        var t = /(chrome)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || e.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [];
        return {
            browser: t[1] || "",
            version: t[2] || "0"
        }
    }, e.browser || (h = e.uaMatch(navigator.userAgent), m = {}, h.browser && (m[h.browser] = !0, m.version = h.version), m.chrome ? m.webkit = !0 : m.webkit && (m.safari = !0), e.browser = m), i(e, "browser", e.browser, "jQuery.browser is deprecated"), e.sub = function() {
        function t(e, n) {
            return new t.fn.init(e, n)
        }
        e.extend(!0, t, this), t.superclass = this, t.fn = t.prototype = this(), t.fn.constructor = t, t.sub = this.sub, t.fn.init = function(o, i) {
            return i && i instanceof e && !(i instanceof t) && (i = t(i)), e.fn.init.call(this, o, i, n)
        }, t.fn.init.prototype = t.fn;
        var n = t(document);
        return o("jQuery.sub() is deprecated"), t
    }, e.ajaxSetup({
        converters: {
            "text json": e.parseJSON
        }
    });
    var w = e.fn.data;
    e.fn.data = function(t) {
        var i, r, s = this[0];
        return !s || "events" !== t || 1 !== arguments.length || (i = e.data(s, t), r = e._data(s, t), i !== n && i !== r || r === n) ? w.apply(this, arguments) : (o("Use of jQuery.fn.data('events') is deprecated"), r)
    };
    var b = /\/(java|ecma)script/i,
        _ = e.fn.andSelf || e.fn.addBack;
    e.fn.andSelf = function() {
        return o("jQuery.fn.andSelf() replaced by jQuery.fn.addBack()"), _.apply(this, arguments)
    }, e.clean || (e.clean = function(t, n, i, r) {
        n = n || document, n = !n.nodeType && n[0] || n, n = n.ownerDocument || n, o("jQuery.clean() is deprecated");
        var s, a, l, c, d = [];
        if (e.merge(d, e.buildFragment(t, n).childNodes), i)
            for (l = function(e) {
                    return !e.type || b.test(e.type) ? r ? r.push(e.parentNode ? e.parentNode.removeChild(e) : e) : i.appendChild(e) : void 0
                }, s = 0; null != (a = d[s]); s++) e.nodeName(a, "script") && l(a) || (i.appendChild(a), "undefined" != typeof a.getElementsByTagName && (c = e.grep(e.merge([], a.getElementsByTagName("script")), l), d.splice.apply(d, [s + 1, 0].concat(c)), s += c.length));
        return d
    });
    var x = e.event.add,
        C = e.event.remove,
        k = e.event.trigger,
        T = e.fn.toggle,
        S = e.fn.live,
        $ = e.fn.die,
        E = "ajaxStart|ajaxStop|ajaxSend|ajaxComplete|ajaxError|ajaxSuccess",
        N = new RegExp("\\b(?:" + E + ")\\b"),
        R = /(?:^|\s)hover(\.\S+|)\b/,
        A = function(t) {
            return "string" != typeof t || e.event.special.hover ? t : (R.test(t) && o("'hover' pseudo-event is deprecated, use 'mouseenter mouseleave'"), t && t.replace(R, "mouseenter$1 mouseleave$1"))
        };
    e.event.props && "attrChange" !== e.event.props[0] && e.event.props.unshift("attrChange", "attrName", "relatedNode", "srcElement"), e.event.dispatch && i(e.event, "handle", e.event.dispatch, "jQuery.event.handle is undocumented and deprecated"), e.event.add = function(e, t, n, i, r) {
        e !== document && N.test(t) && o("AJAX events should be attached to document: " + t), x.call(this, e, A(t || ""), n, i, r)
    }, e.event.remove = function(e, t, n, o, i) {
        C.call(this, e, A(t) || "", n, o, i)
    }, e.fn.error = function() {
        var e = Array.prototype.slice.call(arguments, 0);
        return o("jQuery.fn.error() is deprecated"), e.splice(0, 0, "error"), arguments.length ? this.bind.apply(this, e) : (this.triggerHandler.apply(this, e), this)
    }, e.fn.toggle = function(t, n) {
        if (!e.isFunction(t) || !e.isFunction(n)) return T.apply(this, arguments);
        o("jQuery.fn.toggle(handler, handler...) is deprecated");
        var i = arguments,
            r = t.guid || e.guid++,
            s = 0,
            a = function(n) {
                var o = (e._data(this, "lastToggle" + t.guid) || 0) % s;
                return e._data(this, "lastToggle" + t.guid, o + 1), n.preventDefault(), i[o].apply(this, arguments) || !1
            };
        for (a.guid = r; s < i.length;) i[s++].guid = r;
        return this.click(a)
    }, e.fn.live = function(t, n, i) {
        return o("jQuery.fn.live() is deprecated"), S ? S.apply(this, arguments) : (e(this.context).on(t, this.selector, n, i), this)
    }, e.fn.die = function(t, n) {
        return o("jQuery.fn.die() is deprecated"), $ ? $.apply(this, arguments) : (e(this.context).off(t, this.selector || "**", n), this)
    }, e.event.trigger = function(e, t, n, i) {
        return n || N.test(e) || o("Global events are undocumented and deprecated"), k.call(this, e, t, n || document, i)
    }, e.each(E.split("|"), function(t, n) {
        e.event.special[n] = {
            setup: function() {
                var t = this;
                return t !== document && (e.event.add(document, n + "." + e.guid, function() {
                    e.event.trigger(n, null, t, !0)
                }), e._data(this, n, e.guid++)), !1
            },
            teardown: function() {
                return this !== document && e.event.remove(document, n + "." + e._data(this, n)), !1
            }
        }
    })
}(jQuery, window), ! function(e) {
    "use strict";
    "function" == typeof define && define.amd ? define(["jquery"], e) : "undefined" != typeof exports ? module.exports = e(require("jquery")) : e(jQuery)
}(function(e) {
    "use strict";
    var t = window.Slick || {};
    t = function() {
        function t(t, o) {
            var i, r = this;
            r.defaults = {
                accessibility: !0,
                adaptiveHeight: !1,
                appendArrows: e(t),
                appendDots: e(t),
                arrows: !0,
                asNavFor: null,
                prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button">Previous</button>',
                nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button">Next</button>',
                autoplay: !1,
                autoplaySpeed: 3e3,
                centerMode: !1,
                centerPadding: "50px",
                cssEase: "ease",
                customPaging: function(e, t) {
                    return '<button type="button" data-role="none" role="button" aria-required="false" tabindex="0">' + (t + 1) + "</button>"
                },
                dots: !1,
                dotsClass: "slick-dots",
                draggable: !0,
                easing: "linear",
                edgeFriction: .35,
                fade: !1,
                focusOnSelect: !1,
                infinite: !0,
                initialSlide: 0,
                lazyLoad: "ondemand",
                mobileFirst: !1,
                pauseOnHover: !0,
                pauseOnDotsHover: !1,
                respondTo: "window",
                responsive: null,
                rows: 1,
                rtl: !1,
                slide: "",
                slidesPerRow: 1,
                slidesToShow: 1,
                slidesToScroll: 1,
                speed: 500,
                swipe: !0,
                swipeToSlide: !1,
                touchMove: !0,
                touchThreshold: 5,
                useCSS: !0,
                variableWidth: !1,
                vertical: !1,
                verticalSwiping: !1,
                waitForAnimate: !0,
                zIndex: 1e3
            }, r.initials = {
                animating: !1,
                dragging: !1,
                autoPlayTimer: null,
                currentDirection: 0,
                currentLeft: null,
                currentSlide: 0,
                direction: 1,
                $dots: null,
                listWidth: null,
                listHeight: null,
                loadIndex: 0,
                $nextArrow: null,
                $prevArrow: null,
                slideCount: null,
                slideWidth: null,
                $slideTrack: null,
                $slides: null,
                sliding: !1,
                slideOffset: 0,
                swipeLeft: null,
                $list: null,
                touchObject: {},
                transformsEnabled: !1,
                unslicked: !1
            }, e.extend(r, r.initials), r.activeBreakpoint = null, r.animType = null, r.animProp = null, r.breakpoints = [], r.breakpointSettings = [], r.cssTransitions = !1, r.hidden = "hidden", r.paused = !1, r.positionProp = null, r.respondTo = null, r.rowCount = 1, r.shouldClick = !0, r.$slider = e(t), r.$slidesCache = null, r.transformType = null, r.transitionType = null, r.visibilityChange = "visibilitychange", r.windowWidth = 0, r.windowTimer = null, i = e(t).data("slick") || {}, r.options = e.extend({}, r.defaults, i, o), r.currentSlide = r.options.initialSlide, r.originalSettings = r.options, "undefined" != typeof document.mozHidden ? (r.hidden = "mozHidden", r.visibilityChange = "mozvisibilitychange") : "undefined" != typeof document.webkitHidden && (r.hidden = "webkitHidden", r.visibilityChange = "webkitvisibilitychange"), r.autoPlay = e.proxy(r.autoPlay, r), r.autoPlayClear = e.proxy(r.autoPlayClear, r), r.changeSlide = e.proxy(r.changeSlide, r), r.clickHandler = e.proxy(r.clickHandler, r), r.selectHandler = e.proxy(r.selectHandler, r), r.setPosition = e.proxy(r.setPosition, r), r.swipeHandler = e.proxy(r.swipeHandler, r), r.dragHandler = e.proxy(r.dragHandler, r), r.keyHandler = e.proxy(r.keyHandler, r), r.autoPlayIterator = e.proxy(r.autoPlayIterator, r), r.instanceUid = n++, r.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/, r.registerBreakpoints(), r.init(!0), r.checkResponsive(!0)
        }
        var n = 0;
        return t
    }(), t.prototype.addSlide = t.prototype.slickAdd = function(t, n, o) {
        var i = this;
        if ("boolean" == typeof n) o = n, n = null;
        else if (0 > n || n >= i.slideCount) return !1;
        i.unload(), "number" == typeof n ? 0 === n && 0 === i.$slides.length ? e(t).appendTo(i.$slideTrack) : o ? e(t).insertBefore(i.$slides.eq(n)) : e(t).insertAfter(i.$slides.eq(n)) : o === !0 ? e(t).prependTo(i.$slideTrack) : e(t).appendTo(i.$slideTrack), i.$slides = i.$slideTrack.children(this.options.slide), i.$slideTrack.children(this.options.slide).detach(), i.$slideTrack.append(i.$slides), i.$slides.each(function(t, n) {
            e(n).attr("data-slick-index", t)
        }), i.$slidesCache = i.$slides, i.reinit()
    }, t.prototype.animateHeight = function() {
        var e = this;
        if (1 === e.options.slidesToShow && e.options.adaptiveHeight === !0 && e.options.vertical === !1) {
            var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.animate({
                height: t
            }, e.options.speed)
        }
    }, t.prototype.animateSlide = function(t, n) {
        var o = {},
            i = this;
        i.animateHeight(), i.options.rtl === !0 && i.options.vertical === !1 && (t = -t), i.transformsEnabled === !1 ? i.options.vertical === !1 ? i.$slideTrack.animate({
            left: t
        }, i.options.speed, i.options.easing, n) : i.$slideTrack.animate({
            top: t
        }, i.options.speed, i.options.easing, n) : i.cssTransitions === !1 ? (i.options.rtl === !0 && (i.currentLeft = -i.currentLeft), e({
            animStart: i.currentLeft
        }).animate({
            animStart: t
        }, {
            duration: i.options.speed,
            easing: i.options.easing,
            step: function(e) {
                e = Math.ceil(e), i.options.vertical === !1 ? (o[i.animType] = "translate(" + e + "px, 0px)", i.$slideTrack.css(o)) : (o[i.animType] = "translate(0px," + e + "px)", i.$slideTrack.css(o))
            },
            complete: function() {
                n && n.call()
            }
        })) : (i.applyTransition(), t = Math.ceil(t), o[i.animType] = i.options.vertical === !1 ? "translate3d(" + t + "px, 0px, 0px)" : "translate3d(0px," + t + "px, 0px)", i.$slideTrack.css(o), n && setTimeout(function() {
            i.disableTransition(), n.call()
        }, i.options.speed))
    }, t.prototype.asNavFor = function(t) {
        var n = this,
            o = n.options.asNavFor;
        o && null !== o && (o = e(o).not(n.$slider)), null !== o && "object" == typeof o && o.each(function() {
            var n = e(this).slick("getSlick");
            n.unslicked || n.slideHandler(t, !0)
        })
    }, t.prototype.applyTransition = function(e) {
        var t = this,
            n = {};
        n[t.transitionType] = t.options.fade === !1 ? t.transformType + " " + t.options.speed + "ms " + t.options.cssEase : "opacity " + t.options.speed + "ms " + t.options.cssEase, t.options.fade === !1 ? t.$slideTrack.css(n) : t.$slides.eq(e).css(n)
    }, t.prototype.autoPlay = function() {
        var e = this;
        e.autoPlayTimer && clearInterval(e.autoPlayTimer), e.slideCount > e.options.slidesToShow && e.paused !== !0 && (e.autoPlayTimer = setInterval(e.autoPlayIterator, e.options.autoplaySpeed))
    }, t.prototype.autoPlayClear = function() {
        var e = this;
        e.autoPlayTimer && clearInterval(e.autoPlayTimer)
    }, t.prototype.autoPlayIterator = function() {
        var e = this;
        e.options.infinite === !1 ? 1 === e.direction ? (e.currentSlide + 1 === e.slideCount - 1 && (e.direction = 0), e.slideHandler(e.currentSlide + e.options.slidesToScroll)) : (0 === e.currentSlide - 1 && (e.direction = 1), e.slideHandler(e.currentSlide - e.options.slidesToScroll)) : e.slideHandler(e.currentSlide + e.options.slidesToScroll)
    }, t.prototype.buildArrows = function() {
        var t = this;
        t.options.arrows === !0 && (t.$prevArrow = e(t.options.prevArrow).addClass("slick-arrow"), t.$nextArrow = e(t.options.nextArrow).addClass("slick-arrow"), t.slideCount > t.options.slidesToShow ? (t.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), t.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.prependTo(t.options.appendArrows), t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.appendTo(t.options.appendArrows), t.options.infinite !== !0 && t.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true")) : t.$prevArrow.add(t.$nextArrow).addClass("slick-hidden").attr({
            "aria-disabled": "true",
            tabindex: "-1"
        }))
    }, t.prototype.buildDots = function() {
        var t, n, o = this;
        if (o.options.dots === !0 && o.slideCount > o.options.slidesToShow) {
            for (n = '<ul class="' + o.options.dotsClass + '">', t = 0; t <= o.getDotCount(); t += 1) n += "<li>" + o.options.customPaging.call(this, o, t) + "</li>";
            n += "</ul>", o.$dots = e(n).appendTo(o.options.appendDots), o.$dots.find("li").first().addClass("slick-active").attr("aria-hidden", "false")
        }
    }, t.prototype.buildOut = function() {
        var t = this;
        t.$slides = t.$slider.children(t.options.slide + ":not(.slick-cloned)").addClass("slick-slide"), t.slideCount = t.$slides.length, t.$slides.each(function(t, n) {
            e(n).attr("data-slick-index", t).data("originalStyling", e(n).attr("style") || "")
        }), t.$slidesCache = t.$slides, t.$slider.addClass("slick-slider"), t.$slideTrack = 0 === t.slideCount ? e('<div class="slick-track"/>').appendTo(t.$slider) : t.$slides.wrapAll('<div class="slick-track"/>').parent(), t.$list = t.$slideTrack.wrap('<div aria-live="polite" class="slick-list"/>').parent(), t.$slideTrack.css("opacity", 0), (t.options.centerMode === !0 || t.options.swipeToSlide === !0) && (t.options.slidesToScroll = 1), e("img[data-lazy]", t.$slider).not("[src]").addClass("slick-loading"), t.setupInfinite(), t.buildArrows(), t.buildDots(), t.updateDots(), t.setSlideClasses("number" == typeof t.currentSlide ? t.currentSlide : 0), t.options.draggable === !0 && t.$list.addClass("draggable")
    }, t.prototype.buildRows = function() {
        var e, t, n, o, i, r, s, a = this;
        if (o = document.createDocumentFragment(), r = a.$slider.children(), a.options.rows > 1) {
            for (s = a.options.slidesPerRow * a.options.rows, i = Math.ceil(r.length / s), e = 0; i > e; e++) {
                var l = document.createElement("div");
                for (t = 0; t < a.options.rows; t++) {
                    var c = document.createElement("div");
                    for (n = 0; n < a.options.slidesPerRow; n++) {
                        var d = e * s + (t * a.options.slidesPerRow + n);
                        r.get(d) && c.appendChild(r.get(d))
                    }
                    l.appendChild(c)
                }
                o.appendChild(l)
            }
            a.$slider.html(o), a.$slider.children().children().children().css({
                width: 100 / a.options.slidesPerRow + "%",
                display: "inline-block"
            })
        }
    }, t.prototype.checkResponsive = function(t, n) {
        var o, i, r, s = this,
            a = !1,
            l = s.$slider.width(),
            c = window.innerWidth || e(window).width();
        if ("window" === s.respondTo ? r = c : "slider" === s.respondTo ? r = l : "min" === s.respondTo && (r = Math.min(c, l)), s.options.responsive && s.options.responsive.length && null !== s.options.responsive) {
            i = null;
            for (o in s.breakpoints) s.breakpoints.hasOwnProperty(o) && (s.originalSettings.mobileFirst === !1 ? r < s.breakpoints[o] && (i = s.breakpoints[o]) : r > s.breakpoints[o] && (i = s.breakpoints[o]));
            null !== i ? null !== s.activeBreakpoint ? (i !== s.activeBreakpoint || n) && (s.activeBreakpoint = i, "unslick" === s.breakpointSettings[i] ? s.unslick(i) : (s.options = e.extend({}, s.originalSettings, s.breakpointSettings[i]), t === !0 && (s.currentSlide = s.options.initialSlide), s.refresh(t)), a = i) : (s.activeBreakpoint = i, "unslick" === s.breakpointSettings[i] ? s.unslick(i) : (s.options = e.extend({}, s.originalSettings, s.breakpointSettings[i]), t === !0 && (s.currentSlide = s.options.initialSlide), s.refresh(t)), a = i) : null !== s.activeBreakpoint && (s.activeBreakpoint = null, s.options = s.originalSettings, t === !0 && (s.currentSlide = s.options.initialSlide), s.refresh(t), a = i), t || a === !1 || s.$slider.trigger("breakpoint", [s, a])
        }
    }, t.prototype.changeSlide = function(t, n) {
        var o, i, r, s = this,
            a = e(t.target);
        switch (a.is("a") && t.preventDefault(), a.is("li") || (a = a.closest("li")), r = 0 !== s.slideCount % s.options.slidesToScroll, o = r ? 0 : (s.slideCount - s.currentSlide) % s.options.slidesToScroll, t.data.message) {
            case "previous":
                i = 0 === o ? s.options.slidesToScroll : s.options.slidesToShow - o, s.slideCount > s.options.slidesToShow && s.slideHandler(s.currentSlide - i, !1, n);
                break;
            case "next":
                i = 0 === o ? s.options.slidesToScroll : o, s.slideCount > s.options.slidesToShow && s.slideHandler(s.currentSlide + i, !1, n);
                break;
            case "index":
                var l = 0 === t.data.index ? 0 : t.data.index || a.index() * s.options.slidesToScroll;
                s.slideHandler(s.checkNavigable(l), !1, n), a.children().trigger("focus");
                break;
            default:
                return
        }
    }, t.prototype.checkNavigable = function(e) {
        var t, n, o = this;
        if (t = o.getNavigableIndexes(), n = 0, e > t[t.length - 1]) e = t[t.length - 1];
        else
            for (var i in t) {
                if (e < t[i]) {
                    e = n;
                    break
                }
                n = t[i]
            }
        return e
    }, t.prototype.cleanUpEvents = function() {
        var t = this;
        t.options.dots && null !== t.$dots && (e("li", t.$dots).off("click.slick", t.changeSlide), t.options.pauseOnDotsHover === !0 && t.options.autoplay === !0 && e("li", t.$dots).off("mouseenter.slick", e.proxy(t.setPaused, t, !0)).off("mouseleave.slick", e.proxy(t.setPaused, t, !1))), t.options.arrows === !0 && t.slideCount > t.options.slidesToShow && (t.$prevArrow && t.$prevArrow.off("click.slick", t.changeSlide), t.$nextArrow && t.$nextArrow.off("click.slick", t.changeSlide)), t.$list.off("touchstart.slick mousedown.slick", t.swipeHandler), t.$list.off("touchmove.slick mousemove.slick", t.swipeHandler), t.$list.off("touchend.slick mouseup.slick", t.swipeHandler), t.$list.off("touchcancel.slick mouseleave.slick", t.swipeHandler), t.$list.off("click.slick", t.clickHandler), e(document).off(t.visibilityChange, t.visibility), t.$list.off("mouseenter.slick", e.proxy(t.setPaused, t, !0)), t.$list.off("mouseleave.slick", e.proxy(t.setPaused, t, !1)), t.options.accessibility === !0 && t.$list.off("keydown.slick", t.keyHandler), t.options.focusOnSelect === !0 && e(t.$slideTrack).children().off("click.slick", t.selectHandler), e(window).off("orientationchange.slick.slick-" + t.instanceUid, t.orientationChange), e(window).off("resize.slick.slick-" + t.instanceUid, t.resize), e("[draggable!=true]", t.$slideTrack).off("dragstart", t.preventDefault), e(window).off("load.slick.slick-" + t.instanceUid, t.setPosition), e(document).off("ready.slick.slick-" + t.instanceUid, t.setPosition)
    }, t.prototype.cleanUpRows = function() {
        var e, t = this;
        t.options.rows > 1 && (e = t.$slides.children().children(), e.removeAttr("style"), t.$slider.html(e))
    }, t.prototype.clickHandler = function(e) {
        var t = this;
        t.shouldClick === !1 && (e.stopImmediatePropagation(), e.stopPropagation(), e.preventDefault())
    }, t.prototype.destroy = function(t) {
        var n = this;
        n.autoPlayClear(), n.touchObject = {}, n.cleanUpEvents(), e(".slick-cloned", n.$slider).detach(), n.$dots && n.$dots.remove(), n.$prevArrow && n.$prevArrow.length && (n.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), n.htmlExpr.test(n.options.prevArrow) && n.$prevArrow.remove()), n.$nextArrow && n.$nextArrow.length && (n.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), n.htmlExpr.test(n.options.nextArrow) && n.$nextArrow.remove()), n.$slides && (n.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function() {
            e(this).attr("style", e(this).data("originalStyling"))
        }), n.$slideTrack.children(this.options.slide).detach(), n.$slideTrack.detach(), n.$list.detach(), n.$slider.append(n.$slides)), n.cleanUpRows(), n.$slider.removeClass("slick-slider"), n.$slider.removeClass("slick-initialized"), n.unslicked = !0, t || n.$slider.trigger("destroy", [n])
    }, t.prototype.disableTransition = function(e) {
        var t = this,
            n = {};
        n[t.transitionType] = "", t.options.fade === !1 ? t.$slideTrack.css(n) : t.$slides.eq(e).css(n)
    }, t.prototype.fadeSlide = function(e, t) {
        var n = this;
        n.cssTransitions === !1 ? (n.$slides.eq(e).css({
            zIndex: n.options.zIndex
        }), n.$slides.eq(e).animate({
            opacity: 1
        }, n.options.speed, n.options.easing, t)) : (n.applyTransition(e), n.$slides.eq(e).css({
            opacity: 1,
            zIndex: n.options.zIndex
        }), t && setTimeout(function() {
            n.disableTransition(e), t.call()
        }, n.options.speed))
    }, t.prototype.fadeSlideOut = function(e) {
        var t = this;
        t.cssTransitions === !1 ? t.$slides.eq(e).animate({
            opacity: 0,
            zIndex: t.options.zIndex - 2
        }, t.options.speed, t.options.easing) : (t.applyTransition(e), t.$slides.eq(e).css({
            opacity: 0,
            zIndex: t.options.zIndex - 2
        }))
    }, t.prototype.filterSlides = t.prototype.slickFilter = function(e) {
        var t = this;
        null !== e && (t.unload(), t.$slideTrack.children(this.options.slide).detach(), t.$slidesCache.filter(e).appendTo(t.$slideTrack), t.reinit())
    }, t.prototype.getCurrent = t.prototype.slickCurrentSlide = function() {
        var e = this;
        return e.currentSlide
    }, t.prototype.getDotCount = function() {
        var e = this,
            t = 0,
            n = 0,
            o = 0;
        if (e.options.infinite === !0)
            for (; t < e.slideCount;) ++o, t = n + e.options.slidesToShow, n += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
        else if (e.options.centerMode === !0) o = e.slideCount;
        else
            for (; t < e.slideCount;) ++o, t = n + e.options.slidesToShow, n += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
        return o - 1
    }, t.prototype.getLeft = function(e) {
        var t, n, o, i = this,
            r = 0;
        return i.slideOffset = 0, n = i.$slides.first().outerHeight(!0), i.options.infinite === !0 ? (i.slideCount > i.options.slidesToShow && (i.slideOffset = -1 * i.slideWidth * i.options.slidesToShow, r = -1 * n * i.options.slidesToShow), 0 !== i.slideCount % i.options.slidesToScroll && e + i.options.slidesToScroll > i.slideCount && i.slideCount > i.options.slidesToShow && (e > i.slideCount ? (i.slideOffset = -1 * (i.options.slidesToShow - (e - i.slideCount)) * i.slideWidth, r = -1 * (i.options.slidesToShow - (e - i.slideCount)) * n) : (i.slideOffset = -1 * i.slideCount % i.options.slidesToScroll * i.slideWidth, r = -1 * i.slideCount % i.options.slidesToScroll * n))) : e + i.options.slidesToShow > i.slideCount && (i.slideOffset = (e + i.options.slidesToShow - i.slideCount) * i.slideWidth, r = (e + i.options.slidesToShow - i.slideCount) * n), i.slideCount <= i.options.slidesToShow && (i.slideOffset = 0, r = 0), i.options.centerMode === !0 && i.options.infinite === !0 ? i.slideOffset += i.slideWidth * Math.floor(i.options.slidesToShow / 2) - i.slideWidth : i.options.centerMode === !0 && (i.slideOffset = 0, i.slideOffset += i.slideWidth * Math.floor(i.options.slidesToShow / 2)), t = i.options.vertical === !1 ? -1 * e * i.slideWidth + i.slideOffset : -1 * e * n + r, i.options.variableWidth === !0 && (o = i.slideCount <= i.options.slidesToShow || i.options.infinite === !1 ? i.$slideTrack.children(".slick-slide").eq(e) : i.$slideTrack.children(".slick-slide").eq(e + i.options.slidesToShow), t = o[0] ? -1 * o[0].offsetLeft : 0, i.options.centerMode === !0 && (o = i.options.infinite === !1 ? i.$slideTrack.children(".slick-slide").eq(e) : i.$slideTrack.children(".slick-slide").eq(e + i.options.slidesToShow + 1), t = o[0] ? -1 * o[0].offsetLeft : 0, t += (i.$list.width() - o.outerWidth()) / 2)), t
    }, t.prototype.getOption = t.prototype.slickGetOption = function(e) {
        var t = this;
        return t.options[e]
    }, t.prototype.getNavigableIndexes = function() {
        var e, t = this,
            n = 0,
            o = 0,
            i = [];
        for (t.options.infinite === !1 ? e = t.slideCount : (n = -1 * t.options.slidesToScroll, o = -1 * t.options.slidesToScroll, e = 2 * t.slideCount); e > n;) i.push(n), n = o + t.options.slidesToScroll, o += t.options.slidesToScroll <= t.options.slidesToShow ? t.options.slidesToScroll : t.options.slidesToShow;
        return i
    }, t.prototype.getSlick = function() {
        return this
    }, t.prototype.getSlideCount = function() {
        var t, n, o, i = this;
        return o = i.options.centerMode === !0 ? i.slideWidth * Math.floor(i.options.slidesToShow / 2) : 0, i.options.swipeToSlide === !0 ? (i.$slideTrack.find(".slick-slide").each(function(t, r) {
            return r.offsetLeft - o + e(r).outerWidth() / 2 > -1 * i.swipeLeft ? (n = r, !1) : void 0
        }), t = Math.abs(e(n).attr("data-slick-index") - i.currentSlide) || 1) : i.options.slidesToScroll
    }, t.prototype.goTo = t.prototype.slickGoTo = function(e, t) {
        var n = this;
        n.changeSlide({
            data: {
                message: "index",
                index: parseInt(e)
            }
        }, t)
    }, t.prototype.init = function(t) {
        var n = this;
        e(n.$slider).hasClass("slick-initialized") || (e(n.$slider).addClass("slick-initialized"), n.buildRows(), n.buildOut(), n.setProps(), n.startLoad(), n.loadSlider(), n.initializeEvents(), n.updateArrows(), n.updateDots()), t && n.$slider.trigger("init", [n]), n.options.accessibility === !0 && n.initADA()
    }, t.prototype.initArrowEvents = function() {
        var e = this;
        e.options.arrows === !0 && e.slideCount > e.options.slidesToShow && (e.$prevArrow.on("click.slick", {
            message: "previous"
        }, e.changeSlide), e.$nextArrow.on("click.slick", {
            message: "next"
        }, e.changeSlide))
    }, t.prototype.initDotEvents = function() {
        var t = this;
        t.options.dots === !0 && t.slideCount > t.options.slidesToShow && e("li", t.$dots).on("click.slick", {
            message: "index"
        }, t.changeSlide), t.options.dots === !0 && t.options.pauseOnDotsHover === !0 && t.options.autoplay === !0 && e("li", t.$dots).on("mouseenter.slick", e.proxy(t.setPaused, t, !0)).on("mouseleave.slick", e.proxy(t.setPaused, t, !1))
    }, t.prototype.initializeEvents = function() {
        var t = this;
        t.initArrowEvents(), t.initDotEvents(), t.$list.on("touchstart.slick mousedown.slick", {
            action: "start"
        }, t.swipeHandler), t.$list.on("touchmove.slick mousemove.slick", {
            action: "move"
        }, t.swipeHandler), t.$list.on("touchend.slick mouseup.slick", {
            action: "end"
        }, t.swipeHandler), t.$list.on("touchcancel.slick mouseleave.slick", {
            action: "end"
        }, t.swipeHandler), t.$list.on("click.slick", t.clickHandler), e(document).on(t.visibilityChange, e.proxy(t.visibility, t)), t.$list.on("mouseenter.slick", e.proxy(t.setPaused, t, !0)), t.$list.on("mouseleave.slick", e.proxy(t.setPaused, t, !1)), t.options.accessibility === !0 && t.$list.on("keydown.slick", t.keyHandler), t.options.focusOnSelect === !0 && e(t.$slideTrack).children().on("click.slick", t.selectHandler), e(window).on("orientationchange.slick.slick-" + t.instanceUid, e.proxy(t.orientationChange, t)), e(window).on("resize.slick.slick-" + t.instanceUid, e.proxy(t.resize, t)), e("[draggable!=true]", t.$slideTrack).on("dragstart", t.preventDefault), e(window).on("load.slick.slick-" + t.instanceUid, t.setPosition), e(document).on("ready.slick.slick-" + t.instanceUid, t.setPosition)
    }, t.prototype.initUI = function() {
        var e = this;
        e.options.arrows === !0 && e.slideCount > e.options.slidesToShow && (e.$prevArrow.show(), e.$nextArrow.show()), e.options.dots === !0 && e.slideCount > e.options.slidesToShow && e.$dots.show(), e.options.autoplay === !0 && e.autoPlay()
    }, t.prototype.keyHandler = function(e) {
        var t = this;
        e.target.tagName.match("TEXTAREA|INPUT|SELECT") || (37 === e.keyCode && t.options.accessibility === !0 ? t.changeSlide({
            data: {
                message: "previous"
            }
        }) : 39 === e.keyCode && t.options.accessibility === !0 && t.changeSlide({
            data: {
                message: "next"
            }
        }))
    }, t.prototype.lazyLoad = function() {
        function t(t) {
            e("img[data-lazy]", t).each(function() {
                var t = e(this),
                    n = e(this).attr("data-lazy"),
                    o = document.createElement("img");
                o.onload = function() {
                    t.animate({
                        opacity: 0
                    }, 100, function() {
                        t.attr("src", n).animate({
                            opacity: 1
                        }, 200, function() {
                            t.removeAttr("data-lazy").removeClass("slick-loading")
                        })
                    })
                }, o.src = n
            })
        }
        var n, o, i, r, s = this;
        s.options.centerMode === !0 ? s.options.infinite === !0 ? (i = s.currentSlide + (s.options.slidesToShow / 2 + 1), r = i + s.options.slidesToShow + 2) : (i = Math.max(0, s.currentSlide - (s.options.slidesToShow / 2 + 1)), r = 2 + (s.options.slidesToShow / 2 + 1) + s.currentSlide) : (i = s.options.infinite ? s.options.slidesToShow + s.currentSlide : s.currentSlide, r = i + s.options.slidesToShow, s.options.fade === !0 && (i > 0 && i--, r <= s.slideCount && r++)), n = s.$slider.find(".slick-slide").slice(i, r), t(n), s.slideCount <= s.options.slidesToShow ? (o = s.$slider.find(".slick-slide"), t(o)) : s.currentSlide >= s.slideCount - s.options.slidesToShow ? (o = s.$slider.find(".slick-cloned").slice(0, s.options.slidesToShow), t(o)) : 0 === s.currentSlide && (o = s.$slider.find(".slick-cloned").slice(-1 * s.options.slidesToShow), t(o))
    }, t.prototype.loadSlider = function() {
        var e = this;
        e.setPosition(), e.$slideTrack.css({
            opacity: 1
        }), e.$slider.removeClass("slick-loading"), e.initUI(), "progressive" === e.options.lazyLoad && e.progressiveLazyLoad()
    }, t.prototype.next = t.prototype.slickNext = function() {
        var e = this;
        e.changeSlide({
            data: {
                message: "next"
            }
        })
    }, t.prototype.orientationChange = function() {
        var e = this;
        e.checkResponsive(), e.setPosition()
    }, t.prototype.pause = t.prototype.slickPause = function() {
        var e = this;
        e.autoPlayClear(), e.paused = !0
    }, t.prototype.play = t.prototype.slickPlay = function() {
        var e = this;
        e.paused = !1, e.autoPlay()
    }, t.prototype.postSlide = function(e) {
        var t = this;
        t.$slider.trigger("afterChange", [t, e]), t.animating = !1, t.setPosition(), t.swipeLeft = null, t.options.autoplay === !0 && t.paused === !1 && t.autoPlay(), t.options.accessibility === !0 && t.initADA()
    }, t.prototype.prev = t.prototype.slickPrev = function() {
        var e = this;
        e.changeSlide({
            data: {
                message: "previous"
            }
        })
    }, t.prototype.preventDefault = function(e) {
        e.preventDefault()
    }, t.prototype.progressiveLazyLoad = function() {
        var t, n, o = this;
        t = e("img[data-lazy]", o.$slider).length, t > 0 && (n = e("img[data-lazy]", o.$slider).first(), n.attr("src", n.attr("data-lazy")).removeClass("slick-loading").load(function() {
            n.removeAttr("data-lazy"), o.progressiveLazyLoad(), o.options.adaptiveHeight === !0 && o.setPosition()
        }).error(function() {
            n.removeAttr("data-lazy"), o.progressiveLazyLoad()
        }))
    }, t.prototype.refresh = function(t) {
        var n = this,
            o = n.currentSlide;
        n.destroy(!0), e.extend(n, n.initials, {
            currentSlide: o
        }), n.init(), t || n.changeSlide({
            data: {
                message: "index",
                index: o
            }
        }, !1)
    }, t.prototype.registerBreakpoints = function() {
        var t, n, o, i = this,
            r = i.options.responsive || null;
        if ("array" === e.type(r) && r.length) {
            i.respondTo = i.options.respondTo || "window";
            for (t in r)
                if (o = i.breakpoints.length - 1, n = r[t].breakpoint, r.hasOwnProperty(t)) {
                    for (; o >= 0;) i.breakpoints[o] && i.breakpoints[o] === n && i.breakpoints.splice(o, 1), o--;
                    i.breakpoints.push(n), i.breakpointSettings[n] = r[t].settings
                }
            i.breakpoints.sort(function(e, t) {
                return i.options.mobileFirst ? e - t : t - e
            })
        }
    }, t.prototype.reinit = function() {
        var t = this;
        t.$slides = t.$slideTrack.children(t.options.slide).addClass("slick-slide"), t.slideCount = t.$slides.length, t.currentSlide >= t.slideCount && 0 !== t.currentSlide && (t.currentSlide = t.currentSlide - t.options.slidesToScroll), t.slideCount <= t.options.slidesToShow && (t.currentSlide = 0), t.registerBreakpoints(), t.setProps(), t.setupInfinite(), t.buildArrows(), t.updateArrows(), t.initArrowEvents(), t.buildDots(), t.updateDots(), t.initDotEvents(), t.checkResponsive(!1, !0), t.options.focusOnSelect === !0 && e(t.$slideTrack).children().on("click.slick", t.selectHandler), t.setSlideClasses(0), t.setPosition(), t.$slider.trigger("reInit", [t]), t.options.autoplay === !0 && t.focusHandler()
    }, t.prototype.resize = function() {
        var t = this;
        e(window).width() !== t.windowWidth && (clearTimeout(t.windowDelay), t.windowDelay = window.setTimeout(function() {
            t.windowWidth = e(window).width(), t.checkResponsive(), t.unslicked || t.setPosition()
        }, 50))
    }, t.prototype.removeSlide = t.prototype.slickRemove = function(e, t, n) {
        var o = this;
        return "boolean" == typeof e ? (t = e, e = t === !0 ? 0 : o.slideCount - 1) : e = t === !0 ? --e : e, o.slideCount < 1 || 0 > e || e > o.slideCount - 1 ? !1 : (o.unload(), n === !0 ? o.$slideTrack.children().remove() : o.$slideTrack.children(this.options.slide).eq(e).remove(), o.$slides = o.$slideTrack.children(this.options.slide), o.$slideTrack.children(this.options.slide).detach(), o.$slideTrack.append(o.$slides), o.$slidesCache = o.$slides, void o.reinit())
    }, t.prototype.setCSS = function(e) {
        var t, n, o = this,
            i = {};
        o.options.rtl === !0 && (e = -e), t = "left" == o.positionProp ? Math.ceil(e) + "px" : "0px", n = "top" == o.positionProp ? Math.ceil(e) + "px" : "0px", i[o.positionProp] = e, o.transformsEnabled === !1 ? o.$slideTrack.css(i) : (i = {}, o.cssTransitions === !1 ? (i[o.animType] = "translate(" + t + ", " + n + ")", o.$slideTrack.css(i)) : (i[o.animType] = "translate3d(" + t + ", " + n + ", 0px)", o.$slideTrack.css(i)))
    }, t.prototype.setDimensions = function() {
        var e = this;
        e.options.vertical === !1 ? e.options.centerMode === !0 && e.$list.css({
            padding: "0px " + e.options.centerPadding
        }) : (e.$list.height(e.$slides.first().outerHeight(!0) * e.options.slidesToShow), e.options.centerMode === !0 && e.$list.css({
            padding: e.options.centerPadding + " 0px"
        })), e.listWidth = e.$list.width(), e.listHeight = e.$list.height(), e.options.vertical === !1 && e.options.variableWidth === !1 ? (e.slideWidth = Math.ceil(e.listWidth / e.options.slidesToShow), e.$slideTrack.width(Math.ceil(e.slideWidth * e.$slideTrack.children(".slick-slide").length))) : e.options.variableWidth === !0 ? e.$slideTrack.width(5e3 * e.slideCount) : (e.slideWidth = Math.ceil(e.listWidth), e.$slideTrack.height(Math.ceil(e.$slides.first().outerHeight(!0) * e.$slideTrack.children(".slick-slide").length)));
        var t = e.$slides.first().outerWidth(!0) - e.$slides.first().width();
        e.options.variableWidth === !1 && e.$slideTrack.children(".slick-slide").width(e.slideWidth - t)
    }, t.prototype.setFade = function() {
        var t, n = this;
        n.$slides.each(function(o, i) {
            t = -1 * n.slideWidth * o, n.options.rtl === !0 ? e(i).css({
                position: "relative",
                right: t,
                top: 0,
                zIndex: n.options.zIndex - 2,
                opacity: 0
            }) : e(i).css({
                position: "relative",
                left: t,
                top: 0,
                zIndex: n.options.zIndex - 2,
                opacity: 0
            })
        }), n.$slides.eq(n.currentSlide).css({
            zIndex: n.options.zIndex - 1,
            opacity: 1
        })
    }, t.prototype.setHeight = function() {
        var e = this;
        if (1 === e.options.slidesToShow && e.options.adaptiveHeight === !0 && e.options.vertical === !1) {
            var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.css("height", t)
        }
    }, t.prototype.setOption = t.prototype.slickSetOption = function(t, n, o) {
        var i, r, s = this;
        if ("responsive" === t && "array" === e.type(n))
            for (r in n)
                if ("array" !== e.type(s.options.responsive)) s.options.responsive = [n[r]];
                else {
                    for (i = s.options.responsive.length - 1; i >= 0;) s.options.responsive[i].breakpoint === n[r].breakpoint && s.options.responsive.splice(i, 1), i--;
                    s.options.responsive.push(n[r])
                }
        else s.options[t] = n;
        o === !0 && (s.unload(), s.reinit())
    }, t.prototype.setPosition = function() {
        var e = this;
        e.setDimensions(), e.setHeight(), e.options.fade === !1 ? e.setCSS(e.getLeft(e.currentSlide)) : e.setFade(), e.$slider.trigger("setPosition", [e])
    }, t.prototype.setProps = function() {
        var e = this,
            t = document.body.style;
        e.positionProp = e.options.vertical === !0 ? "top" : "left", "top" === e.positionProp ? e.$slider.addClass("slick-vertical") : e.$slider.removeClass("slick-vertical"), (void 0 !== t.WebkitTransition || void 0 !== t.MozTransition || void 0 !== t.msTransition) && e.options.useCSS === !0 && (e.cssTransitions = !0), e.options.fade && ("number" == typeof e.options.zIndex ? e.options.zIndex < 3 && (e.options.zIndex = 3) : e.options.zIndex = e.defaults.zIndex), void 0 !== t.OTransform && (e.animType = "OTransform", e.transformType = "-o-transform", e.transitionType = "OTransition", void 0 === t.perspectiveProperty && void 0 === t.webkitPerspective && (e.animType = !1)), void 0 !== t.MozTransform && (e.animType = "MozTransform", e.transformType = "-moz-transform", e.transitionType = "MozTransition", void 0 === t.perspectiveProperty && void 0 === t.MozPerspective && (e.animType = !1)), void 0 !== t.webkitTransform && (e.animType = "webkitTransform", e.transformType = "-webkit-transform", e.transitionType = "webkitTransition", void 0 === t.perspectiveProperty && void 0 === t.webkitPerspective && (e.animType = !1)), void 0 !== t.msTransform && (e.animType = "msTransform", e.transformType = "-ms-transform", e.transitionType = "msTransition", void 0 === t.msTransform && (e.animType = !1)), void 0 !== t.transform && e.animType !== !1 && (e.animType = "transform", e.transformType = "transform", e.transitionType = "transition"), e.transformsEnabled = null !== e.animType && e.animType !== !1
    }, t.prototype.setSlideClasses = function(e) {
        var t, n, o, i, r = this;
        n = r.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden", "true"), r.$slides.eq(e).addClass("slick-current"), r.options.centerMode === !0 ? (t = Math.floor(r.options.slidesToShow / 2), r.options.infinite === !0 && (e >= t && e <= r.slideCount - 1 - t ? r.$slides.slice(e - t, e + t + 1).addClass("slick-active").attr("aria-hidden", "false") : (o = r.options.slidesToShow + e, n.slice(o - t + 1, o + t + 2).addClass("slick-active").attr("aria-hidden", "false")), 0 === e ? n.eq(n.length - 1 - r.options.slidesToShow).addClass("slick-center") : e === r.slideCount - 1 && n.eq(r.options.slidesToShow).addClass("slick-center")), r.$slides.eq(e).addClass("slick-center")) : e >= 0 && e <= r.slideCount - r.options.slidesToShow ? r.$slides.slice(e, e + r.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false") : n.length <= r.options.slidesToShow ? n.addClass("slick-active").attr("aria-hidden", "false") : (i = r.slideCount % r.options.slidesToShow, o = r.options.infinite === !0 ? r.options.slidesToShow + e : e, r.options.slidesToShow == r.options.slidesToScroll && r.slideCount - e < r.options.slidesToShow ? n.slice(o - (r.options.slidesToShow - i), o + i).addClass("slick-active").attr("aria-hidden", "false") : n.slice(o, o + r.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false")), "ondemand" === r.options.lazyLoad && r.lazyLoad()
    }, t.prototype.setupInfinite = function() {
        var t, n, o, i = this;
        if (i.options.fade === !0 && (i.options.centerMode = !1), i.options.infinite === !0 && i.options.fade === !1 && (n = null, i.slideCount > i.options.slidesToShow)) {
            for (o = i.options.centerMode === !0 ? i.options.slidesToShow + 1 : i.options.slidesToShow, t = i.slideCount; t > i.slideCount - o; t -= 1) n = t - 1, e(i.$slides[n]).clone(!0).attr("id", "").attr("data-slick-index", n - i.slideCount).prependTo(i.$slideTrack).addClass("slick-cloned");
            for (t = 0; o > t; t += 1) n = t, e(i.$slides[n]).clone(!0).attr("id", "").attr("data-slick-index", n + i.slideCount).appendTo(i.$slideTrack).addClass("slick-cloned");
            i.$slideTrack.find(".slick-cloned").find("[id]").each(function() {
                e(this).attr("id", "")
            })
        }
    }, t.prototype.setPaused = function(e) {
        var t = this;
        t.options.autoplay === !0 && t.options.pauseOnHover === !0 && (t.paused = e, e ? t.autoPlayClear() : t.autoPlay())
    }, t.prototype.selectHandler = function(t) {
        var n = this,
            o = e(t.target).is(".slick-slide") ? e(t.target) : e(t.target).parents(".slick-slide"),
            i = parseInt(o.attr("data-slick-index"));
        return i || (i = 0), n.slideCount <= n.options.slidesToShow ? (n.setSlideClasses(i), void n.asNavFor(i)) : void n.slideHandler(i)
    }, t.prototype.slideHandler = function(e, t, n) {
        var o, i, r, s, a = null,
            l = this;
        return t = t || !1, l.animating === !0 && l.options.waitForAnimate === !0 || l.options.fade === !0 && l.currentSlide === e || l.slideCount <= l.options.slidesToShow ? void 0 : (t === !1 && l.asNavFor(e), o = e, a = l.getLeft(o), s = l.getLeft(l.currentSlide), l.currentLeft = null === l.swipeLeft ? s : l.swipeLeft, l.options.infinite === !1 && l.options.centerMode === !1 && (0 > e || e > l.getDotCount() * l.options.slidesToScroll) ? void(l.options.fade === !1 && (o = l.currentSlide, n !== !0 ? l.animateSlide(s, function() {
            l.postSlide(o)
        }) : l.postSlide(o))) : l.options.infinite === !1 && l.options.centerMode === !0 && (0 > e || e > l.slideCount - l.options.slidesToScroll) ? void(l.options.fade === !1 && (o = l.currentSlide, n !== !0 ? l.animateSlide(s, function() {
            l.postSlide(o)
        }) : l.postSlide(o))) : (l.options.autoplay === !0 && clearInterval(l.autoPlayTimer), i = 0 > o ? 0 !== l.slideCount % l.options.slidesToScroll ? l.slideCount - l.slideCount % l.options.slidesToScroll : l.slideCount + o : o >= l.slideCount ? 0 !== l.slideCount % l.options.slidesToScroll ? 0 : o - l.slideCount : o, l.animating = !0, l.$slider.trigger("beforeChange", [l, l.currentSlide, i]), r = l.currentSlide, l.currentSlide = i, l.setSlideClasses(l.currentSlide), l.updateDots(), l.updateArrows(), l.options.fade === !0 ? (n !== !0 ? (l.fadeSlideOut(r), l.fadeSlide(i, function() {
            l.postSlide(i)
        })) : l.postSlide(i), void l.animateHeight()) : void(n !== !0 ? l.animateSlide(a, function() {
            l.postSlide(i)
        }) : l.postSlide(i))))
    }, t.prototype.startLoad = function() {
        var e = this;
        e.options.arrows === !0 && e.slideCount > e.options.slidesToShow && (e.$prevArrow.hide(), e.$nextArrow.hide()), e.options.dots === !0 && e.slideCount > e.options.slidesToShow && e.$dots.hide(), e.$slider.addClass("slick-loading")
    }, t.prototype.swipeDirection = function() {
        var e, t, n, o, i = this;
        return e = i.touchObject.startX - i.touchObject.curX, t = i.touchObject.startY - i.touchObject.curY, n = Math.atan2(t, e), o = Math.round(180 * n / Math.PI), 0 > o && (o = 360 - Math.abs(o)), 45 >= o && o >= 0 ? i.options.rtl === !1 ? "left" : "right" : 360 >= o && o >= 315 ? i.options.rtl === !1 ? "left" : "right" : o >= 135 && 225 >= o ? i.options.rtl === !1 ? "right" : "left" : i.options.verticalSwiping === !0 ? o >= 35 && 135 >= o ? "left" : "right" : "vertical"
    }, t.prototype.swipeEnd = function() {
        var e, t = this;
        if (t.dragging = !1, t.shouldClick = t.touchObject.swipeLength > 10 ? !1 : !0, void 0 === t.touchObject.curX) return !1;
        if (t.touchObject.edgeHit === !0 && t.$slider.trigger("edge", [t, t.swipeDirection()]), t.touchObject.swipeLength >= t.touchObject.minSwipe) switch (t.swipeDirection()) {
            case "left":
                e = t.options.swipeToSlide ? t.checkNavigable(t.currentSlide + t.getSlideCount()) : t.currentSlide + t.getSlideCount(), t.slideHandler(e), t.currentDirection = 0, t.touchObject = {}, t.$slider.trigger("swipe", [t, "left"]);
                break;
            case "right":
                e = t.options.swipeToSlide ? t.checkNavigable(t.currentSlide - t.getSlideCount()) : t.currentSlide - t.getSlideCount(), t.slideHandler(e), t.currentDirection = 1, t.touchObject = {}, t.$slider.trigger("swipe", [t, "right"])
        } else t.touchObject.startX !== t.touchObject.curX && (t.slideHandler(t.currentSlide), t.touchObject = {})
    }, t.prototype.swipeHandler = function(e) {
        var t = this;
        if (!(t.options.swipe === !1 || "ontouchend" in document && t.options.swipe === !1 || t.options.draggable === !1 && -1 !== e.type.indexOf("mouse"))) switch (t.touchObject.fingerCount = e.originalEvent && void 0 !== e.originalEvent.touches ? e.originalEvent.touches.length : 1, t.touchObject.minSwipe = t.listWidth / t.options.touchThreshold, t.options.verticalSwiping === !0 && (t.touchObject.minSwipe = t.listHeight / t.options.touchThreshold), e.data.action) {
            case "start":
                t.swipeStart(e);
                break;
            case "move":
                t.swipeMove(e);
                break;
            case "end":
                t.swipeEnd(e)
        }
    }, t.prototype.swipeMove = function(e) {
        var t, n, o, i, r, s = this;
        return r = void 0 !== e.originalEvent ? e.originalEvent.touches : null, !s.dragging || r && 1 !== r.length ? !1 : (t = s.getLeft(s.currentSlide), s.touchObject.curX = void 0 !== r ? r[0].pageX : e.clientX, s.touchObject.curY = void 0 !== r ? r[0].pageY : e.clientY, s.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(s.touchObject.curX - s.touchObject.startX, 2))), s.options.verticalSwiping === !0 && (s.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(s.touchObject.curY - s.touchObject.startY, 2)))), n = s.swipeDirection(), "vertical" !== n ? (void 0 !== e.originalEvent && s.touchObject.swipeLength > 4 && e.preventDefault(), i = (s.options.rtl === !1 ? 1 : -1) * (s.touchObject.curX > s.touchObject.startX ? 1 : -1), s.options.verticalSwiping === !0 && (i = s.touchObject.curY > s.touchObject.startY ? 1 : -1), o = s.touchObject.swipeLength, s.touchObject.edgeHit = !1, s.options.infinite === !1 && (0 === s.currentSlide && "right" === n || s.currentSlide >= s.getDotCount() && "left" === n) && (o = s.touchObject.swipeLength * s.options.edgeFriction, s.touchObject.edgeHit = !0), s.swipeLeft = s.options.vertical === !1 ? t + o * i : t + o * (s.$list.height() / s.listWidth) * i, s.options.verticalSwiping === !0 && (s.swipeLeft = t + o * i), s.options.fade === !0 || s.options.touchMove === !1 ? !1 : s.animating === !0 ? (s.swipeLeft = null, !1) : void s.setCSS(s.swipeLeft)) : void 0)
    }, t.prototype.swipeStart = function(e) {
        var t, n = this;
        return 1 !== n.touchObject.fingerCount || n.slideCount <= n.options.slidesToShow ? (n.touchObject = {}, !1) : (void 0 !== e.originalEvent && void 0 !== e.originalEvent.touches && (t = e.originalEvent.touches[0]), n.touchObject.startX = n.touchObject.curX = void 0 !== t ? t.pageX : e.clientX, n.touchObject.startY = n.touchObject.curY = void 0 !== t ? t.pageY : e.clientY, void(n.dragging = !0))
    }, t.prototype.unfilterSlides = t.prototype.slickUnfilter = function() {
        var e = this;
        null !== e.$slidesCache && (e.unload(), e.$slideTrack.children(this.options.slide).detach(), e.$slidesCache.appendTo(e.$slideTrack), e.reinit())
    }, t.prototype.unload = function() {
        var t = this;
        e(".slick-cloned", t.$slider).remove(), t.$dots && t.$dots.remove(), t.$prevArrow && t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.remove(), t.$nextArrow && t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.remove(), t.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden", "true").css("width", "")
    }, t.prototype.unslick = function(e) {
        var t = this;
        t.$slider.trigger("unslick", [t, e]), t.destroy()
    }, t.prototype.updateArrows = function() {
        var e, t = this;
        e = Math.floor(t.options.slidesToShow / 2), t.options.arrows === !0 && t.slideCount > t.options.slidesToShow && !t.options.infinite && (t.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), t.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), 0 === t.currentSlide ? (t.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true"), t.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : t.currentSlide >= t.slideCount - t.options.slidesToShow && t.options.centerMode === !1 ? (t.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), t.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : t.currentSlide >= t.slideCount - 1 && t.options.centerMode === !0 && (t.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), t.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")))
    }, t.prototype.updateDots = function() {
        var e = this;
        null !== e.$dots && (e.$dots.find("li").removeClass("slick-active").attr("aria-hidden", "true"), e.$dots.find("li").eq(Math.floor(e.currentSlide / e.options.slidesToScroll)).addClass("slick-active").attr("aria-hidden", "false"))
    }, t.prototype.visibility = function() {
        var e = this;
        document[e.hidden] ? (e.paused = !0, e.autoPlayClear()) : e.options.autoplay === !0 && (e.paused = !1, e.autoPlay())
    }, t.prototype.initADA = function() {
        var t = this;
        t.$slides.add(t.$slideTrack.find(".slick-cloned")).attr({
            "aria-hidden": "true",
            tabindex: "-1"
        }).find("a, input, button, select").attr({
            tabindex: "-1"
        }), t.$slideTrack.attr("role", "listbox"), t.$slides.not(t.$slideTrack.find(".slick-cloned")).each(function(n) {
            e(this).attr({
                role: "option",
                "aria-describedby": "slick-slide" + t.instanceUid + n
            })
        }), null !== t.$dots && t.$dots.attr("role", "tablist").find("li").each(function(n) {
            e(this).attr({
                role: "presentation",
                "aria-selected": "false",
                "aria-controls": "navigation" + t.instanceUid + n,
                id: "slick-slide" + t.instanceUid + n
            })
        }).first().attr("aria-selected", "true").end().find("button").attr("role", "button").end().closest("div").attr("role", "toolbar"), t.activateADA()
    }, t.prototype.activateADA = function() {
        var e = this,
            t = e.$slider.find("*").is(":focus");
        e.$slideTrack.find(".slick-active").attr({
            "aria-hidden": "false",
            tabindex: "0"
        }).find("a, input, button, select").attr({
            tabindex: "0"
        }), t && e.$slideTrack.find(".slick-active").focus()
    }, t.prototype.focusHandler = function() {
        var t = this;
        t.$slider.on("focus.slick blur.slick", "*", function(n) {
            n.stopImmediatePropagation();
            var o = e(this);
            setTimeout(function() {
                t.isPlay && (o.is(":focus") ? (t.autoPlayClear(), t.paused = !0) : (t.paused = !1, t.autoPlay()))
            }, 0)
        })
    }, e.fn.slick = function() {
        var e, n = this,
            o = arguments[0],
            i = Array.prototype.slice.call(arguments, 1),
            r = n.length,
            s = 0;
        for (s; r > s; s++)
            if ("object" == typeof o || "undefined" == typeof o ? n[s].slick = new t(n[s], o) : e = n[s].slick[o].apply(n[s].slick, i), "undefined" != typeof e) return e;
        return n
    }
}),
function(e, t) {
    "use strict";
    e.fn.popup = function(t) {
        var n = this.selector,
            o = new e.Popup(t);
        return e(document).on("click.popup", n, function(n) {
            var i = t && t.content ? t.content : e(this).attr("href");
            n.preventDefault(), o.open(i, void 0, this)
        }), this.each(function() {
            e(this).data("popup", o)
        })
    }, e.Popup = function(n) {
        function o(t) {
            var n;
            return e.each(t, function(e, t) {
                return t ? (n = t, !1) : void 0
            }), n
        }

        function i(t) {
            return "function" == typeof t ? "function" : t instanceof e ? "jQuery" : "#" === t.substr(0, 1) || "." === t.substr(0, 1) ? "inline" : -1 !== e.inArray(t.substr(t.length - 3), g) ? "image" : "http" === t.substr(0, 4) ? "external" : "ajax"
        }

        function r(n) {
            p && p.fadeOut("fast", function() {
                e(this).remove()
            });
            var o = !0;
            void 0 === d && (o = !1, d = e('<div class="' + h.o.containerClass + '">'), f = e(h.o.markup).appendTo(d), u = e(h.o.closeContent).one("click", function() {
                h.close()
            }).appendTo(d), e(t).resize(h.center), d.appendTo(e("body")).css("opacity", 0));
            var i = e("." + h.o.contentClass, d);
            h.width ? i.css("width", h.width, 10) : i.css("width", ""), h.height ? i.css("height", h.height, 10) : i.css("height", ""), f.hasClass(h.o.contentClass) ? f.html(n) : f.find("." + h.o.contentClass).html(n), o ? h.o.replaced.call(h, d, c) : h.o.show.call(h, d, c)
        }

        function s(e, t) {
            var n = new RegExp("[?&]" + e + "=([^&]*)").exec(t);
            return n && decodeURIComponent(n[1].replace(/\+/g, " "))
        }
        var a, l, c, d, u, p, f, h = this,
            m = {
                backClass: "popup_back",
                backOpacity: .7,
                containerClass: "popup_cont",
                closeContent: '<div class="popup_close">&times;</div>',
                markup: '<div class="popup"><div class="popup_content"/></div>',
                contentClass: "popup_content",
                preloaderContent: '<p class="preloader">Loading</p>',
                activeClass: "popup_active",
                hideFlash: !1,
                speed: 200,
                popupPlaceholderClass: "popup_placeholder",
                keepInlineChanges: !0,
                modal: !1,
                content: null,
                type: "auto",
                width: null,
                height: null,
                typeParam: "pt",
                widthParam: "pw",
                heightParam: "ph",
                beforeOpen: function(e) {},
                afterOpen: function() {},
                beforeClose: function() {},
                afterClose: function() {},
                error: function() {},
                show: function(e, t) {
                    var n = this;
                    n.center(), e.animate({
                        opacity: 1
                    }, n.o.speed, function() {
                        n.o.afterOpen.call(n)
                    })
                },
                replaced: function(e, t) {
                    this.center().o.afterOpen.call(this)
                },
                hide: function(e, t) {
                    void 0 !== e && e.animate({
                        opacity: 0
                    }, this.o.speed)
                },
                types: {
                    inline: function(t, n) {
                        var o = e(t);
                        o.addClass(h.o.popupPlaceholderClass), h.o.keepInlineChanges || (l = o.html()), n.call(this, o.children())
                    },
                    image: function(t, n) {
                        var o = this;
                        e("<img />").one("load", function() {
                            var e = this;
                            setTimeout(function() {
                                n.call(o, e)
                            }, 0)
                        }).one("error", function() {
                            h.o.error.call(h, t, "image")
                        }).attr("src", t).each(function() {
                            this.complete && e(this).trigger("load")
                        })
                    },
                    external: function(t, n) {
                        var o = e("<iframe />").attr({
                            src: t,
                            frameborder: 0,
                            width: h.width,
                            height: h.height
                        });
                        n.call(this, o)
                    },
                    html: function(e, t) {
                        t.call(this, e)
                    },
                    jQuery: function(e, t) {
                        t.call(this, e.html())
                    },
                    "function": function(e, t) {
                        t.call(this, e.call(h))
                    },
                    ajax: function(t, n) {
                        e.ajax({
                            url: t,
                            success: function(e) {
                                n.call(this, e)
                            },
                            error: function(e) {
                                h.o.error.call(h, t, "ajax")
                            }
                        })
                    }
                }
            },
            g = ["png", "jpg", "gif"];
        h.ele = void 0, h.o = e.extend(!0, {}, m, n), h.open = function(t, n, l) {
            if (t = void 0 === t || "#" === t ? h.o.content : t, null === t) return h.o.error.call(h, t, a), !1;
            if (void 0 !== l && (h.ele && h.o.activeClass && e(h.ele).removeClass(h.o.activeClass), h.ele = l, h.ele && h.o.activeClass && e(h.ele).addClass(h.o.activeClass)), void 0 === c && (c = e('<div class="' + h.o.backClass + '"/>').appendTo(e("body")).css("opacity", 0).animate({
                    opacity: h.o.backOpacity
                }, h.o.speed), h.o.modal || c.one("click.popup", function() {
                    h.close()
                }), h.o.hideFlash && e("object, embed").css("visibility", "hidden"), h.o.preloaderContent && (p = e(h.o.preloaderContent).appendTo(e("body")))), n = o([n, h.o.type]), n = "auto" === n ? i(t) : n, a = n, h.width = h.o.width ? h.o.width : null, h.height = h.o.height ? h.o.height : null, -1 === e.inArray(n, ["inline", "jQuery", "function"])) {
                var d = s(h.o.typeParam, t),
                    u = s(h.o.widthParam, t),
                    f = s(h.o.heightParam, t);
                n = null !== d ? d : n, h.width = null !== u ? u : h.width, h.height = null !== f ? f : h.height
            }
            h.o.beforeOpen.call(h, n), h.o.types[n] ? h.o.types[n].call(h, t, r) : h.o.types.ajax.call(h, t, r)
        }, h.close = function() {
            return h.o.beforeClose.call(h), "inline" === a && h.o.keepInlineChanges && (l = e("." + h.o.contentClass).html()), void 0 !== c && c.animate({
                opacity: 0
            }, h.o.speed, function() {
                h.cleanUp()
            }), h.o.hide.call(h, d, c), h
        }, h.cleanUp = function() {
            c.add(d).remove(), d = c = void 0, e(t).unbind("resize", h.center), h.o.hideFlash && e("object, embed").css("visibility", "visible"), h.ele && h.o.activeClass && e(h.ele).removeClass(h.o.activeClass);
            var n = e("." + h.o.popupPlaceholderClass);
            return "inline" == a && n.length && n.html(l).removeClass(h.o.popupPlaceholderClass), a = null, h.o.afterClose.call(h), h
        }, h.center = function() {
            return d.css(h.getCenter()), c.css({
                height: document.documentElement.clientHeight
            }), h
        }, h.getCenter = function() {
            var e = d.children().outerWidth(!0),
                t = d.children().outerHeight(!0),
                n = document.documentElement.clientWidth,
                o = document.documentElement.clientHeight;
            return {
                top: .5 * o - .5 * t,
                left: .5 * n - .5 * e
            }
        }
    }
}(jQuery, window),
function(e, t, n) {
    function o(t, n) {
        this.bodyOverflowX, this.callbacks = {
            hide: [],
            show: []
        }, this.checkInterval = null, this.Content, this.$el = e(t), this.$elProxy, this.elProxyPosition, this.enabled = !0, this.options = e.extend({}, l, n), this.mouseIsOverProxy = !1, this.namespace = "tooltipster-" + Math.round(1e5 * Math.random()), this.Status = "hidden", this.timerHide = null, this.timerShow = null, this.$tooltip, this.options.iconTheme = this.options.iconTheme.replace(".", ""), this.options.theme = this.options.theme.replace(".", ""), this._init()
    }

    function i(t, n) {
        var o = !0;
        return e.each(t, function(e, i) {
            return "undefined" == typeof n[e] || t[e] !== n[e] ? (o = !1, !1) : void 0
        }), o
    }

    function r() {
        return !d && c
    }

    function s() {
        var e = n.body || n.documentElement,
            t = e.style,
            o = "transition";
        if ("string" == typeof t[o]) return !0;
        v = ["Moz", "Webkit", "Khtml", "O", "ms"], o = o.charAt(0).toUpperCase() + o.substr(1);
        for (var i = 0; i < v.length; i++)
            if ("string" == typeof t[v[i] + o]) return !0;
        return !1
    }
    var a = "tooltipster",
        l = {
            animation: "fade",
            arrow: !0,
            arrowColor: "",
            autoClose: !0,
            content: null,
            contentAsHTML: !1,
            contentCloning: !0,
            debug: !0,
            delay: 200,
            minWidth: 0,
            maxWidth: null,
            functionInit: function(e, t) {},
            functionBefore: function(e, t) {
                t()
            },
            functionReady: function(e, t) {},
            functionAfter: function(e) {},
            hideOnClick: !1,
            icon: "(?)",
            iconCloning: !0,
            iconDesktop: !1,
            iconTouch: !1,
            iconTheme: "tooltipster-icon",
            interactive: !1,
            interactiveTolerance: 350,
            multiple: !1,
            offsetX: 0,
            offsetY: 0,
            onlyOne: !1,
            position: "top",
            positionTracker: !1,
            positionTrackerCallback: function(e) {
                "hover" == this.option("trigger") && this.option("autoClose") && this.hide()
            },
            restoration: "current",
            speed: 350,
            timer: 0,
            theme: "tooltipster-default",
            touchDevices: !0,
            trigger: "hover",
            updateAnimation: !0
        };
    o.prototype = {
        _init: function() {
            var t = this;
            if (n.querySelector) {
                var o = null;
                void 0 === t.$el.data("tooltipster-initialTitle") && (o = t.$el.attr("title"), void 0 === o && (o = null), t.$el.data("tooltipster-initialTitle", o)), null !== t.options.content ? t._content_set(t.options.content) : t._content_set(o);
                var i = t.options.functionInit.call(t.$el, t.$el, t.Content);
                "undefined" != typeof i && t._content_set(i), t.$el.removeAttr("title").addClass("tooltipstered"), !c && t.options.iconDesktop || c && t.options.iconTouch ? ("string" == typeof t.options.icon ? (t.$elProxy = e('<span class="' + t.options.iconTheme + '"></span>'), t.$elProxy.text(t.options.icon)) : t.options.iconCloning ? t.$elProxy = t.options.icon.clone(!0) : t.$elProxy = t.options.icon, t.$elProxy.insertAfter(t.$el)) : t.$elProxy = t.$el, "hover" == t.options.trigger ? (t.$elProxy.on("mouseenter." + t.namespace, function() {
                    (!r() || t.options.touchDevices) && (t.mouseIsOverProxy = !0, t._show())
                }).on("mouseleave." + t.namespace, function() {
                    (!r() || t.options.touchDevices) && (t.mouseIsOverProxy = !1)
                }), c && t.options.touchDevices && t.$elProxy.on("touchstart." + t.namespace, function() {
                    t._showNow()
                })) : "click" == t.options.trigger && t.$elProxy.on("click." + t.namespace, function() {
                    (!r() || t.options.touchDevices) && t._show()
                })
            }
        },
        _show: function() {
            var e = this;
            "shown" != e.Status && "appearing" != e.Status && (e.options.delay ? e.timerShow = setTimeout(function() {
                ("click" == e.options.trigger || "hover" == e.options.trigger && e.mouseIsOverProxy) && e._showNow()
            }, e.options.delay) : e._showNow())
        },
        _showNow: function(n) {
            var o = this;
            o.options.functionBefore.call(o.$el, o.$el, function() {
                if (o.enabled && null !== o.Content) {
                    n && o.callbacks.show.push(n), o.callbacks.hide = [], clearTimeout(o.timerShow), o.timerShow = null, clearTimeout(o.timerHide), o.timerHide = null, o.options.onlyOne && e(".tooltipstered").not(o.$el).each(function(t, n) {
                        var o = e(n),
                            i = o.data("tooltipster-ns");
                        e.each(i, function(e, t) {
                            var n = o.data(t),
                                i = n.status(),
                                r = n.option("autoClose");
                            "hidden" !== i && "disappearing" !== i && r && n.hide()
                        })
                    });
                    var i = function() {
                        o.Status = "shown", e.each(o.callbacks.show, function(e, t) {
                            t.call(o.$el)
                        }), o.callbacks.show = []
                    };
                    if ("hidden" !== o.Status) {
                        var r = 0;
                        "disappearing" === o.Status ? (o.Status = "appearing", s() ? (o.$tooltip.clearQueue().removeClass("tooltipster-dying").addClass("tooltipster-" + o.options.animation + "-show"), o.options.speed > 0 && o.$tooltip.delay(o.options.speed), o.$tooltip.queue(i)) : o.$tooltip.stop().fadeIn(i)) : "shown" === o.Status && i()
                    } else {
                        o.Status = "appearing";
                        var r = o.options.speed;
                        o.bodyOverflowX = e("body").css("overflow-x"), e("body").css("overflow-x", "hidden");
                        var a = "tooltipster-" + o.options.animation,
                            l = "-webkit-transition-duration: " + o.options.speed + "ms; -webkit-animation-duration: " + o.options.speed + "ms; -moz-transition-duration: " + o.options.speed + "ms; -moz-animation-duration: " + o.options.speed + "ms; -o-transition-duration: " + o.options.speed + "ms; -o-animation-duration: " + o.options.speed + "ms; -ms-transition-duration: " + o.options.speed + "ms; -ms-animation-duration: " + o.options.speed + "ms; transition-duration: " + o.options.speed + "ms; animation-duration: " + o.options.speed + "ms;",
                            d = o.options.minWidth ? "min-width:" + Math.round(o.options.minWidth) + "px;" : "",
                            u = o.options.maxWidth ? "max-width:" + Math.round(o.options.maxWidth) + "px;" : "",
                            p = o.options.interactive ? "pointer-events: auto;" : "";
                        if (o.$tooltip = e('<div class="tooltipster-base ' + o.options.theme + '" style="' + d + " " + u + " " + p + " " + l + '"><div class="tooltipster-content"></div></div>'), s() && o.$tooltip.addClass(a), o._content_insert(), o.$tooltip.appendTo("body"), o.reposition(), o.options.functionReady.call(o.$el, o.$el, o.$tooltip), s() ? (o.$tooltip.addClass(a + "-show"), o.options.speed > 0 && o.$tooltip.delay(o.options.speed), o.$tooltip.queue(i)) : o.$tooltip.css("display", "none").fadeIn(o.options.speed, i), o._interval_set(), e(t).on("scroll." + o.namespace + " resize." + o.namespace, function() {
                                o.reposition()
                            }), o.options.autoClose)
                            if (e("body").off("." + o.namespace), "hover" == o.options.trigger) {
                                if (c && setTimeout(function() {
                                        e("body").on("touchstart." + o.namespace, function() {
                                            o.hide()
                                        })
                                    }, 0), o.options.interactive) {
                                    c && o.$tooltip.on("touchstart." + o.namespace, function(e) {
                                        e.stopPropagation()
                                    });
                                    var f = null;
                                    o.$elProxy.add(o.$tooltip).on("mouseleave." + o.namespace + "-autoClose", function() {
                                        clearTimeout(f), f = setTimeout(function() {
                                            o.hide()
                                        }, o.options.interactiveTolerance)
                                    }).on("mouseenter." + o.namespace + "-autoClose", function() {
                                        clearTimeout(f)
                                    })
                                } else o.$elProxy.on("mouseleave." + o.namespace + "-autoClose", function() {
                                    o.hide()
                                });
                                o.options.hideOnClick && o.$elProxy.on("click." + o.namespace + "-autoClose", function() {
                                    o.hide()
                                })
                            } else "click" == o.options.trigger && (setTimeout(function() {
                                e("body").on("click." + o.namespace + " touchstart." + o.namespace, function() {
                                    o.hide()
                                })
                            }, 0), o.options.interactive && o.$tooltip.on("click." + o.namespace + " touchstart." + o.namespace, function(e) {
                                e.stopPropagation()
                            }))
                    }
                    o.options.timer > 0 && (o.timerHide = setTimeout(function() {
                        o.timerHide = null, o.hide()
                    }, o.options.timer + r))
                }
            })
        },
        _interval_set: function() {
            var t = this;
            t.checkInterval = setInterval(function() {
                if (0 === e("body").find(t.$el).length || 0 === e("body").find(t.$elProxy).length || "hidden" == t.Status || 0 === e("body").find(t.$tooltip).length)("shown" == t.Status || "appearing" == t.Status) && t.hide(), t._interval_cancel();
                else if (t.options.positionTracker) {
                    var n = t._repositionInfo(t.$elProxy),
                        o = !1;
                    i(n.dimension, t.elProxyPosition.dimension) && ("fixed" === t.$elProxy.css("position") ? i(n.position, t.elProxyPosition.position) && (o = !0) : i(n.offset, t.elProxyPosition.offset) && (o = !0)), o || (t.reposition(), t.options.positionTrackerCallback.call(t, t.$el))
                }
            }, 200)
        },
        _interval_cancel: function() {
            clearInterval(this.checkInterval), this.checkInterval = null
        },
        _content_set: function(e) {
            "object" == typeof e && null !== e && this.options.contentCloning && (e = e.clone(!0)), this.Content = e
        },
        _content_insert: function() {
            var e = this,
                t = this.$tooltip.find(".tooltipster-content");
            "string" != typeof e.Content || e.options.contentAsHTML ? t.empty().append(e.Content) : t.text(e.Content)
        },
        _update: function(e) {
            var t = this;
            t._content_set(e), null !== t.Content ? "hidden" !== t.Status && (t._content_insert(), t.reposition(), t.options.updateAnimation && (s() ? (t.$tooltip.css({
                width: "",
                "-webkit-transition": "all " + t.options.speed + "ms, width 0ms, height 0ms, left 0ms, top 0ms",
                "-moz-transition": "all " + t.options.speed + "ms, width 0ms, height 0ms, left 0ms, top 0ms",
                "-o-transition": "all " + t.options.speed + "ms, width 0ms, height 0ms, left 0ms, top 0ms",
                "-ms-transition": "all " + t.options.speed + "ms, width 0ms, height 0ms, left 0ms, top 0ms",
                transition: "all " + t.options.speed + "ms, width 0ms, height 0ms, left 0ms, top 0ms"
            }).addClass("tooltipster-content-changing"), setTimeout(function() {
                "hidden" != t.Status && (t.$tooltip.removeClass("tooltipster-content-changing"), setTimeout(function() {
                    "hidden" !== t.Status && t.$tooltip.css({
                        "-webkit-transition": t.options.speed + "ms",
                        "-moz-transition": t.options.speed + "ms",
                        "-o-transition": t.options.speed + "ms",
                        "-ms-transition": t.options.speed + "ms",
                        transition: t.options.speed + "ms"
                    })
                }, t.options.speed))
            }, t.options.speed)) : t.$tooltip.fadeTo(t.options.speed, .5, function() {
                "hidden" != t.Status && t.$tooltip.fadeTo(t.options.speed, 1)
            }))) : t.hide()
        },
        _repositionInfo: function(e) {
            return {
                dimension: {
                    height: e.outerHeight(!1),
                    width: e.outerWidth(!1)
                },
                offset: e.offset(),
                position: {
                    left: parseInt(e.css("left")),
                    top: parseInt(e.css("top"))
                }
            }
        },
        hide: function(n) {
            var o = this;
            n && o.callbacks.hide.push(n), o.callbacks.show = [], clearTimeout(o.timerShow), o.timerShow = null, clearTimeout(o.timerHide), o.timerHide = null;
            var i = function() {
                e.each(o.callbacks.hide, function(e, t) {
                    t.call(o.$el)
                }), o.callbacks.hide = []
            };
            if ("shown" == o.Status || "appearing" == o.Status) {
                o.Status = "disappearing";
                var r = function() {
                    o.Status = "hidden", "object" == typeof o.Content && null !== o.Content && o.Content.detach(), o.$tooltip.remove(), o.$tooltip = null, e(t).off("." + o.namespace), e("body").off("." + o.namespace).css("overflow-x", o.bodyOverflowX), e("body").off("." + o.namespace), o.$elProxy.off("." + o.namespace + "-autoClose"), o.options.functionAfter.call(o.$el, o.$el), i()
                };
                s() ? (o.$tooltip.clearQueue().removeClass("tooltipster-" + o.options.animation + "-show").addClass("tooltipster-dying"), o.options.speed > 0 && o.$tooltip.delay(o.options.speed), o.$tooltip.queue(r)) : o.$tooltip.stop().fadeOut(o.options.speed, r)
            } else "hidden" == o.Status && i();
            return o
        },
        show: function(e) {
            return this._showNow(e), this
        },
        update: function(e) {
            return this.content(e)
        },
        content: function(e) {
            return "undefined" == typeof e ? this.Content : (this._update(e), this)
        },
        reposition: function() {
            function n() {
                var n = e(t).scrollLeft();
                0 > E - n && (r = E - n, E = n), E + l - n > s && (r = E - (s + n - l), E = s + n - l)
            }

            function o(n, o) {
                a.offset.top - e(t).scrollTop() - c - A - 12 < 0 && o.indexOf("top") > -1 && (O = n), a.offset.top + a.dimension.height + c + 12 + A > e(t).scrollTop() + e(t).height() && o.indexOf("bottom") > -1 && (O = n, R = a.offset.top - c - A - 12)
            }
            var i = this;
            if (0 !== e("body").find(i.$tooltip).length) {
                i.$tooltip.css("width", ""), i.elProxyPosition = i._repositionInfo(i.$elProxy);
                var r = null,
                    s = e(t).width(),
                    a = i.elProxyPosition,
                    l = i.$tooltip.outerWidth(!1),
                    c = (i.$tooltip.innerWidth() + 1, i.$tooltip.outerHeight(!1));
                if (i.$elProxy.is("area")) {
                    var d = i.$elProxy.attr("shape"),
                        u = i.$elProxy.parent().attr("name"),
                        p = e('img[usemap="#' + u + '"]'),
                        f = p.offset().left,
                        h = p.offset().top,
                        m = void 0 !== i.$elProxy.attr("coords") ? i.$elProxy.attr("coords").split(",") : void 0;
                    if ("circle" == d) {
                        var g = parseInt(m[0]),
                            v = parseInt(m[1]),
                            y = parseInt(m[2]);
                        a.dimension.height = 2 * y, a.dimension.width = 2 * y, a.offset.top = h + v - y, a.offset.left = f + g - y
                    } else if ("rect" == d) {
                        var g = parseInt(m[0]),
                            v = parseInt(m[1]),
                            w = parseInt(m[2]),
                            b = parseInt(m[3]);
                        a.dimension.height = b - v, a.dimension.width = w - g, a.offset.top = h + v, a.offset.left = f + g
                    } else if ("poly" == d) {
                        for (var _ = 0, x = 0, C = 0, k = 0, T = "even", S = 0; S < m.length; S++) {
                            var $ = parseInt(m[S]);
                            "even" == T ? ($ > C && (C = $, 0 === S && (_ = C)), _ > $ && (_ = $), T = "odd") : ($ > k && (k = $, 1 == S && (x = k)), x > $ && (x = $), T = "even")
                        }
                        a.dimension.height = k - x, a.dimension.width = C - _, a.offset.top = h + x, a.offset.left = f + _
                    } else a.dimension.height = p.outerHeight(!1), a.dimension.width = p.outerWidth(!1), a.offset.top = h, a.offset.left = f
                }
                var E = 0,
                    N = 0,
                    R = 0,
                    A = parseInt(i.options.offsetY),
                    D = parseInt(i.options.offsetX),
                    O = i.options.position;
                if ("top" == O) {
                    var j = a.offset.left + l - (a.offset.left + a.dimension.width);
                    E = a.offset.left + D - j / 2, R = a.offset.top - c - A - 12, n(), o("bottom", "top")
                }
                if ("top-left" == O && (E = a.offset.left + D, R = a.offset.top - c - A - 12, n(), o("bottom-left", "top-left")), "top-right" == O && (E = a.offset.left + a.dimension.width + D - l, R = a.offset.top - c - A - 12, n(), o("bottom-right", "top-right")), "bottom" == O) {
                    var j = a.offset.left + l - (a.offset.left + a.dimension.width);
                    E = a.offset.left - j / 2 + D, R = a.offset.top + a.dimension.height + A + 12, n(), o("top", "bottom")
                }
                if ("bottom-left" == O && (E = a.offset.left + D, R = a.offset.top + a.dimension.height + A + 12, n(), o("top-left", "bottom-left")), "bottom-right" == O && (E = a.offset.left + a.dimension.width + D - l, R = a.offset.top + a.dimension.height + A + 12, n(), o("top-right", "bottom-right")), "left" == O) {
                    E = a.offset.left - D - l - 12, N = a.offset.left + D + a.dimension.width + 12;
                    var I = a.offset.top + c - (a.offset.top + a.dimension.height);
                    if (R = a.offset.top - I / 2 - A, 0 > E && N + l > s) {
                        var P = 2 * parseFloat(i.$tooltip.css("border-width")),
                            L = l + E - P;
                        i.$tooltip.css("width", L + "px"), c = i.$tooltip.outerHeight(!1), E = a.offset.left - D - L - 12 - P, I = a.offset.top + c - (a.offset.top + a.dimension.height), R = a.offset.top - I / 2 - A
                    } else 0 > E && (E = a.offset.left + D + a.dimension.width + 12, r = "left")
                }
                if ("right" == O) {
                    E = a.offset.left + D + a.dimension.width + 12, N = a.offset.left - D - l - 12;
                    var I = a.offset.top + c - (a.offset.top + a.dimension.height);
                    if (R = a.offset.top - I / 2 - A, E + l > s && 0 > N) {
                        var P = 2 * parseFloat(i.$tooltip.css("border-width")),
                            L = s - E - P;
                        i.$tooltip.css("width", L + "px"), c = i.$tooltip.outerHeight(!1), I = a.offset.top + c - (a.offset.top + a.dimension.height), R = a.offset.top - I / 2 - A
                    } else E + l > s && (E = a.offset.left - D - l - 12, r = "right")
                }
                if (i.options.arrow) {
                    var H = "tooltipster-arrow-" + O;
                    if (i.options.arrowColor.length < 1) var F = i.$tooltip.css("background-color");
                    else var F = i.options.arrowColor;
                    if (r ? "left" == r ? (H = "tooltipster-arrow-right", r = "") : "right" == r ? (H = "tooltipster-arrow-left", r = "") : r = "left:" + Math.round(r) + "px;" : r = "", "top" == O || "top-left" == O || "top-right" == O) var M = parseFloat(i.$tooltip.css("border-bottom-width")),
                        z = i.$tooltip.css("border-bottom-color");
                    else if ("bottom" == O || "bottom-left" == O || "bottom-right" == O) var M = parseFloat(i.$tooltip.css("border-top-width")),
                        z = i.$tooltip.css("border-top-color");
                    else if ("left" == O) var M = parseFloat(i.$tooltip.css("border-right-width")),
                        z = i.$tooltip.css("border-right-color");
                    else if ("right" == O) var M = parseFloat(i.$tooltip.css("border-left-width")),
                        z = i.$tooltip.css("border-left-color");
                    else var M = parseFloat(i.$tooltip.css("border-bottom-width")),
                        z = i.$tooltip.css("border-bottom-color");
                    M > 1 && M++;
                    var W = "";
                    if (0 !== M) {
                        var q = "",
                            B = "border-color: " + z + ";"; - 1 !== H.indexOf("bottom") ? q = "margin-top: -" + Math.round(M) + "px;" : -1 !== H.indexOf("top") ? q = "margin-bottom: -" + Math.round(M) + "px;" : -1 !== H.indexOf("left") ? q = "margin-right: -" + Math.round(M) + "px;" : -1 !== H.indexOf("right") && (q = "margin-left: -" + Math.round(M) + "px;"), W = '<span class="tooltipster-arrow-border" style="' + q + " " + B + ';"></span>'
                    }
                    i.$tooltip.find(".tooltipster-arrow").remove();
                    var U = '<div class="' + H + ' tooltipster-arrow" style="' + r + '">' + W + '<span style="border-color:' + F + ';"></span></div>';
                    i.$tooltip.append(U)
                }
                i.$tooltip.css({
                    top: Math.round(R) + "px",
                    left: Math.round(E) + "px"
                })
            }
            return i
        },
        enable: function() {
            return this.enabled = !0, this
        },
        disable: function() {
            return this.hide(), this.enabled = !1, this
        },
        destroy: function() {
            var t = this;
            t.hide(), t.$el[0] !== t.$elProxy[0] && t.$elProxy.remove(), t.$el.removeData(t.namespace).off("." + t.namespace);
            var n = t.$el.data("tooltipster-ns");
            if (1 === n.length) {
                var o = null;
                "previous" === t.options.restoration ? o = t.$el.data("tooltipster-initialTitle") : "current" === t.options.restoration && (o = "string" == typeof t.Content ? t.Content : e("<div></div>").append(t.Content).html()), o && t.$el.attr("title", o), t.$el.removeClass("tooltipstered").removeData("tooltipster-ns").removeData("tooltipster-initialTitle")
            } else n = e.grep(n, function(e, n) {
                return e !== t.namespace
            }), t.$el.data("tooltipster-ns", n);
            return t
        },
        elementIcon: function() {
            return this.$el[0] !== this.$elProxy[0] ? this.$elProxy[0] : void 0
        },
        elementTooltip: function() {
            return this.$tooltip ? this.$tooltip[0] : void 0
        },
        option: function(e, t) {
            return "undefined" == typeof t ? this.options[e] : (this.options[e] = t, this)
        },
        status: function() {
            return this.Status
        }
    }, e.fn[a] = function() {
        var t = arguments;
        if (0 === this.length) {
            if ("string" == typeof t[0]) {
                var n = !0;
                switch (t[0]) {
                    case "setDefaults":
                        e.extend(l, t[1]);
                        break;
                    default:
                        n = !1
                }
                return n ? !0 : this
            }
            return this
        }
        if ("string" == typeof t[0]) {
            var i = "#*$~&";
            return this.each(function() {
                var n = e(this).data("tooltipster-ns"),
                    o = n ? e(this).data(n[0]) : null;
                if (!o) throw new Error("You called Tooltipster's \"" + t[0] + '" method on an uninitialized element');
                if ("function" != typeof o[t[0]]) throw new Error('Unknown method .tooltipster("' + t[0] + '")');
                var r = o[t[0]](t[1], t[2]);
                return r !== o ? (i = r, !1) : void 0
            }), "#*$~&" !== i ? i : this
        }
        var r = [],
            s = t[0] && "undefined" != typeof t[0].multiple,
            a = s && t[0].multiple || !s && l.multiple,
            c = t[0] && "undefined" != typeof t[0].debug,
            d = c && t[0].debug || !c && l.debug;
        return this.each(function() {
            var n = !1,
                i = e(this).data("tooltipster-ns"),
                s = null;
            i ? a ? n = !0 : d && console.log('Tooltipster: one or more tooltips are already attached to this element: ignoring. Use the "multiple" option to attach more tooltips.') : n = !0, n && (s = new o(this, t[0]), i || (i = []), i.push(s.namespace), e(this).data("tooltipster-ns", i), e(this).data(s.namespace, s)), r.push(s)
        }), a ? r : this
    };
    var c = !!("ontouchstart" in t),
        d = !1;
    e("body").one("mousemove", function() {
        d = !0
    })
}(jQuery, window, document),
function(e, t, n, o) {
    "use strict";
    var i = n("html"),
        r = n(e),
        s = n(t),
        a = n.fancybox = function() {
            a.open.apply(this, arguments)
        },
        l = navigator.userAgent.match(/msie/i),
        c = null,
        d = t.createTouch !== o,
        u = function(e) {
            return e && e.hasOwnProperty && e instanceof n
        },
        p = function(e) {
            return e && "string" === n.type(e)
        },
        f = function(e) {
            return p(e) && e.indexOf("%") > 0
        },
        h = function(e) {
            return e && !(e.style.overflow && "hidden" === e.style.overflow) && (e.clientWidth && e.scrollWidth > e.clientWidth || e.clientHeight && e.scrollHeight > e.clientHeight)
        },
        m = function(e, t) {
            var n = parseInt(e, 10) || 0;
            return t && f(e) && (n = a.getViewport()[t] / 100 * n), Math.ceil(n)
        },
        g = function(e, t) {
            return m(e, t) + "px"
        };
    n.extend(a, {
        version: "2.1.5",
        defaults: {
            padding: 15,
            margin: 20,
            width: 800,
            height: 600,
            minWidth: 100,
            minHeight: 100,
            maxWidth: 9999,
            maxHeight: 9999,
            pixelRatio: 1,
            autoSize: !0,
            autoHeight: !1,
            autoWidth: !1,
            autoResize: !0,
            autoCenter: !d,
            fitToView: !0,
            aspectRatio: !1,
            topRatio: .5,
            leftRatio: .5,
            scrolling: "auto",
            wrapCSS: "",
            arrows: !0,
            closeBtn: !0,
            closeClick: !1,
            nextClick: !1,
            mouseWheel: !0,
            autoPlay: !1,
            playSpeed: 3e3,
            preload: 3,
            modal: !1,
            loop: !0,
            ajax: {
                dataType: "html",
                headers: {
                    "X-fancyBox": !0
                }
            },
            iframe: {
                scrolling: "auto",
                preload: !0
            },
            swf: {
                wmode: "transparent",
                allowfullscreen: "true",
                allowscriptaccess: "always"
            },
            keys: {
                next: {
                    13: "left",
                    34: "up",
                    39: "left",
                    40: "up"
                },
                prev: {
                    8: "right",
                    33: "down",
                    37: "right",
                    38: "down"
                },
                close: [27],
                play: [32],
                toggle: [70]
            },
            direction: {
                next: "left",
                prev: "right"
            },
            scrollOutside: !0,
            index: 0,
            type: null,
            href: null,
            content: null,
            title: null,
            tpl: {
                wrap: '<div class="fancybox-wrap" tabIndex="-1"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>',
                image: '<img class="fancybox-image" src="{href}" alt="" />',
                iframe: '<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen' + (l ? ' allowtransparency="true"' : "") + "></iframe>",
                error: '<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>',
                closeBtn: '<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>',
                next: '<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
                prev: '<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
            },
            openEffect: "fade",
            openSpeed: 250,
            openEasing: "swing",
            openOpacity: !0,
            openMethod: "zoomIn",
            closeEffect: "fade",
            closeSpeed: 250,
            closeEasing: "swing",
            closeOpacity: !0,
            closeMethod: "zoomOut",
            nextEffect: "elastic",
            nextSpeed: 250,
            nextEasing: "swing",
            nextMethod: "changeIn",
            prevEffect: "elastic",
            prevSpeed: 250,
            prevEasing: "swing",
            prevMethod: "changeOut",
            helpers: {
                overlay: !0,
                title: !0
            },
            onCancel: n.noop,
            beforeLoad: n.noop,
            afterLoad: n.noop,
            beforeShow: n.noop,
            afterShow: n.noop,
            beforeChange: n.noop,
            beforeClose: n.noop,
            afterClose: n.noop
        },
        group: {},
        opts: {},
        previous: null,
        coming: null,
        current: null,
        isActive: !1,
        isOpen: !1,
        isOpened: !1,
        wrap: null,
        skin: null,
        outer: null,
        inner: null,
        player: {
            timer: null,
            isActive: !1
        },
        ajaxLoad: null,
        imgPreload: null,
        transitions: {},
        helpers: {},
        open: function(e, t) {
            return e && (n.isPlainObject(t) || (t = {}), !1 !== a.close(!0)) ? (n.isArray(e) || (e = u(e) ? n(e).get() : [e]), n.each(e, function(i, r) {
                var s, l, c, d, f, h, m, g = {};
                "object" === n.type(r) && (r.nodeType && (r = n(r)), u(r) ? (g = {
                    href: r.data("fancybox-href") || r.attr("href"),
                    title: r.data("fancybox-title") || r.attr("title"),
                    isDom: !0,
                    element: r
                }, n.metadata && n.extend(!0, g, r.metadata())) : g = r), s = t.href || g.href || (p(r) ? r : null), l = t.title !== o ? t.title : g.title || "", c = t.content || g.content, d = c ? "html" : t.type || g.type, !d && g.isDom && (d = r.data("fancybox-type"), d || (f = r.prop("class").match(/fancybox\.(\w+)/), d = f ? f[1] : null)), p(s) && (d || (a.isImage(s) ? d = "image" : a.isSWF(s) ? d = "swf" : "#" === s.charAt(0) ? d = "inline" : p(r) && (d = "html", c = r)), "ajax" === d && (h = s.split(/\s+/, 2), s = h.shift(), m = h.shift())), c || ("inline" === d ? s ? c = n(p(s) ? s.replace(/.*(?=#[^\s]+$)/, "") : s) : g.isDom && (c = r) : "html" === d ? c = s : d || s || !g.isDom || (d = "inline", c = r)), n.extend(g, {
                    href: s,
                    type: d,
                    content: c,
                    title: l,
                    selector: m
                }), e[i] = g
            }), a.opts = n.extend(!0, {}, a.defaults, t), t.keys !== o && (a.opts.keys = t.keys ? n.extend({}, a.defaults.keys, t.keys) : !1), a.group = e, a._start(a.opts.index)) : void 0
        },
        cancel: function() {
            var e = a.coming;
            e && !1 !== a.trigger("onCancel") && (a.hideLoading(), a.ajaxLoad && a.ajaxLoad.abort(), a.ajaxLoad = null, a.imgPreload && (a.imgPreload.onload = a.imgPreload.onerror = null), e.wrap && e.wrap.stop(!0, !0).trigger("onReset").remove(), a.coming = null, a.current || a._afterZoomOut(e))
        },
        close: function(e) {
            a.cancel(), !1 !== a.trigger("beforeClose") && (a.unbindEvents(), a.isActive && (a.isOpen && e !== !0 ? (a.isOpen = a.isOpened = !1, a.isClosing = !0, n(".fancybox-item, .fancybox-nav").remove(), a.wrap.stop(!0, !0).removeClass("fancybox-opened"), a.transitions[a.current.closeMethod]()) : (n(".fancybox-wrap").stop(!0).trigger("onReset").remove(), a._afterZoomOut())))
        },
        play: function(e) {
            var t = function() {
                    clearTimeout(a.player.timer)
                },
                n = function() {
                    t(), a.current && a.player.isActive && (a.player.timer = setTimeout(a.next, a.current.playSpeed))
                },
                o = function() {
                    t(), s.unbind(".player"), a.player.isActive = !1, a.trigger("onPlayEnd")
                },
                i = function() {
                    a.current && (a.current.loop || a.current.index < a.group.length - 1) && (a.player.isActive = !0, s.bind({
                        "onCancel.player beforeClose.player": o,
                        "onUpdate.player": n,
                        "beforeLoad.player": t
                    }), n(), a.trigger("onPlayStart"))
                };
            e === !0 || !a.player.isActive && e !== !1 ? i() : o()
        },
        next: function(e) {
            var t = a.current;
            t && (p(e) || (e = t.direction.next), a.jumpto(t.index + 1, e, "next"))
        },
        prev: function(e) {
            var t = a.current;
            t && (p(e) || (e = t.direction.prev), a.jumpto(t.index - 1, e, "prev"))
        },
        jumpto: function(e, t, n) {
            var i = a.current;
            i && (e = m(e), a.direction = t || i.direction[e >= i.index ? "next" : "prev"], a.router = n || "jumpto", i.loop && (0 > e && (e = i.group.length + e % i.group.length), e %= i.group.length), i.group[e] !== o && (a.cancel(), a._start(e)))
        },
        reposition: function(e, t) {
            var o, i = a.current,
                r = i ? i.wrap : null;
            r && (o = a._getPosition(t), e && "scroll" === e.type ? (delete o.position, r.stop(!0, !0).animate(o, 200)) : (r.css(o), i.pos = n.extend({}, i.dim, o)))
        },
        update: function(e) {
            var t = e && e.type,
                n = !t || "orientationchange" === t;
            n && (clearTimeout(c), c = null), a.isOpen && !c && (c = setTimeout(function() {
                var o = a.current;
                o && !a.isClosing && (a.wrap.removeClass("fancybox-tmp"), (n || "load" === t || "resize" === t && o.autoResize) && a._setDimension(), "scroll" === t && o.canShrink || a.reposition(e), a.trigger("onUpdate"), c = null)
            }, n && !d ? 0 : 300))
        },
        toggle: function(e) {
            a.isOpen && (a.current.fitToView = "boolean" === n.type(e) ? e : !a.current.fitToView, d && (a.wrap.removeAttr("style").addClass("fancybox-tmp"), a.trigger("onUpdate")), a.update())
        },
        hideLoading: function() {
            s.unbind(".loading"), n("#fancybox-loading").remove()
        },
        showLoading: function() {
            var e, t;
            a.hideLoading(), e = n('<div id="fancybox-loading"><div></div></div>').click(a.cancel).appendTo("body"), s.bind("keydown.loading", function(e) {
                27 === (e.which || e.keyCode) && (e.preventDefault(), a.cancel())
            }), a.defaults.fixed || (t = a.getViewport(), e.css({
                position: "absolute",
                top: .5 * t.h + t.y,
                left: .5 * t.w + t.x
            }))
        },
        getViewport: function() {
            var t = a.current && a.current.locked || !1,
                n = {
                    x: r.scrollLeft(),
                    y: r.scrollTop()
                };
            return t ? (n.w = t[0].clientWidth, n.h = t[0].clientHeight) : (n.w = d && e.innerWidth ? e.innerWidth : r.width(), n.h = d && e.innerHeight ? e.innerHeight : r.height()), n
        },
        unbindEvents: function() {
            a.wrap && u(a.wrap) && a.wrap.unbind(".fb"), s.unbind(".fb"), r.unbind(".fb")
        },
        bindEvents: function() {
            var e, t = a.current;
            t && (r.bind("orientationchange.fb" + (d ? "" : " resize.fb") + (t.autoCenter && !t.locked ? " scroll.fb" : ""), a.update), e = t.keys, e && s.bind("keydown.fb", function(i) {
                var r = i.which || i.keyCode,
                    s = i.target || i.srcElement;
                return 27 === r && a.coming ? !1 : void(i.ctrlKey || i.altKey || i.shiftKey || i.metaKey || s && (s.type || n(s).is("[contenteditable]")) || n.each(e, function(e, s) {
                    return t.group.length > 1 && s[r] !== o ? (a[e](s[r]), i.preventDefault(), !1) : n.inArray(r, s) > -1 ? (a[e](), i.preventDefault(), !1) : void 0
                }))
            }), n.fn.mousewheel && t.mouseWheel && a.wrap.bind("mousewheel.fb", function(e, o, i, r) {
                for (var s = e.target || null, l = n(s), c = !1; l.length && !(c || l.is(".fancybox-skin") || l.is(".fancybox-wrap"));) c = h(l[0]), l = n(l).parent();
                0 === o || c || a.group.length > 1 && !t.canShrink && (r > 0 || i > 0 ? a.prev(r > 0 ? "down" : "left") : (0 > r || 0 > i) && a.next(0 > r ? "up" : "right"), e.preventDefault())
            }))
        },
        trigger: function(e, t) {
            var o, i = t || a.coming || a.current;
            if (i) {
                if (n.isFunction(i[e]) && (o = i[e].apply(i, Array.prototype.slice.call(arguments, 1))), o === !1) return !1;
                i.helpers && n.each(i.helpers, function(t, o) {
                    o && a.helpers[t] && n.isFunction(a.helpers[t][e]) && a.helpers[t][e](n.extend(!0, {}, a.helpers[t].defaults, o), i)
                }), s.trigger(e)
            }
        },
        isImage: function(e) {
            return p(e) && e.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp|svg)((\?|#).*)?$)/i)
        },
        isSWF: function(e) {
            return p(e) && e.match(/\.(swf)((\?|#).*)?$/i)
        },
        _start: function(e) {
            var t, o, i, r, s, l = {};
            if (e = m(e), t = a.group[e] || null, !t) return !1;
            if (l = n.extend(!0, {}, a.opts, t), r = l.margin, s = l.padding, "number" === n.type(r) && (l.margin = [r, r, r, r]), "number" === n.type(s) && (l.padding = [s, s, s, s]), l.modal && n.extend(!0, l, {
                    closeBtn: !1,
                    closeClick: !1,
                    nextClick: !1,
                    arrows: !1,
                    mouseWheel: !1,
                    keys: null,
                    helpers: {
                        overlay: {
                            closeClick: !1
                        }
                    }
                }), l.autoSize && (l.autoWidth = l.autoHeight = !0), "auto" === l.width && (l.autoWidth = !0), "auto" === l.height && (l.autoHeight = !0), l.group = a.group, l.index = e, a.coming = l, !1 === a.trigger("beforeLoad")) return void(a.coming = null);
            if (i = l.type, o = l.href, !i) return a.coming = null, a.current && a.router && "jumpto" !== a.router ? (a.current.index = e, a[a.router](a.direction)) : !1;
            if (a.isActive = !0, ("image" === i || "swf" === i) && (l.autoHeight = l.autoWidth = !1, l.scrolling = "visible"), "image" === i && (l.aspectRatio = !0), "iframe" === i && d && (l.scrolling = "scroll"), l.wrap = n(l.tpl.wrap).addClass("fancybox-" + (d ? "mobile" : "desktop") + " fancybox-type-" + i + " fancybox-tmp " + l.wrapCSS).appendTo(l.parent || "body"), n.extend(l, {
                    skin: n(".fancybox-skin", l.wrap),
                    outer: n(".fancybox-outer", l.wrap),
                    inner: n(".fancybox-inner", l.wrap)
                }), n.each(["Top", "Right", "Bottom", "Left"], function(e, t) {
                    l.skin.css("padding" + t, g(l.padding[e]))
                }), a.trigger("onReady"), "inline" === i || "html" === i) {
                if (!l.content || !l.content.length) return a._error("content")
            } else if (!o) return a._error("href");
            "image" === i ? a._loadImage() : "ajax" === i ? a._loadAjax() : "iframe" === i ? a._loadIframe() : a._afterLoad()
        },
        _error: function(e) {
            n.extend(a.coming, {
                type: "html",
                autoWidth: !0,
                autoHeight: !0,
                minWidth: 0,
                minHeight: 0,
                scrolling: "no",
                hasError: e,
                content: a.coming.tpl.error
            }), a._afterLoad()
        },
        _loadImage: function() {
            var e = a.imgPreload = new Image;
            e.onload = function() {
                this.onload = this.onerror = null, a.coming.width = this.width / a.opts.pixelRatio, a.coming.height = this.height / a.opts.pixelRatio, a._afterLoad()
            }, e.onerror = function() {
                this.onload = this.onerror = null, a._error("image")
            }, e.src = a.coming.href, e.complete !== !0 && a.showLoading()
        },
        _loadAjax: function() {
            var e = a.coming;
            a.showLoading(), a.ajaxLoad = n.ajax(n.extend({}, e.ajax, {
                url: e.href,
                error: function(e, t) {
                    a.coming && "abort" !== t ? a._error("ajax", e) : a.hideLoading()
                },
                success: function(t, n) {
                    "success" === n && (e.content = t, a._afterLoad())
                }
            }))
        },
        _loadIframe: function() {
            var e = a.coming,
                t = n(e.tpl.iframe.replace(/\{rnd\}/g, (new Date).getTime())).attr("scrolling", d ? "auto" : e.iframe.scrolling).attr("src", e.href);
            n(e.wrap).bind("onReset", function() {
                try {
                    n(this).find("iframe").hide().attr("src", "//about:blank").end().empty()
                } catch (e) {}
            }), e.iframe.preload && (a.showLoading(), t.one("load", function() {
                n(this).data("ready", 1), d || n(this).bind("load.fb", a.update), n(this).parents(".fancybox-wrap").width("100%").removeClass("fancybox-tmp").show(), a._afterLoad()
            })), e.content = t.appendTo(e.inner), e.iframe.preload || a._afterLoad()
        },
        _preloadImages: function() {
            var e, t, n = a.group,
                o = a.current,
                i = n.length,
                r = o.preload ? Math.min(o.preload, i - 1) : 0;
            for (t = 1; r >= t; t += 1) e = n[(o.index + t) % i], "image" === e.type && e.href && ((new Image).src = e.href)
        },
        _afterLoad: function() {
            var e, t, o, i, r, s, l = a.coming,
                c = a.current,
                d = "fancybox-placeholder";
            if (a.hideLoading(), l && a.isActive !== !1) {
                if (!1 === a.trigger("afterLoad", l, c)) return l.wrap.stop(!0).trigger("onReset").remove(), void(a.coming = null);
                switch (c && (a.trigger("beforeChange", c), c.wrap.stop(!0).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove()), a.unbindEvents(), e = l, t = l.content, o = l.type, i = l.scrolling, n.extend(a, {
                    wrap: e.wrap,
                    skin: e.skin,
                    outer: e.outer,
                    inner: e.inner,
                    current: e,
                    previous: c
                }), r = e.href, o) {
                    case "inline":
                    case "ajax":
                    case "html":
                        e.selector ? t = n("<div>").html(t).find(e.selector) : u(t) && (t.data(d) || t.data(d, n('<div class="' + d + '"></div>').insertAfter(t).hide()), t = t.show().detach(), e.wrap.bind("onReset", function() {
                            n(this).find(t).length && t.hide().replaceAll(t.data(d)).data(d, !1)
                        }));
                        break;
                    case "image":
                        t = e.tpl.image.replace("{href}", r);
                        break;
                    case "swf":
                        t = '<object id="fancybox-swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="' + r + '"></param>', s = "", n.each(e.swf, function(e, n) {
                            t += '<param name="' + e + '" value="' + n + '"></param>', s += " " + e + '="' + n + '"'
                        }), t += '<embed src="' + r + '" type="application/x-shockwave-flash" width="100%" height="100%"' + s + "></embed></object>"
                }
                u(t) && t.parent().is(e.inner) || e.inner.append(t), a.trigger("beforeShow"), e.inner.css("overflow", "yes" === i ? "scroll" : "no" === i ? "hidden" : i), a._setDimension(), a.reposition(), a.isOpen = !1, a.coming = null, a.bindEvents(), a.isOpened ? c.prevMethod && a.transitions[c.prevMethod]() : n(".fancybox-wrap").not(e.wrap).stop(!0).trigger("onReset").remove(), a.transitions[a.isOpened ? e.nextMethod : e.openMethod](), a._preloadImages()
            }
        },
        _setDimension: function() {
            var e, t, o, i, r, s, l, c, d, u, p, h, v, y, w, b = a.getViewport(),
                _ = 0,
                x = !1,
                C = !1,
                k = a.wrap,
                T = a.skin,
                S = a.inner,
                $ = a.current,
                E = $.width,
                N = $.height,
                R = $.minWidth,
                A = $.minHeight,
                D = $.maxWidth,
                O = $.maxHeight,
                j = $.scrolling,
                I = $.scrollOutside ? $.scrollbarWidth : 0,
                P = $.margin,
                L = m(P[1] + P[3]),
                H = m(P[0] + P[2]);
            if (k.add(T).add(S).width("auto").height("auto").removeClass("fancybox-tmp"), e = m(T.outerWidth(!0) - T.width()), t = m(T.outerHeight(!0) - T.height()), o = L + e, i = H + t, r = f(E) ? (b.w - o) * m(E) / 100 : E, s = f(N) ? (b.h - i) * m(N) / 100 : N, "iframe" === $.type) {
                if (y = $.content, $.autoHeight && 1 === y.data("ready")) try {
                    y[0].contentWindow.document.location && (S.width(r).height(9999), w = y.contents().find("body"), I && w.css("overflow-x", "hidden"), s = w.outerHeight(!0))
                } catch (F) {}
            } else($.autoWidth || $.autoHeight) && (S.addClass("fancybox-tmp"), $.autoWidth || S.width(r), $.autoHeight || S.height(s), $.autoWidth && (r = S.width()), $.autoHeight && (s = S.height()), S.removeClass("fancybox-tmp"));
            if (E = m(r), N = m(s), d = r / s, R = m(f(R) ? m(R, "w") - o : R), D = m(f(D) ? m(D, "w") - o : D), A = m(f(A) ? m(A, "h") - i : A), O = m(f(O) ? m(O, "h") - i : O), l = D, c = O, $.fitToView && (D = Math.min(b.w - o, D), O = Math.min(b.h - i, O)), h = b.w - L, v = b.h - H, $.aspectRatio ? (E > D && (E = D, N = m(E / d)), N > O && (N = O, E = m(N * d)), R > E && (E = R, N = m(E / d)), A > N && (N = A, E = m(N * d))) : (E = Math.max(R, Math.min(E, D)), $.autoHeight && "iframe" !== $.type && (S.width(E), N = S.height()), N = Math.max(A, Math.min(N, O))), $.fitToView)
                if (S.width(E).height(N), k.width(E + e), u = k.width(), p = k.height(), $.aspectRatio)
                    for (;
                        (u > h || p > v) && E > R && N > A && !(_++ > 19);) N = Math.max(A, Math.min(O, N - 10)), E = m(N * d), R > E && (E = R, N = m(E / d)), E > D && (E = D, N = m(E / d)), S.width(E).height(N), k.width(E + e), u = k.width(), p = k.height();
                else E = Math.max(R, Math.min(E, E - (u - h))), N = Math.max(A, Math.min(N, N - (p - v)));
            I && "auto" === j && s > N && h > E + e + I && (E += I), S.width(E).height(N), k.width(E + e), u = k.width(), p = k.height(), x = (u > h || p > v) && E > R && N > A, C = $.aspectRatio ? l > E && c > N && r > E && s > N : (l > E || c > N) && (r > E || s > N), n.extend($, {
                dim: {
                    width: g(u),
                    height: g(p)
                },
                origWidth: r,
                origHeight: s,
                canShrink: x,
                canExpand: C,
                wPadding: e,
                hPadding: t,
                wrapSpace: p - T.outerHeight(!0),
                skinSpace: T.height() - N
            }), !y && $.autoHeight && N > A && O > N && !C && S.height("auto")
        },
        _getPosition: function(e) {
            var t = a.current,
                n = a.getViewport(),
                o = t.margin,
                i = a.wrap.width() + o[1] + o[3],
                r = a.wrap.height() + o[0] + o[2],
                s = {
                    position: "absolute",
                    top: o[0],
                    left: o[3]
                };
            return t.autoCenter && t.fixed && !e && r <= n.h && i <= n.w ? s.position = "fixed" : t.locked || (s.top += n.y, s.left += n.x), s.top = g(Math.max(s.top, s.top + (n.h - r) * t.topRatio)), s.left = g(Math.max(s.left, s.left + (n.w - i) * t.leftRatio)), s
        },
        _afterZoomIn: function() {
            var e = a.current;
            e && (a.isOpen = a.isOpened = !0, a.wrap.css("overflow", "visible").addClass("fancybox-opened"), a.update(), (e.closeClick || e.nextClick && a.group.length > 1) && a.inner.css("cursor", "pointer").bind("click.fb", function(t) {
                n(t.target).is("a") || n(t.target).parent().is("a") || (t.preventDefault(), a[e.closeClick ? "close" : "next"]())
            }), e.closeBtn && n(e.tpl.closeBtn).appendTo(a.skin).bind("click.fb", function(e) {
                e.preventDefault(), a.close()
            }), e.arrows && a.group.length > 1 && ((e.loop || e.index > 0) && n(e.tpl.prev).appendTo(a.outer).bind("click.fb", a.prev), (e.loop || e.index < a.group.length - 1) && n(e.tpl.next).appendTo(a.outer).bind("click.fb", a.next)), a.trigger("afterShow"), e.loop || e.index !== e.group.length - 1 ? a.opts.autoPlay && !a.player.isActive && (a.opts.autoPlay = !1, a.play()) : a.play(!1))
        },
        _afterZoomOut: function(e) {
            e = e || a.current, n(".fancybox-wrap").trigger("onReset").remove(), n.extend(a, {
                group: {},
                opts: {},
                router: !1,
                current: null,
                isActive: !1,
                isOpened: !1,
                isOpen: !1,
                isClosing: !1,
                wrap: null,
                skin: null,
                outer: null,
                inner: null
            }), a.trigger("afterClose", e)
        }
    }), a.transitions = {
        getOrigPosition: function() {
            var e = a.current,
                t = e.element,
                n = e.orig,
                o = {},
                i = 50,
                r = 50,
                s = e.hPadding,
                l = e.wPadding,
                c = a.getViewport();
            return !n && e.isDom && t.is(":visible") && (n = t.find("img:first"), n.length || (n = t)), u(n) ? (o = n.offset(), n.is("img") && (i = n.outerWidth(), r = n.outerHeight())) : (o.top = c.y + (c.h - r) * e.topRatio, o.left = c.x + (c.w - i) * e.leftRatio), ("fixed" === a.wrap.css("position") || e.locked) && (o.top -= c.y, o.left -= c.x), o = {
                top: g(o.top - s * e.topRatio),
                left: g(o.left - l * e.leftRatio),
                width: g(i + l),
                height: g(r + s)
            }
        },
        step: function(e, t) {
            var n, o, i, r = t.prop,
                s = a.current,
                l = s.wrapSpace,
                c = s.skinSpace;
            ("width" === r || "height" === r) && (n = t.end === t.start ? 1 : (e - t.start) / (t.end - t.start), a.isClosing && (n = 1 - n), o = "width" === r ? s.wPadding : s.hPadding, i = e - o, a.skin[r](m("width" === r ? i : i - l * n)), a.inner[r](m("width" === r ? i : i - l * n - c * n)))
        },
        zoomIn: function() {
            var e = a.current,
                t = e.pos,
                o = e.openEffect,
                i = "elastic" === o,
                r = n.extend({
                    opacity: 1
                }, t);
            delete r.position, i ? (t = this.getOrigPosition(), e.openOpacity && (t.opacity = .1)) : "fade" === o && (t.opacity = .1), a.wrap.css(t).animate(r, {
                duration: "none" === o ? 0 : e.openSpeed,
                easing: e.openEasing,
                step: i ? this.step : null,
                complete: a._afterZoomIn
            })
        },
        zoomOut: function() {
            var e = a.current,
                t = e.closeEffect,
                n = "elastic" === t,
                o = {
                    opacity: .1
                };
            n && (o = this.getOrigPosition(), e.closeOpacity && (o.opacity = .1)), a.wrap.animate(o, {
                duration: "none" === t ? 0 : e.closeSpeed,
                easing: e.closeEasing,
                step: n ? this.step : null,
                complete: a._afterZoomOut
            })
        },
        changeIn: function() {
            var e, t = a.current,
                n = t.nextEffect,
                o = t.pos,
                i = {
                    opacity: 1
                },
                r = a.direction,
                s = 200;
            o.opacity = .1, "elastic" === n && (e = "down" === r || "up" === r ? "top" : "left", "down" === r || "right" === r ? (o[e] = g(m(o[e]) - s), i[e] = "+=" + s + "px") : (o[e] = g(m(o[e]) + s), i[e] = "-=" + s + "px")), "none" === n ? a._afterZoomIn() : a.wrap.css(o).animate(i, {
                duration: t.nextSpeed,
                easing: t.nextEasing,
                complete: a._afterZoomIn
            })
        },
        changeOut: function() {
            var e = a.previous,
                t = e.prevEffect,
                o = {
                    opacity: .1
                },
                i = a.direction,
                r = 200;
            "elastic" === t && (o["down" === i || "up" === i ? "top" : "left"] = ("up" === i || "left" === i ? "-" : "+") + "=" + r + "px"), e.wrap.animate(o, {
                duration: "none" === t ? 0 : e.prevSpeed,
                easing: e.prevEasing,
                complete: function() {
                    n(this).trigger("onReset").remove()
                }
            })
        }
    }, a.helpers.overlay = {
        defaults: {
            closeClick: !0,
            speedOut: 200,
            showEarly: !0,
            css: {},
            locked: !d,
            fixed: !0
        },
        overlay: null,
        fixed: !1,
        el: n("html"),
        create: function(e) {
            e = n.extend({}, this.defaults, e), this.overlay && this.close(), this.overlay = n('<div class="fancybox-overlay"></div>').appendTo(a.coming ? a.coming.parent : e.parent), this.fixed = !1, e.fixed && a.defaults.fixed && (this.overlay.addClass("fancybox-overlay-fixed"), this.fixed = !0)
        },
        open: function(e) {
            var t = this;
            e = n.extend({}, this.defaults, e), this.overlay ? this.overlay.unbind(".overlay").width("auto").height("auto") : this.create(e), this.fixed || (r.bind("resize.overlay", n.proxy(this.update, this)), this.update()), e.closeClick && this.overlay.bind("click.overlay", function(e) {
                return n(e.target).hasClass("fancybox-overlay") ? (a.isActive ? a.close() : t.close(), !1) : void 0
            }), this.overlay.css(e.css).show()
        },
        close: function() {
            var e, t;
            r.unbind("resize.overlay"), this.el.hasClass("fancybox-lock") && (n(".fancybox-margin").removeClass("fancybox-margin"), e = r.scrollTop(), t = r.scrollLeft(), this.el.removeClass("fancybox-lock"), r.scrollTop(e).scrollLeft(t)), n(".fancybox-overlay").remove().hide(), n.extend(this, {
                overlay: null,
                fixed: !1
            })
        },
        update: function() {
            var e, n = "100%";
            this.overlay.width(n).height("100%"), l ? (e = Math.max(t.documentElement.offsetWidth, t.body.offsetWidth), s.width() > e && (n = s.width())) : s.width() > r.width() && (n = s.width()), this.overlay.width(n).height(s.height())
        },
        onReady: function(e, t) {
            var o = this.overlay;
            n(".fancybox-overlay").stop(!0, !0), o || this.create(e), e.locked && this.fixed && t.fixed && (o || (this.margin = s.height() > r.height() ? n("html").css("margin-right").replace("px", "") : !1), t.locked = this.overlay.append(t.wrap), t.fixed = !1), e.showEarly === !0 && this.beforeShow.apply(this, arguments)
        },
        beforeShow: function(e, t) {
            var o, i;
            t.locked && (this.margin !== !1 && (n("*").filter(function() {
                return "fixed" === n(this).css("position") && !n(this).hasClass("fancybox-overlay") && !n(this).hasClass("fancybox-wrap")
            }).addClass("fancybox-margin"), this.el.addClass("fancybox-margin")), o = r.scrollTop(), i = r.scrollLeft(), this.el.addClass("fancybox-lock"), r.scrollTop(o).scrollLeft(i)), this.open(e)
        },
        onUpdate: function() {
            this.fixed || this.update()
        },
        afterClose: function(e) {
            this.overlay && !a.coming && this.overlay.fadeOut(e.speedOut, n.proxy(this.close, this))
        }
    }, a.helpers.title = {
        defaults: {
            type: "float",
            position: "bottom"
        },
        beforeShow: function(e) {
            var t, o, i = a.current,
                r = i.title,
                s = e.type;
            if (n.isFunction(r) && (r = r.call(i.element, i)), p(r) && "" !== n.trim(r)) {
                switch (t = n('<div class="fancybox-title fancybox-title-' + s + '-wrap">' + r + "</div>"), s) {
                    case "inside":
                        o = a.skin;
                        break;
                    case "outside":
                        o = a.wrap;
                        break;
                    case "over":
                        o = a.inner;
                        break;
                    default:
                        o = a.skin, t.appendTo("body"), l && t.width(t.width()), t.wrapInner('<span class="child"></span>'), a.current.margin[2] += Math.abs(m(t.css("margin-bottom")))
                }
                t["top" === e.position ? "prependTo" : "appendTo"](o)
            }
        }
    }, n.fn.fancybox = function(e) {
        var t, o = n(this),
            i = this.selector || "",
            r = function(r) {
                var s, l, c = n(this).blur(),
                    d = t;
                r.ctrlKey || r.altKey || r.shiftKey || r.metaKey || c.is(".fancybox-wrap") || (s = e.groupAttr || "data-fancybox-group", l = c.attr(s), l || (s = "rel", l = c.get(0)[s]), l && "" !== l && "nofollow" !== l && (c = i.length ? n(i) : o, c = c.filter("[" + s + '="' + l + '"]'), d = c.index(this)), e.index = d, a.open(c, e) !== !1 && r.preventDefault())
            };
        return e = e || {}, t = e.index || 0, i && e.live !== !1 ? s.undelegate(i, "click.fb-start").delegate(i + ":not('.fancybox-item, .fancybox-nav')", "click.fb-start", r) : o.unbind("click.fb-start").bind("click.fb-start", r), this.filter("[data-fancybox-start=1]").trigger("click"), this
    }, s.ready(function() {
        var t, r;
        n.scrollbarWidth === o && (n.scrollbarWidth = function() {
            var e = n('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"),
                t = e.children(),
                o = t.innerWidth() - t.height(99).innerWidth();
            return e.remove(), o
        }), n.support.fixedPosition === o && (n.support.fixedPosition = function() {
            var e = n('<div style="position:fixed;top:20px;"></div>').appendTo("body"),
                t = 20 === e[0].offsetTop || 15 === e[0].offsetTop;
            return e.remove(), t
        }()), n.extend(a.defaults, {
            scrollbarWidth: n.scrollbarWidth(),
            fixed: n.support.fixedPosition,
            parent: n("body")
        }), t = n(e).width(), i.addClass("fancybox-lock-test"), r = n(e).width(), i.removeClass("fancybox-lock-test"), n("<style type='text/css'>.fancybox-margin{margin-right:" + (r - t) + "px;}</style>").appendTo("head")
    })
}(window, document, jQuery),
function() {
    ! function() {}(jQuery)
}(),
function() {
    $(document).on("click", "[data-toggle=modal-remote]", function() {
        var e, t;
        NProgress.start();
        try {
            $.popup.cleanUp()
        } catch (n) {}
        return document.body.style.overflow = "hidden", $("[data-toggle=modal-close]").removeClass("hide"), e = $(".modal"), e.is(":hidden") && e.fadeIn(300), e.data("bg-url") || (e.data("bg-url", location.href), e.data("bg-title", document.title)), t = $(this).attr("href"), $.ajax({
            type: "get",
            url: t,
            dataType: "html",
            beforeSend: function() {
                return $(".modal-content").addClass("loading"), window.history.pushState(t, t, t)
            },
            success: function(e) {
                var n;
                return $(".modal-content").removeClass("loading"), $(".modal-content").html(e), (n = t.split("#")[1]) ? $(".modal-content").scrollTo("#" + n) : void 0
            },
            complete: function() {
                return NProgress.done()
            }
        }), !1
    }), $(document).on("click", "[data-toggle=modal-close]", function() {
        var e, t;
        return e = $(".modal").fadeOut(300, function() {
            return document.body.style.overflow = "scroll"
        }), $(this).addClass("hide"), document.title = e.data("bg-title"), t = e.data("bg-url"), window.history.pushState(t, t, t)
    })
}.call(this),
    function() {
        jQuery(function() {
                var e;
                return e = $("#notification_center"), e.find(".trigger").click(function() {
                    return e.addClass("active"), $(document.body).bind("click", function(t) {
                        return 0 === $(t.target).closest("#notification_center").length ? (e.removeClass("active"), $(document.body).unbind("click", arguments.callee)) : void 0
                    })
                }).on("ajax:before", function() {}).on("ajax:success", function(t, n, o) {
                    return $("#notification_center .notification-dropdown ul").html(n), e.data("load-at", (new Date).toISOString());
                }).end().find(".clear-all").on("ajax:before", function() {
                    var t;
                    return t = e.data("load-at"), $(this).data("params", {
                        timeline: t
                    })
                }).on("ajax:success", function() {
                    return e.removeData("load-at"), e.find(".trigger").trigger("click.rails")
                })
            }), $(document).on("click", "#notification_center .notification-dropdown a", function() {
                return $("#notification_center").removeClass("active")
            }),
            function() {
                var e, t;
                return e = $("html").data("user-id"), window.Faye && e && !window.notification_listening ? (t = function() {
                    var t;
                    return window.notification_listening = !0, t = new Faye.Client("https://next.36kr.com/faye/faye"), t.subscribe("/" + e + "_notification", function(e) {
                        return new Notify(e.message, {
                            body: "\u70b9\u51fb\u67e5\u770b",
                            icon: "//rs-assets.b0.upaiyun.com/assets/logo-72x72-49a257378535625c2714f61feb063a67.png",
                            timeout: 10,
                            tag: e.tag,
                            notifyClick: function() {
                                return window.open(e.url)
                            }
                        }).show()
                    })
                }, Notify.needsPermission ? Notify.isSupported() && "denied" !== window.Notification.permission ? Notify.requestPermission(function() {
                    return t()
                }, function() {
                    return alert("\u4f60\u6ca1\u6709\u5141\u8bb8\u901a\u77e5\uff0c\u8fd9\u5c06\u4f7f\u4f60\u65e0\u6cd5\u53ca\u65f6\u5f97\u5230\u6d88\u606f\u63d0\u9192\u3002\n\u4f60\u53ef\u4ee5\u901a\u8fc7\u6d4f\u89c8\u5668\u8bbe\u7f6e\u8fdb\u884c\u4fee\u6539")
                }) : void 0 : t()) : void 0
            }()
    }.call(this),
    function() {
        jQuery(function() {
            return function() {
                return 0 !== $("body#home").length ? $("form#new_user").on("ajax:success", function(e, t) {
                    return $(".error").removeClass("animated fadeInDown"), $(".spinner").fadeIn("slow"), setTimeout(function() {
                        return $(".form").fadeOut("slow")
                    }, 600), setTimeout(function() {
                        return $(".success").find("p").text(t.notice).removeClass("hide").end().addClass("animated fadeInUp"), t.redirect ? setTimeout(function() {
                            return window.location.href = Routes.root_path()
                        }, 2e3) : void 0
                    }, 1200)
                }).on("ajax:error", function(e, t, n) {
                    var o;
                    return 422 === t.status ? (o = t.responseJSON, $(".error").text(o.error).addClass("animated fadeInDown"), $(".email").select().addClass("animated shake"), setTimeout(function() {
                        return $(".email").removeClass("animated shake")
                    }, 600)) : void 0
                }) : void 0
            }()
        })
    }.call(this),
    function() {
        jQuery(function() {
            var e;
            return e = $("#wechat_login_container"), e.length ? new WxLogin({
                id: "wechat_login_container",
                appid: "wxda815683eebbfa45",
                scope: "snsapi_login",
                redirect_uri: e.data("redirect-uri"),
                state: e.data("state"),
                href: "//rs-assets.b0.upaiyun.com/assets/wechat-6d193b79c12ba927f253af4006804f07.css"
            }) : void 0
        })
    }.call(this),
    function() {
        jQuery(function() {
            return $(document.body).delegate(".load-more-feeds", "ajax:beforeSend", function(e, t, n) {
                return $(this).data("loading") === !0 ? !1 : $(this).data("loading", !0).text("loading..")
            }).delegate(".load-more-feeds", "ajax:success", function(e, t, n) {
                return $(".more-feeds").replaceWith(t)
            }).delegate(".load-more-feeds", "ajax:complete", function(e, t, n) {
                return $(this).data("loading", !1)
            }), $(document).on("load-more", function() {
                return $(".load-more-feeds").click()
            })
        })
    }.call(this),
    function() {
        var e, t, n, o, i;
        t = function(e) {
            var t;
            return t = $('<input type="text">').appendTo(e), t.on("keydown", function(e) {
                var t;
                return 27 === e.keyCode || "" === $(this).val() && (8 === (t = e.keyCode) || 37 === t) ? ($(this).trigger("blur"), e.preventDefault()) : void 0
            }).on("blur", function() {
                var n;
                if (e.is(":visible")) return e.empty(), e.data("editor").focus(), n = document.createTextNode("@"), $("#mention_holder").replaceWith(n), i(n), e.hide(), t.val("").autocomplete("hide")
            }).autocomplete({
                serviceUrl: function() {
                    return $("#comments").data("search-users-url")
                },
                minChars: 0,
                noCache: !0,
                appendTo: e,
                showNoSuggestionNotice: !1,
                maxHeight: "auto",
                noSuggestionNotice: "\u65e0\u7ed3\u679c",
                triggerSelectOnValidInput: !1,
                autoSelectFirst: !0,
                onSelect: function(e) {
                    var t;
                    return $(this).blur(), t = $("<a href='" + Routes.user_path(e.data.id) + "' contenteditable='false' data-user-id='" + e.data.id + "'>@" + e.value + "</a>").click(function() {
                        return !1
                    }), n(t[0], 1, 3), n(document.createTextNode("\xa0"))
                },
                formatResult: function(e, t) {
                    return "<div class='media'> <a class='mention-image left' href='#'> <img class='media-object' src='" + e.data.avatar + "' width='30' height='30'> </a> <div class='media-body'> <span class='media-heading'>" + e.value + "</span> </div> </div>"
                }
            }), t
        }, o = function(e, t) {
            var n, o, i, r, s;
            return 8 === (i = e.keyCode) || 46 === i || t.data("old-value") === t.text() ? !1 : (s = window.getSelection(), o = s.getRangeAt(0), 0 === o.startOffset ? !1 : (n = o.cloneRange(), n.setStart(o.startContainer, o.startOffset - 1), n.setEnd(o.startContainer, o.startOffset), "@" === (r = n.cloneContents().textContent) || "@" === r))
        }, n = function(e, t, n) {
            var o, i, r;
            return r = window.getSelection(), i = r.getRangeAt(0), o = i.cloneRange(), t && (o.setStart(i.startContainer, i.startOffset - t), o.setEnd(i.startContainer, i.startOffset), o.deleteContents()), i.deleteContents(), i.insertNode(e), i.setStartAfter(e), r.removeAllRanges(), r.addRange(i)
        }, i = function(e) {
            var t, n, o;
            return o = window.getSelection(), n = o.getRangeAt(0), t = n.cloneRange(), n.deleteContents(), n.setStartAfter(e), o.removeAllRanges(), o.addRange(n)
        }, e = ".editable-comment[contenteditable=true][mentionable=true]", $(document).on("focus", e, function(e) {
            var t;
            return (t = $(this).data("old-selection")) ? (rangy.restoreSelection(t), e.preventDefault()) : void 0
        }).on("keyup", e, function(e) {
            var i, r, s, a, l, c;
            return i = $(this), o(e, i) && (e.preventDefault(), s = $("#mention_wrapper"), a = Math.random().toString(36).substring(7), r = $("<a href='javascript:' id='mention_holder'>@</a>"), l = n(r[0], 1), c = r.position(), i.data("old-selection", rangy.saveSelection()), s.css({
                left: c.left + r.width(),
                top: c.top
            }).show(), t(s), s.find("input").val("").autocomplete("clear").focus(), s.data("editor", i)), $(this).data("old-value", $(this).text())
        }), $(document).on("mousedown", ".autocomplete-suggestions", function(e) {
            return e.preventDefault()
        })
    }.call(this),
    function() {
        var e;
        $(document).on("click", ".product-sidebar .product-sidebar-up, .product-sidebar .product-sidebar-down", function() {
                var e, t, n, o, i, r, s, a, l, c;
                return e = $(".product-sidebar .product-lists ul"), e.is(":animated") || (s = e.data("notes-per-page"), t = e.data("current-page"), r = e.find("li").length, o = r % s === 0 ? parseInt(r / s) : parseInt(r / s + 1), $(this).is(".product-sidebar-up") && 1 === t || $(this).is(".product-sidebar-down") && t === o) ? void 0 : (n = parseInt(e.css("top")), i = parseInt(e.outerHeight(!0)), a = e.find("li:first").outerHeight(!0), $(this).is(".product-sidebar-up") ? (c = n + s * a, l = t - 1, e.data("current-page", l)) : (c = n - s * a, l = t + 1, e.data("current-page", l)), $(".product-sidebar-up").toggleClass("hidden", 1 === l), $(".product-sidebar-down").toggleClass("hidden", l === o), e.animate({
                    top: c + "px"
                }, 200))
            }), $(document).on("ajax:success", "#category_swicher a", function(e, t) {
                var n;
                return $(this).closest("li").addClass("active").siblings("li").removeClass("active"), $("#content").html(t), n = $(this).attr("href"), window.history.pushState(n, n, n)
            }),
            function() {
                return $(document).on("click", "#ignore_similar_notes", function() {
                    return $(".note-form, .note-similars").toggleClass("active"), $(".note-form input[name=force]").val("true"), $(".popup_cont .popup_close").hide(), setTimeout(function() {
                        return $(".popup_cont .popup_close").show()
                    }, 1e3)
                }), $(document).on("blur", ".note-form .note_title input, .note-form .note_url input", function() {
                    var e;
                    return e = $(this).closest("form"), "true" !== e.find("input[name=force]").val() && "" !== $.trim($(this).val()) ? $.ajax({
                        url: Routes.check_similars_notes_path(),
                        data: e.serialize(),
                        dataType: "html",
                        complete: function(e, t) {
                            return 406 === e.status ? ($(".note-similars").html(e.responseText), $(".note-form, .note-similars").toggleClass("active"), $(".popup_cont .popup_close").hide(), setTimeout(function() {
                                return $(".popup_cont .popup_close").show()
                            }, 1e3)) : void 0
                        }
                    }) : void 0
                })
            }(), $(document).on("click", "html[data-portable-device=true] a[data-client=web]", function() {
                return confirm("\u8be5\u4ea7\u54c1\u7684\u7f51\u7ad9\u6ca1\u6709\u4e3a\u79fb\u52a8\u8bbe\u5907\u8fdb\u884c\u4f18\u5316, \u662f\u5426\u786e\u5b9a\u7ee7\u7eed\u67e5\u770b?")
            }), $(document).on("click", ".comment-content a", function() {
                return $(this).attr("target", "_blank")
            }), $(".fancybox").fancybox({
                live: !0
            }), e = function(e) {
                var t, n, o, i;
                if (e.closest(".product-list").is(".reorderable") && e.siblings(".product-item").length) return i = parseInt(e.find(".upvote-link .vote-count").text()), n = e.prevAll(".product-item").filter(function(e, t) {
                    var n;
                    return n = parseInt($(t).find(".upvote-link .vote-count").text()), i > n
                }), t = e.nextAll(".product-item").filter(function(e, t) {
                    var n;
                    return n = parseInt($(t).find(".upvote-link .vote-count").text()), n > i
                }), n.length ? (o = n.last(), n.animate({
                    top: "+=" + e.outerHeight()
                }, 500), e.animate({
                    top: "-=" + (e.position().top - o.position().top)
                }, 500, function() {
                    return n.css({
                        top: 0
                    }), e.css({
                        top: 0
                    }), e.insertBefore(o)
                })) : t.length ? (o = t.last(), t.animate({
                    top: "-=" + e.outerHeight()
                }, 500), e.animate({
                    top: "+=" + (o.position().top - e.position().top)
                }, 500, function() {
                    return t.css({
                        top: 0
                    }), e.css({
                        top: 0
                    }), e.insertAfter(o)
                })) : void 0
            }, $(document).on("ajax:success", ".vote-up", function(t, n, o, i) {
                var r, s, a;
                return r = $(this), a = r.closest(".upvote").data("note-id"), s = $(".upvote[data-note-id=" + a + "]"), s.find(".vote-count").text($.parseJSON(n).score), 200 === i.status ? s.removeClass("voted") : s.addClass("voted"), e($(this).closest(".product-item"))
            }).on("ajax:before", ".vote-up", function(e, t, n, o) {
                return $(this).data("loading") === !0 ? !1 : $(this).data("loading", !0)
            }).on("ajax:complete", ".vote-up", function(e, t, n, o) {
                return $(this).removeData("loading")
            }).on("ajax:error", ".vote-up", function(e, t, n) {
                var o;
                return o = JSON.parse(t.responseText), o && o.message ? alert(o.message) : void 0
            }), $(document).on("click", "[data-toggle=show-more] a", function() {
                return $(this).closest(".post").find(".item.hide").removeClass("hide"), $(this).closest("[data-toggle=show-more]").remove()
            }), $(document).on("ajax:beforeSend", ".load-more-notes", function(e, t, n) {
                return $(this).data("loading") === !0 ? !1 : $(this).data("loading", !0).text("loading..")
            }).on("ajax:success", ".load-more-notes", function(e, t, n) {
                return $(".more-notes").replaceWith(t)
            }).on("ajax:complete", ".load-more-notes", function(e, t, n) {
                return $(this).data("loading", !1)
            }), $(document).on("load-more", function() {
                return $(".load-more-notes").click()
            }), $(document).on("image:load", ".screenshots .screenshot img", function() {
                var e;
                return e = 0, $(".screenshots .screenshot").each(function() {
                    return e += $(this).outerWidth(!0)
                }), $(".screenshots").width(e)
            }), $(document).on("ajax:success", ".product-avatar.more-voters a", function(e, t) {
                return $(this).removeClass("loading").closest(".upvote-users").html(t)
            }).on("ajax:before", ".product-avatar.more-voters a", function(e) {
                var t;
                return t = $(this), $(this).is(".loading") ? (e.preventDefault(), !1) : $(this).addClass("loading")
            })
    }.call(this),
    function() {
        jQuery(function() {
            return $("#search_type_switcher").length ? ($("#search_type_switcher a").click(function(e) {
                return $("#search_form").attr("action", $(this).attr("href")).find(":submit").click(), $(this).closest("li").addClass("active").siblings().removeClass("active"), e.preventDefault(), !1
            }), $("#search_form").on({
                "ajax:beforeSend": function() {
                    var e;
                    return e = $(this).attr("action") + "?" + $(this).serialize(), window.history.pushState(e, e, e)
                },
                "ajax:success": function(e, t) {
                    return $("#search_result").html(t)
                }
            })) : void 0
        })
    }.call(this),
    function() {
        ! function() {
            return $(document).on("click", ".edit-info-line", function() {
                var e;
                return e = $(this).closest(".info-line"), e.find(".to-edit, .edit-info-line").hide(), e.find(".editing-line").show(), e.find("input.editing-input").val(e.data("text")).focus()
            }), $(document).on("click", ".editing-cancel-btn", function() {
                return $(this).closest(".editing-line").hide().closest(".info-line").find(".to-edit, .edit-info-line").show()
            }), $(document).on("ajax:beforeSend", ".editing-line form", function() {
                var e;
                return $(this).find(".editing-cancel-btn").trigger("click"), e = $("input.editing-input", this).val(), $(this).closest(".info-line").data("text", e).find(".to-edit").text(e)
            }).on("ajax:complete", ".editing-line form", function(e, t) {
                return 422 === t.status ? ($(this).closest(".info-line").find(".edit-info-line").trigger("click"), alert(t.responseJSON.message)) : void 0
            }), $(document).on("change", ".editing-checkboxes :checkbox", function() {
                return $(this).closest("form").trigger("submit.rails")
            }), $(document).on("ajax:success", ".select_bg a", function(e, t) {
                var n;
                return n = t.theme_cover_url, $.popup.cleanUp(), $(".list-background").css("background-image", "url(" + n + ")")
            }), jQuery(function() {
                var e;
                return e = $("#collection_upload_bg img").dropzone({
                    paramName: "note_collection[feature_image]",
                    previewsContainer: !1,
                    method: "put",
                    url: function() {
                        return $("#collection_upload_bg").attr("href")
                    },
                    acceptedFiles: "image/*",
                    init: function() {
                        return this.on("sending", function(e, t, n) {
                            return n.append($('meta[name="csrf-param"]').attr("content"), $('meta[name="csrf-token"]').attr("content"))
                        }), this.on("success", function(e, t) {
                            var n;
                            return n = t.feature_image_url, $(".list-page-header .list-page-people-bg").css("background-image", "url(" + n + ")")
                        }), this.on("error", function(e, t, n) {
                            return 422 === n.status ? alert(t.message) : alert("\u670d\u52a1\u5668\u53d1\u751f\u9519\u8bef\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5")
                        })
                    }
                })
            })
        }(), $(".btn-learnmore").popup({
            content: "#learnmore_content"
        }), $(document).on("click", ".theme-selector a", function() {
            return $("#note_collection_theme_id").val($(this).data("theme-id")), $(this).cloest("li").addClass("active").siblings().removeClass("active")
        }), $(document).on("ajax:success", ".list-fav-trigger", function(e, t, n, o) {
            var i, r, s, a;
            return s = $(this).closest("[data-collection-id]").data("collection-id"), a = $(this).closest(".list-item").find(".liked-count").text(), i = $("[data-collection-id=" + s + "] .list-fav"), r = $("[data-collection-id=" + s + "] .liked-count"), 200 === o.status ? (i.removeClass("faved"), r.text(parseInt(a, 10) - 1)) : (i.addClass("faved"), r.text(parseInt(a, 10) + 1))
        }).on("ajax:before", ".list-fav-trigger", function() {
            return $(this).data("pending") === !0 ? !1 : $(this).data("pending", !0)
        }).on("ajax:complete", ".list-fav-trigger", function() {
            return $(this).removeData("pending")
        }), $(document).on("ajax:success", ".list-fav-btn .btn", function(e, t, n, o) {
            var i, r;
            return r = $(this), i = r.next().find(".total-count"), 200 === o.status ? (r.text(r.data("disfav-text")), r.removeClass("faved"), i.text(parseInt(i.text(), 10) - 1)) : (r.text(r.data("faved-text")), r.addClass("faved"), i.text(parseInt(i.text(), 10) + 1))
        }).on("ajax:before", ".list-fav-btn .btn", function() {
            return $(this).data("pending") === !0 ? !1 : $(this).data("pending", !0)
        }).on("ajax:complete", ".list-fav-btn .btn", function() {
            return $(this).removeData("pending")
        }), $(document).on("click", "#sort_collections", function() {
            return $(this).hide(), $("#unsort_collections, #save_order").show(), $(".list-grid").sortable()
        }), $(document).on("click", "#unsort_collections", function() {
            return $(".list-grid").sortable("destroy"), $(this).hide(), $("#save_order").hide(), $("#sort_collections").show()
        }), $(document).on("click", "#save_order", function() {
            var e;
            return e = [], $(".list-item").map(function(t) {
                return e.push($(this).data("collection-id"))
            }), $.ajax({
                url: Routes.sort_notes_collections_path(),
                data: {
                    orders: e
                },
                method: "post",
                success: function() {
                    return $("#unsort_collections").trigger("click"), alert("\u4fdd\u5b58\u6210\u529f")
                }
            })
        }), $(document).on("ajax:success", "#note_collections_tabs a.tab", function(e, t) {
            var n;
            return $(this).closest("li").addClass("active").siblings("li").removeClass("active"), $("#collections").html(t), n = $(this).attr("href"), window.history.pushState(n, n, n)
        }), $(document).on("mouseover", ".product-list.owner-coming .product-item", function() {
            var e;
            return e = $(".post-url", this), $(".remove-note", this).insertAfter(e).show()
        }).on("mouseout", ".product-list.owner-coming .product-item", function(e) {
            return $(".remove-note", this).hide()
        }).on("ajax:before", ".product-list.owner-coming .product-item .remove-note", function() {
            return $(this).closest(".product-item").fadeOut(function() {
                return $(this).remove()
            })
        })
    }.call(this),
    function() {
        $(document).on("mouseenter", ".comment-image-uploader img", function() {
            return $(this).data("dropzone-prepared") ? void 0 : $(".comment-image-uploader img").data("dropzone-prepared", !0).dropzone({
                paramName: "image[image]",
                previewsContainer: !1,
                url: Routes.images_path(),
                acceptedFiles: "image/*",
                init: function() {
                    return this.on("sending", function(e, t, n) {
                        return n.append($('meta[name="csrf-param"]').attr("content"), $('meta[name="csrf-token"]').attr("content")), $(this.element).closest("form").find(".editable-comment").addClass("loading").attr("contenteditable", !1)
                    }), this.on("success", function(e, t) {
                        var n, o, i, r, s, a;
                        return a = t.url, n = $(this.element).closest("form").find(".editable-comment").removeClass("loading").attr("contenteditable", !0), i = document.createTextNode("![](" + a + ")"), n.focus(), s = window.getSelection(), s.rangeCount > 0 ? (r = s.getRangeAt(0), o = r.cloneRange(), r.deleteContents(), r.insertNode(i), r.setStartAfter(i), s.removeAllRanges(), s.addRange(r)) : n.append(i)
                    }), this.on("error", function(e, t, n) {
                        return 422 === n.status ? alert(t.message) : alert("\u670d\u52a1\u5668\u53d1\u751f\u9519\u8bef\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5")
                    }), this.on("addedfile", function(e) {})
                }
            })
        }), $(document).on("click", "form:has(.editable-comment[contenteditable=true]) :submit", function() {
            var e;
            return e = $(this).closest("form").find(".editable-comment[contenteditable=true]"), "" === $.trim(e.text()) ? (e.focus(), !1) : void 0
        }).on("submit ajax:before", "form:has(.editable-comment[contenteditable=true])", function() {
            var e, t;
            return e = $(".editable-comment[contenteditable=true]", this), t = e.data("for"), $(this).find("[name='" + t + "']").val(e.html())
        }).on("ajax:success", "form:has(.editable-comment[contenteditable=true])", function(e, t, n, o) {
            var i, r, s;
            return r = $(this), r.is(".reply") ? (r.addClass("hide"), r.closest(".replies").length ? r.parents(".replies:last").append(t) : r.closest(".comment").find(".replies:first").append(t)) : $("#comments").append(t), i = $("#comments").find(".comments-count"), i.text(parseInt(i.text()) + 1), $(this).trigger("reset").find(".editable-comment[contenteditable=true]").text(""), s = o.getResponseHeader("Comment-ID"), $(".modal:visible").length ? $(".modal-content").scrollTo($("#comment_" + s), 300) : $.scrollTo($("#comment_" + s), 300)
        }), $(document).on("ajax:beforeSend", "a.vote-comment", function(e) {
            return $(this).is(".loading") ? !1 : $(this).addClass("loading")
        }).on("ajax:success", "a.vote-comment", function(e, t, n, o) {
            return 201 === o.status ? $(this).addClass("voted") : $(this).removeClass("voted"), $(".voted-count", this).text(t.score || "")
        }).on("ajax:error", "a.vote-comment", function(e, t) {
            return 406 === t.status ? alert(t.responseJSON.message) : void 0
        }).on("ajax:complete", "a.vote-comment", function(e, t, n, o) {
            return $(this).removeClass("loading")
        }), $(document).on("click", "[data-online=true] a.reply", function(e) {
            var t, n, o, i;
            return n = $(this), $("form.reply:visible").addClass("hide"), t = $(this).closest(".comment").find("form.reply:first").removeClass("hide").find(".editable-comment").focus(), n.is(".reply-inline:not(.owned)") && "" === $.trim(t.html()) && (o = n.data("user-id"), i = n.data("user-name"), t.html("<a href='" + Routes.user_path(o) + "' data-user-id='" + o + "'>@" + i + "</a>\uff1a")), t.moveCursorToEnd(), e.preventDefault()
        }), jQuery(function() {
            return $(document).on("ajax:success", ".delete-comment", function() {
                var e, t, n, o;
                return e = $(this).closest(".comment"), t = $(".comments-count"), n = parseInt(t.text()), o = e.find(".comment").length + 1, e.fadeOut(function() {
                    return t.text(n - o), $(this).remove()
                })
            }), $(".delete-comment[data-disable-at]").each(function() {
                var e, t;
                return e = $(this), t = new Date(e.data("disable-at")).getTime() - (new Date).getTime(), setTimeout(function() {
                    return e.fadeOut(function() {
                        return e.remove()
                    })
                }, t)
            })
        }), $(document).on("paste", ".editable-comment[contenteditable=true]", function(e) {
            var t, n;
            return e.preventDefault(), (t = (e.originalEvent || e).clipboardData) ? (n = t.getData("text/plain"), document.execCommand("insertText", !1, n)) : window.clipboardData ? (n = window.clipboardData.getData("Text"), document.selection.createRange().pasteHTML(n)) : void 0
        }), $(document).on("next:load-comments", function(e) {
            var t;
            return t = $(e.target), t.load(t.data("url"), function() {
                return location.hash.startsWith("#comment_") ? $(".modal:visible").length ? $(".modal-content").scrollTo(location.hash, 300) : $.scrollTo(location.hash, 300) : void 0
            })
        })
    }.call(this),
    function() {
        window.following_user_ids = [], $(document).on("ajax:success", "html[data-portable-device=false] [data-toggle=follow]", function(e, t, n, o) {
            var i, r;
            return r = $(this).data("user-id"), 201 === o.status ? (window.following_user_ids.indexOf(r) < 0 && window.following_user_ids.push(r), $("[data-toggle=follow][data-user-id=" + r + "]").button("following").addClass("following"), $(".follower-count[data-user-id=" + r + "]").text(t.following_count)) : ((i = window.following_user_ids.indexOf(r)) >= 0 && window.following_user_ids.splice(i, 1), $("[data-toggle=follow][data-user-id=" + r + "]").button("follow").removeClass("following"), $(".follower-count[data-user-id=" + r + "]").text(t.following_count))
        }), $(document).on("click", "html[data-portable-device=false] .user-follow .follow", function() {
            return $(".modal-overlay").fadeIn(300)
        }), $(document).on("click", "html[data-portable-device=false] .modal-overlay .modal-follow .modal-close", function(e) {
            return $(".modal-overlay").fadeOut(300)
        }), $(document).on("user:updateFollowing", function(e) {
            var t;
            return t = $("html").data("user-id"), $("div.user-tooltip .follow-btn:not(.loaded)").each(function() {
                var e, n;
                return e = $(this).addClass("loaded"), n = e.data("user-id"), t === n ? e.remove() : window.following_user_ids.indexOf(n) >= 0 ? e.button("following").addClass("following") : void 0
            })
        }), $(document).ajaxComplete(function() {
            return $(document).trigger("user:updateFollowing")
        }), $(function() {
            return $(document).trigger("user:updateFollowing")
        }), $(document).on("change", ":file.upload", function(e) {
            var t;
            return t = $.trim($(this).val().replace(/^.*[\\\/]/, "")), "" !== t ? $(".upload-filename").text("\u5df2\u9009\uff1a" + t) : $(".upload-filename").text("\u6ca1\u6709\u9009\u62e9\u6587\u4ef6")
        })
    }.call(this),
    function() {
        jQuery(function() {
            return $("#feature_notification .close").click(function() {
                return $(this).closest(".alert").remove()
            })
        })
    }.call(this),
    function() {
        $(document).ajaxSend(function(e, t, n) {
            return "html" === n.dataType && "GET" === n.type && (window.ga && ga("send", "pageview", n.url), window._hmt) ? _hmt.push(["_trackPageview", n.url]) : void 0
        }), jQuery(function() {
            return window.ga ? (ga("send", "pageview"), $("#logo").click(function() {
                return ga("send", "event", "link", "logo", ga_user_id)
            }), $("#subscription_email").focus(function() {
                return ga("send", "event", "link", "subscription#create.focus", ga_user_id)
            }), $(".product-link").click(function() {
                return ga("send", "event", "link", "notes#show", ga_user_id)
            }), $(".post-url").click(function() {
                return ga("send", "event", "link", "notes#hit", ga_user_id)
            }), $(".load-more-notes").click(function() {
                return ga("send", "event", "link", "notes#load_more", ga_user_id)
            }), $("#query").focus(function() {
                return ga("send", "event", "link", "notes#search.focus", ga_user_id)
            }), $(".share-wechat a").hover(function() {
                var e, t;
                return e = $(this), e.data("ga-sent") ? void 0 : (t = setTimeout(function() {
                    return ga("send", "event", "link", "share#wechat", ga_user_id), e.data("ga-sent", !0)
                }, 3e3), e.data("ga-timer", t))
            }, function() {
                return clearTimeout($(this).data("ga-timer"))
            }), $(".share-weibo a").click(function() {
                return ga("send", "event", "link", "share#weibo", ga_user_id)
            })) : void 0
        })
    }.call(this),
    function() {
        jQuery(function() {
            return $("#jsapi_data").each(function() {
                var e, t;
                return e = $(this), t = "#debug_jsapi" === window.location.hash, t && alert("debugging jsapi"), wx.config({
                    debug: t,
                    appId: "wxca85fbcede352c08",
                    timestamp: e.data("timestamp"),
                    nonceStr: e.data("noncestr"),
                    signature: e.data("signature"),
                    jsApiList: ["checkJsApi", "onMenuShareTimeline", "onMenuShareAppMessage", "onMenuShareQQ", "onMenuShareWeibo", "hideMenuItems", "showMenuItems", "hideAllNonBaseMenuItem", "showAllNonBaseMenuItem", "translateVoice", "startRecord", "stopRecord", "onRecordEnd", "playVoice", "pauseVoice", "stopVoice", "uploadVoice", "downloadVoice", "chooseImage", "previewImage", "uploadImage", "downloadImage", "getNetworkType", "openLocation", "getLocation", "hideOptionMenu", "showOptionMenu", "closeWindow", "scanQRCode", "chooseWXPay", "openProductSpecificView", "addCard", "chooseCard", "openCard"]
                }), wx.ready(function() {
                    var t;
                    return wx.onMenuShareTimeline({
                        title: e.data("title") + " - " + e.data("desc"),
                        link: e.data("url"),
                        imgUrl: e.data("image") || "//rs-assets.b0.upaiyun.com/assets/logo-72x72-49a257378535625c2714f61feb063a67.png"
                    }), t = {
                        title: e.data("title"),
                        desc: e.data("desc"),
                        link: e.data("url"),
                        imgUrl: e.data("image") || "//rs-assets.b0.upaiyun.com/assets/logo-72x72-49a257378535625c2714f61feb063a67.png"
                    }, wx.onMenuShareAppMessage(t), wx.onMenuShareQQ(t), wx.onMenuShareWeibo(t)
                })
            })
        })
    }.call(this),
    function() {
        var e;
        NProgress.configure({
                minimum: .3,
                showSpinner: !1,
                trickleRate: .01,
                trickleSpeed: 100
            }), $(document).on("page:fetch", function() {
                return NProgress.start()
            }), $(document).on("page:change", function() {
                return NProgress.done()
            }), $(document).on("page:restore", function() {
                return NProgress.remove()
            }), $(document).on("pjax:start", function() {
                return NProgress.start()
            }), $(document).on("pjax:end", function() {
                return NProgress.done()
            }), $(".banner").unslider({
                speed: 500,
                delay: 2500,
                complete: function() {},
                keys: !0,
                dots: !0,
                fluid: !1
            }), jQuery(function() {
                return $("[data-toggle=tooltip], .tooltip").each(function() {
                    var e;
                    return e = $(this).data("position") || "bottom", $(this).tooltipster({
                        position: e
                    })
                })
            }), $.fn.moveCursorToEnd = function() {
                var e, t, n;
                return e = $(this).get(0), document.createRange ? (t = document.createRange(), t.selectNodeContents(e), t.collapse(!1), n = window.getSelection(), n.removeAllRanges(), n.addRange(t)) : document.selection ? (t = document.body.createTextRange(), t.moveToElementText(e), t.collapse(!1), t.select()) : void 0
            }, e = function(e) {
                var t, n;
                return t = $(e), t.is(".ignore-track-url") || t.cloest(".ignore-track-url").length ? void 0 : (n = t.attr("href"), window.history.pushState(n, n, n))
            }, $(document).on("ajax:error", function(e, t, n, o) {
                return 401 === t.status ? window.location.href = Routes.new_user_session_path({
                    ok_url: window.location.href
                }) : 500 === t.status ? (alert("\u62b1\u6b49\uff0c\u60a8\u7684\u64cd\u4f5c\u6ca1\u80fd\u6210\u529f\uff0c\u53ef\u80fd\u662f\u670d\u52a1\u5668\u5f00\u5c0f\u5dee\u4e86\uff0c\u8bf7\u5237\u65b0\u6216\u7a0d\u540e\u518d\u8bd5\u3002"), e.preventDefault()) : 403 === t.status ? (alert("\u62b1\u6b49, \u60a8\u65e0\u6743\u8bbf\u95ee\u6b64\u9875\u9762\u3002"), e.preventDefault()) : void 0
            }), $.clean_popup = function() {
                return $(".popup_cont .popup").data("ignore-flip", !0), $(".popup").removeClass("flip-wrapper"), $.popup.center()
            }, $("html[data-online=true] a.popup, a.popup[data-require-online=false]").popup({
                modal: !0,
                beforeOpen: function() {
                    return $.popup = this
                },
                afterOpen: function() {
                    return $("div.popup_content").find("input:visible, textarea:visible").first().focus()
                },
                show: function(e, t) {
                    var n;
                    return n = this, $(this.ele).is(".new-product") && !$(".popup_cont .popup").data("ignore-flip") && $("div.popup").addClass("flip-wrapper"), n.center(), e.css({
                        opacity: 1
                    }).animate({}, function() {
                        return n.o.afterOpen.call(n)
                    })
                }
            }), $(document).on("keypress", function(e) {
                var t;
                if (!$(e.target).is("input, textarea, [contenteditable=true]") && !$(document.body).is(":animated")) switch (e.keyCode) {
                    case 106:
                    case 74:
                    case 32:
                        return $(document).height() === $(window).height() + $(window).scrollTop() ? $(document).trigger("load-more") : $(window).scrollTo("+=" + $(window).height(), 200), e.preventDefault();
                    case 107:
                    case 75:
                        return $(window).scrollTo("-=" + $(window).height(), 200);
                    case 116:
                    case 84:
                        return $(window).scrollTo(0, 700);
                    case 102:
                    case 70:
                        return t = $("input#query"), $(window).scrollTo(t, 500, {
                            onAfter: function() {
                                return t.focus()
                            }
                        })
                }
            }), $(document).on("ajax:success", "#navbar a", function(t, n) {
                return $(this).closest("li").addClass("active").siblings("li").removeClass("active"), $("#content").html(n), e(this)
            }),
            function() {
                var e;
                return e = null, $(document).on("click", ".share-wechat", function() {
                    return $(".share-wechat-tip").addClass("active"), e = setTimeout(function() {
                        return $(".share-wechat-tip").removeClass("active")
                    }, 3e3)
                }), $(document).on("click", ".share-wechat-tip", function() {
                    return clearTimeout(e), $(this).removeClass("active")
                })
            }(), $(document).on("click", "a[href^=#]", function() {
                return $.scrollTo($(this).attr("href"), 300), !1
            }),
            function() {
                return $(document).on("submit", "form:not(.ignore-submitting)", function() {
                    var e;
                    return e = $(":submit", this).addClass("disabled").attr("disabled", "disabled"), e.is("input") ? (e.data("text", e.val()), e.val("\u63d0\u4ea4\u4e2d..")) : (e.data("text", e.text()), e.text("\u63d0\u4ea4\u4e2d.."))
                }), $(document).on("reset", "form:not(.ignore-submitting)", function() {
                    var e;
                    return e = $(":submit", this), e.is(".disabled") ? (e.removeClass("disabled").removeAttr("disabled"), e.is("input") ? e.val(e.data("text")) : e.text(e.data("text"))) : void 0
                })
            }(), $(document).on("ajax:complete", "form[data-toggle=fetch]", function(e, t, n) {
                var o;
                return o = $($(this).data("target")), o.html(t.responseText)
            }), $(document).on("ajax:success", "ul[data-toggle=fetch] a", function(t, n) {
                var o;
                return $(this).closest("li").addClass("active").siblings("li").removeClass("active"), o = $($(this).closest("ul").data("target")), o.html(n), e(this)
            }), $(document).on("ajax:success", "a[data-toggle=fetch]", function(t, n) {
                return $($(this).data("target")).html(n), e(this)
            }), $(document).on("ajax:success", "div[data-toggle=fetch] a[data-remote=true]", function(t, n) {
                var o, i, r;
                return i = $(this).closest("div[data-toggle=fetch]"), o = $(i.data("target")), (r = i.data("active-class")) && $(this).addClass(r).siblings().removeClass(r), o.html(n), e(this)
            }), $(document).on("ajax:before", "#remind_me_later_to_improve_info", function() {
                return $(this).closest(".alert").remove()
            }),
            function() {
                return $(document).on("click", ".back-top", function(e) {
                    return e = jQuery.Event("keypress"), e.keyCode = 84, $(document).trigger(e)
                }), $(window).scroll(function() {
                    return $(this).scrollTop() > 300 ? $(".back-top").addClass("cd-is-visible") : $(".back-top").removeClass("cd-is-visible")
                }), $(document).on("ajax:success", ".remote-pagination a[data-remote=true]", function(t, n, o) {
                    var i;
                    return i = $(this).closest(".remote-pagination").data("target"), $(i).html(n), e(this)
                }), $(window).on("popstate", function(e) {
                    var t;
                    return (t = $(".modal:visible .header_inner .back_arrow")) ? t.trigger("click") : e.originalEvent.state ? window.location.reload() : e.originalEvent.state.trigger ? $(e.originalEvent.state.trigger).click() : $(e.originalEvent.state.target).load(e.originalEvent.state.url)
                })
            }()
    }.call(this);