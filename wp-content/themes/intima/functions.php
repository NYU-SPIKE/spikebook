<?php

// load_textdomain('intima', 'intima');

require_once dirname( __FILE__ ) . '/class-tgm-plugin-activation.php';

if (!class_exists('ReduxFramework') && file_exists(dirname(__FILE__) . '/ReduxCore/framework.php')) {
    require_once(dirname(__FILE__) . '/ReduxCore/framework.php');
}


if (!isset($redux_demo) && file_exists(dirname(__FILE__) . '/ReduxConfigs/admin-config.php')) {
    require_once (dirname(__FILE__) . '/ReduxConfigs/admin-config.php');
}


if ( ! isset( $content_width ) ) {
    $content_width = 1000;
}




// Intima Menu

function intima_menu_register()
{
    $locations = array(
        'header-menu' => 'Header Menu',
    );

    register_nav_menus($locations);
}
add_action('init','intima_menu_register' );



// Thumbnail Support por post

add_theme_support('post-thumbnails', array('post'));
add_theme_support( 'automatic-feed-links' );

Global $redux_framework;


// Intima Metaboxes

function intima_metaboxes()
{
    $prefix = "_intima_";


    // Educations
    $meta_boxes[] = array(
        'id' => 'education',
        'title' => __('Education Details (Latest education will be displayed on top)',"intima"),
        'pages' => array('education'), // post type
        'context' => 'normal',
        'priority' => 'high',
        'show_names' => true, // Show field names on the left
        'fields' => array(
            array(
                'name' => __('Time (From - To): ',"intima"),
                'id' => $prefix . 'edu_time',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('College: ',"intima"),
                'id' => $prefix . 'edu_college',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Degree Earned: ',"intima"),
                'id' => $prefix . 'edu_degree',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Result: ',"intima"),
                'id' => $prefix . 'edu_result',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Description: ',"intima"),
                'id' => $prefix . 'edu_description',
                'type' => 'wysiwyg',

            ),
        )
    );


	// Employments
    $meta_boxes[] = array(
        'id' => 'employment',
        'title' => __('Employment Details (Latest employment will be displayed on top)',"intima"),
        'pages' => array('employment'), // post type
        'context' => 'normal',
        'priority' => 'high',
        'show_names' => true, // Show field names on the left
        'fields' => array(
            array(
                'name' => __('Time (From - To): ',"intima"),
                'id' => $prefix . 'emp_time',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Company Name: ',"intima"),
                'id' => $prefix . 'emp_name',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Company URL: ',"intima"),
                'id' => $prefix . 'emp_url',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Position: ',"intima"),
                'id' => $prefix . 'emp_position',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Description: ',"intima"),
                'id' => $prefix . 'emp_description',
                'type' => 'wysiwyg'
            ),
        )
    );


	// Recognitions
    $meta_boxes[] = array(
        'id' => 'recognition',
        'title' => __('Recognition Details (Latest recognition will be displayed on top)',"intima"),
        'pages' => array('recognition'), // post type
        'context' => 'normal',
        'priority' => 'high',
        'show_names' => true, // Show field names on the left
        'fields' => array(
            array(
                'name' => __('Recognition Name: ',"intima"),
                'id' => $prefix . 'rec_name',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Recognition Title: ',"intima"),
                'id' => $prefix . 'rec_title',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Location: ',"intima"),
                'id' => $prefix . 'rec_location',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Front-Awesome Icon Name: ',"intima"),
                'description' => 'ex: fa-trophy',
                'default' => 'fa-trophy',
                'id' => $prefix . 'rec_icon',
                'type' => 'text_medium'
            ),
        )
    );


    // Portfolios
    $meta_boxes[] = array(
        'id' => 'portfolio',
        'title' => __('Portfolio Details (Latest portfolio will be displayed first)',"intima"),
        'pages' => array('portfolio'), // post type
        'context' => 'normal',
        'priority' => 'high',
        'show_names' => true, // Show field names on the left
        'fields' => array(
            array(
                'name' => __('Portfolio Title: ',"intima"),
                'id' => $prefix . 'port_title',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Category: ',"intima"),
                'id' => $prefix . 'port_ceta',
                'type' => 'text_medium'
            ),
			array(
			    'name' => 'Thumbnail: ',
			    'desc' => 'Enter an URL or Upload an image.',
			    'id' => $prefix . 'port_thumb',
			    'type' => 'file',
			),
            array(
                'name' => __('Tags: ',"intima"),
                'id' => $prefix . 'port_tags',
                'desc' => 'like: BRANDING, WEBDESIGN',
                'type' => 'text'
            ),
            array(
                'name' => __('Live Demo Link: ',"intima"),
                'id' => $prefix . 'port_link',
                'type' => 'text'
            ),
            array(
                'name' => __('Portfolio Details: ',"intima"),
                'id' => $prefix . 'portfolio_description',
                'type' => 'wysiwyg'
            ),
        )
    );


	// Testimonials
    $meta_boxes[] = array(
        'id' => 'testimonial',
        'title' => __('Testimonial Details (Latest testimonial will be displayed first)',"intima"),
        'pages' => array('testimonial'), // post type
        'context' => 'normal',
        'priority' => 'high',
        'show_names' => true, // Show field names on the left
        'fields' => array(
            array(
                'name' => __('Person Name ',"intima"),
                'id' => $prefix . 'test_name',
                'type' => 'text_medium'
            ),
            array(
                'name' => __('Testimonial ',"intima"),
                'id' => $prefix . 'test_description',
                'type' => 'textarea'
            ),
        )
    );

    return $meta_boxes;
}

