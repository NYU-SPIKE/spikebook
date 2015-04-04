<?php Global $redux_framework; ?>
<!-- Portfolio Section
================================================== -->
<?php if($redux_framework['section_portfolio_display'] == 1) : ?>

<section id="portfolio" style="<?php echo 'background-image: url(' . $redux_framework['section_portfolio_bgimg']['background-image'] .')'; ?>">

    <div class="row">

        <?php $limit = $redux_framework['portfolio_post_number']; $order = get_order_value($redux_framework['portfolio_post_order']); $portfoios = intima_get_custom_posts('portfolio', $limit, $order); ?>

        <div class="twelve columns collapsed">

            <h1 class="section-title wow fadeInDown"><?php echo $redux_framework['section_portfolio_title']; ?></h1>

            <!-- portfolio-wrapper -->
            <?php if($portfoios) : ?>

            <div id="portfolio-wrapper" class="bgrid-quarters s-bgrid-thirds cf wow fadeIn">
                <?php foreach ($portfoios as $portfoio) : $port_meta = get_post_meta($portfoio->ID); ?>

                <div class="columns portfolio-item">
                    <div class="item-wrap">
                        <a href="#modal-<?php echo $portfoio->ID; ?>" title="">

                            <?php if ( isset($port_meta['_intima_port_thumb'][0] ) ) {
                                echo "<img alt='Portfolio Thumbnail' src='" . $port_meta['_intima_port_thumb'][0] . "' />";
                            } else {
                                echo "<img class='scale-with-grid' alt='Portfolio No Thumbnail' src='" . get_stylesheet_directory_uri() . "/images/no_thumb.jpg' />";
                            } ?>

                            <div class="overlay">
                                <div class="portfolio-item-meta">
                                    <?php if ( isset( $port_meta['_intima_port_title'][0] ) ) {
                                        echo "<h5>" . $port_meta['_intima_port_title'][0] . "</h5>";
                                    } ?>
                                    <?php if ( isset( $port_meta['_intima_port_ceta'][0] ) ) {
                                        echo "<p>" . $port_meta['_intima_port_ceta'][0] . "</p>";
                                    } ?>
                                </div>
                            </div>
                            <div class="link-icon"><i class="fa fa-plus fa-2x"></i></div>
                        </a>
                    </div>
                </div> <!-- item end -->

                <?php endforeach; ?>

            </div> <!-- portfolio-wrapper end -->

            <?php endif; ?>

        </div> <!-- twelve columns end -->


        <!-- Modal Popup
        =============================================== -->

        <?php if($portfoios) : foreach ($portfoios as $portfoio) : $port_meta = get_post_meta($portfoio->ID); ?>

            <div id="modal-<?php echo $portfoio->ID; ?>" class="popup-modal mfp-hide">

                <?php if ( isset($port_meta['_intima_port_thumb'][0]) ) {
                    echo "<img class='scale-with-grid' alt='Portfolio Thumbnail' src='" . $port_meta['_intima_port_thumb'][0] . "' />";
                } else {
                    echo "<img class='scale-with-grid' alt='Portfolio No Thumbnail' src='" . get_stylesheet_directory_uri() . "/images/no_thumb.jpg' />";
                } ?>

                <div class="description-box">
                    <?php //echo $port_meta['_intima_portfolio_description'][0]; ?>
                    <?php
                        if ( isset($port_meta['_intima_portfolio_description'][0]) ) {
                            echo wpautop( $port_meta['_intima_portfolio_description'][0] );
                        }
                    ?>
                    <?php if ( isset($port_meta['_intima_port_tags'][0]) ) : ?>
                        <span class="categories"><i class="fa fa-tag"></i>
                        <?php echo $port_meta['_intima_port_tags'][0]; ?>
                    <?php endif; ?>
                    </span>
                </div>

                <div class="link-box">
                    <?php if ( isset($port_meta['_intima_port_link'][0]) ) {
                        echo "<a href='{$port_meta['_intima_port_link'][0]}' class='button'>Live Demo</a>";
                    } ?>
                    <a class="popup-modal-dismiss button btn-close">Close</a>
                </div>

            </div><!-- modal-01 End -->

        <?php endforeach; endif; ?>

    </div> <!-- row End -->

</section> <!-- Portfolio Section End-->

<?php endif; ?>


<!-- Call-To-Action Section
================================================== -->
<?php if($redux_framework['section_hire_display'] == 1) : ?>

<section id="call-to-action">

    <div class="row">

        <div class="two columns header-col">
            <h1 class="wow fadeInLeft">
                <span><i class="fa fa-paper-plane fa-5x pull-left fa-fw"></i></span>
            </h1>
        </div>

        <div class="seven columns">            
            <h2 class="wow zoomIn"><?php echo $redux_framework['section_hire_title']; ?></h2>
            <p><?php echo $redux_framework['section_hire_des']; ?></p>
        </div>

        <?php if ( $redux_framework['port_hire_button_show'] == 1 ) : ?>
            <div class="three columns action wow fadeIn">
                <?php if ( $redux_framework['port_hire_button_contact_scroll'] == 0 ) {
                    echo "<a href='{$redux_framework['port_section_hire_me_link']}' class='button'>Hire me Now</a>";
                } else {
                    echo "<a href='#contact' class='button smoothscroll'>Hire me Now</a>";
                } ?>
            </div>
        <?php endif; ?>

    </div>

</section> <!-- Call-To-Action Section End-->

<?php endif; ?>