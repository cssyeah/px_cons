<?php

defined('_JEXEC') or die('Restricted access');

$modSubHeading        = $params->get('mod_sub_heading');
$modHeading           = $params->get('mod_heading');
$modDesc              = $params->get('mod_desc');
$modHeadingAligment   = $params->get('mod_heading_alignment');
$enableContainer      = $params->get('enable_container');

$modBgImage           = $params->get('mod_bg_image','');
$modBgColor           = $params->get('mod_bg_color','');
$modTextColor         = $params->get('mod_text_color','');
$modLinkColor         = $params->get('mod_link_color'.'');
$modLinkHoverColor    = $params->get('mod_link_hover_color','');
$modSpacingTop        = $params->get('mod_spacing_top','');
$modSpacingBottom     = $params->get('mod_spacing_bot','');

$modBtnLabel          = $params->get('mod_btn_label','');
$modBtnUrl            = $params->get('mod_btn_url','');
$modBtnType           = $params->get('mod_btn_type','');

$modStyle = '';
$modStyle .= $modBgImage? 'background-image: url(\''.$modBgImage.'\');' : '';
$modStyle .= $modBgColor? ' background-color: '.$modBgColor.';' : '';
$modStyle .= $modTextColor? ' color: '.$modTextColor.';' : '';

$testimonialTextAlignment = $styleconfig->get('testimonial_text_alignment');
$testimonialBgColor       = $styleconfig->get('testimonial_bg_color');
$testimonialBorderWidth   = $styleconfig->get('testimonial_border_width');
$testimonialBorderColor   = $styleconfig->get('testimonial_border_color');
$testimonialTextColor     = $styleconfig->get('testimonial_text_color');
$testimonialPadding       = $styleconfig->get('testimonial_padding');
$testimonialBorderRadius  = $styleconfig->get('testimonial_border_radius');

$testimonialPerRow           = $styleconfig->get('testimonials_per_row', 3);

$items                = $styleconfig->get('testimonial_items');

// Total items
$totalItems           = count((array)$items);
?>

<style>
  .testimonials-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .testimonials-<?php echo $module->id; ?> a:hover,
  .testimonials-<?php echo $module->id; ?> a:focus,
  .testimonials-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout testimonials testimonials-<?php echo $module->id; ?> layout-01 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="mod-heading-wrapper testimonial-heading-wrapper<?php echo ' text-'. $modHeadingAligment; ?>">
    <?php if($modSubHeading) : ?>
      <h4 class="mod-sub-heading"><?php echo $modSubHeading; ?></h4>
    <?php endif; ?>

    <?php if($modHeading) : ?>
      <h2 class="mod-heading"><?php echo $modHeading; ?></h2>
    <?php endif; ?>

    <?php if($modDesc) : ?>
      <p class="mod-lead"><?php echo $modDesc; ?></p>
    <?php endif; ?>
  </div>

  <div id="testimonial-wrapper-<?php echo $module->id; ?>" class="testimonial-wrapper" style="grid-template-columns: repeat(<?php echo ($totalItems <= $testimonialPerRow)?$totalItems:$testimonialPerRow; ?>, 1fr);">
    <div class=" owl-carousel owl-theme">
    <?php foreach ($items as $item) { ?>
      <div class="testimonial-item slide slide-item">
        <div class="testimonial-item-inner">

          <?php if($item->customer_testimonial) : ?>
            <div class="customer-testimonial"><?php echo $item->customer_testimonial; ?></div>
          <?php endif; ?>

          <div class="customer-info-wrapper">
            <?php if($item->customer_image) : ?>
              <div class="customer-image"><img src="<?php echo $item->customer_image; ?>" alt="" /></div>
            <?php endif; ?>

            <div class="customer-info">
              <?php if($item->customer_name) : ?>
                <h4><?php echo $item->customer_name; ?></h4>
              <?php endif; ?>

              <div class="customer-position">
              <?php if($item->customer_position) : ?>
                <?php echo $item->customer_position; ?>
                <?php if($item->customer_website_name) : ?>
                  <a href="<?php echo $item->customer_website_url; ?>" title="" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
                <?php endif; ?>
                <?php endif; ?>
              </div>

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

            </div>
          </div>

        </div>
      </div>
    <?php } ?>
    </div>
  </div>

  <?php if($modBtnLabel) : ?>
  <div class="mod-action text-center">
    <a href="<?php echo $modBtnUrl; ?>" title="<?php echo $modBtnLabel; ?>" class="btn btn-lg <?php echo $modBtnType; ?>"><?php echo $modBtnLabel; ?></a>
  </div>
  <?php endif; ?>

  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>

<script>
  (function($) {
    jQuery(document).ready(function($) {
      var owlTestimoniallide<?php echo $module->id; ?> = $("#testimonial-wrapper-<?php echo $module->id; ?> .owl-carousel");
      owlTestimoniallide<?php echo $module->id; ?>.owlCarousel({
        addClassActive: true,
        margin: 0,
        stagePadding: 240,
        items: 3,
        loop: true,
        nav: 0,
        dotsSpeed: 400,
        slideTransition: 'linear',
        autoplaySpeed: 6000,
        dots: 1,
        autoplay: 0,
        animateIn: 'fadeIn',
        animateOut: 'fadeOut',
        autoplayTimeout: 5000,
        smartSpeed: 1200,
        mouseDrag: false,
        navText: [
          '<i class="fa-solid fa-chevron-left"></i>', // HTML for the previous button
          '<i class="fa-solid fa-chevron-right"></i>' // HTML for the next button
        ]
      });

      // Go to the next item
      $('.fl-owl-next').click(function() {
        owlTestimoniallide<?php echo $module->id; ?>.trigger('next.owl.carousel');
      })

      // Go to the previous item
      $('.fl-owl-prev').click(function() {
        owlTestimoniallide<?php echo $module->id; ?>.trigger('prev.owl.carousel');
      })
    });

  })(jQuery);
</script>