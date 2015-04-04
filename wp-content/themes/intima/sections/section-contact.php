<?php Global $redux_framework; ?>
<!-- Contact Section
================================================== -->

<?php if($redux_framework['section_contact_display'] == 1) : ?>

    <section id="contact">

        <div class="row section-head">
            <div class="twelve columns">
                <h1 class="section-title wow fadeInDown"><?php echo $redux_framework['section_contact_title']; ?></h1>
                <p class="lead"><?php echo $redux_framework['section_contact_des']; ?></p>
            </div>
        </div> <!-- Section head --> 

        <?php if($redux_framework['section_map_display'] == 1) : ?>

            <div class="row contact-area">
                <div class="five columns">
                    <div class="form-container wow fadeIn">
                        <!-- form -->
                        <?php if (isset( $redux_framework['section_contact_shortcode'] )) {
                            echo do_shortcode($redux_framework['section_contact_shortcode']);
                        } ?>
                    </div>  <!-- Form Container End -->

                </div>

                <div class="seven columns">
                <!-- Start Google Map -->
                    <div id="map"></div>
                <!-- End -->
                </div> <!-- Row ends-->
            </div> <!-- Row ends-->

        <?php else: ?>

            <div class="row contact-area">
                <div class="twelve columns">
                    <div class="form-container wow fadeIn">
                        <!-- form -->
                        <?php if (isset( $redux_framework['section_contact_shortcode'] )) {
                            echo do_shortcode($redux_framework['section_contact_shortcode']);
                        } ?>
                    </div>  <!-- Form Container End -->

                </div>
            </div> <!-- Row ends-->
        <?php endif; ?>

    </section> <!-- Contact Section End-->

<?php endif; ?>