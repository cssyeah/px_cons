<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\CMS\Helper\MediaHelper;
use Joomla\CMS\Language\Text;

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
?>

<!DOCTYPE html>
<html class="<?php echo $option . ' view-' . $view . ' layout-' . $layout . ' taks-' . $task . ' ' . $pageclass;?>" lang="<?php echo $doc->language; ?>" dir="<?php echo $doc->direction; ?>">

<head>
    <?php echo PixelTemplate::renderBlock('head') ?>
    <link href="<?php echo $doc->baseurl; ?>/templates/<?php echo $doc->template; ?>/media/css/template.css" rel="stylesheet" />
</head>

<body id="px-body">
    <div id="px-bg">
        <div class="container">
          <div class="error-page-wrap card">
            <div class="card-body">
              <div class="error-info">
                  <h1 class="error-code"><?php echo $doc->error->getCode(); ?></h1>
                  <div class="error-msg">
                      <h2><?php echo htmlspecialchars($doc->error->getMessage(), ENT_QUOTES, 'UTF-8');?></h2>
                      <?php if (Factory::getConfig()->get('devmode')): ?>
                      <p class="alert alert-error"><code><?php echo $doc->error->getFile() ?> (<?php echo $doc->error->getLine() ?>)</code></p>
                      <?php endif ?>
                  </div>
              </div>

              <div class="error-other-info">
                <p><strong><?php echo Text::_('JERROR_LAYOUT_ERROR_HAS_OCCURRED_WHILE_PROCESSING_YOUR_REQUEST'); ?></strong></p>
                <p><?php echo Text::_('JERROR_LAYOUT_NOT_ABLE_TO_VISIT'); ?></p>
                <ul>
                  <li><?php echo Text::_('JERROR_LAYOUT_AN_OUT_OF_DATE_BOOKMARK_FAVOURITE'); ?></li>
                  <li><?php echo Text::_('JERROR_LAYOUT_MIS_TYPED_ADDRESS'); ?></li>
                  <li><?php echo Text::_('JERROR_LAYOUT_SEARCH_ENGINE_OUT_OF_DATE_LISTING'); ?></li>
                  <li><?php echo Text::_('JERROR_LAYOUT_YOU_HAVE_NO_ACCESS_TO_THIS_PAGE'); ?></li>
                </ul>

                <div class="page-redirect">
                  <a class="btn btn-primary" href="<?php echo $doc->baseurl; ?>/index.php" title="<?php echo Text::_('JERROR_LAYOUT_HOME_PAGE'); ?>"><?php echo Text::_('JERROR_LAYOUT_HOME_PAGE'); ?></a>
                </div>
              </div>
            </div>
          </div>
          <?php echo $doc->getBuffer('modules', 'debug', array('style' => 'none')); ?>
        </div>
    </div>
</body>
<html>