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

$heroContentWidth     = $styleconfig->get('hero_content_width', 6);
$heroSmallText        = $styleconfig->get('small_text');

$heroMainImage  = $styleconfig->get('hero_main_image');
$heroThumb1     = $styleconfig->get('hero_image_thumb_1');
$heroThumb2     = $styleconfig->get('hero_image_thumb_2');
$heroThumb3     = $styleconfig->get('hero_image_thumb_3');
$heroThumb4     = $styleconfig->get('hero_image_thumb_4');

$heroBtn1Title        = $styleconfig->get('btn_1_title');
$heroBtn1Url          = $styleconfig->get('btn_1_url');
$heroBtn1Type         = $styleconfig->get('btn_1_type');
$heroBtn2Title        = $styleconfig->get('btn_2_title');
$heroBtn2Url          = $styleconfig->get('btn_2_url');
$heroBtn2Type         = $styleconfig->get('btn_2_type');
?>

<div class="wt-flex-layout hero hero-<?php echo $module->id; ?> layout-02 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="row">
    <div class="col-12 col-lg-<?php echo $heroContentWidth; ?>">
      <div class="hero-content-wrapper">
        <?php if($modSubHeading || $modHeading || $modDesc) : ?>
        <div class="mod-heading-wrapper">
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

        <?php if($heroSmallText) : ?>
          <div class="hero-small-text"><?php echo $heroSmallText; ?></div>
        <?php endif ?>
      </div>
    </div>

    <div class="col-12 col-lg-<?php echo (12 - $heroContentWidth); ?>">
      <div class="hero-media">
        <div class="hero-thumb-main"><img src="<?php echo $heroMainImage; ?>" alt="<?php echo $modHeading; ?>" /></div>
        <div class="hero-thumb-1"><img src="<?php echo $heroThumb1; ?>" alt="<?php echo $modHeading; ?>" /></div>
        <div class="hero-thumb-2"><img src="<?php echo $heroThumb2; ?>" alt="<?php echo $modHeading; ?>" /></div>
        <div class="hero-thumb-3"><img src="<?php echo $heroThumb3; ?>" alt="<?php echo $modHeading; ?>" /></div>
        <div class="hero-thumb-4"><img src="<?php echo $heroThumb4; ?>" alt="<?php echo $modHeading; ?>" /></div>
      </div>
    </div>
  </div>


  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>