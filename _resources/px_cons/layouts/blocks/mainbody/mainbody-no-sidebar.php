<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

// This is the code which will be placed in the mainbody section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();

?>
<div id="px-mainbody-wrap" class="px-mainbody-wrap">
    <?php if($doc->countModules('mainbody_top') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS && !PIXEL_LAYOUT_EDIT) : ?>
      <section id="px-mainbody-top" class="px-mainbody-top">
        <jdoc:include type="modules" name="mainbody_top" style="px_subheading_style" />
      </section>
    <?php endif; ?>

    <?php if($doc->countModules('mainbody') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS && !PIXEL_LAYOUT_EDIT) : ?>
      <div id="px-mainbody" class="px-mainbody px-module">
        <jdoc:include type="modules" name="mainbody" style="px_subheading_style" />
      </div>
    <?php else : ?>
      <div id="px-mainbody" class="px-mainbody px-component">
        <div class="container">
          <jdoc:include type="message" />
          <jdoc:include type="component" />
        </div>
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('mainbody_bottom') && !PIXEL_COM_CONFIG && !PIXEL_COM_USERS && !PIXEL_LAYOUT_EDIT) : ?>
      <section id="px-mainbody-bottom" class="px-mainbody-bottom">
        <jdoc:include type="modules" name="mainbody_bottom" style="px_subheading_style" />
      </section>
    <?php endif; ?>
</div>