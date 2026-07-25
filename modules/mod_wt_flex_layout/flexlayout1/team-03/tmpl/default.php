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

$memberTextAlignment = $styleconfig->get('member_text_alignment');
$memberBgColor       = $styleconfig->get('member_bg_color');
$memberBorderWidth   = $styleconfig->get('member_border_width');
$memberBorderColor   = $styleconfig->get('member_border_color');
$memberTextColor     = $styleconfig->get('member_text_color');
$memberPadding       = $styleconfig->get('member_padding');
$memberBorderRadius  = $styleconfig->get('member_border_radius');

if(($memberBorderRadius - $memberPadding) > 0 ) {
  $mediaBorderRadius    = ($memberBorderRadius - $memberPadding);
} elseif((($memberBorderRadius - $memberPadding) <= 0) && ($memberBorderRadius > 0)) {
  $mediaBorderRadius = ($memberBorderRadius / 2);
} else {
  $mediaBorderRadius = 0;
}

$itemPerRow           = $styleconfig->get('members_per_row', 3);
$items                = $styleconfig->get('team_items');

// Total items
$totalItems           = count((array)$items);
?>

<style>
  .team-<?php echo $module->id; ?> a {    
    <?php echo $modLinkColor?'color:'.$modLinkColor.';':''; ?>
  }

  .team-<?php echo $module->id; ?> a:hover,
  .team-<?php echo $module->id; ?> a:focus,
  .team-<?php echo $module->id; ?> a:active {
    <?php echo $modLinkHoverColor?'color:'.$modLinkHoverColor.';':''; ?>
  }
</style>

<div class="wt-flex-layout team team-<?php echo $module->id; ?> layout-03 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

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

  <div class="team-wrapper" style="grid-template-columns: repeat(<?php echo ($totalItems <= $itemPerRow)?$totalItems:$itemPerRow; ?>, 1fr);">
  <?php foreach ($items as $item) { ?>
    <div class="team-item item-aligment-<?php echo $memberTextAlignment; ?>">
      <div class="team-item-inner" style="background-color: <?php echo $memberBgColor; ?>; border: <?php echo $memberBorderWidth; ?>px solid <?php echo $memberBorderColor; ?>; border-radius: <?php echo $memberBorderRadius; ?>px; color: <?php echo $memberTextColor; ?>; text-align: <?php echo $memberTextAlignment; ?>; padding: <?php echo $memberPadding; ?>px;">

        <?php if($item->member_image) : ?>
          <div class="member-image" style="border-radius: <?php echo $mediaBorderRadius; ?>px;">
            <img src="<?php echo $item->member_image; ?>" alt="<?php echo $item->member_name; ?>" />
          </div>
        <?php endif; ?>

        <div class="member-info-wrapper">
          <?php if($item->member_position) : ?>
            <div class="member-position"><?php echo $item->member_position; ?></div>
          <?php endif; ?>

          <?php if($item->member_name) : ?>
            <h4><?php echo $item->member_name; ?></h4>
          <?php endif; ?>

          <?php if($item->member_website_name) : ?>
            <span class="member-website">
              <a href="<?php echo $item->member_website_url; ?>" title="<?php echo $item->member_website_name;?>" target="_blank"><?php echo $item->member_website_name; ?></a>
              <i class="fa-solid fa-arrow-up-right-from-square"></i>
            </span>
          <?php endif; ?>

          <?php if($item->member_intro) : ?>
            <div class="member-desc"><?php echo $item->member_intro; ?></div>
          <?php endif; ?>

          <?php if($item->member_social_links) : ?>
            <div class="member-social-links"><?php echo $item->member_social_links; ?></div>
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