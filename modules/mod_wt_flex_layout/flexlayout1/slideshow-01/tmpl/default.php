<?php
/**
 * ------------------------------------------------------------------------
 * WT Flex Layout Module
 * ------------------------------------------------------------------------
 * Copyright (C) 2009-2024 Wave Theme. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: Wave Theme Template Club
 * Websites: http://www.wavetheme.com - http://www.9themestore.com
 * ------------------------------------------------------------------------
 */

defined('_JEXEC') or die('Restricted access');

$enableContainer      = $params->get('enable_container');
$modSpacingTop        = $params->get('mod_spacing_top','');
$modSpacingBottom     = $params->get('mod_spacing_bot','');

$modTextColor         = $params->get('mod_text_color','');
$modLinkColor         = $params->get('mod_link_color'.'');
$modLinkHoverColor    = $params->get('mod_link_hover_color','');

$modStyle = '';
$modStyle .= $modTextColor? ' color: '.$modTextColor.';' : '';

$showDots             = $styleconfig->get('show_dots_navigation');
$showNextPrev         = $styleconfig->get('show_next_prev');
$autoPlay             = $styleconfig->get('auto_play');
$slideshowCtWidth     = $styleconfig->get('slideshow_ct_width');
$slideshowCtAlignment = $styleconfig->get('slideshow_ct_alignment');
$slideMaskOpacity     = $styleconfig->get('item_mask_opacity');

$slideshowHeight      = $styleconfig->get('slideshow-height');

$items                = $styleconfig->get('slide_items');
?>

<style>
  .slideshow-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .slideshow-<?php echo $module->id; ?> a:hover,
  .slideshow-<?php echo $module->id; ?> a:focus,
  .slideshow-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout slideshow slideshow-<?php echo $module->id; ?> layout-01">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="slideshow-wrapper owl-carousel owl-theme">
  <?php foreach ($items as $item) { ?>
    <div class="slide slide-item <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="background-image: url('<?php echo $item->slide_image; ?>'); <?php echo $modStyle; ?>">
      <div class="container<?php echo ' '.$slideshowCtAlignment; ?>">

        <div class="slide-ct" style="max-width: <?php echo $slideshowCtWidth; ?>">
          <?php if($item->slide_sub_heading) : ?>
            <h5 class="slide-sub-heading">
              <?php echo $item->slide_sub_heading; ?>
            </h5>
          <?php endif; ?>

          <?php if($item->slide_heading) : ?>
            <h3 class="slide-heading"><?php echo $item->slide_heading; ?></h3>
          <?php endif; ?>

          <?php if($item->slide_desc) : ?>
            <div class="slide-desc"><?php echo $item->slide_desc; ?></div>
          <?php endif; ?>

          <?php if($item->slide_link_label) : ?>
            <div class="slide-action">
              <a href="<?php echo $item->feature_link_url; ?>" class="btn btn-primary"><?php echo $item->slide_link_label; ?></a>
            </div>
          <?php endif ?>
        </div>

      </div>
      <div class="slide-item-mask" style="background-color: rgba(0,0,0,<?php echo $slideMaskOpacity; ?>);"></div>
    </div>
  <?php } ?>
  </div>

  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>

<script>
  (function($){
    jQuery(document).ready(function($) {
      var owlSlideshow<?php echo $module->id; ?> = $(".slideshow-<?php echo $module->id; ?> .owl-carousel");
      owlSlideshow<?php echo $module->id; ?>.owlCarousel({
        addClassActive: true,
        margin: 0,
        items: 1,
        loop: true,
        nav : <?php echo $showNextPrev; ?>,
        dotsSpeed: 400,
        slideTransition: 'linear',
        autoplaySpeed: 6000,
        dots: <?php echo $showDots; ?>,
        autoplay: <?php echo $autoPlay; ?>,
        animateIn: 'fadeIn',
        animateOut: 'fadeOut',
        autoplayTimeout: 5000,
        smartSpeed: 1200,
        mouseDrag: false,
        navText: [
        '<i class="fa-solid fa-chevron-left"></i>', // HTML for the previous button
        '<i class="fa-solid fa-chevron-right"></i>'  // HTML for the next button
        ]
      });
      
      // Go to the next item
      $('.fl-owl-next').click(function() {
        owlSlideshow<?php echo $module->id; ?>.trigger('next.owl.carousel');
      })
      
      // Go to the previous item
      $('.fl-owl-prev').click(function() {
        owlSlideshow<?php echo $module->id; ?>.trigger('prev.owl.carousel');
      })
    });

  })(jQuery);
</script>