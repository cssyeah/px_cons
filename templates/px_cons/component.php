<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();

$app   = Factory::getApplication();
$input = $app->getInput();

// Detecting Active Variables
$option   = $input->getCmd('option', '');
$view     = $input->getCmd('view', '');
$print 		= $input->getCmd('print','');
$layout   = $input->getCmd('layout', '');
$task     = $input->getCmd('task', '');
$itemid   = $input->getCmd('Itemid', '');
$sitename = htmlspecialchars($app->get('sitename'), ENT_QUOTES, 'UTF-8');
$menu     = $app->getMenu()->getActive();
$pageclass = $menu !== null ? $menu->getParams()->get('pageclass_sfx', '') : '';

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="<?php echo $option; ?>" lang="<?php echo $doc->language; ?>" dir="<?php echo $doc->direction; ?>">
<head>
	<?php echo PixelTemplate::renderBlock('head') ?>
	<link  href="<?php echo $doc->baseurl; ?>/templates/<?php echo $doc->template; ?>/media/css/template.css" rel="stylesheet" />
</head>
<body class="contentpane">
		<jdoc:include type="message" />
		<jdoc:include type="component" />
</body>
</html>
