<?php

namespace Joomla\Plugin\System\Pixel\Field;

use Joomla\CMS\Form\FormField;
use Joomla\CMS\HTML\HTMLHelper;

defined('_JEXEC') or die('Restricted access');

class PixelAdminassetsField extends FormField
{
    protected $type = 'gkadminassets';

    public function renderfield($options = [])
    {
        HTMLHelper::stylesheet('plugins/system/pixel/media/css/admin-style.css');

        return '';
    }
}
