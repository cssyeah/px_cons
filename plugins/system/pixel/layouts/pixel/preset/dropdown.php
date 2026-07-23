<?php

use Joomla\CMS\Language\Text;
use Joomla\Plugin\System\Pixel\Helper\PixelColorPresetHelper;

defined('_JEXEC') or die('Restricted access');

extract($displayData);

$activePreset = PixelColorPresetHelper::getActivePreset();
$languages = [];

foreach ($presets as $preset) {
    $str = 'PIXEL_PRESET_TEXT_' . strtoupper($preset);
    Text::script($str, true);
}
?>
<div class="px-preset-dropdown dropdown" data-active-preset="<?php echo $activePreset ?>">
    <a class="dropdown-toggle" href="javascript:;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <span class="preset-item-icon" data-preset="<?php echo $activePreset ?>"></span>
        <span class="preset-item-text"><?php echo Text::_('PIXEL_PRESET_TEXT_' . strtoupper($activePreset)) ?></span>
    </a>
    <ul class="dropdown-menu">
        <?php foreach ($presets as $preset) : ?>
            <li class="preset-item <?php echo $preset === $activePreset ? 'active-preset' : '' ?>" data-preset="<?php echo $preset ?>">
                <a class="dropdown-item" href="javascript:;">
                    <span class="preset-item-icon" data-preset="<?php echo 'preset-item-icon-' . $preset ?>"></span>
                    <span class="preset-item-text"><?php echo Text::_('PIXEL_PRESET_TEXT_' . strtoupper($preset)) ?></span>
                </a>
            </li>
        <?php endforeach ?>
    </ul>
</div>