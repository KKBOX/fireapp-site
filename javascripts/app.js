$(function(){
    prettyPrint();
    var adjustIcon = function() {
        if (($("ul.menu").height() > 2)&&($("ul.menu").is(":visible"))) {
            $("a.collapse-menu").find(".lsf-icon").removeClass("down").addClass("up");
        }
        else {
            $("a.collapse-menu").find(".lsf-icon").removeClass("up").addClass("down");
        }
    }
    $(window).resize(function() {
        if ($(window).width() > 768) {
            $("ul.menu").show();
        }
        else {
            $("ul.menu").hide();
        }
        adjustIcon();
    });
    $("a.collapse-menu").on("click", function() {
        $("ul.menu").slideToggle(400, function() {
            adjustIcon();
        });
        
    });
});