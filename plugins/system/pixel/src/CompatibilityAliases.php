<?php
/** Transitional aliases for templates migrated from the original framework. */
namespace Joomla\Plugin\System\Pixel;

defined('_JEXEC') or die;

if (!class_exists(__NAMESPACE__ . '\\GKTemplate', false) && class_exists(PixelTemplate::class)) {
    class_alias(PixelTemplate::class, __NAMESPACE__ . '\\GKTemplate');
}
if (!class_exists(__NAMESPACE__ . '\\GKConfig', false) && class_exists(PixelConfig::class)) {
    class_alias(PixelConfig::class, __NAMESPACE__ . '\\GKConfig');
}
