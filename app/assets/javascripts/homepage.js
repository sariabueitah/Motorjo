var ready = function() {
    $('.heroFlex').flexslider({
        animation: "slide",
        customDirectionNav: $(".custom-navigation a")
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