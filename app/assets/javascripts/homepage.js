var ready = function() {
    $('.heroFlex').flexslider({
        animation: "slide",
        slideshow: true,
        customDirectionNav: $(".custom-navigation a"),
        start: function(slider){
          $(".heroFlexTextContainer").attr("style","").children().attr("style","");
          h2Height = $(".flex-active-slide .heroFlexTextContainer h2").outerHeight();
          pHeight = $(".flex-active-slide .heroFlexTextContainer p").outerHeight();
          $(".flex-active-slide .heroFlexTextContainer h2").animate({
            top:"0px",
            right: "0px",
            opacity : "1"
          },500);
          var topPos = $(".flex-active-slide .heroFlexTextContainer p").css("top");
          topPos = parseInt(topPos,10);
          $(".flex-active-slide .heroFlexTextContainer p").css("top",h2Height+"px")
          $(".flex-active-slide .heroFlexTextContainer p.direction_top ,.flex-active-slide .heroFlexTextContainer p.direction_down").css("top",(topPos+h2Height)+"px");
          $(".flex-active-slide .heroFlexTextContainer p").animate({
            top:h2Height+"px",
            right: "0px",
            opacity : "1"
          },500,function(){
            $(".flex-active-slide .heroFlexTextContainer .topBar").animate({
              top:"0px",
              opacity : "1"
            },500);
            topPos = $(".flex-active-slide .heroFlexTextContainer .bottomBar").css("top",(h2Height+pHeight+200)+"px");
            $(".flex-active-slide .heroFlexTextContainer .bottomBar").animate({
              top:(h2Height+pHeight)+"px",
              opacity : "1"
            },500);
          });

        },
        after: function(){
          $(".heroFlexTextContainer").attr("style","").children().attr("style","");
          h2Height = $(".flex-active-slide .heroFlexTextContainer h2").outerHeight();
          pHeight = $(".flex-active-slide .heroFlexTextContainer p").outerHeight();
          $(".flex-active-slide .heroFlexTextContainer h2").animate({
            top:"0px",
            right: "0px",
            opacity : "1"
          },500);
          var topPos = $(".flex-active-slide .heroFlexTextContainer p").css("top");
          topPos = parseInt(topPos,10);
          $(".flex-active-slide .heroFlexTextContainer p").css("top",h2Height+"px")
          $(".flex-active-slide .heroFlexTextContainer p.direction_top ,.flex-active-slide .heroFlexTextContainer p.direction_down").css("top",(topPos+h2Height)+"px");
          $(".flex-active-slide .heroFlexTextContainer p").animate({
            top:h2Height+"px",
            right: "0px",
            opacity : "1"
          },500,function(){
            $(".flex-active-slide .heroFlexTextContainer .topBar").animate({
              top:"0px",
              opacity : "1"
            },500);
            topPos = $(".flex-active-slide .heroFlexTextContainer .bottomBar").css("top",(h2Height+pHeight+200)+"px");
            $(".flex-active-slide .heroFlexTextContainer .bottomBar").animate({
              top:(h2Height+pHeight)+"px",
              opacity : "1"
            },500);
          });
        }
    });
    var screenRes = $(window).width();
        if($('#latest_offers').length > 0){
            $('#latest_offers').carouFredSel({
                prev : "#latest_offers_prev",
                next : "#latest_offers_next",
                infinite: false,
                circular: true,
                auto: false,
                width: '100%',
                scroll: {
                    items : 1,
                    onBefore: function (data) {
                        if (screenRes > 900) {
                        data.items.visible.eq(0).animate({opacity: 0.15},300);
                        data.items.old.eq(-1).animate({opacity: 1},300);
                        data.items.visible.eq(-1).animate({opacity: 0.15},300);
                        }
                    },
                    onAfter: function (data) {
                        if (screenRes > 900) {
                        data.items.old.eq(0).animate({opacity: 1},300);
                        }
                    }
                }
            });
            if (screenRes > 900) {
                var vis_items = $("#latest_offers").triggerHandler("currentVisible");
                vis_items.eq(-1).animate({opacity: 0.15},100);
                vis_items.eq(0).animate({opacity: 0.15},100);
            }
        }
        function carSpecicalInit() {
            var car_specical = $('#special_Deal');
            car_specical.carouFredSel({
                prev : "#special_offers_prev",
                next : "#special_offers_next",
                infinite: true,
                circular: false,
                auto: false,
                width: '100%',
                direction: "down",
                scroll: {
                    items : 1
                }
            });
        }
        $(document).ready(function() {
            carSpecicalInit();
        });
        var resizeTimer;
        $(window).resize(function() {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(carSpecicalInit, 100);
        });

    if($("#car_search_form").length > 0){
    	$("#q_car_make").change(function(){
    		if($(this).val() == ""){
    			$('#q_car_model').detachOptions('*');
    			$('#q_car_model').attachOptions('[value=""]');
    			$('#q_car_model').attachOptions('[parent_id]');
    			$("#q_car_model")[0].selectedIndex = 0;
                $('#HomeSearchModel select').attr('disabled','disabled');
    		}else {
    			$('#q_car_model').detachOptions('*');
    			$('#q_car_model').attachOptions('[value=""]');
    			$('#q_car_model').attachOptions('[parent_id='+$(this).val()+']');
    			$("#q_car_model")[0].selectedIndex = 0;
    			$('#HomeSearchModel select').removeAttr('disabled');
    		}
    	});
    }
};
$(document).ready(ready);
$(document).on('page:load', ready);
