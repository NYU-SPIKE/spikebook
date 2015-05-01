<?php
	// $temp = "<script>console.log('loaded the bp_custom script');</script>"
	// echo $temp;
	function my_test_setup_nav() {
		global $bp;
		bp_core_new_nav_item( array( 
			'name' => 'Resume',
			'slug' => 'resume', 
			'link' =>  $bp->displayed_user_domain . 'resume',
			// 'parent_url' => $bp->loggedin_user->domain . '/', 
			// 'parent_slug' => $bp->slug, 
			'screen_function' => 'my_profile_page_function_to_show_screen', 
			'position' => 50 ) 
		);

		function my_profile_page_function_to_show_screen() {
			echo ("display something");
			//add title and content here – last is to call the members plugin.php template
			add_action( 'bp_template_content', 'my_profile_page_function_to_show_screen_content' );
			bp_core_load_template( apply_filters( 'bp_core_template_plugin', 'members/single/resume/resume-template' ) );
		}
		
		function my_profile_page_function_to_show_screen_content() {

			echo "string";
		}
	}
	add_action( 'bp_setup_nav', 'my_test_setup_nav' );

	function remove_xprofile_links() {
    	remove_filter( 'bp_get_the_profile_field_value', 'xprofile_filter_link_profile_data', 9, 2 );
	}
	add_action( 'bp_init', 'remove_xprofile_links' );
// 	add_action( 'bp_setup_nav', 'add_feedback_subnav_tab', 100 );
// 	function add_feedback_subnav_tab() {
// 		global $bp;
// 		bp_core_new_subnav_item( array(
// 			'name' => 'Feedback',
// 			'slug' => 'feedback',
// 			'parent_url' => trailingslashit( bp_loggedin_user_domain() . 'profile' ),
// 			'parent_slug' => 'profile',
// 			'screen_function' => 'profile_screen_feedback',
// 			'position' => 50)
// 		);
// 	}

// // show feedback when 'Feedback' tab is clicked
// 	function profile_screen_feedback() {
// 		add_action( 'bp_template_content', 'profile_screen_feedback_show' );
// 		bp_core_load_template( apply_filters( 'bp_core_template_plugin', 'members/single/plugins' ) );
// 	}

// 	function profile_screen_feedback_show() {
// 		echo "Feedback Screen";
// 	}
// 	// call your feedback template
// 	locate_template( array( 'feedback-profile.php' ), true );	

?>