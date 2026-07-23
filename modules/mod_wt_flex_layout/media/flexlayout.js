document.addEventListener('DOMContentLoaded', () => {
    const $style = document.querySelector('#jform_params_flexstyle');

    $style.addEventListener('change', () => {
        const url = new URL(location.href);

        url.searchParams.set('flexstyle', $style.value);

        location.href = url.toString();
    })
})