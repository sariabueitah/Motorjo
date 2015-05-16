

var ready = function() {
	var carMakeValue = $("#car_car_make option:selected").attr("value");
	if($("#new_car").length > 0 ){
		$("#car_car_model").children().not("option[parent_id^=" + carMakeValue + "]").hide();
		$("#car_car_model option[parent_id^=" + $("#car_car_make option:selected").attr("value") + "]:eq(0)").attr("selected","selected");
		$(".formCarModel").show();
	}else if($("#car_car_make").length > 0){
		$("#car_car_model").children().not("option[parent_id^=" + carMakeValue + "]").hide();
		$(".formCarModel").show();
	}
	$("#car_car_make").change(function(){
		$("#car_car_model").children('option').hide();
    	$("#car_car_model").children("option[parent_id^=" + $(this).val() + "]").show();
    	$("#car_car_model option[parent_id^=" + $(this).val() + "]:eq(0)").attr("selected","selected");

	});
};
$(document).ready(ready);
$(document).on('page:load', ready);