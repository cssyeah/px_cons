export default ({ styles }) => {
  const data = Joomla.getOptions('flexlayout-data');
  const value = data.value;

  function changeStyle(style) {
    document.querySelector('body').classList.add('flexlayout-loading-body');

    const url = new URL(location.href);

    url.searchParams.set('flexstyle', style.value);

    location.href = url.toString();
  }

  return (
    <div className="fl-thumbs-wrap">
      <div className="fl-thumbs-inner">
        {styles.map(style => {
          const isActive = style.value === value;

          return (
            <div
              key={style.value}
              className={isActive ? 'thumb-item thumb-active' : 'thumb-item'}
              onClick={() => changeStyle(style)}
            >
              <div className="thumb-item-inner">
                <div className="thumbnail">
                  <img
                    src={style.preview.url}
                    width={style.preview.width}
                    height={style.preview.height}
                  />
                </div>
                <h4>{style.title}</h4>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};
