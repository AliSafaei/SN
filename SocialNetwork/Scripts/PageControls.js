

// SCROLL UP APPEARS IF THE PAGE IS SCROLLED DOWN.
$(document).ready(function() {
    $(".scrollTo_top").hide();
    //var header = document.querySelector(".he");
    //if (window.location.hash) {
    //    header.classList.add("slide--up");
    //}
    //var headroom = new Headroom(header, {
    //    "offset": 244,
    //    "tolerance": 11,
    //    "classes": {
    //        "initial": "animated",
    //        "pinned": "flipInX",
    //        "unpinned": "flipOutX"
    //    }
    //});

    //headroom.init();
            //
});

jQuery(function () {
    jQuery(window).scroll(function () {
        if (jQuery(this).scrollTop() > 100) {
            $("#Header").attr("class", "animated fadeOutUp");
            jQuery('.scrollTo_top').fadeIn();
            
        } else {
            $("#Header").attr("class", "animated fadeInDown");
            jQuery('.scrollTo_top').fadeOut();
        }
    });
    jQuery('.scrollTo_top a').click(function () {
        jQuery('html, body').animate({ scrollTop: 0 }, 500);
        return false;
    });
});
