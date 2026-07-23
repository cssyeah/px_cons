<?php
/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */
?>

<?php if($doc->countModules('breadcrumb')): ?>
<div id="px-breadcrumb" class="px-breadcrumb">
  <div class="container">
    <jdoc:include type="modules" name="breadcrumb" style="none" />
  </div>
</div>
<?php endif; ?>