function ajaxCountFn(a, b) {

}
var MediaPlayMgr = new
function() {
    function g(a, b) {
        e.src = a + (a.indexOf("?") == -1 ? "?": "&") + "t=" + (new Date).getTime(),
        ajaxCountFn("音乐：播放--" + b, a)
    }
    function h(b) {
        var c = b && b.autoScroll || !1,
        d = decodeURIComponent($.cookie("yinyuemedia")),
        e = d != "null" ? d: "酷狗音乐",
        h = f.getElementsByTagName("strong");
        for (var i = 0,
        j = h.length; i <= j - 1; i++) {
            var k = h[i];
            if (e == k.innerHTML) {
                var l = k.parentNode.parentNode,
                m = $(l),
                n = l.getAttribute("data-url");
                return g(n, e),
                a && $(a).removeClass("on"),
                a = l,
                m.addClass("on"),
                c && (f.scrollTop = 67 * i),
                !1
            }
        }
    }
    function i(a, c) {
        a == "on" ? (b && b.close(), e.style.display = "block", d.style.display = "none", c == "noScroll" ? h() : h({
            autoScroll: !0
        })) : (e.style.display = "none", e.src = "", d.style.display = "block")
    }
    function j() {
        $("#mediaList li").click(function(b) {
            var c = $(this),
            d = $("#playIframe")[0],
            e = this.getAttribute("data-url");
            a && $(a).removeClass("on"),
            a = this,
            c.addClass("on");
            var f = c.find("strong")[0].innerHTML,
            g = encodeURIComponent(f);
            return $.cookie("yinyuemedia", g, {
                expires: 365,
                path: "/",
                domain: ""
            }),
            i("on", "noScroll"),
            b.stopPropagation(),
            !1
        }),
        $("#stopBtn").click(function() {
            return i("on"),
            !1
        }),
        $("#windowOpenMedia").click(function() {
            var a = 992,
            c = 554;
            try {
                if (!b || b.closed == 1) b = window.open("musicMini.html", "", "width=" + a + ",height=" + c + ",left=" + (screen.width - a) / 2 + ",top=" + (screen.height - c) / 2);
                b && b.focus(),
                i("off"),
                ajaxCountFn("音乐：小窗口  Y", "")
            } catch(d) {
                b = window.open("musicMini.html", "_blank"),
                ajaxCountFn("音乐：小窗口  N", ""),
                i("off")
            }
            return ! 1
        })
    }
    function k() {
        d = document.createElement("div"),
        d.id = "stopBtnWrap",
        d.innerHTML = '<a title="点击本页播放" id="stopBtn" href="javascript:void(0)" style="display: block;"><span>继续播放，关闭小窗口</span></a>',
        d.style.display = "none",
        e.parentNode.appendChild(d)
    }
    function l() {
        k(),
        j(),
        h({
            autoScroll: !0
        })
    }
    var a = "",
    b = "",
    c = "",
    d = "",
    e = document.getElementById("playIframe"),
    f = document.getElementById("mediaList");
    l()
};
$(".music-sites-recommend a,.other-music-info a").click(function() {
    ajaxCountFn("音乐：站点--" + this.innerHTML, this.href)
});