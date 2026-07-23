<?php

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;

extract($displayData);

$title      = $item->anchor_title ? ' title="' . $item->anchor_title . '"' : '';
$anchor_css = $item->anchor_css ?: '';
$linktype   = '<span class="item-text">' . $item->title . '</span>';

$itemParams = $item->getParams();

if ($item->menu_icon) {
    // The link is an icon
    if ($itemParams->get('menu_text', 1)) {
        // If the link text is to be displayed, the icon is added with aria-hidden
        $linktype = '<span class="p-2 ' . $item->menu_icon . '" aria-hidden="true"></span>' . '<span class="item-text">' . $item->title . '</span>';
    } else {
        // If the icon itself is the link, it needs a visually hidden text
        $linktype = '<span class="p-2 ' . $item->menu_icon . '" aria-hidden="true"></span><span class="visually-hidden">' . $item->title . '</span>';
    }
} elseif ($item->menu_image) {
    // The link is an image, maybe with its own class
    $image_attributes = [];

    if ($item->menu_image_css) {
        $image_attributes['class'] = $item->menu_image_css;
    }

    $linktype = HTMLHelper::_('image', $item->menu_image, $item->title, $image_attributes);

    if ($itemParams->get('menu_text', 1)) {
        $linktype .= '<span class="image-title">' . $item->title . '</span>';
    }
}

if ($item->deeper) {
    $linktype .= '<span class="px-menu-caret"></span>';
}
?>
<a class="px-menu-separator separator <?php echo $anchor_css; ?>"<?php echo $title; ?> href="javascript:;"><?php echo $linktype; ?></a>
