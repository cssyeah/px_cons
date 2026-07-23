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

$ctaBtnSize        = $styleconfig->get('cta_btn_size');
$ctaBtnRounded        = $styleconfig->get('cta_btn_rounded');

$ctaBtn1Label        = $styleconfig->get('cta_btn_1_label');
$ctaBtn1Url          = $styleconfig->get('cta_btn_1_url');
$ctaBtn1Type         = $styleconfig->get('cta_btn_1_type');

$ctaBtn2Label        = $styleconfig->get('cta_btn_2_label');
$ctaBtn2Url          = $styleconfig->get('cta_btn_2_url');
$ctaBtn2Type         = $styleconfig->get('cta_btn_2_type');
?>

<style>
  .cta-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .cta-<?php echo $module->id; ?> a:hover,
  .cta-<?php echo $module->id; ?> a:focus,
  .cta-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout cta cta-<?php echo $module->id; ?> layout-01 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

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

  <div class="mod-action<?php echo ' justify-content-'. $modHeadingAligment; ?>">
    <?php if($ctaBtn1Label) : ?>
      <a href="<?php echo $ctaBtn1Url; ?>" title="" class="btn  <?php echo $ctaBtnSize . ' ' . $ctaBtn1Type . ' ' . $ctaBtnRounded; ?>"><?php echo $ctaBtn1Label; ?></a>
    <?php endif ?>

    <?php if($ctaBtn2Label) : ?>
      <a href="<?php echo $ctaBtn2Url; ?>" title="" class="btn  <?php echo $ctaBtnSize . ' ' . $ctaBtn2Type . ' ' . $ctaBtnRounded; ?>"><?php echo $ctaBtn2Label; ?></a>
    <?php endif ?>
  </div>

  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>