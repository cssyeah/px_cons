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

if ($touch_image == '') {
  $touch_image = $doc->baseurl . '/templates/' . $doc->template . '/media/images/touch-device.png';
}

$doc->addCustomTag('<link rel="apple-touch-icon" href="' . $touch_image . '">');
$doc->addCustomTag('<link rel="apple-touch-icon-precomposed" href="' . $touch_image . '">');

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
<html class="<?php echo $option . ' view-' . $view . ' layout-' . $layout . ' taks-' . $task . ' ' . $pageclass; ?>" lang="<?php echo $doc->language; ?>" dir="<?php echo $doc->direction; ?>">

<head>
  <?php echo PixelTemplate::renderBlock('head') ?>
</head>

<body id="px-body" class="px-body" data-px-theme="<?php echo PixelColorPresetHelper::getActivePreset(); ?>">
    <!-- before open body -->
    <?php echo PixelConfig::get('custom_code_before_body') ?>

  <?php echo PixelTemplate::renderBlock('offcanvas') ?>
  <div id="px-page-wrapper" class="px-page-wrapper">
    <?php echo PixelTemplate::renderBlock('header') ?>

    <!-- Hero -->
    <?php if($doc->countModules('hero') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
    <div id="px-hero">
      <jdoc:include type="modules" name="hero" style="none" />
    </div>
    <?php endif; ?>

    <?php if($doc->countModules('landing-1') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-1" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-2') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-2" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-3') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-3" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-4') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-4" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-5') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-5" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-6') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-6" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-7') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-7" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-8') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-8" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-9') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-9" style="px_section" />
    <?php endif; ?>

    <?php if($doc->countModules('landing-10') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG) : ?>
      <jdoc:include type="modules" name="landing-10" style="px_section" />
    <?php endif; ?>

    <!-- Footer -->
    <?php echo PixelTemplate::renderBlock('footer') ?>
  </div>

  <!-- after open body -->
  <?php echo PixelConfig::get('custom_code_after_body') ?>
</body>
<html>