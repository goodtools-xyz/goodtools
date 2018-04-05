//隐藏工具提示
function hiddentip() {
    var op = document.getElementsByTagName("p");
    var i;
    if (document.getElementById("check-box").checked) {
        for (i = 0; i < op.length; i++) {
            op[i].style.display = "none";
            //getElementsByTagName("a")[i].style.margin = "50px";
        }
    } else {
        for (i = 0; i < op.length; i++) {
            op[i].style.display = "block";
        }

    }
}

//tab切换

//20s自动隐藏幻灯片
function close() {
    var close = document.getElementById("carouselExampleIndicators").style.display = "none";
}

setTimeout("close()", 20000);

//下拉菜单hover自动显示
/**
 * Project: Bootstrap Hover Dropdown
 * Author: Cameron Spear
 * Contributors: Mattia Larentis
 *
 * Dependencies: Bootstrap's Dropdown plugin, jQuery
 *
 * A simple plugin to enable Bootstrap dropdowns to active on hover and provide a nice user experience.
 *
 * License: MIT
 *
 * http://cameronspear.com/blog/bootstrap-dropdown-on-hover-plugin/
 */
(function(e, t, n) {
    var r = e();
    e.fn.dropdownHover = function(n) {
        if ("ontouchstart" in document) return this;
        r = r.add(this.parent());
        return this.each(function() {
            function h(e) {
                r.find(":focus").blur();
                l.instantlyCloseOthers === !0 && r.removeClass("open");
                t.clearTimeout(c);
                s.addClass("open");
                i.trigger(a)
            }
            var i = e(this),
                s = i.parent(),
                o = { delay: 500, instantlyCloseOthers: !0 },
                u = { delay: e(this).data("delay"), instantlyCloseOthers: e(this).data("close-others") },
                a = "show.bs.dropdown",
                f = "hide.bs.dropdown",
                l = e.extend(!0, {}, o, n, u),
                c;
            s.hover(function(e) {
                if (!s.hasClass("open") && !i.is(e.target)) return !0;
                h(e)
            }, function() {
                c = t.setTimeout(function() {
                    s.removeClass("open");
                    i.trigger(f)
                }, l.delay)
            });
            i.hover(function(e) {
                if (!s.hasClass("open") && !s.is(e.target)) return !0;
                h(e)
            });
            s.find(".dropdown-submenu").each(function() {
                var n = e(this),
                    r;
                n.hover(function() {
                    t.clearTimeout(r);
                    n.children(".dropdown-menu").show();
                    n.siblings().children(".dropdown-menu").hide()
                }, function() {
                    var e = n.children(".dropdown-menu");
                    r = t.setTimeout(function() { e.hide() }, l.delay)
                })
            })
        })
    };
    e(document).ready(function() { e('[data-hover="dropdown"]').dropdownHover() })
})(jQuery, this);

;
(function($, window, undefined) {
    // outside the scope of the jQuery plugin to
    // keep track of all dropdowns
    var $allDropdowns = $();
    // if instantlyCloseOthers is true, then it will instantly
    // shut other nav items when a new one is hovered over
    $.fn.dropdownHover = function(options) {
        // the element we really care about
        // is the dropdown-toggle's parent
        $allDropdowns = $allDropdowns.add(this.parent());
        return this.each(function() {
            var $this = $(this).parent(),
                defaults = {
                    delay: 500,
                    instantlyCloseOthers: true
                },
                data = {
                    delay: $(this).data('delay'),
                    instantlyCloseOthers: $(this).data('close-others')
                },
                options = $.extend(true, {}, defaults, options, data),
                timeout;
            $this.hover(function() {
                if (options.instantlyCloseOthers === true)
                    $allDropdowns.removeClass('open');
                window.clearTimeout(timeout);
                $(this).addClass('open');
            }, function() {
                timeout = window.setTimeout(function() {
                    $this.removeClass('open');
                }, options.delay);
            });
        });
    };
    $('[data-hover="dropdown"]').dropdownHover();
})(jQuery, this);