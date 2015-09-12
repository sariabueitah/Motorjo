var ready = function() {
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
    if($("#FormCarMain").length > 0){
        $('#car_car_model').detachOptions('*');
        $('#car_car_model').attachOptions('[parent_id="1"');
        $("#car_car_model")[0].selectedIndex = 0;

        $("#car_car_make").change(function(){
            $('#car_car_model').detachOptions('*');
            $('#car_car_model').attachOptions('[parent_id='+$(this).val()+']');
            $("#car_car_model")[0].selectedIndex = 0;
        });
    }
    $('.file_field input').on('change', function(event) {
      thisparent = $(this).parent("div");
      var isIE = (navigator.appName=="Microsoft Internet Explorer");  
      var path = this.value;  
      var ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();

      if(ext == "gif" || ext == "jpeg" || ext == "jpg" ||  ext == "png" )  
      {       
        if(isIE) {  
          $(thisparent).children('img').attr("src",path);
        } else {  
          if (event.target.files[0]) 
          {  
            var files = event.target.files;
            var image = files[0]
            var reader = new FileReader();
            reader.onload = function(file) {
              var img = new Image();
              img.src = file.target.result;
              $(thisparent).children('img').attr("src",file.target.result);
            }
            reader.readAsDataURL(image);
          }
        }  
      } else {  
        alert("not supported");  
      }   
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);