add_filter('cmb_meta_boxes', 'intima_metaboxes');



// Initialize the metabox class

function intima_initialize_cmb_meta_boxes()
{
    if (!class_exists('cmb_Meta_Box')) {
        require_once('libs/cmb/init.php');
    }
}
add_action('init', 'intima_initialize_cmb_meta_boxes', 9999);




// post types

function intima_custom_posts()
{
	// Educations

    $labels1 = array(
        'name' => _x('Educations', 'Post Type General Name', 'intima'),
        'singular_name' => _x('Education', 'Post Type Singular Name', 'intima'),
        'menu_name' => __('Educations', 'intima'),
        'parent_item_colon' => __('Parent Education:', 'intima'),
        'all_items' => __('All Educations', 'intima'),
        'view_item' => __('View Education', 'intima'),
        'add_new_item' => __('Add New Education', 'intima'),
        'add_new' => __('New Education', 'intima'),
        'edit_item' => __('Edit Education', 'intima'),
        'update_item' => __('Update Education', 'intima'),
        'search_items' => __('Search Educations', 'intima'),
        'not_found' => __('No education found', 'intima'),
        'not_found_in_trash' => __('No educations found in Trash', 'intima'),
    );
    $args1 = array(
        'label' => __('Education', 'intima'),
        'description' => __('Education', 'intima'),
        'labels' => $labels1,
        'supports' => array('title'),
        'hierarchical' => false,
        'public' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,
        'show_in_admin_bar' => true,
        'menu_position' => 5,
        'menu_icon' => get_template_directory_uri() . '/images/admin_icons/education.png',
        'can_export' => true,
        'has_archive' => true,
        'exclude_from_search' => false,
        'publicly_queryable' => true,
        'capability_type' => 'page',
    );
    register_post_type('education', $args1);


    // Employments

    $labels2 = array(
        'name' => _x('Employments', 'Post Type General Name', 'intima'),
        'singular_name' => _x('Employment', 'Post Type Singular Name', 'intima'),
        'menu_name' => __('Employments', 'intima'),
        'parent_item_colon' => __('Parent Employment:', 'intima'),
        'all_items' => __('All Employments', 'intima'),
        'view_item' => __('View Employment', 'intima'),
        'add_new_item' => __('Add New Employment', 'intima'),
        'add_new' => __('New Employment', 'intima'),
        'edit_item' => __('Edit Employment', 'intima'),
        'update_item' => __('Update Employment', 'intima'),
        'search_items' => __('Search Employment', 'intima'),
        'not_found' => __('No employment found', 'intima'),
        'not_found_in_trash' => __('No employments found in Trash', 'intima'),
    );
    $args2 = array(
        'label' => __('Employment', 'intima'),
        'description' => __('Employment', 'intima'),
        'labels' => $labels2,
        'supports' => array('title'),
        'hierarchical' => false,
        'public' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,
        'show_in_admin_bar' => true,
        'menu_position' => 5,
        'menu_icon' => get_template_directory_uri() . '/images/admin_icons/employment.png',
        'can_export' => true,
        'has_archive' => true,
        'exclude_from_search' => false,
        'publicly_queryable' => true,
        'capability_type' => 'page',
    );
    register_post_type('employment', $args2);


    // Recognitions

    $labels3 = array(
        'name' => _x('Recognitions', 'Post Type General Name', 'intima'),
        'singular_name' => _x('Recognition', 'Post Type Singular Name', 'intima'),
        'menu_name' => __('Recognitions', 'intima'),
        'parent_item_colon' => __('Parent Recognition:', 'intima'),
        'all_items' => __('All Recognitions', 'intima'),
        'view_item' => __('View Recognition', 'intima'),
        'add_new_item' => __('Add New Recognition', 'intima'),
        'add_new' => __('New Recognition', 'intima'),
        'edit_item' => __('Edit Recognition', 'intima'),
        'update_item' => __('Update Recognition', 'intima'),
        'search_items' => __('Search Recognition', 'intima'),
        'not_found' => __('No recognition found', 'intima'),
        'not_found_in_trash' => __('No recognitions found in Trash', 'intima'),
    );
    $args3 = array(
        'label' => __('recognition', 'intima'),
        'description' => __('recognition', 'intima'),
        'labels' => $labels3,
        'supports' => array('title'),
        'hierarchical' => false,
        'public' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,
        'show_in_admin_bar' => true,
        'menu_position' => 5,
        'menu_icon' => get_template_directory_uri() . '/images/admin_icons/recognition.png',
        'can_export' => true,
        'has_archive' => true,
        'exclude_from_search' => false,
        'publicly_queryable' => true,
        'capability_type' => 'page',
    );
    register_post_type('recognition', $args3);


    // Portfolios

    $labels4 = array(
        'name' => _x('Portfolios', 'Post Type General Name', 'intima'),
        'singular_name' => _x('Portfolio', 'Post Type Singular Name', 'intima'),
        'menu_name' => __('Portfolios', 'intima'),
        'parent_item_colon' => __('Parent Portfolio:', 'intima'),
        'all_items' => __('All Portfolios', 'intima'),
        'view_item' => __('View Portfolio', 'intima'),
        'add_new_item' => __('Add New Portfolio', 'intima'),
        'add_new' => __('New Portfolio', 'intima'),
        'edit_item' => __('Edit Portfolio', 'intima'),
        'update_item' => __('Update Portfolio', 'intima'),
        'search_items' => __('Search Portfolios', 'intima'),
        'not_found' => __('No portfolio found', 'intima'),
        'not_found_in_trash' => __('No portfolios found in Trash', 'intima'),
    );
    $args4 = array(
        'label' => __('Portfolio', 'intima'),
        'description' => __('Portfolio', 'intima'),
        'labels' => $labels4,
        'supports' => array('title'),
        'hierarchical' => false,
        'public' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,
        'show_in_admin_bar' => true,
        'menu_position' => 5,
        'menu_icon' => get_template_directory_uri() . '/images/admin_icons/portfolio.png',
        'can_export' => true,
        'has_archive' => true,
        'exclude_from_search' => false,
        'publicly_queryable' => true,
        'capability_type' => 'page',
    );
    register_post_type('portfolio', $args4);


    // Testimonials

    $labels5 = array(
        'name' => _x('Testimonials', 'Post Type General Name', 'intima'),
        'singular_name' => _x('Testimonial', 'Post Type Singular Name', 'intima'),
        'menu_name' => __('Testimonials', 'intima'),
        'parent_item_colon' => __('Parent Testimonial:', 'intima'),
        'all_items' => __('All Testimonials', 'intima'),
        'view_item' => __('View Testimonial', 'intima'),
        'add_new_item' => __('Add New Testimonial', 'intima'),
        'add_new' => __('New Testimonial', 'intima'),
        'edit_item' => __('Edit Testimonial', 'intima'),
        'update_item' => __('Update Testimonial', 'intima'),
        'search_items' => __('Search Testimonials', 'intima'),
        'not_found' => __('No testimonial found', 'intima'),
        'not_found_in_trash' => __('No testimonials found in Trash', 'intima'),
    );
    $args5 = array(
        'label' => __('Testimonial', 'intima'),
        'description' => __('Testimonial', 'intima'),
        'labels' => $labels5,
        'supports' => array('title'),
        'hierarchical' => false,
        'public' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,
        'show_in_admin_bar' => true,
        'menu_position' => 5,
        'menu_icon' => get_template_directory_uri() . '/images/admin_icons/testimonial.png',
        'can_export' => true,
        'has_archive' => true,
        'exclude_from_search' => false,
        'publicly_queryable' => true,
        'capability_type' => 'page',
    );
    register_post_type('testimonial', $args5);
}

