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
$menu_fixed = $params->get('menu_fixed','0');
$show_dark_light_mode = $params->get('show_dark_light_mode','0');
?>

<?php if($doc->countModules('topbar') || $show_dark_light_mode): ?>
<div id="px-topbar" class="px-topbar bg-warning text-white">
  <div class="container">
    <div class="row">
      <?php if($doc->countModules('topbar')): ?>
      <div class="col-12 col-lg-6 px-topbar-mod d-none d-lg-block">
        <jdoc:include type="modules" name="topbar" style="none" />
      </div>
      <?php endif; ?>
      
      <?php if($show_dark_light_mode): ?>
      <div class="col-12 col-lg-6 mode-darklight">
        <?php echo PixelPresetElement::renderPresetDropdown(['light', 'dark']); ?>
        <?php // echo PixelPresetElement::renderPresetToggle('light', 'dark'); ?>
      </div>
      <?php endif; ?>
    </div>
  </div>
</div>
<?php endif; ?>

<header id="px-header" class="px-header <?php echo $menu_fixed ? 'px-fixed-top' : ''; ?>">
  <div id="px-header-nav" class="px-header-nav container">
    <div class="px-header-nav collapse-static">
      <div class="px-navbar mx-auto">
        <nav class="navbar d-flex align-items-center justify-content-between">
          <div class="px-logo-wrap navbar-brand">
            <?php echo PixelTemplate::renderBlock('logo') ?>
          </div>

          <div class="px-menu-toggle-wrap d-flex align-items-center gap-1">
            <?php echo PixelMenuElement::renderDropdownButton() ?>
            <!-- Offcanvas -->
            <?php 
            if ($doc->params->get('offcanvas')) {
              echo PixelOffcanvasElement::render(); 
            }
            ?>
          </div>

          <?php if ($doc->countModules('mainmenu', true)) : ?>
            <?php echo PixelMenuElement::render(); ?>
          <?php endif; ?>
        </nav>
      </div>
    </div>
  </div><!-- #px-header-nav -->
</header><!-- #px-header -->

<?php if($doc->countModules('header') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS): ?>
<div id="px-header-mod" class="px-header-mod">
    <jdoc:include type="modules" name="header" style="none" />
</div>
<?php endif; ?>

<?php if($doc->countModules('masthead') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS): ?>
<div id="px-masthead" class="px-masthead">
    <jdoc:include type="modules" name="masthead" style="none" />
</div>
<?php endif; ?>
