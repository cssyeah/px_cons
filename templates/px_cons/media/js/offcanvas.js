jQuery(document).ready(function($){
	// Dropdown Menu
  jQuery('#px-offcanvas li.deeper > a, #px-offcanvas li.deeper > span, .px-sidebar li.deeper > span, .px-sidebar li.deeper > span').on('click', function(e) {

    e.preventDefault();
    e.stopPropagation();

    if (jQuery(this).parent().hasClass('open')) {
      if (jQuery(this).attr('href')) {
        if (jQuery(this).attr('target') == '_blank') {
          window.open(jQuery(this).attr('href'), '_blank');
        }
        else {
          window.location.href = jQuery(this).attr('href');
        }

        clearTimeout(debounceClick);
          debounceClick = setTimeout(function () {
              gkOpenAsideMenu();
          }, 1000);

      } else {
        jQuery(this).parent().toggleClass('open');
        jQuery(this).parent().children('.mod-menu__sub').slideToggle(350);
      }

    } else {
      jQuery(this).parent().parent().find('li.deeper').each(function() {
        if (jQuery(this).hasClass('open')) {
          jQuery(this).removeClass('open');
          jQuery(this).children('.mod-menu__sub').slideToggle(350);
        }
      });

      jQuery(this).parent().toggleClass('open');
      jQuery(this).parent().children('.mod-menu__sub').slideToggle(350);
    }
  });
});