add_action('init', 'intima_custom_posts', 0);



function intima_get_custom_posts($type, $limit = 20, $order = "DESC")
{
    //wp_reset_postdata();
    $args = array(
        "posts_per_page" => $limit,
        "post_type" => $type,
        "orderby" => "ID",
        "order" => $order,
    );
    $custom_posts = get_posts($args);
    return $custom_posts;
}



function intima_get_query_posts($type, $limit = 20, $order = "DESC")
{
    //wp_reset_postdata();
    $args = array(
        "posts_per_page" => $limit,
        "post_type" => $type,
        "orderby" => "ID",
        "order" => $order,
    );
    $custom_posts = new wp_query($args);
    return $custom_posts;
}


function intima_truncate($string, $limit, $break=".", $pad="...")
{
    // return with no change if string is shorter than $limit
    if(strlen($string) <= $limit) return $string;

    // is $break present between $limit and the end of the string?
    if(false !== ($breakpoint = strpos($string, $break, $limit))) {
        if($breakpoint < strlen($string) - 1) {
            $string = substr($string, 0, $breakpoint) . $pad;
        }
    }

    return $string;
}


function get_order_value($val)
{
    if ( $val == 1 ) {
        return 'ASC';
    } else {
        return "DESC";
    }
}


function the_social_links()
{
    Global $redux_framework;


    $facebook_data = ( isset($redux_framework['social_facebook']) ) ? trim( $redux_framework['social_facebook'] ) : "";
    $twitter_data = ( isset($redux_framework['social_twitter']) ) ? trim( $redux_framework['social_twitter'] ) : "";
    $google_data = ( isset($redux_framework['social_google']) ) ? trim( $redux_framework['social_google'] ) : "";
    $linkedin_data = ( isset($redux_framework['social_linkedin']) ) ? trim( $redux_framework['social_linkedin'] ) : "";
    $instagram_data = ( isset($redux_framework['social_instagram']) ) ? trim( $redux_framework['social_instagram'] ) : "";
    $dribbble_data = ( isset($redux_framework['social_dribbble']) ) ? trim( $redux_framework['social_dribbble'] ) : "";
    $skype_data = ( isset($redux_framework['social_skype']) ) ? trim( $redux_framework['social_skype'] ) : "";

    $social_links = array(
        'facebook'  => array(
            'data' => $facebook_data,
            'icon' => 'fa-facebook'
        ),
        'twitter'   => array(
            'data' => $twitter_data,
            'icon' => 'fa-twitter'
        ),
        'google'    => array(
            'data' => $google_data,
            'icon' => 'fa-google-plus'
        ),
        'linkedin'  => array(
            'data' => $linkedin_data,
            'icon' => 'fa-linkedin'
        ),
        'instagram' => array(
            'data' => $instagram_data,
            'icon' => 'fa-instagram'
        ),
        'dribbble'  => array(
            'data' => $dribbble_data,
            'icon' => 'fa-dribbble'
        ),
        'skype' => array(
            'data' => $skype_data,
            'icon' => 'fa-skype'
        )
    );

    $htmlLinks = "";

    foreach ($social_links as $social_name => $social_link) {
        if ( !empty($social_link['data']) ) {
            if ( $social_name == 'skype' ) {
                $htmlLinks.= "<li><a href='callto:{$social_link['data']}' target='_blank'><i class='fa {$social_link['icon']}'></i></a></li>";
            } else {

                $htmlLinks.= "<li><a href='{$social_link['data']}' target='_blank'><i class='fa {$social_link['icon']}'></i></a></li>";
            }
        }
    }

    return $htmlLinks;
}


