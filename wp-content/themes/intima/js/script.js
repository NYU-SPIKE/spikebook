/*-----------------------------------------------------------------------------------
/*
/* Script for Resume
/*
-----------------------------------------------------------------------------------*/

/*----------------------------------------------------*/
/* Preloader
------------------------------------------------------ */

var $ = jQuery;

jQuery(window).load(function(){

	$('.loader').fadeOut();    
	$('#preloader').delay(350).fadeOut('slow');    
	$('body').delay(350);   

});


jQuery(document).ready(function() {

	/*----------------------------------------------------*/
	/* Initializing jQuery Nice Scroll
	------------------------------------------------------ */

	$("html").niceScroll({
		cursorcolor:"#11abb0", // Set cursor color
		cursorwidth: "8", // Sety cursor width
		cursorborder: "" // Set cursor border color, default left none
	});


	/*----------------------------------------------------*/
	/* FitText Settings
	------------------------------------------------------ */

	setTimeout(function() {
		$('h1.responsive-headline').fitText(1, { minFontSize: '28px', maxFontSize: '72px' });
	}, 100);


	/*----------------------------------------------------*/
	/* Smooth Scrolling
	------------------------------------------------------ */

	$('.smoothscroll').on('click',function (e) {
		e.preventDefault();

		var target = this.hash,
		$target = $(target);

		$('html, body').stop().animate({
			'scrollTop': $target.offset().top
		}, 800, 'swing', function () {
			window.location.hash = target;
		});

	});


	/*----------------------------------------------------*/
	/* Appear Animation
	------------------------------------------------------*/
	new WOW().init();

	/*----------------------------------------------------*/
	/* Parallax for Header Content
	------------------------------------------------------*/
	$(window).scroll(function(e){
		parallax();
	});

	function parallax() {
		var scrollPosition = $(window).scrollTop();
		$('.banner').css('margin-top', (0 - (scrollPosition * .8)) + 'px');
	}


	/*----------------------------------------------------*/
	/* Highlight the current section in the navigation bar
	------------------------------------------------------*/

	var sections = $("section");
	var navigation_links = $("#m-nav a");
	var left_navigation_links = $("#left-nav a");

	sections.waypoint({

		handler: function(event, direction) {

			var active_section;

			active_section = $(this);
			if (direction === "up") active_section = active_section.prev();

			var active_link = $('#m-nav a[href="#' + active_section.attr("id") + '"]');
			var left_active_link = $('#left-nav a[href="#' + active_section.attr("id") + '"]');

			navigation_links.parent().removeClass("current");
			left_navigation_links.parent().removeClass("current");
			active_link.parent().addClass("current");
			left_active_link.parent().addClass("current");
		},

		offset: '35%'
	});


	/*----------------------------------------------------*/
	/*	Make sure that #header-background-image height is
	/* equal to the browser height.
	------------------------------------------------------ */

	$('header').css({ 'height': $(window).height() });

	$(window).on('resize', function() {
		$('header').css({ 'height': $(window).height() });
		$('body').css({ 'width': $(window).width() })
	});


	/*----------------------------------------------------*/
	/*  On scroll blur header
	------------------------------------------------------*/
	(function() {
		$(window).scroll(function() {
			var oVal;
			oVal = $(window).scrollTop() / 100;
			return $(".header-overlay").css("opacity", oVal);
		});

	}).call(this);



	/*----------------------------------------------------*/
	/*	Fade In/Out Primary Navigation
	------------------------------------------------------*/

	$(window).on('scroll', function() {

		var h = $('header').height();
		var y = $(window).scrollTop();
		var nav = $('#m-nav');

		if ( (y > h*.20) && (y < h) && ($(window).outerWidth() > 768 ) ) {
			nav.fadeOut('fast');
		}
		else {
			if (y < h*.20) {
				nav.removeClass('opaque').fadeIn('fast');
			}
			else {
				nav.addClass('opaque').fadeIn('fast');
			}
		}
	});

	// fixing menu on small screen, make sure that all menu item can show.

	function checkMenuHeight() {
		if ( $(window).width() < 768 ) {
			var winHeight = $(window).height();
			var calHeight =  ( winHeight - 60 );
			var nav = $('#nav');
			nav.css('max-height', calHeight+'px');

		}
	}

	checkMenuHeight();

	$(window).resize(function(){
		checkMenuHeight();
	});



	/*----------------------------------------------------*/
	/*	Modal Popup
	------------------------------------------------------*/

	$('.item-wrap a').magnificPopup({
		type:'inline',
		fixedContentPos: false,
		removalDelay: 200,
		showCloseBtn: false,
		mainClass: 'mfp-fade'
	});

	$(document).on('click', '.popup-modal-dismiss', function (e) {
		e.preventDefault();
		$.magnificPopup.close();
	});


	/*----------------------------------------------------*/
	/*  Owl Carousel
	/*----------------------------------------------------*/

	$(document).ready(function() {

		$("#testimonial-slides").owlCarousel({
			navigation : false, // Show next and prev buttons
			slideSpeed : 300,
			paginationSpeed : 400,
			singleItem:true
			// "singleItem: true" is a shortcut for:
			// items : 1,
			// itemsDesktop : false,
			// itemsDesktopSmall : false,
			// itemsTablet: false,
			// itemsMobile : false
		});
	});


	// menu fixing and creating


	$('#menu').click(function(e){
		e.preventDefault();
		$(document.body).toggleClass("show-menu");
		$('.menu').toggleClass("close-menu");
	});

	var Menu = {

		el: {
			ham: $('.menu'),
			menuTop: $('.menu-top'),
			menuMiddle: $('.menu-middle'),
			menuBottom: $('.menu-bottom')
		},

		init: function() {
			Menu.bindUIactions();
		},

		bindUIactions: function() {
			Menu.el.ham.on('click',function(event) {
				event.preventDefault();
				Menu.activateMenu(event);
			});
		},

		activateMenu: function() {
			Menu.el.menuTop.toggleClass('menu-top-click');
			Menu.el.menuMiddle.toggleClass('menu-middle-click');
			Menu.el.menuBottom.toggleClass('menu-bottom-click'); 
		}
	};

	Menu.init();

	// Google Map

	if ( $('#map').length != 0 ) {
		map = new GMaps({
			el: '#map', 
			lat: Number(geo.lat),
			lng: Number(geo.lon),
			zoom: 15, 
			zoomControl : true, 
			zoomControlOpt: { 
				style : 'SMALL', 
				position: 'TOP_LEFT'
			},
			panControl : false, 
			scrollwheel: false
		});

		// add address markers

		map.addMarker({
			lat: Number(geo.lat),
			lng: Number(geo.lon),
			infoWindow: {
				content: geo.con
			}
		});
	};
});