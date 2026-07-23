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

$clientsPerRow        = $styleconfig->get('clients_per_row', 6);
$imageMaxHeight       = $styleconfig->get('image_max_height');
$imageOpacity         = $styleconfig->get('image_opacity');

$items = $styleconfig->get('client_items');
?>

<style>
  .clients-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .clients-<?php echo $module->id; ?> a:hover,
  .clients-<?php echo $module->id; ?> a:focus,
  .clients-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout clients clients-<?php echo $module->id; ?> layout-01 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>

  <div class="mod-heading-wrapper clients-heading-wrapper<?php echo ' text-'. $modHeadingAligment; ?>">
    <?php if($modSubHeading) : ?>
      <h4 class="mod-sub-heading clients-sub-heading"><?php echo $modSubHeading; ?></h4>
    <?php endif; ?>

    <?php if($modHeading) : ?>
      <h2 class="mod-heading clients-heading"><?php echo $modHeading; ?></h2>
    <?php endif; ?>

    <?php if($modDesc) : ?>
      <p class="mod-lead clients-lead"><?php echo $modDesc; ?></p>
    <?php endif; ?>
  </div>

  <ul style="grid-template-columns: repeat(<?php echo $clientsPerRow; ?>, 1fr);">
  <?php foreach ($items as $item) { ?>
    <li>
      <a href="<?php echo $item->client_link_url; ?>" title="<?php echo $item->client_name; ?>" target="_blank" style="opacity: <?php echo $imageOpacity; ?>;">
        <img src="<?php echo $item->client_image; ?>" alt="<?php echo $item->client_name; ?>" style="max-height: <?php echo $imageMaxHeight; ?>px;" />
      </a>
    </li>
  <?php } ?>
  </ul>

  <?php if($modBtnLabel) : ?>
  <div class="mod-action client-action text-center">
    <a href="<?php echo $modBtnUrl; ?>" title="<?php echo $modBtnLabel; ?>" class="btn <?php echo $modBtnType; ?> btn-lg"><?php echo $modBtnLabel; ?></a>
  </div>
  <?php endif ?>

  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>

</div>