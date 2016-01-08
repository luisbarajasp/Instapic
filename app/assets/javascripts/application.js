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
//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap-tooltip
//= require twitter/bootstrap
//= require turbolinks
//= require masonry/jquery.masonry
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function(){
    //Set options
    var switchSpeed = 800;
    var speed = 4000;
    var id;

    //Add initial active class
    $('.imgage').first().addClass('active');

    //Hide all images
    $('.imgage').hide();

    //Show first image
    $('.active').show();

    id = setInterval(nextImage,speed);

    function nextImage(){
        $('.active').removeClass('active').addClass('oldActive');
            if($('.oldActive').is(':last-child')){
                $('.imgage').first().addClass('active');
            }else{
                $('.oldActive').next().addClass('active');
            }
            $('.oldActive').removeClass('oldActive');
            $('.imgage').fadeOut(switchSpeed);
            $('.active').fadeIn(switchSpeed);
    }

    //Serach bar
    var searchField = $('#query');
    var icon = $('.fa-search');

    //Focus event Handler
    $(searchField).on('focus',function(){
        $(this).removeClass('blur');
        $(this).addClass('focus');
        $(icon).animate({
                left: '10px'
            },10);
    });

    //Blur event Handler
    $(searchField).on('blur',function(){
        if(searchField.val() == ''){
            $(this).removeClass('focus');
            $(this).addClass('blur');
            $(icon).animate({
                    left: '70px'
                },10);
        }
    });

    $('#search_form').submit(function(e){
        e.preventDefault();
    });

    // var findHeight = $('.imageShow').height();
    // $('#allBoutImage').css({"height: "+findHeight+"px;"});


});
