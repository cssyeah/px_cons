<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */


use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Plugin\System\Pixel\Element\PixelMenuElement;
use Joomla\Plugin\System\Pixel\Element\PixelOffcanvasElement;
use Joomla\Plugin\System\Pixel\Element\PixelPresetElement;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
$params = $doc->params;
$menu_fixed = $params->get('menu_fixed', '0');
$show_dark_light_mode = $params->get('show_dark_light_mode', '0');
?>

<!-- TOPBAR -->
<?php if ($doc->countModules('topbar')): ?>
  <div id="px-topbar" class="px-topbar">
    <div class="container">
      <?php if ($doc->countModules('topbar')): ?>
        <jdoc:include type="modules" name="topbar" style="none" />
      <?php endif; ?>
    </div>
  </div>
<?php endif; ?>
<!-- // TOPBAR -->

<!-- HEADER -->
<header id="px-header" class="px-header <?php echo $menu_fixed ? 'px-fixed-top' : ''; ?>">
  <div class="container">
    <div class="header-inner">
      <div class="px-logo-wrap navbar-brand">
        <?php echo PixelTemplate::renderBlock('logo') ?>
      </div>

      <?php if ($doc->countModules('mainmenu', true)) : ?>
        <?php echo PixelMenuElement::render(); ?>
      <?php endif; ?>

      <div class="px-header-r">
        <?php if($doc->countModules('header-r')) : ?>
          <jdoc:include type="modules" name="header-r" style="raw" />
        <?php endif ?>

        <?php echo PixelMenuElement::renderDropdownButton() ?>
        <!-- Offcanvas -->
        <?php
        if ($doc->params->get('offcanvas')) {
          echo PixelOffcanvasElement::render();
        }
        ?>
      </div>
    </div>
  </div>
</header>
<!-- // HEADER -->

<!-- MASTHEAD -->
<?php if ($doc->countModules('masthead') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS): ?>
  <div id="px-masthead" class="px-masthead">
    <jdoc:include type="modules" name="masthead" style="none" />
  </div>
<?php endif; ?>
<!-- // MASTHEAD -->