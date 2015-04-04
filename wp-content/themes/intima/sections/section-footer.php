<?php Global $redux_framework; ?>
   <!-- footer
   ================================================== -->
   <footer>

      <div class="row">

         <div class="twelve columns">

            <?php $links = the_social_links();
            if ( !empty( $links ) ) : ?>
               <ul class='social-links'><?php echo $links; ?></ul>
            <?php endif; ?>

            <?php $copyrights = $redux_framework['footer_text'];
            if ( $copyrights ) : ?>
               <ul class='copyright'><?php echo $copyrights; ?></ul>
            <?php endif; ?>

         </div>

         <div id="go-top"><a class="smoothscroll" title="Back to Top" href="#home"><i class="fa fa-chevron-up"></i></a></div>

      </div>

   </footer> <!-- Footer End-->
   <?php
      $map_content = str_replace('"', "'", $redux_framework['section_contact_description']);
      $map_lat = $redux_framework['section_contact_lat'];
      $map_lon = $redux_framework['section_contact_lon'];
   ?>
   <?php wp_footer(); ?>
</body>

</html>