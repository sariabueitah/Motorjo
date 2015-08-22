// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require carouFredSel
//= require flexslider
//= require foundation
//= require turbolinks
//= require cocoon
//= require_tree .
var ready = function() {
	$(document).foundation();
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
}
$(document).ready(ready);
$(document).on('page:load', ready);

 //1.3.8.11.16.27a.28.31.37.40.
