<?php Global $redux_framework; ?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php wp_title( '|', true, 'right' ); ?></title>

    <?php

    if (isset($redux_framework['custom_css'])) echo $redux_framework['custom_css'];
    if (isset($redux_framework['custom_ga'])) echo $redux_framework['custom_ga'];
    
    ?>



    <?php wp_head(); ?>
</head>

<body class="blog-body">
<div class="blog-section">
    <header class="blog-header" style="
    <?php echo 'background-image: url(' . $redux_framework['section_blog_bg']['url'] .')'; ?>
    ">
        <div class="row menu-wrap">
            <div class="menu-area">
            <?php
                $args = array(
                    'container'         => 'none',
                    'theme_location'    => 'header-menu'
                );
                wp_nav_menu( $args ); ?>
            </div>
        </div>
        <div class="row">
            <div class="head-section-area">
                <h1 class="section-heading"><?php echo $redux_framework['section_blog_title']; ?></h1>
                <h2 class="section-subheading-nobg"><?php echo $redux_framework['section_blog_des']; ?></h2>
            </div>
        </div>
    </header>
    