function intima_menu($left_nav = false)
{
    Global $redux_framework;

    $menu_links = array(
        'home' => array(
            'is_show' => $redux_framework['header_display_menu'],
            'menu_text' => $redux_framework['header_menu_text'],
            'menu_icon' => $redux_framework['header_menu_icon'],
            'target' => '#home',
            'is_active' => 1
        ),
        'about' => array(
            'is_show' => $redux_framework['section_about_display_menu'],
            'menu_text' => $redux_framework['section_about_menu_text'],
            'menu_icon' => $redux_framework['section_about_menu_icon'],
            'target' => '#about',
            'is_active' => 0
        ),
        'resume' => array(
            'is_show' => $redux_framework['section_resume_display_menu'],
            'menu_text' => $redux_framework['section_resume_menu_text'],
            'menu_icon' => $redux_framework['section_resume_menu_icon'],
            'target' => '#resume',
            'is_active' => 0
        ),
        'portfolio' => array(
            'is_show' => $redux_framework['section_portfolio_display_menu'],
            'menu_text' => $redux_framework['section_portfolio_menu_text'],
            'menu_icon' => $redux_framework['section_portfolio_menu_icon'],
            'target' => '#portfolio',
            'is_active' => 0
        ),
        'testimonial' => array(
            'is_show' => $redux_framework['section_testimonial_display_menu'],
            'menu_text' => $redux_framework['section_testimonial_menu_text'],
            'menu_icon' => $redux_framework['section_testimonial_menu_icon'],
            'target' => '#testimonials',
            'is_active' => 0
        ),
        'contact' => array(
            'is_show' => $redux_framework['section_contact_display_menu'],
            'menu_text' => $redux_framework['section_contact_menu_text'],
            'menu_icon' => $redux_framework['section_contact_menu_icon'],
            'target' => '#contact',
            'is_active' => 0
        ),
        'blog' => array(
            'is_show' => $redux_framework['section_blog_display_menu'],
            'menu_text' => $redux_framework['section_blog_menu_text'],
            'menu_icon' => $redux_framework['section_blog_menu_icon'],
            'target' => $redux_framework['section_blog_menu_link'],
            'is_active' => 0
        ),

    );

    $htmlLinks = "";

    foreach ($menu_links as $menu_name => $menu_link) {
        if ( $left_nav == true ) {
            if( $menu_link['is_show'] == 1 ){
                if ( $menu_link['is_active'] == 1 ) {
                    $htmlLinks.= "<li class='current'><a class='smoothscroll' href='{$menu_link['target']}'><i class='fa {$menu_link['menu_icon']} fa-fw'></i>{$menu_link['menu_text']}</a></li>";
                } else {
                    if ( $menu_name == 'blog' ) {
                        $htmlLinks.= "<li><a href='{$menu_link['target']}'><i class='fa {$menu_link['menu_icon']} fa-fw'></i>{$menu_link['menu_text']}</a></li>";
                    } else {
                        $htmlLinks.= "<li><a class='smoothscroll' href='{$menu_link['target']}'><i class='fa {$menu_link['menu_icon']} fa-fw'></i>{$menu_link['menu_text']}</a></li>";
                    }
                }
            }
        } else {
            if( $menu_link['is_show'] == 1 ){
                if ( $menu_link['is_active'] == 1 ) {
                    $htmlLinks.= "<li class='current'><a class='smoothscroll' href='{$menu_link['target']}'>{$menu_link['menu_text']}</a></li>";
                } else {
                    if ( $menu_name == 'blog' ) {
                        $htmlLinks.= "<li><a href='{$menu_link['target']}'>{$menu_link['menu_text']}</a></li>";
                    } else {
                        $htmlLinks.= "<li><a class='smoothscroll' href='{$menu_link['target']}'>{$menu_link['menu_text']}</a></li>";
                    }
                }
            }
        }
    }

    return $htmlLinks;

}


