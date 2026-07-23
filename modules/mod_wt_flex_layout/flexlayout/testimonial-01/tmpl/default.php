<?php
/**
 * WT Flex Layout Module
 *
 * @package         Flexlayout.Testimonials
 *
 * @copyright       Copyright (C) 2009 - 2024 Wave Theme. All rights reserved.
 * @license         https://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @link            https://www.wavetheme.com
 **/

defined('_JEXEC') or die('Restricted access');

// Global settings
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


// Item settings
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

  <div class="mod-heading-wrapper<?php echo ' text-'. $modHeadingAligment; ?>">
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

  <div class="testimonial-wrapper" style="grid-template-columns: repeat(<?php echo $testimonialPerRow; ?>, 1fr);">
  <?php foreach ($items as $item) { ?>
    <div class="testimonial-item">
      <div class="testimonial-item-inner" style="background-color: <?php echo $testimonialBgColor; ?>; border: <?php echo $testimonialBorderWidth; ?>px solid <?php echo $testimonialBorderColor; ?>; border-radius: <?php echo $testimonialBorderRadius; ?>px; color: <?php echo $testimonialTextColor; ?>; text-align: <?php echo $testimonialTextAlignment; ?>; padding: <?php echo $testimonialPadding; ?>px;">
        
        <?php if($item->customer_image) : ?>
          <div class="customer-image"><img src="<?php echo $item->customer_image; ?>" alt="<?php echo $item->customer_name; ?>" /></div>
        <?php endif; ?>

        <?php if($item->customer_testimonial) : ?>
          <div class="customer-testimonial"><?php echo $item->customer_testimonial; ?></div>
        <?php endif; ?>

        <div class="customer-info">
          <?php if($item->customer_name) : ?>
            <h4><?php echo $item->customer_name; ?></h4>
          <?php endif; ?>

          <?php if($item->customer_position) : ?>
            <div class="customer-position">
              <?php echo $item->customer_position; ?>
              <?php if($item->customer_website_name) : ?>
                <a href="<?php echo $item->customer_website_url; ?>" title="<?php echo $item->customer_website_name; ?>" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
              <?php endif; ?>
          </div>
          <?php endif; ?>

          <?php if($item->customer_rating > 0) : ?>
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
          <?php endif ?>              
        </div>

      </div>
    </div>
  <?php } ?>
  </div>

  <?php if($modBtnLabel) : ?>
  <div class="mod-action text-center">
    <a href="<?php echo $modBtnUrl; ?>" title="<?php echo $modBtnLabel; ?>" class="btn btn-lg <?php echo $modBtnType; ?>" target="_blank"><?php echo $modBtnLabel; ?></a>
  </div>
  <?php endif; ?>

  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>