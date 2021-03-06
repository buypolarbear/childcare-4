// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require autocomplete-rails
//= require bootstrap
//= require turbolinks
//= require jquery.tablesorter
//= require jquery.ui.autocomplete
//= require jquery.ui.datepicker
//= require jquery.ui.draggable
//= require jquery.ui.droppable
//= require_tree .

// dynamically submits item completion checkboxes without page refresh
$(document).on('change', '.submittable', function() {
  $(this).parents('form:first').submit();
});

$(document).ready(function() 
    { 
        $("#myTable").tablesorter(); 
    } 
); 
$(document).ready(function() 
    { 
        $("#myTable").tablesorter( {sortList: [[0,0], [1,0]]} ); 
    } 
); 




