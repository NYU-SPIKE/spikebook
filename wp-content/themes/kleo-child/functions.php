<?php
/**
 * @package WordPress
 * @subpackage Kleo
 * @author SeventhQueen <themesupport@seventhqueen.com>
 * @since Kleo 1.0
 */

/**
 * Kleo Child Theme Functions
 * Add custom code below
*/ 

function my_wp_nav_menu_args( $args = '' ) {
	if( is_user_logged_in() ) {
	    $args['menu'] = 'logged-in';
	} else {
	    $args['menu'] = 'logged-out';
	}
	    return $args;
	}
add_filter( 'wp_nav_menu_args', 'my_wp_nav_menu_args' );