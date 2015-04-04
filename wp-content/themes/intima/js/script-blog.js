var $ = jQuery;

$(document).ready(function(){

    // search box Animation
    function animateIt($domObj, animationVal, time){
        $domObj.animate({
        'right' : animationVal
        }, time || 100);
    }

    var $searchForm = $('#searchform');

    function blogSearchAnimation(){

        if ( $searchForm.hasClass('manualform') ) {
            var $input = $searchForm.find("input[type='text']");
            var $button = $('#blog_search_button').css('right', '-60px');

            $(window).on('click', function(){
                animateIt($button, '-60px');
            });

            $input.on('click', function(e){
                e.stopImmediatePropagation();
                animateIt($button, '0px');
            });

        } else {

            $('#searchsubmit').after('<button class="btn btn-search" type="submit" id="blog_search_button"><i class="fa fa-search"></i></button>').remove();

            var $input = $searchForm.find("input[type='text']");
            var $button = $searchForm.find("#blog_search_button").css('right', '-60px');

            $(window).on('click', function(){
                animateIt($button, '-60px');
            });

            $input.on('click', function(e){
                e.stopImmediatePropagation();
                animateIt($button, '0px');
            });
            
        }

    }

    blogSearchAnimation();



    // $('#searchsubmit').attr('value', '');


    /*----------------------------------------------------*/
    /* Nice Scroll Activation
    ------------------------------------------------------ */

    $("html").niceScroll({
        cursorcolor:"#11abb0",
        cursorwidth: "8",
        cursorborder: ""
    });


    /*----------------------------------------------------*/
    /* Smooth Scrolling
    ------------------------------------------------------ */

    $('#go-top').on('click',function (e) {
        e.preventDefault();

        $('html, body').stop().animate({
            'scrollTop': '0px'
        }, 800, 'swing');
    });
});