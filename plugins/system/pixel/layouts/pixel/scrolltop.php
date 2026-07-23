<?php

defined('_JEXEC') or die('Restricted access');

?>
<div id="back-to-top" style="opacity: 0;">
    <button class="btn btn-primary btn-to-top"><i class="fas fa-arrow-up"></i></button>
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const $btn = document.querySelector('.btn-to-top');

        $btn.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                left: 0,
            })
        })

        let timer = 0;
        const $html = document.querySelector('html');
        const $top = document.querySelector('#back-to-top');

        document.addEventListener('scroll', () => {
            clearTimeout(timer);

            timer = setTimeout(() => {
                const pageY = $html.scrollTop;

                if (pageY > 700) {
                    $top.classList.add('px-to-top-show');
                    $top.style.opacity = 1;
                } else {
                    $top.classList.remove('px-to-top-show');
                    $top.style.opacity = 0;
                }
            }, 100);
        })
    })
</script>