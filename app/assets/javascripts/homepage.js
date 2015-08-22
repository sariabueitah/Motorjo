var ready = function() {
	$.fn.extend({detachOptions: function(o) {
        var s = this;
        return s.each(function(){
            var d = s.data('selectOptions') || [];
            s.find(o).each(function() {
                d.push($(this).detach());
            });
            s.data('selectOptions', d);
        });
    }, attachOptions: function(o) {
        var s = this;
        return s.each(function(){
            var d = s.data('selectOptions') || [];
            for (var i in d) {
                if (d[i].is(o)) {
                    s.append(d[i]);
                }
            }
        });
    }});
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