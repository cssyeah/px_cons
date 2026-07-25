<?php

defined('_JEXEC') or die('Restricted access');

$socialIconSize = $styleconfig->get('social_icon_size');
$socialLinkTarget = $styleconfig->get('social_link_target');
$customText = $styleconfig->get('custom_text','');

$linkColor = $styleconfig->get('link_color');
$linkHoverColor = $styleconfig->get('link_hover_color');

$items = $styleconfig->get('social_item');
?>

<style>
:root {
  --wt-social-<?php echo $module->id; ?>-link-color: <?php echo $linkColor; ?>;
  --wt-social-<?php echo $module->id; ?>-link-hover-color: <?php echo $linkHoverColor; ?>;
}

.social-links-<?php echo $module->id; ?> ul a {
  color: var(--wt-social-<?php echo $module->id; ?>-link-color);
}

.social-links-<?php echo $module->id; ?> ul a:hover,
.social-links-<?php echo $module->id; ?> ul a:focus,
.social-links-<?php echo $module->id; ?> ul a:active {
  color: var(--wt-social-<?php echo $module->id; ?>-link-hover-color);
}
</style>

<div class="wt-flex-layout social-links social-links-<?php echo $module->id; ?> layout-01<?php echo ' social-icon-size-'.$socialIconSize; ?>">
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