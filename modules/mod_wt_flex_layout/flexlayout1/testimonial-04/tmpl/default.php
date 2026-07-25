<?php

defined('_JEXEC') or die('Restricted access');

// Global settings
$modSubHeading        = $params->get('mod_sub_heading');
$modHeading           = $params->get('mod_heading');
$modDesc              = $params->get('mod_desc');
$modHeadingAligment   = $params->get('mod_heading_alignment');
$enableContainer      = $params->get('enable_container');

$modBgImage           = $params->get('mod_bg_image', '');
$modBgColor           = $params->get('mod_bg_color', '');
$modTextColor         = $params->get('mod_text_color', '');
$modLinkColor         = $params->get('mod_link_color' . '');
$modLinkHoverColor    = $params->get('mod_link_hover_color', '');
$modSpacingTop        = $params->get('mod_spacing_top', '');
$modSpacingBottom     = $params->get('mod_spacing_bot', '');

$modBtnLabel          = $params->get('mod_btn_label', '');
$modBtnUrl            = $params->get('mod_btn_url', '');
$modBtnType           = $params->get('mod_btn_type', '');

$modStyle = '';
$modStyle .= $modBgImage ? 'background-image: url(\'' . $modBgImage . '\');' : '';
$modStyle .= $modBgColor ? ' background-color: ' . $modBgColor . ';' : '';
$modStyle .= $modTextColor ? ' color: ' . $modTextColor . ';' : '';

$showDots             = $styleconfig->get('show_dots_navigation');
$showNextPrev         = $styleconfig->get('show_next_prev');
$autoPlay             = $styleconfig->get('auto_play');

// Item settings
$testimonialTextAlignment = $styleconfig->get('testimonial_text_alignment');

$items                = $styleconfig->get('testimonial_items');
?>

<style>
  .testimonial-<?php echo $module->id; ?>a {
    <?php echo $modLinkColor ? 'color:' . $modLinkColor . ';' : ''; ?>
  }

  .testimonial-<?php echo $module->id; ?>a:hover,
  .testimonial-<?php echo $module->id; ?>a:focus,
  .testimonial-<?php echo $module->id; ?>a:active {
    <?php echo $modLinkHoverColor ? 'color:' . $modLinkHoverColor . ';' : ''; ?>
  }
</style>

<div class="wt-flex-layout testimonials testimonial-<?php echo $module->id; ?> layout-04 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if ($enableContainer) echo '<div class="container">'; ?>

  <div class="mod-heading-wrapper<?php echo ' text-' . $modHeadingAligment; ?>">
    <?php if ($modSubHeading) : ?>
      <h4 class="mod-sub-heading"><?php echo $modSubHeading; ?></h4>
    <?php endif; ?>

    <?php if ($modHeading) : ?>
      <h2 class="mod-heading"><?php echo $modHeading; ?></h2>
    <?php endif; ?>

    <?php if ($modDesc) : ?>
      <p class="mod-lead"><?php echo $modDesc; ?></p>
    <?php endif; ?>
  </div>

  <div class="testimonial-wrapper owl-carousel owl-theme">
    <?php foreach ($items as $item) { ?>
      <div class="testimonial-item">
        <div class="testimonial-item-inner">

          <div class="customer-rating">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <span class="star-rating">
              <?php for ($i = 1; $i <= ($item->customer_rating); $i++) { ?>
                <i class="fa-solid fa-star"></i>
              <?php } ?>
            </span>
          </div>

          <?php if ($item->customer_testimonial) : ?>
            <div class="customer-testimonial"><?php echo $item->customer_testimonial; ?></div>
          <?php endif; ?>

          <?php if ($item->customer_image) : ?>
            <div class="customer-image"><img src="<?php echo $item->customer_image; ?>" alt="" /></div>
          <?php endif; ?>

          <div class="customer-info">
            <?php if ($item->customer_name) : ?>
              <h4><?php echo $item->customer_name; ?></h4>
            <?php endif; ?>

            <div class="customer-position">
              <?php if ($item->customer_position) : ?>
                <?php echo $item->customer_position; ?>
                <?php if ($item->customer_website_name) : ?>
                  <a href="<?php echo $item->customer_website_url; ?>" title="" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
                <?php endif; ?>
              <?php endif; ?>
            </div>
          </div>

        </div>
      </div>
    <?php } ?>
  </div>

  <?php if ($modBtnLabel) : ?>
    <div class="mod-action text-center">
      <a href="<?php echo $modBtnUrl; ?>" title="<?php echo $modBtnLabel; ?>" class="btn btn-lg <?php echo $modBtnType; ?>"><?php echo $modBtnLabel; ?></a>
    </div>
  <?php endif; ?>

  <!-- Wrapping content -->
  <?php if ($enableContainer) {
    echo '</div>';
  } ?>
</div>

<script>
  (function($) {
    jQuery(document).ready(function($) {
      var owlTestimonial<?php echo $module->id; ?> = $(".testimonial-<?php echo $module->id; ?> .owl-carousel");
      owlTestimonial<?php echo $module->id; ?>.owlCarousel({
        addClassActive: true,
        margin: 0,
        items: 1,
        loop: true,
        nav: <?php echo $showNextPrev; ?>,
        dotsSpeed: 400,
        slideTransition: 'linear',
        autoplaySpeed: 6000,
        dots: <?php echo $showDots; ?>,
        autoplay: <?php echo $autoPlay; ?>,
        autoplayTimeout: 5000,
        smartSpeed: 1000,
        mouseDrag: true,
        navText: [
          '<i class="fa-solid fa-chevron-left"></i>', // HTML for the previous button
          '<i class="fa-solid fa-chevron-right"></i>' // HTML for the next button
        ]
      });

      // Go to the next item
      $('.fl-owl-next').click(function() {
        owlTestimonial<?php echo $module->id; ?>.trigger('next.owl.carousel');
      })

      // Go to the previous item
      $('.fl-owl-prev').click(function() {
        owlTestimonial<?php echo $module->id; ?>.trigger('prev.owl.carousel');
      })
    });

  })(jQuery);
</script>