<?php Global $redux_framework; ?>
<!-- Testimonials Section
================================================== -->

<?php if($redux_framework['section_testimonial_display'] == 1) : ?>

	<?php $limit = 3; $order = 'DESC'; $testimonials = intima_get_custom_posts('testimonial', $limit, $order); ?>

	<section id="testimonials">
		<div class="text-container">
			<div class="row">
				<div class="twelve columns flex-container">
					<h1 class="section-title wow fadeInDown"><?php echo $redux_framework['section_testimonial_title']; ?></h1>

	        		<?php if ( $testimonials ) : ?>

					<div id="testimonial-slides" class="owl-carousel">
	        			<?php foreach ($testimonials as $testimonial) : $testimonial_meta = get_post_meta($testimonial->ID); ?>

						<div> 
							<blockquote>
								<?php if ( isset( $testimonial_meta['_intima_test_name'][0] ) ) {
									echo "<p>" . $testimonial_meta['_intima_test_name'][0] . "</p>";
								}?>
								<?php if ( isset( $testimonial_meta['_intima_test_description'][0] ) ) {
									echo "<cite>" . $testimonial_meta['_intima_test_description'][0] . "</cite>";
								}?>
							</blockquote> 
						</div> <!-- Single testimonial -->

						<?php endforeach; ?>

					</div> <!-- Owl Carousel End -->

					<?php endif; ?>

				</div> <!-- Testimonial-container ends -->

			</div> <!-- row ends -->

		</div>  <!-- text-container ends -->

	</section> <!-- Testimonials Section End-->
	
<?php endif; ?>