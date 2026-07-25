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
$app = JFactory::getApplication();
$menu = $app->getMenu();
$activeMenu = $menu->getActive();

$moduleTitle          = $module->title;
$enableContainer      = $params->get('enable_container');
$modBgImage           = $params->get('mod_bg_image','');
$modBgColor           = $params->get('mod_bg_color','');
$modTextColor         = $params->get('mod_text_color','');
$modLinkColor         = $params->get('mod_link_color'.'');
$modLinkHoverColor    = $params->get('mod_link_hover_color','');
$modSpacingTop        = $params->get('mod_spacing_top','');
$modSpacingBottom     = $params->get('mod_spacing_bot','');

$modStyle = '';
$modStyle .= $modBgImage? 'background-image: url(\''.$modBgImage.'\');' : '';
$modStyle .= $modBgColor? ' background-color: '.$modBgColor.';' : '';
$modStyle .= $modTextColor? ' color: '.$modTextColor.';' : '';

$mastheadHeading      = $styleconfig->get('masthead_heading',0);
$mastheadDesc         = $styleconfig->get('masthead_heading_desc',0);
$mastheadTextAlignment = $styleconfig->get('masthead_text_alignment',0);

// Check if the active menu item exists
if ($activeMenu) {
    // Get the title of the active menu item
    $menuTitle = $activeMenu->title;    

    // Get the Meta Description of the active menu item
    $metaDescription  = $activeMenu->getParams()->get('menu-meta_description', '');
    $pageTitle        = $activeMenu->getParams()->get('page_title', '');
    $pageHeading      = $activeMenu->getParams()->get('page_heading', '');

    switch ($mastheadHeading) {
      case 1:
        $mastheadTitle = $moduleTitle;
        break;
      case 2:
        $mastheadTitle = $pageTitle;
        break;
      case 3:
        $mastheadTitle = $pageHeading;
        break;
      default:
        $mastheadTitle = $menuTitle;
    }

} else {
    echo '';
}
?>

<div class="wt-flex-layout masthead masthead-<?php echo $module->id; ?> layout-01 <?php echo $modSpacingTop . ' ' . $modSpacingBottom; ?>" style="<?php echo $modStyle; ?>">
  <!-- Wrapping content -->
  <?php if($enableContainer) echo '<div class="container">'; ?>
    <div class="masthead-inner d-flex flex-column<?php echo ' '.$mastheadTextAlignment; ?>">
      <h1 class="masthead-heading"><?php echo $mastheadTitle; ?></h1>
      <div class="masthead-desc"><?php echo $metaDescription ? $metaDescription : '<div class="empty-msg">No meta description found for this menu item.</div>'; ?></div>
    </div>
  <!-- Wrapping content -->
  <?php if($enableContainer) { echo '</div>';} ?>
</div>