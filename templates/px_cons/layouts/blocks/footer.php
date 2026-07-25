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
$show_back_to_top = $doc->params->get('show_back_to_top', '');
?>

<?php if ($doc->countModules('footnav-1') || $doc->countModules('footnav-2') || $doc->countModules('footnav-3') || $doc->countModules('footnav-4') || $doc->countModules('footnav-5') || $doc->countModules('footnav-6')) : ?>
  <div id="px-footer-nav">
    <div class="container">
      <div class="row d-flex">
        <?php if ($doc->countModules('footnav-1')) : ?>
          <div class="col-xs-6 col-sm-6 col-md-6 col-lg footnav-mod">
            <jdoc:include type="modules" name="footnav-1" style="px_style" />
          </div>
        <?php endif; ?>

        <?php if ($doc->countModules('footnav-2')) : ?>
          <div class="col-6 col-sm-6 col-md-6 col-lg footnav-mod">
            <jdoc:include type="modules" name="footnav-2" style="px_style" />
          </div>
        <?php endif; ?>

        <?php if ($doc->countModules('footnav-3')) : ?>
          <div class="col-6 col-sm-6 col-md-6 col-lg footnav-mod">
            <jdoc:include type="modules" name="footnav-3" style="px_style" />
          </div>
        <?php endif; ?>

        <?php if ($doc->countModules('footnav-4')) : ?>
          <div class="col-6 col-sm-6 col-md-6 col-lg footnav-mod">
            <jdoc:include type="modules" name="footnav-4" style="px_style" />
          </div>
        <?php endif; ?>

        <?php if ($doc->countModules('footnav-5')) : ?>
          <div class="col-6 col-sm-6 col-md-6 col-lg footnav-mod">
            <jdoc:include type="modules" name="footnav-5" style="px_style" />
          </div>
        <?php endif; ?>

        <?php if ($doc->countModules('footnav-6')) : ?>
          <div class="col-6 col-sm-6 col-md-6 col-lg footnav-mod">
            <jdoc:include type="modules" name="footnav-6" style="px_style" />
          </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
<?php endif; ?>

<footer id="px-footer" class="px-footer">
  <div class="container">
    <div class="px-footer-inner">
      <?php if ($doc->countModules('footer')) : ?>
        <div class="px-footer-l">
          <jdoc:include type="modules" name="footer" style="none" />
        </div>
      <?php endif; ?>

      <?php if ($doc->countModules('footer-r')) : ?>
        <div class="px-footer-r">
          <jdoc:include type="modules" name="footer-r" style="none" />
        </div>
      <?php endif ?>
    </div>

    <?php if ($show_back_to_top): echo PixelScrollTopElement::render();
    endif; ?>
  </div>
</footer>