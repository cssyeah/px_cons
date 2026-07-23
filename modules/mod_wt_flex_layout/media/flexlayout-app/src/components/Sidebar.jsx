export default ({ categories, templates, filterTemplates, filterCategories, updateFilter }) => {
  const data = Joomla.getOptions('flexlayout-data');

  function handleFilterTemplatesChange(event) {
    const $target = event.target;
    const templateState = {};

    templateState[$target.value] = $target.checked;

    updateFilter({
      templateState,
    });
  }

  function handleFilterCategoriesChange(event) {
    const $target = event.target;
    const categoryState = {};

    categoryState[$target.value] = $target.checked;

    updateFilter({
      categoryState,
    });
  }

  function countItemByTemplate(template) {
    return data.styles.filter(style => {
      let matched = false;

      if (filterCategories.length) {
        const common = style.categories.filter(value => filterCategories.includes(value));

        matched = !!common.length;
      } else {
        matched = true;
      }

      return style.template === template && matched;
    }).length;
  }

  function countItemByCategory(category) {
    return data.styles.filter(style => {
      let matched = false;

      if (filterTemplates.length) {
        matched = !!filterTemplates.includes(style.template);
      } else {
        matched = true;
      }

      return !!style.categories.includes(category) && matched;
    }).length;
  }

  return (
    <div className="fl-sidebar-inner">
      <div className="fl-filter fl-filter-template">
        <h3>Templates</h3>
        {Object.keys(templates).map(key => {
          const count = countItemByTemplate(key);

          return (
            <div className="form-check" key={key}>
              <input
                className="form-check-input"
                type="checkbox"
                value={key}
                id={`checkbox-${key}`}
                checked={filterTemplates.includes(key)}
                onChange={handleFilterTemplatesChange}
                disabled={!count}
              />
              <label className="form-check-label" htmlFor={`checkbox-${key}`}>
                <span className="layout-name">{templates[key]}</span>
                <span className="layout-number">{count}</span>
              </label>
            </div>
          );
        })}
      </div>

      <div className="fl-filter fl-filter-tags">
        <h3>Categories</h3>
        {Object.keys(categories).map(key => {
          const count = countItemByCategory(key);

          return (
            <div className="form-check" key={key}>
              <input
                className="form-check-input"
                type="checkbox"
                value={key}
                id={`checkbox-${key}`}
                checked={filterCategories.includes(key)}
                onChange={handleFilterCategoriesChange}
                disabled={!count}
              />
              <label className="form-check-label" htmlFor={`checkbox-${key}`}>
                <span className="layout-name">{categories[key]}</span>
                <span className="layout-number">{count}</span>
              </label>
            </div>
          );
        })}
      </div>
    </div>
  );
};
