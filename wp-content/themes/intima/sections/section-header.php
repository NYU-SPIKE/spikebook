<?php Global $redux_framework; ?>

<!DOCTYPE html>
<!--[if lt IE 8 ]><html class="no-js ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 8)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>

   <!--- Basic Page Needs
   ================================================== -->
    <meta charset="<?php bloginfo('charset'); ?>">
    <title><?php wp_title( '|', true, 'right' ); ?></title>
    <meta name="description" content="">
    <meta name="author" content="">

   <!-- Mobile Specific Metas
   ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

   <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.png" >
    <?php
    if (isset($redux_framework['custom_css'])) echo $redux_framework['custom_css'];
    if (isset($redux_framework['custom_ga'])) echo $redux_framework['custom_ga'];
    ?>

  <?php wp_head(); ?>

</head>

<body <?php body_class( ); ?>>

  <!-- Preloader --> 
    <div id="preloader">
      <div class="loader"></div>
    </div><!--preloader end-->


    <!-- Header
    ================================================== -->
    <header id="home" style="<?php echo 'background-color: ' . $redux_framework['header_background']['background-color'] .';'.'background-image: url(' . $redux_framework['header_background']['background-image'] .')'; ?>">

        <?php if( $redux_framework['menu_system'] == 1) : ?>
            <nav id="m-nav">
                <a class="mobile-btn" href="#m-nav" title="Show navigation">Show navigation</a>
                <a class="mobile-btn" href="#" title="Hide navigation">Hide navigation</a>

                <ul id="nav" class="nav">
                    <?php echo intima_menu(); ?>
                </ul>
            </nav>
        <?php else : ?>
            <nav id="left-nav">
                <div class="logo">
                    <img src="<?php echo $redux_framework['section_leftmenu_avatar']['url']; ?>">
                </div>
                <div class="menu" id="menu">
                    <span class="menu-global menu-top"></span>
                    <span class="menu-global menu-middle"></span>
                    <span class="menu-global menu-bottom"></span>
                </div>
                <ul id="nav" class="nav">
                    <?php echo intima_menu(true); ?>
                </ul>
            </nav>
        <?php endif; ?>



        <div class="row banner">
            <div class="banner-text">
                <h1 class="responsive-headline wow zoomIn"><?php echo $redux_framework['header_title'] ?></h1>
                <h3 class="wow fadeInUp"><?php echo $redux_framework['header_text'] ?></h3>
                <hr />
            </div>
        </div>

        <p class="scrolldown">
            <a class="smoothscroll" href="#about"><i class="fa fa-angle-double-down"></i></a>
        </p>

        <div class="header-overlay" style="<?php echo 'background-color: ' . $redux_framework['header_overlay_background']['background-color'] .';'.'background-image: url(' . $redux_framework['header_overlay_background']['background-image'] .')'; ?>"></div>

        <!-- Social Section
        ================================================== -->
        <?php $links = the_social_links();
        if ( !empty( $links ) ) : ?>

        <div id="social">
            <div class="row social-container">
                <ul class='social'><?php echo $links; ?></ul>
            </div>
        </div> <!-- Social End -->

        <?php endif; ?>



    </header> <!-- Header End -->