<?php

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

$heroDesktopScreen    = $styleconfig->get('hero_desktop_screen');
$heroMobileScreen     = $styleconfig->get('hero_mobile_screen');

$heroBtnTitle         = $styleconfig->get('hero_btn_title');
$heroBtnUrl           = $styleconfig->get('hero_btn_url');
$heroBtnType          = $styleconfig->get('hero_btn_type');
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

<div class="wt-flex-layout hero hero-<?php echo $module->id; ?> layout-04 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="row">
    <div class="col-12 col-lg-<?php echo $heroContentWidth; ?>">
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

        <?php if($heroBtnTitle) : ?>
        <div class="hero-actions-wrapper">
          <a href="<?php echo $heroBtnUrl; ?>" title="" class="btn <?php echo $heroBtnType; ?> btn-lg"><?php echo $heroBtnTitle; ?></a>
        </div>
        <?php endif ?>
      </div>
    </div>

    <?php if($heroDesktopScreen || $heroMobileScreen) : ?>
    <div class="col-12 col-lg-<?php echo (12 - $heroContentWidth); ?>">
      <div class="hero-media">
        <?php if($heroDesktopScreen) : ?>
        <div class="hero-desktop-screen">
          <img src="<?php echo $heroDesktopScreen; ?>" alt="<?php echo $modHeading; ?>" />
        </div>
        <?php endif ?>

        <?php if($heroMobileScreen) : ?>
        <div class="hero-mobile-screen">
          <img src="<?php echo $heroMobileScreen; ?>" alt="<?php echo $modHeading; ?>" />
        </div>
        <?php endif ?>
      </div>
    </div>
    <?php endif ?>

  </div>


  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>