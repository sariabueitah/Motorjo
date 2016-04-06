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
//= require_tree .
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
var ready = function() {
	$(document).foundation();
}
$(document).ready(ready);
$(document).on('page:load', ready);
