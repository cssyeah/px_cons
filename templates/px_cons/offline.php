<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */
 
// No direct access.
defined('_JEXEC') or die;

$app = JFactory::getApplication();

$uri = JURI::getInstance();
jimport('joomla.factory');

// Add JavaScript Frameworks
JHtml::_('bootstrap.framework');

// get necessary template parameters
$templateParams = JFactory::getApplication()->getTemplate(true)->params;
$pageName = JFactory::getDocument()->getTitle();

// get logo configuration
$logo_type = $templateParams->get('logo_type');
$logo_image = $templateParams->get('logo_image');
$template_style = $templateParams->get('template_color');

$override_suffix = '';

if($templateParams->get('custom_override', '-1') != '-1') {
	$override_suffix = '.' . $templateParams->get('custom_override', '-1');
}

$style_suffix = '';

if($templateParams->get('template_style', 'main.less') != 'main.less') {
	$style_suffix = '.' . str_replace('.main.less', '', $templateParams->get('template_style', 'main.less'));
}

if(($logo_image == '') || ($templateParams->get('logo_type') == 'css')) {
     $logo_image = JURI::base() . '../images/logo.png';
} else {
     $logo_image = JURI::base() . $logo_image;
}
$logo_text = $templateParams->get('logo_text', '');
$logo_slogan = $templateParams->get('logo_slogan', '');

$joomlaClass ='';
if (version_compare(JVERSION, '4', '<')) {
	$joomlaClass = 'j3';
} else {
	$joomlaClass = 'j4';
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" class="<?php echo $joomlaClass; ?>">
<head>
	<jdoc:include type="head" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<?php echo JURI::base(); ?>templates/<?php echo $this->template; ?>/css/offline<?php echo $style_suffix . $override_suffix; ?>.css" type="text/css" />
</head>
<body>
	<div id="gkPage">
	    <div id="gkPageWrap">
		     <?php if ($logo_type !== 'none' && !$app->getCfg('offline_image')): ?>
                  <?php if($logo_type =='text') : ?>
                          <a href="./" class="gkLogo text">
                               <span><?php echo $logo_text; ?></span>
                               <small class="gkLogoSlogan"><?php echo $logo_slogan; ?></small>
                          </a>
                 <?php elseif($logo_type =='image') : ?>
                       <a href="./" class="gkLogo">
                           <img src="<?php echo $logo_image; ?>" alt="<?php echo $pageName; ?>" />
                        </a>
                  <?php endif; ?>
             <?php else : ?>
                  <?php if($app->getCfg('offline_image')) : ?>
                      <a href="./" class="gkLogo">
                            <img src="<?php echo $app->getCfg('offline_image'); ?>" alt="<?php echo $app->getCfg('sitename'); ?>" />
                       </a>
                  <?php endif; ?>
             <?php endif; ?>
        </div>
		<div id="gkPageWrap">      
		     <div id="frame">
		            <h2><?php echo $app->getCfg('offline_message'); ?></h2>
		           
		           	<jdoc:include type="message" />
		           
		            <form action="index.php" method="post" name="login" id="form-login">
		                  
		                  <fieldset class="input">
		                        <p id="username">
		                              <label for="username"><?php echo JText::_('JGLOBAL_USERNAME') ?></label>
		                              <input name="username" id="username" type="text" class="inputbox" alt="<?php echo JText::_('JGLOBAL_USERNAME') ?>" placeholder="<?php echo JText::_('JGLOBAL_USERNAME') ?>" size="50" />
		                        </p>
		                        <p id="password">
		                              <label for="passwd"><?php echo JText::_('JGLOBAL_PASSWORD') ?></label>
		                              <input type="password" name="password" class="inputbox" size="50" alt="<?php echo JText::_('JGLOBAL_PASSWORD') ?>" placeholder="<?php echo JText::_('JGLOBAL_PASSWORD') ?>" id="passwd" />
		                        </p>
		                       
		                       
		                        <div class="buttons">
		                              <input type="submit" name="Submit" class="button" value="<?php echo JText::_('JLOGIN') ?>" />
		                        </div>
		                        <input type="hidden" name="option" value="com_users" />
		                        <input type="hidden" name="task" value="user.login" />
		                        <input type="hidden" name="return" value="<?php echo base64_encode(JURI::base()) ?>" />
		                        <?php echo JHtml::_('form.token'); ?>
		                  </fieldset>
		            </form>
		      </div>
	      </div>
	</div>
</body>
</html>
