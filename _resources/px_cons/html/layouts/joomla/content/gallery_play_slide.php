<?php
/**
 * $JA#COPYRIGHT$
 */

defined('_JEXEC') or die;

JHtml::_('jquery.framework');

$item  			= $displayData;
$params  		= json_decode($item->attribs, true);
$desc 			= '';

if (!isset($params['ctm_gallery'])) return;
$gallery = $params['ctm_gallery'];

if(is_array($gallery) && isset($gallery['src'])) {
	$thumbnail = $gallery['src'][0];
	$desc = $gallery['caption'][0];
}

if(!$thumbnail) {
  $images = json_decode($item->images);
  $thumbnail = @$images->image_intro;
}

$galleryId = 'ja-gallery-detail-'.$item->id;
?>

<?php if(is_array($gallery) && count($gallery['src']) > 1):
  ?>

  <div id="<?php echo $galleryId; ?>">

    <!-- Wrapper for slides -->
    <div class="owl-carousel owl-theme">
      <?php $cnt = -1; $i= 0; ?>
      <?php foreach($gallery['src'] as $index => $src): $cnt++; ?>
      <div class="item <?php if($index == 0) echo 'active'; ?>">
        <div class="item-slide" itemprop="image" data-dot="<img src='<?php echo htmlspecialchars(JUri::root(true).'/'.$src); ?>'/>">
          <img src="<?php echo htmlspecialchars(JUri::root(true).'/'.$src); ?>" alt="<?php echo htmlspecialchars($gallery['caption'][$index]); ?>" itemprop="thumbnailUrl"/>
        </div>
        <?php if ($gallery['caption'][$index] !='') : ?>
        <div class="carousel-caption">
          <?php echo $gallery['caption'][$index]; ?>
        </div>
        <?php endif; ?>
      </div>
      <?php $i++; endforeach; ?>
    </div>
  </div>

<?php elseif (isset($thumbnail) && !empty($thumbnail)) : ?>
  <div class="item-image">
    <img
      <?php if ($desc):
        echo 'class="caption"' . ' title="' . htmlspecialchars($desc) . '"';
      endif; ?>
      src="<?php echo htmlspecialchars($thumbnail); ?>" alt="<?php echo htmlspecialchars($item->title); ?>" itemprop="thumbnailUrl"/>
  </div>
<?php endif; ?>

<script>
(function($){
  jQuery(document).ready(function($) {
    $("#<?php echo $galleryId; ?> .owl-carousel").owlCarousel({
      items: 1,
      margin: 0,
      dots: true,
      loop: true
    });
  });
})(jQuery);
</script>