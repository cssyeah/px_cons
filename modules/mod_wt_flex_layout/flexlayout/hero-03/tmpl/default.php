<?php
/**
 * ------------------------------------------------------------------------
 * WT Flex Layout Module
 * ------------------------------------------------------------------------
 * Copyright (C) 2009-2024 Wave Theme. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: Wave Theme
 * Websites: http://www.wavetheme.com - http://www.9themestore.com
 * ------------------------------------------------------------------------
 */

defined('_JEXEC') or die('Restricted access');

$modSubHeading        = $params->get('mod_sub_heading','');
$modHeading           = $params->get('mod_heading','');
$modDesc              = $params->get('mod_desc','');
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

$heroImage  = $styleconfig->get('hero_image');

$heroBtn1Title        = $styleconfig->get('btn_1_title');
$heroBtn1Url          = $styleconfig->get('btn_1_url');
$heroBtn1Type         = $styleconfig->get('btn_1_type');
$heroBtn2Title        = $styleconfig->get('btn_2_title');
$heroBtn2Url          = $styleconfig->get('btn_2_url');
$heroBtn2Type         = $styleconfig->get('btn_2_type');
?>

<style>
  .hero-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .hero-<?php echo $module->id; ?> a:hover,
  .hero-<?php echo $module->id; ?> a:focus,
  .hero-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout hero hero-<?php echo $module->id; ?> layout-03 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="row flex-column align-items-center text-center">
    <div class="col-12 col-lg-7">
      <div class="hero-content-wrapper">
        <?php if($modSubHeading || $modHeading || $modDesc) : ?>
        <div class="mod-heading-wrapper">
          <?php if($modSubHeading) : ?>
            <h4 class="mod-sub-heading"><span><?php echo $modSubHeading; ?></span></h4>
          <?php endif; ?>

          <?php if($modHeading) : ?>
            <h2 class="mod-heading"><?php echo $modHeading; ?></h2>
          <?php endif; ?>

          <?php if($modDesc) : ?>
            <p class="mod-lead"><?php echo $modDesc; ?></p>
          <?php endif; ?>
        </div>
        <?php endif ?>

        <?php if($heroBtn1Title || $heroBtn2Title) : ?>
        <div class="hero-actions-wrapper">
          <?php if($heroBtn1Title) : ?>
            <a href="<?php echo $heroBtn1Url; ?>" title="" class="btn <?php echo $heroBtn1Type; ?> btn-lg"><?php echo $heroBtn1Title; ?></a>
          <?php endif ?>

          <?php if($heroBtn2Title) : ?>
            <a href="<?php echo $heroBtn2Url; ?>" title="<?php echo $heroBtn2Title; ?>" class="btn <?php echo $heroBtn2Type; ?> btn-lg"><?php echo $heroBtn2Title; ?></a>
          <?php endif ?>
        </div>
        <?php endif ?>
      </div>
    </div>

    <div class="col-12 col-lg-8">
      <div class="hero-media">
        <img src="<?php echo $heroImage; ?>" alt="<?php echo $modHeading; ?>" />
      </div>
    </div>
  </div>


  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>