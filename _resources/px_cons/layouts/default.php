<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\CMS\Helper\MediaHelper;
use Joomla\Plugin\System\Pixel\PixelConfig;
use Joomla\Plugin\System\Pixel\Helper\PixelColorPresetHelper;

// No direct access.
defined('_JEXEC') or die('Restricted access');

$doc = Factory::getDocument();

$app   = Factory::getApplication();
$input = $app->getInput();
$params = $doc->params;

$favicon = MediaHelper::getCleanMediaFieldValue($params->get('favicon_image', ''));

if ($favicon) {
    $doc->addFavicon($favicon);
}

$touch_image = $params->get('touch_image', '');

if($touch_image == '') {
    $touch_image = $doc->baseurl.'/templates/'.$doc->template.'/media/images/touch-device.png';
}

$doc->addCustomTag('<link rel="apple-touch-icon" href="'.$touch_image.'">');
$doc->addCustomTag('<link rel="apple-touch-icon-precomposed" href="'.$touch_image.'">');

// Detecting Active Variables
$option   = $input->getCmd('option', '');
$view     = $input->getCmd('view', '');
$layout   = $input->getCmd('layout', '');
$task     = $input->getCmd('task', '');
$itemid   = $input->getCmd('Itemid', '');
$sitename = htmlspecialchars($app->get('sitename'), ENT_QUOTES, 'UTF-8');
$menu     = $app->getMenu()->getActive();
$pageclass = $menu !== null ? $menu->getParams()->get('pageclass_sfx', '') : '';

// defines if com_config
define('PIXEL_COM_CONFIG', $option == 'com_config');

// Defines if layout-edit
define('PIXEL_LAYOUT_EDIT', $layout == 'edit');

// defines if com_users
define('PIXEL_COM_USERS', $option == 'com_users');

// Colors
PixelColorPresetHelper::loadPreset();
?>

<!DOCTYPE html>
<html class="<?php echo $option . ' view-' . $view . ' layout-' . $layout . ' taks-' . $task . ' ' . $pageclass;?>" lang="<?php echo $doc->language; ?>" dir="<?php echo $doc->direction; ?>">

<head>
    <?php echo PixelTemplate::renderBlock('head') ?>
</head>

<body id="px-body" class="px-body" data-px-theme="<?php echo PixelColorPresetHelper::getActivePreset(); ?>">
    <!-- before open body -->
    <?php echo PixelConfig::get('custom_code_before_body') ?>

  <?php echo PixelTemplate::renderBlock('offcanvas') ?>
	<div id="px-bg" class="px-bg">
    	<?php echo PixelTemplate::renderBlock('header') ?>

        <?php if ($sublayout = PixelTemplate::getSublayout()): ?>
            <?php echo PixelTemplate::renderSublayout($sublayout) ?>
        <?php else : ?>
            <?php echo PixelTemplate::renderBlock('mainbody') ?>
        <?php endif ?>
        
        <?php echo PixelTemplate::renderBlock('footer') ?>
	</div>
    <!-- after open body -->
    <?php echo PixelConfig::get('custom_code_after_body') ?>
</body>
<html>