function intima_comment_walker($comment, $args, $depth)
{
    ?>
    <div <?php comment_class('media blog-cmnt'); ?> id="comment-<?php comment_ID(); ?>">
        <a href="javascript:;" class="pull-left avater-link">
            <?php echo get_avatar($comment->user_id); ?>
        </a>

        <div class="media-body">
            <h4 class="media-heading">
                <a href="#"><?php echo intima_comment_author($comment->user_id, $comment->comment_ID); ?></a>
            </h4>

            <div class="bl-status cf">
                <span class="pull-left"><?php echo get_comment_date("d F, Y"); ?></span>
                <?php comment_reply_link(array_merge($args, array('add_below' => "comment", 'depth' => $depth, 'max_depth' => $args['max_depth']))) ?>
            </div>
            <?php
            $cmnt = get_comment_text();
            echo wpautop($cmnt);
            ?>
        </div>
    </div>
    <?php
}


function intima_comment_author($id, $comment_id)
{
    $user = new WP_User($id);
    if ($user) {
        return $user->display_name;
    }
    return get_comment_author($comment_id);
}


function intima_user_display_name($id)
{
    $user = new WP_User($id);
    return $user->display_name;
}


function intima_scripts()
{
    global $redux_framework;
    wp_enqueue_style('intima-style', get_stylesheet_uri());
    wp_enqueue_script("jquery");
    wp_enqueue_style( 'default', get_template_directory_uri() . '/css/default.css' );

    if (is_page() && basename(get_page_template())=="landing-page.php") {

        // landing page

        wp_enqueue_style('home_style', get_template_directory_uri() . "/css/style.css");
        wp_enqueue_style('responsive', get_template_directory_uri() . "/css/responsive.css");
        wp_enqueue_style('animate', get_template_directory_uri() . "/css/animate.css");
        wp_enqueue_style('magnific_popup', get_template_directory_uri() . "/css/magnific-popup.css");
        wp_enqueue_style('owl_carousel', get_template_directory_uri() . "/assets/owl-carousel/owl.carousel.css");
        wp_enqueue_style('owl_theme', get_template_directory_uri() . "/assets/owl-carousel/owl.theme.css");


        wp_enqueue_script('modernizr', get_template_directory_uri() . '/js/modernizr.js', array(), '1', false);
        wp_enqueue_script('googleapis', 'https://maps.googleapis.com/maps/api/js?v=3.exp&AMP;sensor=false', array(), '', true);
        wp_enqueue_script('gmap', get_template_directory_uri() . '/js/gmaps.js', array("googleapis"), '1', true);
        wp_enqueue_script('owl_carousel', get_template_directory_uri() . '/assets/owl-carousel/owl.carousel.min.js', array("jquery"), '1', true);
        wp_enqueue_script('waypoints', get_template_directory_uri() . '/js/waypoints.js', array("jquery"), '1', true);
        wp_enqueue_script('fittext', get_template_directory_uri() . '/js/jquery.fittext.js', array("jquery"), '1', true);
        wp_enqueue_script('magnific_popup', get_template_directory_uri() . '/js/magnific-popup.js', array("jquery"), '1', true);
        wp_enqueue_script('wow', get_template_directory_uri() . '/js/wow.min.js', array("jquery"), '1', true);
        wp_enqueue_script('nicescroll', get_template_directory_uri() . '/js/jquery.nicescroll.min.js', array("jquery"), '1', true);
        wp_enqueue_script('script', get_template_directory_uri() . '/js/script.js', array("jquery", "googleapis", "gmap"), '1', true);

        if (isset($redux_framework['section_contact_lat']) && isset($redux_framework['section_contact_lon'])) {
            wp_localize_script("script", "geo",
                array(
                    "lat" => trim($redux_framework['section_contact_lat']),
                    "lon" => trim($redux_framework['section_contact_lon']),
                    "con" => wpautop($redux_framework['section_contact_description'])
                )
            );
        }

    } else if ( $redux_framework['blog_page_template_select'] == 1 ) {
        wp_enqueue_style('blog_style_main', get_template_directory_uri() . "/css/blog.css");
        wp_enqueue_style('timeline_blog_style', get_template_directory_uri() . "/css/timeline-blog.css");
        wp_enqueue_script('nicescroll', get_template_directory_uri() . '/js/jquery.nicescroll.min.js', array("jquery"), '1', true);
        wp_enqueue_script('blog_scripts', get_template_directory_uri() . '/js/script-blog.js', array("jquery"), '1', true);

    } else if ( $redux_framework['blog_page_template_select'] == 2 ) {
        wp_enqueue_style('blog_style_main', get_template_directory_uri() . "/css/blog.css");
        wp_enqueue_style('timeline_blog_style', get_template_directory_uri() . "/css/timeline-blog.css");
        wp_enqueue_script('nicescroll', get_template_directory_uri() . '/js/jquery.nicescroll.min.js', array("jquery"), '1', true);
        wp_enqueue_script('blog_scripts', get_template_directory_uri() . '/js/script-blog.js', array("jquery"), '1', true);

    } else {
        wp_enqueue_style('blog_style_main', get_template_directory_uri() . "/css/blog.css");
        wp_enqueue_script('nicescroll', get_template_directory_uri() . '/js/jquery.nicescroll.min.js', array("jquery"), '1', true);
        wp_enqueue_script('blog_scripts', get_template_directory_uri() . '/js/script-blog.js', array("jquery"), '1', true);

    }

    if (is_singular() && comments_open() && get_option('thread_comments')) {
        wp_enqueue_script('comment-reply');
    }
}

