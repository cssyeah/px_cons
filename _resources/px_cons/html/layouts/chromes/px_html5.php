<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.cassiopeia
 *
 * @copyright   (C) 2020 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;

$module  = $displayData['module'];
$params  = $displayData['params'];
$attribs = $displayData['attribs'];

if ($module->content === null || $module->content === '')
{
	return;
}

$moduleTag              = $params->get('module_tag', 'div');
$moduleAttribs          = [];
$moduleAttribs['class'] = ' box px-module ' . htmlspecialchars($params->get('moduleclass_sfx',''), ENT_QUOTES, 'UTF-8');
$headerTag              = htmlspecialchars($params->get('header_tag', 'h3'), ENT_QUOTES, 'UTF-8');
$headerClass            = htmlspecialchars($params->get('header_class', ''), ENT_QUOTES, 'UTF-8');
$headerAttribs          = [];
$headerAttribs['class'] = $headerClass;
	
global $gkModulesCounter;
	
	/*
		Fix for a very strange problem when mod_custom only on the sidebar module
		position returns double title. Seems to be an issue with Joomla! core.
	 */
	if(stripos($module->content, 'box-wrap') !== FALSE) {
		echo $module->content;
		return true;
	}

	if (!empty ($module->content)) {	
		$modnum_class = '';
		
		if(isset($attribs['name']) && isset($gkModulesCounter[$attribs['name']])) {
			$gkModulesCounter[$attribs['name']]++;
		} elseif(isset($attribs['name'])) {
			$gkModulesCounter[$attribs['name']] = 1;
		}

		$clear_mode = false;
		
		if(stripos($params->get('moduleclass_sfx',''), 'clear') !== FALSE) {
			$clear_mode = true;
		}
		
		echo '<div class="px-module' . $params->get('moduleclass_sfx','') . '">';
		
		if($clear_mode == false) echo '<div class="px-module-inner"' . (($params->get('backgroundimage')) ? ' style="background-image:url('. $params->get('backgroundimage') . ');" ' : '') . '>';
		
		if($module->showtitle) {	
			$title = str_replace('[br]', '<br />', $module->title);

			$title = preg_replace('/__(.*?)__/i', '</span><small>${1}</small>', $title);
			
			if(stripos($title, '</span>') === FALSE) {
				$title .= '</span>';
			}

			echo '<'.$headerTag.' class="mod-title"><span>'. $title .'</'.$headerTag.'>';
		}
	
		if($clear_mode == false) echo '<div class="mod-ct">';	
		echo $module->content;
		if($clear_mode == false) echo '</div>';
		if($clear_mode == false) echo '</div>';
		
		echo '</div>';
 	}