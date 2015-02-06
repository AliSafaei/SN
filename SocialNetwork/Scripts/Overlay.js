(function (n) {
    n.fn.extend({
        dkOverlay: function (t) {
            var u = { mask: "#000", opacity: .7, animationSpeed: 400, closeOnClick: !0, closeOnEscPress: !0, contentType: "html", onBeforeLoad: function () { } },
                r, i, t = n.extend(u, t); return this.each(function () {
                function f() { i && (i.fadeOut("fast").remove(), n("#mask").fadeOut(u.animationSpeed, function () { setTimeout("$('#mask').remove()", 100) })) }
                var u = t;
                n(this).click(function (t) {
                    var e, o, f; t.preventDefault();
                    r = n(this);
                    i = n("<div id='overlay'><div id='inner'><\/div><\/div>");
                    e = n("<div id='loading'><img class='tl' src='" +
                        TemplateServerUrl +
                        "/Image/Public/vtwo/digikala-logo.png'/><img src='" +
                        TemplateServerUrl +
                        "/Image/Public/vtwo/overlayloading.gif'/><\/div>");
                    n("body").append(i);
                    u.onBeforeLoad();
                    n("#mask").length || n("body").append("<div id='mask'><\/div>");
                    o = i.children("#inner");
                    f = o.children("iframe");
                    i.css({ left: n(window).width() / 2 - f.width() / 2, top: n(window).scrollTop() + (n(window).height() / 2 - f.height() / 2) });
                    e.css({ top: (f.height() + n("#overlay #inner #header #container").outerHeight(!0)) / 2 - 50, left: f.width() / 2 - 120 });
                    i.append(e); f.load(function () {
                        o.css({ visibility: "visible", "line-height": "0" });
                        e.remove()
                    });
                    n("#mask").hide().css({ "background-color": u.mask, opacity: u.opacity }).fadeIn("slow"); i.fadeIn(u.animationSpeed)
                });
                n(this).keypress(function (n) { n.keyCode == 13 && n.preventDefault() });
                getTrigger = function () { return r };
                n(".close").live("click", function (n) { n.preventDefault(); f() });
                u.closeOnClick && n("#mask").live("click", function (n) { n.preventDefault(); f() });
                u.closeOnEscPress && n(document).keyup(function (n) { n.keyCode == 27 && f() })
            })
        }
    })
})(jQuery)