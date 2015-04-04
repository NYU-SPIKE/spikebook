<?php
global $post;

if ( isset( $post ) ) {
    setup_postdata($post);
}
?>
        <div class="row blog">
            <div class="eight columns mainpost">
                <?php while (have_posts()) : the_post();  ?>
                    <div <?php post_class('panel'); ?>>
                        <div class="panel-body">
                            <h1 class="mtop35"><?php the_title(); ?></h1>

                            <p class="auth-row">
                                By <?php the_author(); ?> | <?php the_date(); ?> | <a
                                    href="<?php echo get_permalink(); ?>"><?php echo get_comments_number(); ?>
                                    Comment</a>
                            </p>

                            <?php if (!is_single() && !is_page() && has_post_thumbnail()) : ?>
                                <div class="blog-img-wide">
                                    <?php the_post_thumbnail(); ?>
                                </div>
                            <?php endif; ?>

                            <?php if (!is_single() && !is_page()) : ?>
                                <?php the_excerpt(); ?>
                                <a href="<?php echo get_permalink(); ?>" class="more">Continue Reading</a>
                            <?php else : if( has_post_thumbnail() ) : ?>
                                <div class="blog-img-wide">
                                    <?php the_post_thumbnail(); ?>
                                </div>
                            <?php endif;
                                the_content();
                                $defaults = array(
                                    'before'           => '<p>' . __( 'Pages:','intima' ),
                                    'after'            => '</p>',
                                    'link_before'      => '',
                                    'link_after'       => '',
                                    'next_or_number'   => 'number',
                                    'separator'        => ' ',
                                    'nextpagelink'     => __( 'Next page','intima' ),
                                    'previouspagelink' => __( 'Previous page','intima' ),
                                    'pagelink'         => '%',
                                    'echo'             => 1
                                );
                                wp_link_pages($defaults);

                                $tags = get_the_tag_list("", "", "");

                                if ( !empty($tags) ) {
                                    echo '<div class="blog-tags"> TAGS' . get_the_tag_list("", "", "") . '</div>';
                                } ?>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endwhile; ?>
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
                            <h3 class="cmnt-head"><?php echo get_comments_number(); ?> Comments</h3>
                            <?php
                            if (comments_open() || '0' != get_comments_number()) :
                                comments_template();
                            endif;
                            ?>
                        </div>
                    </div>
                    <!-- If comments are closed and there are comments, let's leave a little note, shall we? -->
                    <?php if (!comments_open() && '0' != get_comments_number() && post_type_supports(get_post_type(), 'comments')) : ?>
                        <p class="no-comments"><?php _e('Comments are closed.', 'intima'); ?></p>
                    <?php endif; ?>

                    <?php comment_form(array('comment_notes_after'=>null)); ?>
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
            <div class="four columns sidebar">
                <?php if(!dynamic_sidebar("sidebar-1")) : ?>
                <div class="panel">
                    <div class="panel-body">
                        <form action="<?php echo site_url(); ?>" method="GET" class="searchform manualform" id="searchform">
                            <input type="text" name="s" placeholder="Search Blog" class="form-control blog-search" id="blog_search">
                            <button class="btn btn-search" type="submit" id="blog_search_button"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-body">
                        <div class="blog-post">
                            <h3 class="widget-title">Latest Blog Post</h3>

                            <?php
                            $posts = intima_get_custom_posts("post", 3);
                            if ($posts) : foreach ($posts as $p) : ?>
                                <div class="media">
                                    <a href="<?php echo $p->guid; ?>" class="post-thumbnail-link">
                                        <?php if (get_the_post_thumbnail($p->ID, "blog-sidebar")) echo get_the_post_thumbnail($p->ID, "blog-sidebar"); else echo "<img width=81 height=81 src='" . get_template_directory_uri() . "/images/no_thumb.jpg'/>"; ?>
                                    </a>

                                    <div class="media-body">
                                        <h5 class="media-heading"><a
                                                href="<?php echo $p->guid; ?>"><?php echo $p->post_title; ?></a>
                                        </h5>

                                        <?php
                                        echo intima_truncate(strip_tags($p->post_content), 60, " ");
                                        ?>
                                    </div>
                                </div>
                            <?php endforeach; endif; ?>
                        </div>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-body">
                        <div class="blog-post">
                            <h3 class="widget-title">category</h3>
                            <?php wp_list_categories(array("title_li" => "", "hierarchical" => false, "depth" => 0)); ?>
                        </div>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-body">
                        <div class="blog-post">
                            <h3 class="widget-title">blog archive</h3>
                            <?php wp_get_archives(); ?>
                        </div>
                    </div>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>