add_action('wp_enqueue_scripts', 'intima_scripts');




// TMGA

add_action( 'tgmpa_register', 'intima_register_required_plugins' );

function intima_register_required_plugins() {

    /**
     * Array of plugin arrays. Required keys are name, slug and required.
     * If the source is NOT from the .org repo, then source is also required.
     */
    $plugins = array(

        array(
            'name'                  => 'Contact Form 7', // The plugin name
            'slug'                  => 'contact-form-7', // The plugin slug (typically the folder name)
            'source'                => get_template_directory_uri() . '/plugins/contact-form-7.zip', // The plugin source
            'required'              => false, // If false, the plugin is only 'recommended' instead of required
            'version'               => '', // E.g. 1.0.0. If set, the active plugin must be this version or higher, otherwise a notice is presented
            'force_activation'      => false, // If true, plugin is activated upon theme activation and cannot be deactivated until theme switch
            'force_deactivation'    => false, // If true, plugin is deactivated upon theme switch, useful for theme-specific plugins
            'external_url'          => '', // If set, overrides default API URL and points to an external URL
        )

    );

    // Change this to your theme text domain, used for internationalising strings
    $theme_text_domain = 'intima';

    $config = array(
        'id'                => 'intimaTMGID5790',
        'domain'            => $theme_text_domain,           // Text domain - likely want to be the same as your theme.
        'default_path'      => '',                           // Default absolute path to pre-packaged plugins
        'parent_menu_slug'  => 'themes.php',         // Default parent menu slug
        'parent_url_slug'   => 'themes.php',         // Default parent URL slug
        'menu'              => 'install-required-plugins',   // Menu slug
        'has_notices'       => true,                         // Show admin notices or not
        'is_automatic'      => false,            // Automatically activate plugins after installation or not
        'message'           => '',               // Message to output right before the plugins table
        'strings'           => array(
            'page_title'                                => __( 'Install Required Plugins', $theme_text_domain ),
            'menu_title'                                => __( 'Install Plugins', $theme_text_domain ),
            'installing'                                => __( 'Installing Plugin: %s', $theme_text_domain ), // %1$s = plugin name
            'oops'                                      => __( 'Something went wrong with the plugin API.', $theme_text_domain ),
            'notice_can_install_required'               => _n_noop( 'This theme requires the following plugin: %1$s.', 'This theme requires the following plugins: %1$s.' ), // %1$s = plugin name(s)
            'notice_can_install_recommended'            => _n_noop( 'This theme recommends the following plugin: %1$s.', 'This theme recommends the following plugins: %1$s.' ), // %1$s = plugin name(s)
            'notice_cannot_install'                     => _n_noop( 'Sorry, but you do not have the correct permissions to install the %s plugin. Contact the administrator of this site for help on getting the plugin installed.', 'Sorry, but you do not have the correct permissions to install the %s plugins. Contact the administrator of this site for help on getting the plugins installed.' ), // %1$s = plugin name(s)
            'notice_can_activate_required'              => _n_noop( 'The following required plugin is currently inactive: %1$s.', 'The following required plugins are currently inactive: %1$s.' ), // %1$s = plugin name(s)
            'notice_can_activate_recommended'           => _n_noop( 'The following recommended plugin is currently inactive: %1$s.', 'The following recommended plugins are currently inactive: %1$s.' ), // %1$s = plugin name(s)
            'notice_cannot_activate'                    => _n_noop( 'Sorry, but you do not have the correct permissions to activate the %s plugin. Contact the administrator of this site for help on getting the plugin activated.', 'Sorry, but you do not have the correct permissions to activate the %s plugins. Contact the administrator of this site for help on getting the plugins activated.' ), // %1$s = plugin name(s)
            'notice_ask_to_update'                      => _n_noop( 'The following plugin needs to be updated to its latest version to ensure maximum compatibility with this theme: %1$s.', 'The following plugins need to be updated to their latest version to ensure maximum compatibility with this theme: %1$s.' ), // %1$s = plugin name(s)
            'notice_cannot_update'                      => _n_noop( 'Sorry, but you do not have the correct permissions to update the %s plugin. Contact the administrator of this site for help on getting the plugin updated.', 'Sorry, but you do not have the correct permissions to update the %s plugins. Contact the administrator of this site for help on getting the plugins updated.' ), // %1$s = plugin name(s)
            'install_link'                              => _n_noop( 'Begin installing plugin', 'Begin installing plugins' ),
            'activate_link'                             => _n_noop( 'Activate installed plugin', 'Activate installed plugins' ),
            'return'                                    => __( 'Return to Required Plugins Installer', $theme_text_domain ),
            'plugin_activated'                          => __( 'Plugin activated successfully.', $theme_text_domain ),
            'complete'                                  => __( 'All plugins installed and activated successfully. %s', $theme_text_domain ) // %1$s = dashboard link
        )
    );

    tgmpa( $plugins, $config );

}



