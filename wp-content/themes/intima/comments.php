<?php
/*
 * If the current post is protected by a password and
 * the visitor has not yet entered the password we will
 * return early without loading the comments.
 */

if (post_password_required()) {
    return;
}
?>

<div id="comments" class="comments-area">

    <?php // You can start editing here -- including this comment! ?>

    <?php if (have_comments()) : ?>

        <?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : // are there comments to navigate through ?>

            <nav id="comment-nav-above" class="comment-navigation" role="navigation">
                <h1 class="screen-reader-text"><?php _e('Comment navigation', 'intima'); ?></h1>

                <div class="nav-previous"><?php previous_comments_link(__('&larr; Older Comments', 'intima')); ?></div>
                <div class="nav-next"><?php next_comments_link(__('Newer Comments &rarr;', 'intima')); ?></div>
            </nav><!-- #comment-nav-above -->
        <?php endif; // check for comment navigation ?>

        <?php
        wp_list_comments(array(
            'style' => 'ol',
            'short_ping' => true,
            'callback'=>'intima_comment_walker',
        ));
        ?>

        <?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : // are there comments to navigate through ?>
            <nav id="comment-nav-below" class="comment-navigation" role="navigation">
                <h1 class="screen-reader-text"><?php _e('Comment navigation', 'intima'); ?></h1>

                <div class="nav-previous"><?php previous_comments_link(__('&larr; Older Comments', 'intima')); ?></div>
                <div class="nav-next"><?php next_comments_link(__('Newer Comments &rarr;', 'intima')); ?></div>
            </nav><!-- #comment-nav-below -->
        <?php endif; // check for comment navigation ?>

    <?php endif; // have_comments() ?>

</div><!-- #comments -->
