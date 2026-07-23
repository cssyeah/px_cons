<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */


// This is the code which will be placed in the head section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
?>
<div id="px-mainbody-wrap" class="px-mainbody-wrap">
  <div class="container">
    <div class="row row-flex">
      <div id="px-main-content" class="px-main-content col-xs-12 col-md-6 col-lg-6">
        <?php if($doc->countModules('mainbody_top') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS) : ?>
          <section id="px-mainbody-top" class="px-mainbody-top">
            <jdoc:include type="modules" name="mainbody_top" style="px_subheading_style" />
          </section>
        <?php endif; ?>

        <?php if($doc->countModules('mainbody')  && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS) : ?>
          <div id="px-mainbody" class="px-mainbody px-module">
            <jdoc:include type="message" />
            <jdoc:include type="modules" name="mainbody" style="px_subheading_style" />
          </div>
        <?php else : ?>
          <div id="px-mainbody" class="px-mainbody px-component">
            <jdoc:include type="message" />
            <jdoc:include type="component" />
          </div>
        <?php endif; ?>

        <?php if($doc->countModules('mainbody_bottom')  && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS) : ?>
          <section id="px-mainbody-bottom" class="px-mainbody-bottom">
            <jdoc:include type="modules" name="mainbody_bottom" style="px_subheading_style" />
          </section>
        <?php endif; ?>
      </div>
      <div id="px-sidebar-left" class="px-sidebar px-sidebar-left col-xs-12 col-md-3 col-lg-3 order-md-first">
        <jdoc:include type="modules" name="sidebar-l" style="px_style" />
      </div>
      <div id="px-sidebar-right" class="px-sidebar px-sidebar-right col-xs-12 col-md-3 col-lg-3">
        <jdoc:include type="modules" name="sidebar-r" style="px_style" />
      </div>
    </div>
  </div>
</div>