function intima_widgets_init()
{
    register_sidebar(array(
        'name' => __('Sidebar', 'intima'),
        'id' => 'sidebar-1',
        'before_widget' => '<aside id="%1$s" class="widget %2$s">',
        'after_widget' => '</aside>',
        'before_title' => '<h1 class="widget-title">',
        'after_title' => '</h1>',
        'description'=>__("Blog Sidebar","intima")
    ));
}

add_action('widgets_init', 'intima_widgets_init');


function get_current_page_template(){

    global $redux_framework;

    $template_id = $redux_framework['blog_page_template_select'];

    if ( $template_id == 1 ) {
        get_template_part("blog/timeline-blog");

    } else if ( $template_id == 2 ) {
        get_template_part("blog/timeline-blog-fullwidth");

    } else if ( $template_id == 4 ) {
        get_template_part("blog/standard-blog-fullwidth");

    } else {
        get_template_part("blog/standard-blog");
    }
}

function get_current_single_page(){
    global $redux_framework;
    
    if ( $redux_framework['single_page_sidebar_display'] == 1 ) {
        get_template_part("blog/single_with_sidebar");
    } else {
        get_template_part("blog/single_full_width");
    }
}





function intima_wp_title( $title, $sep ) {
    global $paged, $page;

    if ( is_feed() ) {
        return $title;
    } // end if

    // Add the site name.
    $title .= get_bloginfo( 'name' );

    // Add the site description for the home/front page.
    $site_description = get_bloginfo( 'description', 'display' );
    if ( $site_description && ( is_home() || is_front_page() ) ) {
        $title = "$title $sep $site_description";
    } // end if

    // Add a page number if necessary.
    if ( $paged >= 2 || $page >= 2 ) {
        $title = sprintf( __( 'Page %s', 'intima' ), max( $paged, $page ) ) . " $sep $title";
    } // end if

    return $title;
}
add_filter( 'wp_title', 'intima_wp_title', 10, 2 );


// custom function to change menu items for logged-in and logged-out users
function my_wp_nav_menu_args( $args = '' ) {
if( is_user_logged_in() ) {
    $args['menu'] = 'logged-in';
} else {
    $args['menu'] = 'logged-out';
}
    return $args;
}
add_filter( 'wp_nav_menu_args', 'my_wp_nav_menu_args' );