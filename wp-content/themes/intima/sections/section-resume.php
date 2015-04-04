<?php Global $redux_framework; ?>
<!-- Resume Section
================================================== -->

<?php if ($redux_framework['section_resume_display'] == 1) : ?>

    <section id="resume">
        <h1 class="section-title wow fadeInDown"><?php echo $redux_framework['section_resume_title']; ?></h1>





        <!-- Education
        =============================================== -->
        <?php if($redux_framework['resume_education_display'] == 1) : ?>
            
        <div class="row education">
        
            <div class="three columns header-col"><h2><span><?php echo $redux_framework['resume_education_section_text']; ?></span></h2></div>

            <?php $limit = $redux_framework['education_post_number']; $order = get_order_value($redux_framework['education_post_order']); $educations = intima_get_custom_posts('education', $limit, $order);

            if ( $educations ) : ?>

            <div class="nine columns main-col">
                <div class="education-timeline">
                    <ul class="timeline wow fadeInUp">

                        <?php foreach ($educations as $education) : $edu_meta = get_post_meta($education->ID); ?>

                        <li class="timeline-event">
                            <label class="timeline-event-icon"></label>
                            <div class="timeline-event-copy">

                                <p class="timeline-event-thumbnail"><?php if (isset($edu_meta['_intima_edu_time'][0])) echo $edu_meta['_intima_edu_time'][0]; ?></p>

                                <h3><?php if (isset($edu_meta['_intima_edu_college'][0])) echo $edu_meta['_intima_edu_college'][0]; ?></h3>

                                <h4><?php if (isset($edu_meta['_intima_edu_degree'][0])) echo $edu_meta['_intima_edu_degree'][0]; ?></h4>

                                <p class="edu-result"><strong><?php if (isset($edu_meta['_intima_edu_description'][0])) echo $edu_meta['_intima_edu_result'][0]; ?></strong></p>

                                <p><?php if (isset($edu_meta['_intima_edu_description'][0])) echo $edu_meta['_intima_edu_description'][0]; ?></p>

                            </div>
                        </li>

                        <?php endforeach; ?>

                    </ul>  
                </div> <!-- Education Timeline End --> 
            </div> <!-- main-col end -->

            <?php endif; ?>

        </div> <!-- End Education -->

        <?php endif; ?>






        <!-- Work
        ========================================= -->
        <?php if($redux_framework['resume_employment_display'] == 1) : ?>

        <div class="row work">

            <div class="three columns header-col"><h2><span><?php echo $redux_framework['resume_employment_section_text']; ?></span></h2></div>

            <?php $limit = $redux_framework['employment_post_number']; $order = get_order_value($redux_framework['employment_post_order']); $employments = intima_get_custom_posts('employment', $limit, $order);

            if ( $employments ) : ?>

            <div class="nine columns main-col">

                <div class="work-timeline">
                    <ul class="timeline">

                        <?php foreach ($employments as $employment) : $emp_meta = get_post_meta($employment->ID); ?>

                        <li class="timeline-event">
                            <label class="timeline-event-icon"></label>
                            <div class="timeline-event-copy">

                                <p class="timeline-event-thumbnail"><?php if (isset($emp_meta['_intima_emp_time'][0])) echo $emp_meta['_intima_emp_time'][0]; ?></p>

                                <?php if ( isset($emp_meta['_intima_emp_url'][0]) ) : ?>

                                <h3><a href="<?php echo $emp_meta['_intima_emp_url'][0]; ?>"><?php if (isset($emp_meta['_intima_emp_name'][0])) echo $emp_meta['_intima_emp_name'][0]; ?></a></h3>

                                <?php else: ?>

                                <h3><?php if (isset($emp_meta['_intima_emp_name'][0])) echo $emp_meta['_intima_emp_name'][0]; ?></h3>

                                <?php endif; ?>


                                <h4><?php if (isset($emp_meta['_intima_emp_position'][0])) echo $emp_meta['_intima_emp_position'][0]; ?></h4>

                                <p><?php if (isset($emp_meta['_intima_emp_description'][0])) echo $emp_meta['_intima_emp_description'][0]; ?></p>

                            </div>
                        </li>

                        <?php endforeach; ?>
                    </ul>  
                </div> <!-- Work Timeline End --> 
            </div> <!-- main-col end -->

            <?php endif; ?>

        </div> <!-- End Work -->
        
        <?php endif; ?>




        <!-- Skills
        =============================================== -->
        <?php if( $redux_framework['resume_skill_display'] == 1 ) : ?>

        <div class="row skill">

            <div class="three columns header-col"><h2><span><?php echo $redux_framework['resume_skill_section_text']; ?></span></h2></div>

            <div class="nine columns main-col">

                <p><?php echo $redux_framework['resume_skill_des']; ?></p>

                <div class="bars">

                    <?php
                        if( $redux_framework['resume_skills'] ) {
                            $skills = $redux_framework['resume_skills'];
                            echo "<ul class='skills'>";

                                foreach ($skills as $skill) {
                                    $skill_arg = explode(',', trim($skill));
                                    echo "<li><span class='bar-expand wow fadeInLeft' style='width: {$skill_arg[1]}%; background-color: {$skill_arg[2]};'></span><em>{$skill_arg[0]}</em></li>";
                                }

                            echo "<ul>";
                        }
                    ?>

                </div><!-- end skill-bars -->

            </div> <!-- main-col end -->

        </div> <!-- End skills -->

        <?php endif; ?>

        <!-- Awards
        =============================================== -->
        <?php if( $redux_framework['resume_recognition_display'] == 1 ) : ?>

        <div class="row awards">

            <div class="three columns header-col"><h2><span><?php echo $redux_framework['resume_recognition_section_title']; ?></span></h2></div>

            <?php $limit = $redux_framework['recognition_post_number']; $order = get_order_value($redux_framework['recognition_post_order']); $awards = intima_get_custom_posts('recognition', $limit, $order);
            if ( $awards ) : ?>

            <div class="nine columns main-col">

                <p><?php echo $redux_framework['resume_recognition_des']; ?></p>

                <div class="award-list">

                    <ul>
                        <?php foreach ($awards as $award) : $award_meta = get_post_meta($award->ID); ?>

                        <li class="wow fadeIn">
                            <span><i class="fa <?php echo $award_meta['_intima_rec_icon'][0]; ?> fa-5x pull-left fa-fw"></i></span>
                            <h3><?php echo $award_meta['_intima_rec_name'][0]; ?></h3>
                            <h5><?php echo $award_meta['_intima_rec_title'][0]; ?></h5>
                            <h4><?php echo $award_meta['_intima_rec_location'][0]; ?></h4>
                        </li>

                        <?php endforeach; ?>
                    </ul>

                </div><!-- end awards list -->

            </div> <!-- main-col end -->

            <?php endif; ?>

        </div> <!-- End skills -->

        <?php endif; ?>

    </section> <!-- Resume Section End-->

<?php endif; ?>