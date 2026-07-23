<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */


// This is the code which will be placed in the head section

// No direct access.
defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Pixel\PixelConfig;

$doc = Factory::getDocument();
$params = $doc->params;

$doc->setMetaData('viewport', 'width=device-width, initial-scale=1');

HTMLHelper::stylesheet('plugins/system/pixel/media/css/joomla-fontawesome.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/js/owl-carousel/owl.carousel.min.css');
HTMLHelper::stylesheet('templates/'.$doc->template.'/media/js/owl-carousel/owl.theme.default.min.css');

HTMLHelper::_('jquery.framework');
HTMLHelper::_('bootstrap.offcanvas');
HTMLHelper::_('bootstrap.collapse');
HTMLHelper::script('templates/'.$doc->template.'/media/js/owl-carousel/owl.carousel.min.js');
HTMLHelper::script('templates/'.$doc->template.'/media/js/offcanvas.js');
?>
<!-- after open head -->
<?php echo PixelConfig::get('custom_code_after_head') ?>

<jdoc:include type="metas" />
<jdoc:include type="styles" />
<jdoc:include type="scripts" />

<!-- before close head -->
<?php echo PixelConfig::get('custom_code_before_head') ?>