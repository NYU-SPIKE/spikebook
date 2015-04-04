<?php
    /**
     * ReduxFramework Sample Config File
     * For full documentation, please visit: http://docs.reduxframework.com/
     */

    if ( ! class_exists( 'Redux_Framework_sample_config' ) ) {

        class Redux_Framework_sample_config {

            public $args = array();
            public $sections = array();
            public $theme;
            public $ReduxFramework;

            public function __construct() {

                if ( ! class_exists( 'ReduxFramework' ) ) {
                    return;
                }

                // This is needed. Bah WordPress bugs.  ;)
                if ( true == Redux_Helpers::isTheme( __FILE__ ) ) {
                    $this->initSettings();
                } else {
                    add_action( 'plugins_loaded', array( $this, 'initSettings' ), 10 );
                }
            }

            public function initSettings() {

                // Just for demo purposes. Not needed per say.
                $this->theme = wp_get_theme();

                // Set the default arguments
                $this->setArguments();

                // Set a few help tabs so you can see how it's done
                $this->setHelpTabs();

                // Create the sections and fields
                $this->setSections();

                if ( ! isset( $this->args['opt_name'] ) ) { // No errors please
                    return;
                }

                // If Redux is running as a plugin, this will remove the demo notice and links
                //add_action( 'redux/loaded', array( $this, 'remove_demo' ) );

                // Function to test the compiler hook and demo CSS output.
                // Above 10 is a priority, but 2 in necessary to include the dynamically generated CSS to be sent to the function.
                //add_filter('redux/options/'.$this->args['opt_name'].'/compiler', array( $this, 'compiler_action' ), 10, 3);

                // Change the arguments after they've been declared, but before the panel is created
                //add_filter('redux/options/'.$this->args['opt_name'].'/args', array( $this, 'change_arguments' ) );

                // Change the default value of a field after it's been set, but before it's been useds
                //add_filter('redux/options/'.$this->args['opt_name'].'/defaults', array( $this,'change_defaults' ) );

                // Dynamically add a section. Can be also used to modify sections/fields
                //add_filter('redux/options/' . $this->args['opt_name'] . '/sections', array($this, 'dynamic_section'));

                $this->ReduxFramework = new ReduxFramework( $this->sections, $this->args );
            }

            /**
             * This is a test function that will let you see when the compiler hook occurs.
             * It only runs if a field    set with compiler=>true is changed.
             * */
            function compiler_action( $options, $css, $changed_values ) {
                echo '<h1>The compiler hook has run!</h1>';
                echo "<pre>";
                print_r( $changed_values ); // Values that have changed since the last save
                echo "</pre>";
                //print_r($options); //Option values
                //print_r($css); // Compiler selector CSS values  compiler => array( CSS SELECTORS )

                /*
              // Demo of how to use the dynamic CSS and write your own static CSS file
              $filename = dirname(__FILE__) . '/style' . '.css';
              global $wp_filesystem;
              if( empty( $wp_filesystem ) ) {
                require_once( ABSPATH .'/wp-admin/includes/file.php' );
              WP_Filesystem();
              }

              if( $wp_filesystem ) {
                $wp_filesystem->put_contents(
                    $filename,
                    $css,
                    FS_CHMOD_FILE // predefined mode settings for WP files
                );
              }
             */
            }

            /**
             * Custom function for filtering the sections array. Good for child themes to override or add to the sections.
             * Simply include this function in the child themes functions.php file.
             * NOTE: the defined constants for URLs, and directories will NOT be available at this point in a child theme,
             * so you must use get_template_directory_uri() if you want to use any of the built in icons
             * */
            function dynamic_section( $sections ) {
                //$sections = array();
                $sections[] = array(
                    'title'  => __( 'Section via hook', 'intima' ),
                    'desc'   => __( '<p class="description">This is a section created by adding a filter to the sections array. Can be used by child themes to add/remove sections from the options.</p>', 'intima' ),
                    'icon'   => 'el-icon-paper-clip',
                    // Leave this as a blank section, no options just some intro text set above.
                    'fields' => array()
                );

                return $sections;
            }

            /**
             * Filter hook for filtering the args. Good for child themes to override or add to the args array. Can also be used in other functions.
             * */
            function change_arguments( $args ) {
                //$args['dev_mode'] = true;

                return $args;
            }

            /**
             * Filter hook for filtering the default value of any given field. Very useful in development mode.
             * */
            function change_defaults( $defaults ) {
                $defaults['str_replace'] = 'Testing filter hook!';

                return $defaults;
            }

            // Remove the demo link and the notice of integrated demo from the intima plugin
            function remove_demo() {

                // Used to hide the demo mode link from the plugin page. Only used when Redux is a plugin.
                if ( class_exists( 'ReduxFrameworkPlugin' ) ) {
                    remove_filter( 'plugin_row_meta', array(
                        ReduxFrameworkPlugin::instance(),
                        'plugin_metalinks'
                    ), null, 2 );

                    // Used to hide the activation notice informing users of the demo panel. Only used when Redux is a plugin.
                    remove_action( 'admin_notices', array( ReduxFrameworkPlugin::instance(), 'admin_notices' ) );
                }
            }

            public function setSections() {

                /**
                 * Used within different fields. Simply examples. Search for ACTUAL DECLARATION for field examples
                 * */
                // Background Patterns Reader
                $sample_patterns_path = ReduxFramework::$_dir . '../sample/patterns/';
                $sample_patterns_url  = ReduxFramework::$_url . '../sample/patterns/';
                $sample_patterns      = array();

                if ( is_dir( $sample_patterns_path ) ) :

                    if ( $sample_patterns_dir = opendir( $sample_patterns_path ) ) :
                        $sample_patterns = array();

                        while ( ( $sample_patterns_file = readdir( $sample_patterns_dir ) ) !== false ) {

                            if ( stristr( $sample_patterns_file, '.png' ) !== false || stristr( $sample_patterns_file, '.jpg' ) !== false ) {
                                $name              = explode( '.', $sample_patterns_file );
                                $name              = str_replace( '.' . end( $name ), '', $sample_patterns_file );
                                $sample_patterns[] = array(
                                    'alt' => $name,
                                    'img' => $sample_patterns_url . $sample_patterns_file
                                );
                            }
                        }
                    endif;
                endif;

                ob_start();

                $ct          = wp_get_theme();
                $this->theme = $ct;
                $item_name   = $this->theme->get( 'Name' );
                $tags        = $this->theme->Tags;
                $screenshot  = $this->theme->get_screenshot();
                $class       = $screenshot ? 'has-screenshot' : '';

                $customize_title = sprintf( __( 'Customize &#8220;%s&#8221;', 'intima' ), $this->theme->display( 'Name' ) );

                ?>
                <div id="current-theme" class="<?php echo esc_attr( $class ); ?>">
                    <?php if ( $screenshot ) : ?>
                        <?php if ( current_user_can( 'edit_theme_options' ) ) : ?>
                            <a href="<?php echo wp_customize_url(); ?>" class="load-customize hide-if-no-customize"
                               title="<?php echo esc_attr( $customize_title ); ?>">
                                <img src="<?php echo esc_url( $screenshot ); ?>"
                                     alt="<?php esc_attr_e( 'Current theme preview', 'intima' ); ?>"/>
                            </a>
                        <?php endif; ?>
                        <img class="hide-if-customize" src="<?php echo esc_url( $screenshot ); ?>"
                             alt="<?php esc_attr_e( 'Current theme preview', 'intima' ); ?>"/>
                    <?php endif; ?>

                    <h4><?php echo $this->theme->display( 'Name' ); ?></h4>

                    <div>
                        <ul class="theme-info">
                            <li><?php printf( __( 'By %s', 'intima' ), $this->theme->display( 'Author' ) ); ?></li>
                            <li><?php printf( __( 'Version %s', 'intima' ), $this->theme->display( 'Version' ) ); ?></li>
                            <li><?php echo '<strong>' . __( 'Tags', 'intima' ) . ':</strong> '; ?><?php printf( $this->theme->display( 'Tags' ) ); ?></li>
                        </ul>
                        <p class="theme-description"><?php echo $this->theme->display( 'Description' ); ?></p>
                        <?php
                            if ( $this->theme->parent() ) {
                                printf( ' <p class="howto">' . __( 'This <a href="%1$s">child theme</a> requires its parent theme, %2$s.', 'intima' ) . '</p>', __( 'http://codex.wordpress.org/Child_Themes', 'intima' ), $this->theme->parent()->display( 'Name' ) );
                            }
                        ?>

                    </div>
                </div>

                <?php
                $item_info = ob_get_contents();

                ob_end_clean();

                $sampleHTML = '';
                if ( file_exists( dirname( __FILE__ ) . '/info-html.html' ) ) {
                    Redux_Functions::initWpFilesystem();

                    global $wp_filesystem;

                    $sampleHTML = $wp_filesystem->get_contents( dirname( __FILE__ ) . '/info-html.html' );
                }

                // Global Management
                $this->sections[] = array(
                    'title'   => 'Global Management',
                    'icon'    => 'el-icon-globe',
                    'fields'  => array(
                        array(
                            'id'       => 'menu_system',
                            'type'     => 'radio',
                            'title'    => __('Navigation Style', 'intima'),
                            'options'  => array(
                                '1' => 'Header Navigation',
                                '2' => 'Left Navigation',
                            ),
                            'default' => '1'
                        ),

                        array(
                            'id' => 'section_leftmenu_avatar',
                            'type' => 'media',
                            'title' => __('Left menu avatar', 'intima'),
                            'default' => array("url" => get_template_directory_uri() . "/images/avatar.jpg"),
                            'preview' => true,
                            "url" => true,
                            'required' => array('menu_system', '=', '2')
                        ),

                        array(
                            'id' => 'custom_css',
                            'type' => 'ace_editor',
                            'title' => __('Custom CSS', 'intima'),
                            'description' => 'Write your custom CSS code inside &lt;style> &lt;/style> block'
                        ),

                        array(
                            'id' => 'custom_ga',
                            'type' => 'ace_editor',
                            'title' => __('Google Analytics Code', 'intima'),
                            'description' => 'Write your custom google analytics code inside &lt;script> &lt;/script> block'
                        )
                    ),
                );

                // header Section
                $this->sections[] = array(
                    'title'   => 'Header Section',
                    'icon'    => 'el-icon-website',
                    'fields'  => array(
                        array(
                            'id' => 'header_display_menu',
                            'type' => 'switch',
                            'title' => __('Display In Menubar', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'header_menu_text',
                            'type' => 'text',
                            'title' => __('Section Title in Menubar', 'intima'),
                            'default' => "Home",
                            'required' => array('header_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'header_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-home",
                            'required' => array('header_display_menu', '=', '1')
                        ),
                        array(
                            'id'       => 'header_background',
                            'type'     => 'background',
                            'title'    => __('Header Background', 'intima'),
                            'default'  => array(
                                'background-color' => '#161415',
                                'background-image' => get_template_directory_uri() . "/images/bg.jpg",
                            ),
                            'preview_media' => true,
                            'background-repeat' => false,
                            'background-size' => false,
                            'background-position' => false,
                            'background-attachment' => false,
                        ),
                        array(
                            'id'       => 'header_overlay_background',
                            'type'     => 'background',
                            'title'    => __('Header Overlay Background', 'intima'),
                            'default'  => array(
                                'background-color' => '#161415',
                                'background-image' => get_template_directory_uri() . "/images/bg-blur.jpg",
                            ),
                            'preview_media' => true,
                            'background-repeat' => false,
                            'background-size' => false,
                            'background-position' => false,
                            'background-attachment' => false,
                        ),
                        array(
                            'id'       => 'header_title',
                            'type' => 'textarea',
                            'title' => __('Header Primary Text', 'intima'),
                            'rows' => 1,
                            'validate' => 'html_custom',
                            'default' => 'I\'m <span>John Doe</span>',
                            'allowed_html' => array(
                                'br' => array(),
                                'span' => array()
                            )
                        ),
                        array(
                            'id'=>'header_text',
                            'type' => 'textarea',
                            'title' => __('Header Secondary Text', 'intima'),
                            'validate' => 'html_custom',
                            'default' => 'I\'m a passionate <span>UI/UX Designer</span> and <span>Front-End Developer</span> creating modern and responsive design for <span>Web</span> and <span>Mobile</span>. <br> Let\'s start scfadeIng and learn more <a class="smoothscroll" href="#about">about me</a>.',
                            'allowed_html' => array(
                                'a' => array(
                                    'href' => array(),
                                    'title' => array()
                                ),
                                'br' => array(),
                                'em' => array(),
                                'strong' => array(),
                                'span' => array(),
                            )
                        ),
                    )
                );

                // about Section
                $this->sections[] = array(
                    'title'   => 'About Section',
                    'icon'    => 'el-icon-user',
                    'fields'  => array(
                        array(
                            'id' => 'section_about_display',
                            'type' => 'switch',
                            'title' => __('Display About Section', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'section_about_display_menu',
                            'type' => 'switch',
                            'title' => __('Display In Menubar', 'intima'),
                            'default' => 1,
                            'required' => array('section_about_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_about_menu_text',
                            'type' => 'text',
                            'title' => __('Section Title in Menubar', 'intima'),
                            'default' => "About me",
                            'required' => array('section_about_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_about_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-user",
                            'required' => array('section_about_display_menu', '=', '1')
                        ),

                        array(
                            'id' => 'section_abtme_mainimg',
                            'type' => 'media',
                            'title' => __('Section Image', 'intima'),
                            'default' => array("url" => get_template_directory_uri() . "/images/avatar.jpg"),
                            'preview' => true,
                            "url" => true,
                            'required' => array('section_about_display', '=', '1')
                        ),
                        array(
                            'id'       => 'section_abtme_bgimg',
                            'type'     => 'background',
                            'title'    => __('Section Background Image', 'intima'),
                            'default'  => array(
                                'background-image' => get_template_directory_uri() . "/images/2.jpg",
                            ),
                            'preview_media' => true,
                            'background-repeat' => false,
                            'background-color' => false,
                            'background-size' => false,
                            'background-position' => false,
                            'background-attachment' => false,
                        ),
                        array(
                            'id' => "section_abtme_title",
                            'type' => 'text',
                            'title' => __('Section Title', 'intima'),
                            'default' => "John Doe",
                            'required' => array('section_about_display', '=', '1')
                        ),
                        array(
                            'id' => "section_abtme_subtitle",
                            'type' => 'text',
                            'title' => __('Section Subtitle', 'intima'),
                            'default' => "UI/UX Developer",
                            'required' => array('section_about_display', '=', '1')
                        ),

                        array(
                            'id'=>'about_text',
                            'type' => 'textarea',
                            'title' => __('Section Description Text', 'intima'),
                            'validate' => 'html_custom',
                            'default' => 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.',
                            'allowed_html' => array(
                                'a' => array(
                                    'href' => array(),
                                    'title' => array()
                                ),
                                'br' => array(),
                                'em' => array(),
                                'strong' => array(),
                                'span' => array(),
                            ),
                            'required' => array('section_about_display', '=', '1')
                        ),

                        array(
                            'id' => 'hire_button_show',
                            'type' => 'switch',
                            'title' => __('Show Hire Button', 'intima'),
                            'default' => 1,
                            'required' => array('section_about_display', '=', '1')
                        ),

                        array(
                            'id' => 'hire_button_contact_link',
                            'type' => 'switch',
                            'title' => __('Scroll to Contact Section ', 'intima'),
                            'desc' => __('Enable the Hire button for scroll to contact section', 'intima'),
                            'required' => array('hire_button_show', '=', '1'),
                            'default' => 1,
                        ),

                        array(
                            'id' => 'section_hire_me_link',
                            'type' => 'text',
                            'title' => __('Hire Link', 'intima'),
                            'desc' => __('Hire button will open this link', 'intima'),
                            'required' => array('hire_button_contact_link', '=', '0')
                        ),

                        array(
                            'id' => 'section_abtme_resume',
                            'type' => 'text',
                            'title' => __('Resume Document URL', 'intima'),
                            'placeholder' => 'Resume Link',
                            'default' => 'http://myresumeLink.com/resume.pdf',
                            'required' => array('section_about_display', '=', '1')
                        ),
                    )
                );

                // resume Section
                $this->sections[] = array(
                    'title'   => 'Resume Section',
                    'icon'    => 'el-icon-file',
                    'fields'  => array(
                        array(
                            'id' => 'section_resume_display',
                            'type' => 'switch',
                            'title' => __('Display Resume Section', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'section_resume_display_menu',
                            'type' => 'switch',
                            'title' => __('Display In Menubar', 'intima'),
                            'default' => 1,
                            'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_resume_menu_text',
                            'type' => 'text',
                            'title' => __('Section Title in Menubar', 'intima'),
                            'default' => "Resume",
                            'required' => array('section_resume_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_resume_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-file-text",
                            'required' => array('section_resume_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_resume_title',
                            'type' => 'text',
                            'title' => __('Resume Title', 'intima'),
                            'default' => "RESUME",
                            'required' => array('section_resume_display', '=', '1')
                        ),

                        // section education
                        array(
                           'id' => 'section-education-start',
                           'type' => 'section',
                           'title' => __('Education Settings', 'intima'),
                           'indent' => true,
                           'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_education_display',
                            'type' => 'switch',
                            'title' => __('Display Education in Resume section', 'intima'),
                            'default' => 1,
                            'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_education_section_text',
                            'type' => 'text',
                            'title' => __('Education Title', 'intima'),
                            'default' => "Education",
                            'required' => array('resume_education_display', '=', '1')
                        ),
                        array(
                            'id'        => 'education_post_number',
                            'type'      => 'slider',
                            'title'     => __('Max Post Appear', 'intima'),
                            'desc'      => __('Min: 1, max: 20, step: 1, default value: 3', 'intima'),
                            "default"   => 3,
                            "min"       => 1,
                            "step"      => 1,
                            "max"       => 20,
                            'display_value' => 'Max Post',
                            'required' => array('resume_education_display', '=', '1')
                        ),
                        array(
                            'id'       => 'education_post_order',
                            'type'     => 'select',
                            'title'    => __('Display Order Type', 'intima'), 
                            'desc'     => __('Display Educations in Ascending or Descending Order', 'intima'),
                            'options'  => array(
                                '1' => 'ASC Order',
                                '2' => 'DESC Order',
                            ),
                            'default'  => '2',
                            'required' => array('resume_education_display', '=', '1')
                        ),
                        array(
                            'id'     => 'section-education-end',
                            'type'   => 'section',
                            'indent' => false,
                            'required' => array('section_resume_display', '=', '1')
                        ),

                        // section employment
                        array(
                           'id' => 'section-employment-start',
                           'type' => 'section',
                           'title' => __('Employment Settings', 'intima'),
                           'indent' => true,
                           'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_employment_display',
                            'type' => 'switch',
                            'title' => __('Display Employment in Resume section', 'intima'),
                            'default' => 1,
                            'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_employment_section_text',
                            'type' => 'text',
                            'title' => __('Employment Title', 'intima'),
                            'default' => "Employment",
                            'required' => array('resume_employment_display', '=', '1')
                        ),
                        array(
                            'id'        => 'employment_post_number',
                            'type'      => 'slider',
                            'title'     => __('Max Post Appear', 'intima'),
                            'desc'      => __('Min: 1, max: 20, step: 1, default value: 3', 'intima'),
                            "default"   => 3,
                            "min"       => 1,
                            "step"      => 1,
                            "max"       => 20,
                            'display_value' => 'Max Post',
                            'required' => array('resume_employment_display', '=', '1')
                        ),
                        array(
                            'id'       => 'employment_post_order',
                            'type'     => 'select',
                            'title'    => __('Display Order Type', 'intima'), 
                            'desc'     => __('Display Employments in Ascending or Descending Order', 'intima'),
                            'options'  => array(
                                '1' => 'ASC Order',
                                '2' => 'DESC Order',
                            ),
                            'default'  => '2',
                            'required' => array('resume_employment_display', '=', '1')
                        ),
                        array(
                            'id'     => 'section-employment-end',
                            'type'   => 'section',
                            'indent' => false,
                            'required' => array('section_resume_display', '=', '1')
                        ),

                        // section skills
                        array(
                           'id' => 'section-skill-start',
                           'type' => 'section',
                           'title' => __('Skill Settings', 'intima'),
                           'indent' => true,
                           'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_skill_display',
                            'type' => 'switch',
                            'title' => __('Display Skill in Resume section', 'intima'),
                            'default' => 1,
                            'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_skill_section_text',
                            'type' => 'text',
                            'title' => __('skill Title', 'intima'),
                            'default' => "skill",
                            'required' => array('resume_skill_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_skill_des',
                            'type' => 'textarea',
                            'title' => __('Skill Section Description', 'intima'),
                            'default' => "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            'required' => array('resume_skill_display', '=', '1')
                        ),
                        array(
                            'id'=>'resume_skills',
                            'type' => 'multi_text',
                            'title' => __('Skills', 'intima'),
                            'subtitle' => 'Add as many skills as you want. Separate skill name, value and color by a comma, ex: Photoshop, 90, #e74c3c',
                            'validate' => '',
                            'default' => array(
                                'PHOTOSHOP, 60, #1abc9c',
                                'ILLUSTRATOR, 55, #e74c3c',
                                'WORDPRESS, 50, #34495e',
                                'CSS, 90, #3498db',
                                'HTML5, 80, #d35400',
                                'JQUERY, 50, #9b59b6',
                            ),
                            'required' => array('resume_skill_display', '=', '1')
                        ),
                        array(
                            'id'     => 'section-skill-end',
                            'type'   => 'section',
                            'indent' => false,
                            'required' => array('section_resume_display', '=', '1')
                        ),

                        // section recognition
                        array(
                           'id' => 'section-recognition-start',
                           'type' => 'section',
                           'title' => __('Recognition Settings', 'intima'),
                           'indent' => true,
                           'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_recognition_display',
                            'type' => 'switch',
                            'title' => __('Display Recognition in Resume section', 'intima'),
                            'default' => 1,
                            'required' => array('section_resume_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_recognition_section_title',
                            'type' => 'text',
                            'title' => __('Recognition Title', 'intima'),
                            'default' => "Recognition",
                            'required' => array('resume_recognition_display', '=', '1')
                        ),
                        array(
                            'id' => 'resume_recognition_des',
                            'type' => 'textarea',
                            'title' => __('Recognition Description', 'intima'),
                            'default' => "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                            'required' => array('resume_recognition_display', '=', '1')
                        ),
                        array(
                            'id'        => 'recognition_post_number',
                            'type'      => 'slider',
                            'title'     => __('Max Post Appear', 'intima'),
                            'desc'      => __('Min: 1, max: 25, step: 1, default value: 4', 'intima'),
                            "default"   => 4,
                            "min"       => 1,
                            "step"      => 1,
                            "max"       => 25,
                            'display_value' => 'Max Post',
                            'required' => array('resume_recognition_display', '=', '1')
                        ),
                        array(
                            'id'       => 'recognition_post_order',
                            'type'     => 'select',
                            'title'    => __('Display Order Type', 'intima'), 
                            'desc'     => __('Display Recognitions in Ascending or Descending Order', 'intima'),
                            'options'  => array(
                                '1' => 'ASC Order',
                                '2' => 'DESC Order',
                            ),
                            'default'  => '2',
                            'required' => array('resume_recognition_display', '=', '1')
                        ),
                        array(
                            'id'     => 'section-recognition-end',
                            'type'   => 'section',
                            'indent' => false,
                            'required' => array('section_resume_display', '=', '1')
                        )
                    ),
                );

                // Portfolio Section
                $this->sections[] = array(
                    'title'   => 'Portfolio Section',
                    'icon'    => 'el-icon-th ',
                    'fields'  => array(
                        // section Portfolio grid
                        array(
                           'id' => 'section-portfolio-start',
                           'type' => 'section',
                           'indent' => true,
                        ),
                        array(
                            'id' => 'section_portfolio_display',
                            'type' => 'switch',
                            'title' => __('Display Portfolio Section', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'section_portfolio_display_menu',
                            'type' => 'switch',
                            'title' => __('Display In Menubar', 'intima'),
                            'default' => 1,
                            'required' => array('section_portfolio_display', '=', '1')
                        ),
                        array(
                            'id'       => 'section_portfolio_bgimg',
                            'type'     => 'background',
                            'title'    => __('Section Background Image', 'intima'),
                            'default'  => array(
                                'background-image' => get_template_directory_uri() . "/images/3.jpg",
                            ),
                            'preview_media' => true,
                            'background-repeat' => false,
                            'background-color' => false,
                            'background-size' => false,
                            'background-position' => false,
                            'background-attachment' => false,
                        ),
                        array(
                            'id' => 'section_portfolio_menu_text',
                            'type' => 'text',
                            'title' => __('Section Title in Menubar', 'intima'),
                            'default' => "Portfolio",
                            'required' => array('section_portfolio_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_portfolio_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-briefcase",
                            'required' => array('section_portfolio_display_menu', '=', '1')
                        ),

                        array(
                            'id' => 'section_portfolio_title',
                            'type' => 'text',
                            'title' => __('Portfolio Title', 'intima'),
                            'default' => "SOME OF MY WORKS",
                            'required' => array('section_portfolio_display', '=', '1')
                        ),
                        array(
                            'id'        => 'portfolio_post_number',
                            'type'      => 'slider',
                            'title'     => __('Max Post Appear', 'intima'),
                            'desc'      => __('Min: 1, max: 32, step: 1, default value: 8', 'intima'),
                            "default"   => 8,
                            "min"       => 1,
                            "step"      => 1,
                            "max"       => 32,
                            'display_value' => 'Max Post',
                            'required' => array('section_portfolio_display', '=', '1')
                        ),
                        array(
                            'id'       => 'portfolio_post_order',
                            'type'     => 'select',
                            'title'    => __('Display Order Type', 'intima'), 
                            'desc'     => __('Display Portfolios in Ascending or Descending Order', 'intima'),
                            'options'  => array(
                                '1' => 'ASC Order',
                                '2' => 'DESC Order',
                            ),
                            'default'  => '2',
                            'required' => array('section_portfolio_display', '=', '1')
                        ),
                        array(
                            'id'     => 'section-portfolio-end',
                            'type'   => 'section',
                            'indent' => false,
                        ),

                        // section hire me area
                        array(
                           'id' => 'section-hire-start',
                           'type' => 'section',
                           'title' => __('Hire Section', 'intima'),
                           'indent' => true,
                        ),
                        array(
                            'id' => 'section_hire_display',
                            'type' => 'switch',
                            'title' => __('Display Hire Me', 'intima'),
                            'default' => 1,
                        ),

                        array(
                            'id' => 'section_hire_title',
                            'type' => 'text',
                            'title' => __('Hire section title', 'intima'),
                            'default' => "HIRE ME FOR YOUR AWESOME PROJECT",
                            'required' => array('section_hire_display', '=', '1')
                        ),

                        array(
                            'id' => 'section_hire_des',
                            'type' => 'textarea',
                            'title' => __('Hire section description', 'intima'),
                            'default' => "I am available for Freelance projects that depends on your project value. Hire me and get your project done!",
                            'required' => array('section_hire_display', '=', '1')
                        ),

                        array(
                            'id' => 'port_hire_button_show',
                            'type' => 'switch',
                            'title' => __('Show Hire Button', 'intima'),
                            'default' => 1,
                            'required' => array('section_hire_display', '=', '1')
                        ),

                        array(
                            'id' => 'port_hire_button_contact_scroll',
                            'type' => 'switch',
                            'title' => __('Scroll to Contact Section ', 'intima'),
                            'desc' => __('Enable the Hire button for scroll to contact section', 'intima'),
                            'required' => array('port_hire_button_show', '=', '1'),
                            'default' => 1,
                        ),

                        array(
                            'id' => 'port_section_hire_me_link',
                            'type' => 'text',
                            'title' => __('Hire Link', 'intima'),
                            'desc' => __('Hire button will open this link', 'intima'),
                            'required' => array('port_hire_button_contact_scroll', '=', '0')
                        ),

                        array(
                            'id'     => 'section-hire-end',
                            'type'   => 'section',
                            'indent' => false,
                        )
                    ),
                );

                // Testimonial Section
                $this->sections[] = array(
                    'title'   => 'Testimonial Section',
                    'icon'    => 'el-icon-star',
                    'fields'  => array(
                        array(
                            'id' => 'section_testimonial_display',
                            'type' => 'switch',
                            'title' => __('Display testimonial', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'section_testimonial_display_menu',
                            'type' => 'switch',
                            'title' => __('Display In Menubar', 'intima'),
                            'default' => 1,
                            'required' => array('section_testimonial_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_testimonial_menu_text',
                            'type' => 'text',
                            'title' => __('Section Title in Menubar', 'intima'),
                            'default' => "Testimonial",
                            'required' => array('section_testimonial_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_testimonial_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-comments",
                            'required' => array('section_testimonial_display_menu', '=', '1')
                        ),

                        array(
                            'id' => 'section_testimonial_title',
                            'type' => 'text',
                            'title' => __('Testimonial Title', 'intima'),
                            'default' => "CLIENT TESTIMONIALS",
                            'required' => array('section_testimonial_display', '=', '1')
                        ),
                        array(
                            'id'        => 'testimonial_post_number',
                            'type'      => 'slider',
                            'title'     => __('Max Post Appear', 'intima'),
                            'desc'      => __('Min: 1, max: 10, step: 1, default value: 3', 'intima'),
                            "default"   => 3,
                            "min"       => 1,
                            "step"      => 1,
                            "max"       => 10,
                            'display_value' => 'Max Post',
                            'required' => array('section_testimonial_display', '=', '1')
                        ),
                        array(
                            'id'       => 'testimonial_post_order',
                            'type'     => 'select',
                            'title'    => __('Display Order Type', 'intima'), 
                            'desc'     => __('Display Testimonials in Ascending or Descending Order', 'intima'),
                            'options'  => array(
                                '1' => 'ASC Order',
                                '2' => 'DESC Order',
                            ),
                            'default'  => '2',
                            'required' => array('section_testimonial_display', '=', '1')
                        )
                    ),
                );
                
                // Contact Section
                $this->sections[] = array(
                    'title' => __('Contact Section', 'intima'),
                    'icon' => 'el-icon-envelope',
                    'fields' => array(
                        array(
                            'id' => 'section_contact_display',
                            'type' => 'switch',
                            'title' => __('Display Contact', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'section_contact_display_menu',
                            'type' => 'switch',
                            'title' => __('Display in Menubar', 'intima'),
                            'default' => 1,
                            'required' => array('section_contact_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_contact_menu_text',
                            'type' => 'text',
                            'title' => __('Section Title in Menubar', 'intima'),
                            'default' => "CONTACT",
                            'required' => array('section_contact_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_contact_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-envelope",
                            'required' => array('section_contact_display_menu', '=', '1')
                        ),

                        // section Contact Form
                        array(
                           'id' => 'section_contact_form_start',
                           'type' => 'section',
                           'title' => __('Contact From Settings', 'intima'),
                           'indent' => true,
                           'required' => array('section_contact_display', '=', '1')
                        ),

                        array(
                            'id' => "section_contact_title",
                            'type' => 'text',
                            'title' => __('Section Title', 'intima'),
                            'default' => "GET IN TOUCH",
                            'required' => array('section_contact_display', '=', '1')
                        ),
                        array(
                            'id' => "section_contact_des",
                            'type' => 'text',
                            'title' => __('Section Description', 'intima'),
                            'default' => "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
                            'required' => array('section_contact_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_contact_shortcode',
                            'type' => 'text',
                            'title' => __('Contact Form 7 Shortcode', 'intima'),
                            'desc' => __('Create one from <a href="' . site_url() . '/wp-admin/admin.php?page=wpcf7-new">here</a>', 'intima'),
                            'required' => array('section_contact_display', '=', '1')
                        ),

                        array(
                            'id'     => 'section-contact-form-end',
                            'type'   => 'section',
                            'indent' => false,
                        ),

                        // section map
                        array(
                           'id' => 'section-map-start',
                           'type' => 'section',
                           'title' => __('Google Map Settings', 'intima'),
                           'indent' => true,
                           'required' => array('section_contact_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_map_display',
                            'type' => 'switch',
                            'title' => __('Display Contact', 'intima'),
                            'default' => 1,
                            'required' => array('section_contact_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_contact_lat',
                            'type' => 'text',
                            'title' => __('Latitude', 'intima'),
                            'default' => "23.790223",
                            'required' => array('section_map_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_contact_lon',
                            'type' => 'text',
                            'title' => __('Longitude', 'intima'),
                            'default' => "90.414036",
                            'required' => array('section_map_display', '=', '1')
                        ),
                        array(
                            'id' => 'section_contact_description',
                            'type' => 'editor',
                            'title' => __('Marker Details', 'intima'),
                            'default' => "<p>Building # 2, Plot # 111, Road # 35, Gulshan - 2, Dhaka</p>",
                            'required' => array('section_map_display', '=', '1')
                        ),

                        array(
                            'id'     => 'section-map-end',
                            'type'   => 'section',
                            'indent' => false,
                        ),
                    )
                );
                
                // Social & Footer Section
                $this->sections[] = array(
                    'title' => __('Social & Footer', 'intima'),
                    'icon' => 'el-icon-share',
                    'fields' => array(
                        array(
                            'id' => 'social_facebook',
                            'type' => 'text',
                            'title' => __('Facebook', 'intima')
                        ),
                        array(
                            'id' => 'social_twitter',
                            'type' => 'text',
                            'title' => __('Twitter', 'intima')
                        ),
                        array(
                            'id' => 'social_google',
                            'type' => 'text',
                            'title' => __('Google Plus', 'intima')
                        ),
                        array(
                            'id' => 'social_linkedin',
                            'type' => 'text',
                            'title' => __('Linked In', 'intima')
                        ),
                        array(
                            'id' => 'social_instagram',
                            'type' => 'text',
                            'title' => __('Instagram', 'intima')
                        ),
                        array(
                            'id' => 'social_dribbble',
                            'type' => 'text',
                            'title' => __('Dribbble', 'intima')
                        ),
                        array(
                            'id' => 'social_skype',
                            'type' => 'text',
                            'title' => __('Skype', 'intima')
                        ),
                        array(
                            'id'   =>'divider_1',
                            'type' => 'divide'
                        ),
                        array(
                            'id'               => 'footer_text',
                            'type'             => 'editor',
                            'title'            => __('Footer Text', 'intima'),
                            'default'          => 'John Doe &copy; Copyright 2014, All Rights Reserved',
                            'args'   => array(
                                'teeny'            => true,
                                'textarea_rows'    => 5
                            )
                        )
                    )
                );
                
                // Blog Section
                $this->sections[] = array(
                    'title' => __('Blog Settings', 'intima'),
                    'icon' => 'el-icon-comment-alt',
                    'fields' => array(
                        array(
                            'id' => 'section_blog_display_menu',
                            'type' => 'switch',
                            'title' => __('Display In Menubar', 'intima'),
                            'default' => 1,
                        ),
                        array(
                            'id' => 'section_blog_menu_text',
                            'type' => 'text',
                            'title' => __('Blog page Title in Menubar', 'intima'),
                            'default' => "Blog",
                            'required' => array('section_blog_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_blog_menu_link',
                            'type' => 'text',
                            'title' => __('Blog Page link', 'intima'),
                            'default' => home_url().'/blog',
                            'required' => array('section_blog_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_blog_menu_icon',
                            'type' => 'text',
                            'title' => __('Font Awesome icon for menu', 'intima'),
                            'default' => "fa-code",
                            'required' => array('section_blog_display_menu', '=', '1')
                        ),
                        array(
                            'id' => 'section_blog_bg',
                            'type' => 'media',
                            'title' => __('Blog Page Background Image', 'intima'),
                            'default' => array("url" => get_template_directory_uri() . "/images/blog-header-bg.jpg"),
                            'preview' => true,
                            "url" => true
                        ),
                        array(
                            'id' => "section_blog_title",
                            'type' => 'text',
                            'title' => __('Blog Page Title', 'intima'),
                            'default' => "Intima",
                        ),
                        array(
                            'id' => "section_blog_des",
                            'type' => 'text',
                            'title' => __('Blog Page Description', 'intima'),
                            'default' => "A GREAT RESUME TEMPLATE"
                        ),
                        array(
                            'id'       => 'blog_page_template_select',
                            'type'     => 'select',
                            'title'    => __('Blog Template Style', 'intima'),
                            'options'  => array(
                                '1' => 'Timeline Blog',
                                '2' => 'Timeline Blog Full Width',
                                '3' => 'Standard Blog',
                                '4' => 'Standard Blog Full Width',
                            ),
                            'default'  => '1',
                        ),
                        array(
                            'id' => 'single_page_sidebar_display',
                            'type' => 'switch',
                            'title' => __('Sidebar display in single blog page', 'intima'),
                            'default' => 1,
                        ),
                    )
                );
                
                // 404 sectino
                $this->sections[] = array(
                    'title' => __('404 Settings', 'intima'),
                    'icon' => 'el-icon-cogs',
                    'fields' => array(
                        array(
                            'id' => "section_404_title",
                            'type' => 'text',
                            'title' => __('404 Title', 'intima'),
                            'default' => "404"
                        ),
                        array(
                            'id' => "section_404_des",
                            'type' => 'editor',
                            'title' => __('404 Description', 'intima'),
                            'default' => "<p>The page your are looking for does not exist,<br>I can take you to the <a href=".home_url().">home page</a></p>"
                        ),
                        array(
                            'id' => 'section_404_full_bg',
                            'type' => 'background',
                            'title' => __('404 Page Background', 'intima'),
                            'preview' => true,
                            'preview_media' => true,
                            'background-attachment' => false,
                            'background-size' => false,
                            'background-position' => false,
                            'default'  => array(
                                'background-color' => '#1481c4',
                                'background-repeat' => 'no-repeat',
                                'background-image' => get_template_directory_uri() . '/images/error_bg.png'
                            )
                        ),
                        array(
                            'id' => 'section_404_quote_bg',
                            'type' => 'background',
                            'title' => __('404 Quote Background', 'intima'),
                            'preview' => true,
                            'preview_media' => true,
                            'background-attachment' => false,
                            'background-size' => false,
                            'background-position' => false,
                            'background-color' => false,
                            'default'  => array(
                                'background-repeat' => 'no-repeat',
                                'background-image' => get_template_directory_uri() . '/images/quote_bg.png'
                            )
                        )
                    )
                );
            }

            public function setHelpTabs() {

                // Custom page help tabs, displayed using the help API. Tabs are shown in order of definition.
                $this->args['help_tabs'][] = array(
                    'id'      => 'redux-help-tab-1',
                    'title'   => __( 'Theme Information 1', 'intima' ),
                    'content' => __( '<p>This is the tab content, HTML is allowed.</p>', 'intima' )
                );

                $this->args['help_tabs'][] = array(
                    'id'      => 'redux-help-tab-2',
                    'title'   => __( 'Theme Information 2', 'intima' ),
                    'content' => __( '<p>This is the tab content, HTML is allowed.</p>', 'intima' )
                );

                // Set the help sidebar
                $this->args['help_sidebar'] = __( '<p>This is the sidebar content, HTML is allowed.</p>', 'intima' );
            }

            /**
             * All the possible arguments for Redux.
             * For full documentation on arguments, please refer to: https://github.com/ReduxFramework/ReduxFramework/wiki/Arguments
             * */
            public function setArguments() {

                $theme = wp_get_theme(); // For use with some settings. Not necessary.

                $this->args = array(
                    // TYPICAL -> Change these values as you need/desire
                    'opt_name'             => 'redux_framework',
                    // This is where your data is stored in the database and also becomes your global variable name.
                    'display_name'         => $theme->get( 'Name' ),
                    // Name that appears at the top of your panel
                    'display_version'      => $theme->get( 'Version' ),
                    // Version that appears at the top of your panel
                    'menu_type'            => 'menu',
                    //Specify if the admin menu should appear or not. Options: menu or submenu (Under appearance only)
                    'allow_sub_menu'       => true,
                    // Show the sections below the admin menu item or not
                    'menu_title'           => __( 'Intima Options', 'intima' ),
                    'page_title'           => __( 'Intima Options', 'intima' ),
                    // You will need to generate a Google API key to use this feature.
                    // Please visit: https://developers.google.com/fonts/docs/developer_api#Auth
                    'google_api_key'       => '',
                    // Set it you want google fonts to update weekly. A google_api_key value is required.
                    'google_update_weekly' => false,
                    // Must be defined to add google fonts to the typography module
                    'async_typography'     => true,
                    // Use a asynchronous font on the front end or font string
                    //'disable_google_fonts_link' => true,                    // Disable this in case you want to create your own google fonts loader
                    'admin_bar'            => true,
                    // Show the panel pages on the admin bar
                    'admin_bar_icon'     => 'dashicons-portfolio',
                    // Choose an icon for the admin bar menu
                    'admin_bar_priority' => 50,
                    // Choose an priority for the admin bar menu
                    'global_variable'      => '',
                    // Set a different name for your global variable other than the opt_name
                    'dev_mode'             => false,
                    // Show the time the page took to load, etc
                    'update_notice'        => true,
                    // If dev_mode is enabled, will notify developer of updated versions available in the GitHub Repo
                    'customizer'           => true,
                    // Enable basic customizer support
                    //'open_expanded'     => true,                    // Allow you to start the panel in an expanded way initially.
                    //'disable_save_warn' => true,                    // Disable the save warning when a user changes a field

                    // OPTIONAL -> Give you extra features
                    'page_priority'        => null,
                    // Order where the menu appears in the admin area. If there is any conflict, something will not show. Warning.
                    'page_parent'          => 'themes.php',
                    // For a full list of options, visit: http://codex.wordpress.org/Function_Reference/add_submenu_page#Parameters
                    'page_permissions'     => 'manage_options',
                    // Permissions needed to access the options panel.
                    'menu_icon'            => get_template_directory_uri() . "/images/admin_icons/option.png",
                    // Specify a custom URL to an icon
                    'last_tab'             => '',
                    // Force your panel to always open to a specific tab (by id)
                    'page_icon'            => 'icon-themes',
                    // Icon displayed in the admin panel next to your menu_title
                    'page_slug'            => '_options',
                    // Page slug used to denote the panel
                    'save_defaults'        => true,
                    // On load save the defaults to DB before user clicks save or not
                    'default_show'         => false,
                    // If true, shows the default value next to each field that is not the default value.
                    'default_mark'         => '',
                    // What to print by the field's title if the value shown is default. Suggested: *
                    'show_import_export'   => true,
                    // Shows the Import/Export panel when not used as a field.

                    // CAREFUL -> These options are for advanced use only
                    'transient_time'       => 60 * MINUTE_IN_SECONDS,
                    'output'               => true,
                    // Global shut-off for dynamic CSS output by the framework. Will also disable google fonts output
                    'output_tag'           => true,
                    // Allows dynamic CSS to be generated for customizer and google fonts, but stops the dynamic CSS from going to the head
                    // 'footer_credit'     => '',                   // Disable the footer credit of Redux. Please leave if you can help it.

                    // FUTURE -> Not in use yet, but reserved or partially implemented. Use at your own risk.
                    'database'             => '',
                    // possible: options, theme_mods, theme_mods_expanded, transient. Not fully functional, warning!
                    'system_info'          => false,
                    // REMOVE

                    // HINTS
                    'hints'                => array(
                        'icon'          => 'icon-question-sign',
                        'icon_position' => 'right',
                        'icon_color'    => 'lightgray',
                        'icon_size'     => 'normal',
                        'tip_style'     => array(
                            'color'   => 'light',
                            'shadow'  => true,
                            'rounded' => false,
                            'style'   => '',
                        ),
                        'tip_position'  => array(
                            'my' => 'top left',
                            'at' => 'bottom right',
                        ),
                        'tip_effect'    => array(
                            'show' => array(
                                'effect'   => 'slide',
                                'duration' => '500',
                                'event'    => 'mouseover',
                            ),
                            'hide' => array(
                                'effect'   => 'slide',
                                'duration' => '500',
                                'event'    => 'click mouseleave',
                            ),
                        ),
                    )
                );

                // ADMIN BAR LINKS -> Setup custom links in the admin bar menu as external items.
                $this->args['admin_bar_links'][] = array(
                    'id'    => 'redux-docs',
                    'href'   => 'http://docs.reduxframework.com/',
                    'title' => __( 'Documentation', 'intima' ),
                );

                $this->args['admin_bar_links'][] = array(
                    //'id'    => 'redux-support',
                    'href'   => 'https://github.com/ReduxFramework/redux-framework/issues',
                    'title' => __( 'Support', 'intima' ),
                );

                $this->args['admin_bar_links'][] = array(
                    'id'    => 'redux-extensions',
                    'href'   => 'reduxframework.com/extensions',
                    'title' => __( 'Extensions', 'intima' ),
                );

                // SOCIAL ICONS -> Setup custom links in the footer for quick links in your panel footer icons.
                $this->args['share_icons'][] = array(
                    'url'   => 'https://github.com/ReduxFramework/redux-framework',
                    'title' => 'Visit us on GitHub',
                    'icon'  => 'el-icon-github'
                    //'img'   => '', // You can use icon OR img. IMG needs to be a full URL.
                );
                $this->args['share_icons'][] = array(
                    'url'   => 'https://www.facebook.com/pages/Redux-Framework/243141545850368',
                    'title' => 'Like us on Facebook',
                    'icon'  => 'el-icon-facebook'
                );
                $this->args['share_icons'][] = array(
                    'url'   => 'http://twitter.com/reduxframework',
                    'title' => 'Follow us on Twitter',
                    'icon'  => 'el-icon-twitter'
                );
                $this->args['share_icons'][] = array(
                    'url'   => 'http://www.linkedin.com/company/redux-framework',
                    'title' => 'Find us on LinkedIn',
                    'icon'  => 'el-icon-linkedin'
                );

                // Panel Intro text -> before the form
                if ( ! isset( $this->args['global_variable'] ) || $this->args['global_variable'] !== false ) {
                    if ( ! empty( $this->args['global_variable'] ) ) {
                        $v = $this->args['global_variable'];
                    } else {
                        $v = str_replace( '-', '_', $this->args['opt_name'] );
                    }
                    $this->args['intro_text'] = sprintf( __( '<p>Did you know that Redux sets a global variable for you? To access any of your saved options from within your code you can use your global variable: <strong>$%1$s</strong></p>', 'redux-framework' ), $v );
                } else {
                    $this->args['intro_text'] = __( '<p>This text is displayed above the options panel. It isn\'t required, but more info is always better! The intro_text field accepts all HTML.</p>', 'redux-framework' );
                }

                // Add content after the form.
                $this->args['footer_text'] = __( '<p>This text is displayed below the options panel. It isn\'t required, but more info is always better! The footer_text field accepts all HTML.</p>', 'redux-framework' );
            }

            public function validate_callback_function( $field, $value, $existing_value ) {
                $error = true;
                $value = 'just testing';

                /*
              do your validation

              if(something) {
                $value = $value;
              } elseif(something else) {
                $error = true;
                $value = $existing_value;
                
              }
             */

                $return['value'] = $value;
                $field['msg']    = 'your custom error message';
                if ( $error == true ) {
                    $return['error'] = $field;
                }

                return $return;
            }

            public function class_field_callback( $field, $value ) {
                print_r( $field );
                echo '<br/>CLASS CALLBACK';
                print_r( $value );
            }

        }

        global $reduxConfig;
        $reduxConfig = new Redux_Framework_sample_config();
    } else {
        echo "The class named Redux_Framework_sample_config has already been called. <strong>Developers, you need to prefix this class with your company name or you'll run into problems!</strong>";
    }

    /**
     * Custom function for the callback referenced above
     */
    if ( ! function_exists( 'redux_my_custom_field' ) ):
        function redux_my_custom_field( $field, $value ) {
            print_r( $field );
            echo '<br/>';
            print_r( $value );
        }
    endif;

    /**
     * Custom function for the callback validation referenced above
     * */
    if ( ! function_exists( 'redux_validate_callback_function' ) ):
        function redux_validate_callback_function( $field, $value, $existing_value ) {
            $error = true;
            $value = 'just testing';

            /*
          do your validation

          if(something) {
            $value = $value;
          } elseif(something else) {
            $error = true;
            $value = $existing_value;
            
          }
         */

            $return['value'] = $value;
            $field['msg']    = 'your custom error message';
            if ( $error == true ) {
                $return['error'] = $field;
            }

            return $return;
        }
    endif;
