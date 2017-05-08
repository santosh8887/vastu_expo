// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require bootstrap.min
//= require bootstrap
//= require npm
//= require jquery
//= require jquery_ujs
//= require contact-map
//= require jpages
//= require jquery-migrate.min1576
//= require jquery.flexslider
//= require jquery.form.min
//= require jquery.jcarousel.min
//= require jquery.placeholder
//= require jquery.selectbox
//= require jquery3e5a
//= require map-highlight
//= require property-map
//= require real-expert
//= require respond.min
//= require selectivizr.min
//= require html5shiv
//= require bootstrap/bootstrap

//= require_tree .

var slide = {"start":"1","interval":"5000"};

jQuery(document).ready(function(){
// Tab contents = .inside
  var tag_cloud_class = '#tagcloud';
  //Fix for tag clouds - unexpected height before .hide()
  var tag_cloud_height = jQuery( '#tagcloud').height();
  jQuery( '.inside ul li:last-child').css( 'border-bottom','0px' ); // remove last border-bottom from list in tab content
  jQuery( '.realTabs').each(function(){
    jQuery(this).children( 'li').children( 'a:first').addClass( 'selected' ); // Add .selected class to first tab on load
  });
  jQuery( '.inside > *').hide();
  jQuery( '.inside > *:first-child').show();
  jQuery( '.realTabs li a').click(function(evt){ // Init Click funtion on Tabs
    var clicked_tab_ref = jQuery(this).attr( 'href' ); // Strore Href value
    jQuery(this).parent().parent().children( 'li').children( 'a').removeClass( 'selected' ); //Remove selected from all tabs
    jQuery(this).addClass( 'selected' );
    jQuery(this).parent().parent().parent().children( '.inside').children( '*').hide();
    jQuery( '.inside ' + clicked_tab_ref).fadeIn(500);
    evt.preventDefault();
  });
});
