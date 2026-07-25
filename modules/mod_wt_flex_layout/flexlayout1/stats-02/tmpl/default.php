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

$modBgImage           = $params->get('mod_bg_image', '');
$modBgColor           = $params->get('mod_bg_color', '');
$modTextColor         = $params->get('mod_text_color', '');
$modLinkColor         = $params->get('mod_link_color' . '');
$modLinkHoverColor    = $params->get('mod_link_hover_color', '');
$modSpacingTop        = $params->get('mod_spacing_top', '');
$modSpacingBottom     = $params->get('mod_spacing_bot', '');

$modBtnLabel = $params->get('mod_btn_label', '');
$modBtnUrl = $params->get('mod_btn_url', '');
$modBtnType = $params->get('mod_btn_type', '');

$modStyle = '';
$modStyle .= $modBgImage ? 'background-image: url(\'' . $modBgImage . '\');' : '';
$modStyle .= $modBgColor ? ' background-color: ' . $modBgColor . ';' : '';
$modStyle .= $modTextColor ? ' color: ' . $modTextColor . ';' : '';

$statsItemGap       = $styleconfig->get('stats_item_gap','0px');
$statsTextAlignment = $styleconfig->get('stats_text_alignment');
$statsBgColor       = $styleconfig->get('stats_bg_color');
$statsBorderWidth   = $styleconfig->get('stats_border_width');
$statsBorderColor   = $styleconfig->get('stats_border_color');
$statsTextColor     = $styleconfig->get('stats_text_color');
$statsPadding       = $styleconfig->get('stats_padding');
$statsBorderRadius  = $styleconfig->get('stats_border_radius');

$statsStyle = '';
$statsStyle .= $statsBgColor?'background-color: '.$statsBgColor.';':'';
$statsStyle .= ($statsBorderWidth > 0)?'border: '.$statsBorderWidth.'px solid '. $statsBorderColor .';':'';
$statsStyle .= $statsBorderRadius?'border-radius: '.$statsBorderRadius.';':'';
$statsStyle .= $statsTextColor?'color: '.$statsTextColor.';':'';
$statsStyle .= $statsTextAlignment?'text-align: '.$statsTextAlignment.';':'';
$statsStyle .= $statsPadding?'padding: '.$statsPadding.';':'';

$itemPerRow           = $styleconfig->get('stats_per_row', 3);
$items                = $styleconfig->get('stats_items');

// Total items
$totalItems           = count((array)$items);
?>

<style>
  .stats-<?php echo $module->id; ?>a {
    <?php echo $modLinkColor ? 'color:' . $modLinkColor . ';' : ''; ?>
  }

  .stats-<?php echo $module->id; ?>a:hover,
  .stats-<?php echo $module->id; ?>a:focus,
  .stats-<?php echo $module->id; ?>a:active {
    <?php echo $modLinkHoverColor ? 'color:' . $modLinkHoverColor . ';' : ''; ?>
  }
</style>

<div class="wt-flex-layout stats stats-<?php echo $module->id; ?> layout-02 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">

  <!-- Wrapping content -->
  <?php if ($enableContainer) echo '<div class="container">'; ?>

  <div class="row">
    <div class="col-12 col-lg-5">
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

      <?php if ($modBtnLabel) : ?>
        <div class="mod-action text-center">
          <a href="<?php echo $modBtnUrl; ?>" title="<?php echo $modBtnLabel; ?>" class="btn <?php echo $modBtnType; ?> btn-lg"><?php echo $modBtnLabel; ?></a>
        </div>
      <?php endif ?>
    </div>

    <div class="col-12 col-lg-7">
      <div class="stats-wrapper" style="grid-template-columns: repeat(<?php echo ($totalItems <= $itemPerRow) ? $totalItems : $itemPerRow; ?>, 1fr);">
        <?php foreach ($items as $item) { ?>
          <div class="stats-item">
            <div class="stats-item-inner<?php echo $statsTextAlignment ? ' text-' . $statsTextAlignment . '' : ''; ?>" style="<?php echo $statsStyle; ?>">
              <?php if ($item->stats_number) : ?>
                <span class="stats-number">
                  <?php echo $item->stats_number; ?>
                </span>
              <?php endif; ?>

              <?php if ($item->stats_title) : ?>
                <h4 class="stats-title"><?php echo $item->stats_title; ?></h4>
              <?php endif; ?>

              <?php if ($item->stats_title) : ?>
                <div class="stats-desc"><?php echo $item->stats_desc; ?></div>
              <?php endif; ?>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </div>

  <!-- Wrapping content -->
  <?php if ($enableContainer) {
    echo '</div>';
  } ?>
</div>