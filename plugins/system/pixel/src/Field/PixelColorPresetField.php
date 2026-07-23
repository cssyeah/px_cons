<?php

namespace Joomla\Plugin\System\Pixel\Field;

use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class PixelColorPresetField extends FormField
{
    protected $type = 'PixelColorPreset';

    public function renderfield($options = [])
    {
        $base = $this->getBase();

        return PixelTemplate::renderLayout('pixel/fields/pixelcolorpreset', [
            'name' => $this->name,
            'value' => $this->formatValue($this->value),
            'id' => $this->id,
            'fieldname' => $this->fieldname,
            'basePresets' => $base['presets'],
            'baseGroups' => $base['groups'],
        ]);
    }

    protected function formatValue($value)
    {
        $data = new Registry($value);

        if (!$data->get('default')) {
            $data->set('default', $this->getDefaultPreset());
        }

        $base = $this->getBase();
        if (!$data->get('presets')) {
            $data->set('presets', $base['presets']);
        }

        return $data->toArray();
    }

    protected function getBase()
    {
        $groups = [];
        $presets = [];

        foreach ($this->element->preset as $item) {
            $name = (string) $item->attributes()->name;

            $preset = [
                'name' => $name,
            ];
            $variables = [];

            foreach ($item->variable as $var) {
                $varName = (string) $var->attributes()->name;
                $value = (string) $var[0];
                $variables[$varName] = $value;

                $group = (string) $var->attributes()->group;
                if (!isset($groups[$group])) {
                    $groups[$group] = [];
                }

                if (!in_array($varName, $groups[$group])) {
                    $groups[$group][$varName] = '#000000';
                }
            }

            $preset['variables'] = $variables;
            $presets[] = $preset;
        }

        return [
            'presets' => $presets,
            'groups' => $groups,
        ];
    }

    protected function getDefaultPreset()
    {
        return (string) $this->element->attributes()->default_preset;
    }
}
