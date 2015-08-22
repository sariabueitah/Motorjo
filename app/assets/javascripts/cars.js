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
    $("#car_make").change(function(){
        if($(this).val() == ""){
            $('#car_model').detachOptions('*');
            $('#car_model').attachOptions('[value=""]');
            $('#car_model').attachOptions('[parent_id]');
            $("#car_model")[0].selectedIndex = 0;
            $('#HomeSearchModel').hide();
            
        }else {
            $('#car_model').detachOptions('*');
            $('#car_model').attachOptions('[value=""]');
            $('#car_model').attachOptions('[parent_id='+$(this).val()+']');
            $("#car_model")[0].selectedIndex = 0;
            $('#HomeSearchModel').show();
        }
        
    });
    $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 109,
        itemMargin: 10,
        prevText: "<i class='fa fa-chevron-left'></i>",
        nextText: "<i class='fa fa-chevron-right'></i>",
        asNavFor: '#slider'
    });

    $('#slider').flexslider({
        animation: "slide",
        directionNav: false,
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel"
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);