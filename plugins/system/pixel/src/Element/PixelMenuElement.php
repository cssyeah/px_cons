<?php

namespace Joomla\Plugin\System\Pixel\Element;

use Joomla\CMS\Factory;
use Joomla\CMS\Helper\ModuleHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Module\Menu\Site\Helper\MenuHelper;
use Joomla\Plugin\System\Pixel\PixelConfig;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class PixelMenuElement
{
    public static function render()
    {
        $doc = Factory::getDocument();
        $mode = $doc->params->get('menu_mode', 'normal');
        $megamenu = new Registry(PixelConfig::get('megamenu'));
        $modules = ModuleHelper::getModules('mainmenu');
        $output = '';

        if ($modules) {
            HTMLHelper::script('plugins/system/pixel/media/js/pixelmegamenu.js', [], ['defer' => true]);

            HTMLHelper::stylesheet('plugins/system/pixel/media/css/pixelmegamenu.css');

            $mobileBreakpoint = $doc->params->get('mobile_menu_breakpoint', '768');
            $doc->addScriptOptions('pixel_mobile_menu_breakpoint', $mobileBreakpoint);

            $output .= "
            <style>
            @media (min-width: {$mobileBreakpoint}px) {
                .px-menu-toggle {
                    display: none;
                }

                .px-menu {
                    display: block;
                }
            }
            </style>
            ";
        }

        $module = array_shift($modules);

        $params     = new Registry($module->params);
        $list       = MenuHelper::getList($params);
        $base       = MenuHelper::getBase($params);
        $active     = MenuHelper::getActive($params);
        $default    = MenuHelper::getDefault();
        $active_id  = $active->id;
        $default_id = $default->id;
        $path       = $base->tree;
        $showAll    = $params->get('showAllChildren', 1);
        $class_sfx  = htmlspecialchars($params->get('class_sfx', ''), ENT_COMPAT, 'UTF-8');
        $megaParams = new Registry($megamenu->get('mod_' . $module->id));
        $layoutName = 'default';

        $output .= PixelTemplate::renderLayout('pixel/menu/' . $layoutName, [
            'megaParams' => $megaParams,
            'moduleid' => $module->id,
            'params' => $params,
            'list' => $list,
            'base' => $base,
            'active' => $active,
            'default' => $default,
            'path' => $path,
            'showAll' => $showAll,
            'class_sfx' => $class_sfx,
            'active_id' => $active_id,
            'default_id' => $default_id,
            'mode' => $mode,
        ]);

        return $output;
    }

    public static function renderDropdownButton()
    {
        return PixelTemplate::renderLayout('pixel/menu/dropdown_button');
    }
}
