<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */


// This is the code which will be placed in the footer section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Plugin\System\Pixel\Element\PixelScrollTopElement;

// No direct access.
defined('_JEXEC') or die('Restricted access');
$doc = Factory::getDocument();
$show_back_to_top = $doc->params->get('show_back_to_top','');
?>

<?php if($doc->countModules('footer_nav_1') || $doc->countModules('footer_nav_2') || $doc->countModules('footer_nav_3') || $doc->countModules('footer_nav_4') || $doc->countModules('footer_nav_5') || $doc->countModules('footer_nav_6')) : ?>
<div id="px-footer-nav">
  <div class="container">
    <div class="row d-flex">
    <?php if($doc->countModules('footer_nav_1')) : ?>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg footer_nav_mod">
        <jdoc:include type="modules" name="footer_nav_1" style="px_style"  />
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('footer_nav_2')) : ?>
      <div class="col-6 col-sm-6 col-md-6 col-lg footer_nav_mod">
        <jdoc:include type="modules" name="footer_nav_2" style="px_style"  />
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('footer_nav_3')) : ?>
      <div class="col-6 col-sm-6 col-md-6 col-lg footer_nav_mod">
        <jdoc:include type="modules" name="footer_nav_3" style="px_style"  />
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('footer_nav_4')) : ?>
      <div class="col-6 col-sm-6 col-md-6 col-lg footer_nav_mod">
        <jdoc:include type="modules" name="footer_nav_4" style="px_style"  />
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('footer_nav_5')) : ?>
      <div class="col-6 col-sm-6 col-md-6 col-lg footer_nav_mod">
        <jdoc:include type="modules" name="footer_nav_5" style="px_style"  />
      </div>
    <?php endif; ?>

    <?php if($doc->countModules('footer_nav_6')) : ?>
      <div class="col-6 col-sm-6 col-md-6 col-lg footer_nav_mod">
        <jdoc:include type="modules" name="footer_nav_6" style="px_style"  />
      </div>
    <?php endif; ?>
    </div>
  </div>
</div>
<?php endif; ?>

<footer id="px-footer">
  <div class="container">
    <div class="row d-flex">
      <?php if($doc->countModules('footer')) : ?>
      <section id="footer" class="col-sm-12 col-md-12 col-lg-12">
        <jdoc:include type="modules" name="footer" style="none" modnum="footer"  />
      </section>
      <?php endif; ?>
    </div>

    <?php if($doc->countModules('lang')) : ?>
    <div id="px-lang" class="clearfix">
      <jdoc:include type="modules" name="lang" style="none" />
    </div>
    <?php endif; ?>

    <?php if($show_back_to_top): echo PixelScrollTopElement::render(); endif; ?>
  </div>
</footer>