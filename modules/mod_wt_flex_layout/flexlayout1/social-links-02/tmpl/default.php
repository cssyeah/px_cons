<?php

defined('_JEXEC') or die('Restricted access');

$socialIconSize = $styleconfig->get('social_icon_size');
$socialIconStyle = $styleconfig->get('social_icon_style');
$socialLinkTarget = $styleconfig->get('social_link_target');
$customText = $styleconfig->get('custom_text','');

$linkColor = $styleconfig->get('link_color');
$linkBgColor = $styleconfig->get('link_bg_color');
$linkHoverColor = $styleconfig->get('link_hover_color');
$linkBgHoverColor = $styleconfig->get('link_bg_hover_color');

$items = $styleconfig->get('social_item');
?>

<style>
:root {
  --wt-social-<?php echo $module->id; ?>-link-color: <?php echo $linkColor; ?>;
  --wt-social-<?php echo $module->id; ?>-link-bg-color: <?php echo $linkBgColor; ?>;
  --wt-social-<?php echo $module->id; ?>-link-hover-color: <?php echo $linkHoverColor; ?>;
  --wt-social-<?php echo $module->id; ?>-link-bg-hover-color: <?php echo $linkBgHoverColor; ?>;
}

.social-links-<?php echo $module->id; ?> ul a {
  background: var(--wt-social-<?php echo $module->id; ?>-link-bg-color);
  color: var(--wt-social-<?php echo $module->id; ?>-link-color);
}

.social-links-<?php echo $module->id; ?> ul a:hover,
.social-links-<?php echo $module->id; ?> ul a:focus,
.social-links-<?php echo $module->id; ?> ul a:active {
  background: var(--wt-social-<?php echo $module->id; ?>-link-bg-hover-color);
  color: var(--wt-social-<?php echo $module->id; ?>-link-hover-color);
}
</style>

<div class="wt-flex-layout social-links social-links-<?php echo $module->id; ?> layout-02<?php echo ' social-icon-size-'.$socialIconSize; ?><?php echo ' social-icon-style-'.$socialIconStyle; ?> ">
  <?php if(trim($customText)) : ?>
  <p><?php echo $customText; ?></p>
  <?php endif ?>

  <ul>
  <?php foreach ($items as $item) { ?>
    <li>
      <a href="<?php echo !empty($item->item_link)? $item->item_link: '#'; ?>" title="<?php echo $item->item_title; ?>" target="<?php echo $socialLinkTarget; ?>">
        <?php if(trim($item->item_icon) || trim($item->item_media) ) : ?>
          <?php if(!empty($item->item_media)) : ?>
            <img src="<?php echo $item->item_media; ?>" alt="<?php echo $item->item_title; ?>" />
          <?php else : ?>
            <?php echo trim($item->item_icon); ?>
          <?php endif; ?>
        <?php endif; ?>
      </a>
    </li>
  <?php } ?>
  </ul>
</div>