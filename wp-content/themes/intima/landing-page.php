<?php
/*
  Template Name: Home
*/

$sections = array('header', 'about', 'resume', 'portfolio', 'testimonial', 'contact', 'footer');

foreach ($sections as $section) {
  get_template_part("sections/section-{$section}");
}