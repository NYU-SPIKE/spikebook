<?php
global $post;

if ( isset( $post ) ) {
    setup_postdata($post);
}
?>
        <div class="row blog">
            <div class="twelve columns mainpost">
                <?php if(have_posts()) : while (have_posts()) : the_post() ?>
                    <div <?php post_class('panel'); ?>>
                        <div class="panel-body cf">
                            <div class="left-side-content">
                                <p class="stylish-con"><?php the_time( get_option( 'date_format' ) ); ?></p>
                            </div>
                            <div class="right-side-content">
                                <div class="inner-left-content">
                                    <p class="stylish-con"><?php the_time( get_option( 'date_format' ) ); ?></p>
                                </div>
                                <label class="timeline-event-icon"></label>
                                <h2 class="post-title"><a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a></h2>


                                <p class="meta">By <?php the_author(); ?> | <a href="<?php echo get_permalink(); ?>"><?php echo get_comments_number(); ?> Comment</a></p>

                                <?php if( has_post_thumbnail() ) : ?>
                                    <div class="blog-img-wide"><?php the_post_thumbnail(); ?></div>
                                <?php endif; ?>

                                <?php if (!is_single() && !is_page()) : ?>
                                    <?php the_excerpt(); ?>
                                    <a href="<?php echo get_permalink(); ?>" class="more">Continue Reading</a>
                                <?php else: ?>
                                    <?php the_content(); ?>
                                    <div class="blog-tags">
                                        TAGS
                                        <?php echo get_the_tag_list("", "", ""); ?>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endwhile; ?>
                <?php else: ?>
                <h2>Not Found Anything</h2>
                <?php endif; ?>
                <?php if (is_single() || is_page()) : ?>
                    <div class="panel">
                        <div class="panel-body ">
                            <div class="media blog-cmnt cf">
                                <a href="javascript:;" class="pull-left avater-link">
                                    <?php echo get_avatar($post->post_author); ?>
                                </a>

                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="#"><?php the_author(); ?></a>
                                    </h4>

                                    <p class="mp-less">
                                        <?php the_author_meta("description"); ?>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-body">
                            <h1 class="text-center cmnt-head"><?php echo get_comments_number(); ?> Comments</h1>
                            <?php
                            if (comments_open() || '0' != get_comments_number()) :
                                comments_template();
                            endif;
                            ?>
                        </div>
                    </div>
                <?php endif; ?>
                <div class="text-center">
                    <ul class="pagination">
                        <?php
                        global $wp_query;

                        $big = 999999999; // need an unlikely integer

                        $links = paginate_links(array(
                            'base' => str_replace($big, '%#%', esc_url(get_pagenum_link($big))),
                            'format' => '?paged=%#%',
                            'current' => max(1, get_query_var('paged')),
                            'total' => $wp_query->max_num_pages,
                            'type' => 'array',
                            'prev_next' => true,
                            'prev_text' => '<i class="fa fa-angle-left"></i>',
                            "next_text" => '<i class="fa fa-angle-right"></i>',
                            'mid_size' => 3
                        ));
                        //print_r($links);
                        if ($links) {
                            foreach ($links as $link) {
                                if (strpos($link, "current") !== false)
                                    echo '<li class="active"><a>' . $link . "</a></li>\n";
                                else
                                    echo '<li>' . $link . "</li>\n";

                            }
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>