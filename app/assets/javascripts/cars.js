var ready = function() {
    if($("#advancedSearch").length > 0){
      $("#advancedSearchToggleOff").hide();
      $("#advancedSearchToggleOn").click(function(event) {
        $(this).hide();
        $("#advancedSearchToggleOff").css("display","block");
        $("#advancedSearch").slideToggle(500)
      });
      $("#advancedSearchToggleOff").click(function(event) {
        $(this).hide();
        $("#advancedSearchToggleOn").css("display","block");
        $("#advancedSearch").slideToggle(500)
      });
    }
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
        $('#car_car_model').attachOptions('[parent_id="'+$("#car_car_make :selected").val()+'"');
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
        alert("this file extension is not supported");  
      }   
    });
    if($("#car_report").length > 0){
      if($("#car_report").val() == 4){
        $("#car_report_other").parent("div").show();
      }else {
        $("#car_report_other").parent("div").hide();
      }
      $("#car_report").change(function(){
        if($("#car_report").val() == 4){
          $("#car_report_other").parent("div").show();
        }else {
          $("#car_report_other").parent("div").hide();
        }
      });
    }
    if($("#formContainer").length > 0)
    {
      function next(){
        $("#formContainer .button").hide();
        $(".prev").hide();
        $(".next").hide();
        $("body, html").animate({
            scrollTop: $("#formContainer").offset().top - 20
        });
        $('.next').unbind('click');
        $('.prev').unbind('click');
        setTimeout(function() {
          $(".next").bind('click',next);
          $(".prev").bind('click',prev);
        }, 1000);
        $("#formContainer section").eq(CurrentPage).css({left: "auto"});
        $("#formContainer section").eq(CurrentPage).animate({
          right: '105%'
        },1000);
        CurrentPage++;
        $("#formContainer").css("min-height",($("#formContainer section").eq(CurrentPage).outerHeight())+"px");
        if(parseFloat($("#formContainer section").eq(CurrentPage).css("left")) > 0 ) {
          $("#formContainer section").eq(CurrentPage).animate({
            left: '0'
          },1000,function() {
            if(CurrentPage == 0){
              $(".prev").hide();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }else if(CurrentPage == numberofSlides-1){
              $(".prev").show();
              $(".next").hide();
              $("#formContainer .createCar").show();
            }else {
              $(".prev").show();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }
          });
        }else if (parseFloat($("#formContainer section").eq(CurrentPage).css("right")) > 0) {
          $("#formContainer section").eq(CurrentPage).animate({
            right: '0'
          },1000,function() {
            if(CurrentPage == 0){
              $(".prev").hide();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }else if(CurrentPage == numberofSlides-1){
              $(".prev").show();
              $(".next").hide();
              $("#formContainer .createCar").show();
            }else {
              $(".prev").show();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }
          });
        }
      }
      function prev(){
        $(".prev").hide();
        $(".next").hide();
        $("#formContainer .button").hide();
        $("body, html").animate({
            scrollTop: $("#formContainer").offset().top - 20
        });
        $('.next').unbind('click');
        $('.prev').unbind('click');
        setTimeout(function() {
          $(".next").bind('click',next);
          $(".prev").bind('click',prev);
        }, 1000);
        $("#formContainer section").eq(CurrentPage).css({right: "auto"});
        $("#formContainer section").eq(CurrentPage).animate({
          left: '105%'
        },1000);
        CurrentPage--;
        $("#formContainer").css("min-height",($("#formContainer section").eq(CurrentPage).outerHeight())+"px");
        if(parseFloat($("#formContainer section").eq(CurrentPage).css("left")) > 0 ) {
          $("#formContainer section").eq(CurrentPage).animate({
            left: '0'
          },1000,function() {
            if(CurrentPage == 0){
              $(".prev").hide();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }else if(CurrentPage == numberofSlides-1){
              $(".prev").show();
              $(".next").hide();
              $("#formContainer .createCar").show();
            }else {
              $(".prev").show();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }
          });
        }else if (parseFloat($("#formContainer section").eq(CurrentPage).css("right")) > 0) {
          $("#formContainer section").eq(CurrentPage).animate({
            right: '0'
          },1000,function() {
            if(CurrentPage == 0){
              $(".prev").hide();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }else if(CurrentPage == numberofSlides-1){
              $(".prev").show();
              $(".next").hide();
              $("#formContainer .createCar").show();
            }else {
              $(".prev").show();
              $(".next").show();
              $("#formContainer .createCar").hide();
            }
          });
        }
        
      }
      var CurrentPage = 0;
      var numberofSlides = $("#formContainer section").length;
      $(".prev").hide();
      $("#formContainer").css("min-height",($("#formContainer section").eq(0).outerHeight())+"px");
      $("#formContainer section").css({
        right: 'auto',
        left: '105%',
        position: 'absolute'
      });
      $("#formContainer section").eq(0).css({
        left: 'auto',
        right: '0'
      });
      $(".next").bind('click',next);
      $(".prev").bind('click',prev);
    }
};
$(document).ready(ready);
$(document).on('page:load', ready);