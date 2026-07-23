<?php

namespace Joomla\Plugin\System\Pixel\Helper;

use Joomla\CMS\Factory;
use Joomla\CMS\Table\Table;
use Joomla\Database\DatabaseInterface;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class PixelMenuHelper
{
    public static function getMenu($moduleid)
    {
        $module = self::getModule($moduleid);

        if (!$module) {
            return false;
        }

        $baseMenuId = (int) $module->params->get('base');
        $startLevel = $module->params->get('startLevel');
        $endLevel = $module->params->get('endLevel');
        $menu = self::getMenuItems($module->params->get('menutype'), $baseMenuId, $startLevel, $endLevel);

        return $menu;
    }

    public static function getMenuItems($menutype, $baseId, $startLevel, $endLevel)
    {
        $db = Factory::getContainer()->get(DatabaseInterface::class);
        $query = $db->getQuery(true);
        $rootMenuId = 1;
        $baseId = $baseId ?: $rootMenuId;

        // Prepare the query.
        $query->select($db->quoteName([
            'm.id',
            'm.title',
            'm.parent_id',
            'm.level',
            'm.link',
        ]))
            ->from($db->quoteName('#__menu', 'm'))
            ->where(
                [
                    $db->quoteName('m.menutype') . ' = :menutype',
                    $db->quoteName('m.client_id') . ' = 0',
                    $db->quoteName('m.id') . ' > 1',
                    $db->quoteName('m.published') . ' = 1',
                ]
            )
            ->bind(':menutype', $menutype);

        // Filter on the enabled states.
        $query->select($db->quoteName('e.element'))
            ->join('LEFT', $db->quoteName('#__extensions', 'e'), $db->quoteName('m.component_id') . ' = ' . $db->quoteName('e.extension_id'))
            ->extendWhere(
                'AND',
                [
                    $db->quoteName('e.enabled') . ' = 1',
                    $db->quoteName('e.enabled') . ' IS NULL',
                ],
                'OR'
            );

        $query->where($db->qn('m.level') . ' >= ' . $db->q($startLevel));

        if ($endLevel) {
            $query->where($db->qn('m.level') . ' <= ' . $db->q($endLevel));
        }

        if ($baseId > 1) {
            $menuTable = Table::getInstance('Menu');
            $menuTable->load($baseId);

            if ($menuTable->id) {
                $query->where([
                    $db->qn('m.lft') . '>' . $db->q($menuTable->lft),
                    $db->qn('m.rgt') . '<' . $db->q($menuTable->rgt),
                ]);
            }
        }

        // Order by lft.
        $query->order($db->quoteName('m.lft'));

        $menuItems = $db->setQuery($query)->loadObjectList();

        return [
            'base' => $baseId,
            'items' => $menuItems,
        ];
    }

    protected static function getModule($id)
    {
        $db = Factory::getDbo();
        $query = "SELECT * FROM `#__modules` WHERE id = " . $db->q($id);
        $row = $db->setQuery($query)->loadObject();

        if (!$row) {
            return false;
        }

        $row->params = new Registry($row->params);

        return $row;
    }
}
