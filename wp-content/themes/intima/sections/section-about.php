
<?php Global $redux_framework; ?>
<!-- About Section
================================================== -->

<?php if ($redux_framework['section_about_display'] == 1) : ?>

    <section id="about" style="<?php echo 'background-image: url(' . $redux_framework['section_abtme_bgimg']['background-image'] .')'; ?>">

        <div class="row bio-container">
            <div class="twelve columns bio-inner">
                <div class="six columns bio-left"> 
                    <div class="pp-container">
                        <img class="profile-pic wow zoomIn"  src="<?php echo $redux_framework['section_abtme_mainimg']['url']; ?>" alt="About me Image" />
                        <h2><?php echo $redux_framework['section_abtme_title']; ?></h2>
                        <h3><?php echo $redux_framework['section_abtme_subtitle']; ?></h3>              
                    </div> <!-- Profile Picture -->
                </div>

                <div class="six columns main-col wow fadeIn">
                    <div class="arrow-left"></div>
                    <p><?php echo $redux_framework['about_text']; ?></p>
                    <div class="row">
                        <div class="six columns download">
                            <p>
                                <?php
                                    if ($redux_framework['hire_button_show'] == 1) {
                                        if ( $redux_framework['hire_button_contact_link'] == 0 ) {
                                            
                                            echo "<a href='{$redux_framework['section_hire_me_link']}' class='button' target='_blank'><i class='fa fa-paper-plane'></i>Hire Me</a>";
                                        } else {
                                            
                                            echo "<a href='#contact' class='button smoothscroll'><i class='fa fa-paper-plane'></i>Hire Me</a>";

                                        }
                                    }

                                    if ( $redux_framework['section_abtme_resume'] ) {
                                        
                                        echo "<a href='{$redux_framework['section_abtme_resume']}' class='button target='_blank><i class='fa fa-download'></i>Download Resume</a>";
                                    }
                                ?>

                            </p>
                        </div> <!-- Download Buttons --> 
                    </div>
                </div> <!-- end .main-col -->
            </div>
        </div>


    </section> <!-- About Section End-->

<?php endif; ?>