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

$modBtnLabel = $params->get('mod_btn_label','');
$modBtnUrl = $params->get('mod_btn_url','');
$modBtnType = $params->get('mod_btn_type','');

$modStyle = '';
$modStyle .= $modBgImage? 'background-image: url(\''.$modBgImage.'\');' : '';
$modStyle .= $modBgColor? ' background-color: '.$modBgColor.';' : '';
$modStyle .= $modTextColor? ' color: '.$modTextColor.';' : '';

$featureMainImage       = $styleconfig->get('feature_main_image','');
$featureContentPosition = $styleconfig->get('feature_content_position','');
$featureItemGap         = $styleconfig->get('feature_item_gap','0px');
$featureTextAlignment   = $styleconfig->get('feature_text_alignment');
$featureBtnType         = $styleconfig->get('feature_btn_type');

$featureStyle = '';
$featureStyle .= $featureTextAlignment?'text-align: '.$featureTextAlignment.';':'';

$itemPerRow           = $styleconfig->get('features_per_row', 3);
$items                = $styleconfig->get('feature_items');

// Total items
$totalItems           = count((array)$items);
?>

<style>
  .features-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .features-<?php echo $module->id; ?> a:hover,
  .features-<?php echo $module->id; ?> a:focus,
  .features-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout features features-<?php echo $module->id; ?> layout-04 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="row<?php echo ' ' . $featureContentPosition; ?>">
    <div class="col-12 col-lg-6 d-none d-lg-flex">
      <div class="features-media">
        <img src="<?php echo $featureMainImage; ?>" alt="" />
      </div>
    </div><!-- Features media -->

    <div class="col-12 col-lg-6">
      <div class="features-content">
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

        <div class="features-media d-lg-none pe-0 mb-5">
          <img src="<?php echo $featureMainImage; ?>" alt="" />
        </div>

        <div class="features-wrapper" style="grid-template-columns: repeat(<?php echo ($totalItems <= $itemPerRow)?$totalItems:$itemPerRow; ?>, 1fr); gap: <?php echo $featureItemGap; ?>;">
        <?php foreach ($items as $item) { ?>
          <div class="feature-item">
            <div class="feature-item-inner<?php echo $featureTextAlignment?' text-'.$featureTextAlignment.'':''; ?>" style="<?php echo $featureStyle; ?>">
              <?php if($item->feature_icon || $item->feature_image) : ?>
                <span class="feature-media">
                  <?php if($item->feature_image) { ?>
                    <img src="<?php echo $item->feature_image; ?>" alt="" />
                  <?php } else { ?>                    
                    <?php echo $item->feature_icon; ?>
                  <?php } ?>
                </span>
              <?php endif; ?>

              <?php if($item->feature_title) : ?>
                <h4 class="feature-title"><?php echo $item->feature_title; ?></h4>
              <?php endif; ?>

              <?php if($item->feature_title) : ?>
                <div class="feature-desc"><?php echo $item->feature_desc; ?></div>
              <?php endif; ?>

              <?php if($item->feature_link_url) : ?>
                <a href="<?php echo $item->feature_link_url; ?>" class="link-mask">&nbsp;</a>
              <?php endif ?>
            </div>
          </div>
        <?php } ?>
        </div>

        <?php if($modBtnLabel) : ?>
        <div class="mod-action text-center">
          <a href="<?php echo $modBtnUrl; ?>" title="<?php echo $modBtnLabel; ?>" class="btn <?php echo $modBtnType; ?> btn-lg"><?php echo $modBtnLabel; ?></a>
        </div>
        <?php endif ?>
      </div> <!-- Features content -->

    </div>
  </div>

  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>