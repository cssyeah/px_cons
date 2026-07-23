import { useState } from 'react';

import Sidebar from './Sidebar';
import Content from './Content';

export default ({ setIsOpen }) => {
  const data = Joomla.getOptions('flexlayout-data');
  const categories = data.categories;
  const templates = data.templates;

  const [styles, setStyles] = useState(getFilteredStyles([], []) || []);
  const [filterTemplates, setFilterTemplates] = useState([]);
  const [filterCategories, setFilterCategories] = useState([]);

  function updateFilter(params) {
    params = params || {};

    const _filterTemplates = updateFilterParams(params.templateState || {}, filterTemplates, setFilterTemplates);
    const _filterCategories = updateFilterParams(params.categoryState || {}, filterCategories, setFilterCategories);

    setStyles(getFilteredStyles(_filterTemplates, _filterCategories));
  }

  function getFilteredStyles(filterTemplates, filterCategories) {
    const styles = data.styles
      .filter(style => {
        let show = true;

        if (filterTemplates.length) {
          show = filterTemplates.includes(style.template);
        }

        return show;
      })
      .filter(style => {
        let show = true;

        if (filterCategories.length) {
          const common = style.categories.filter(value => filterCategories.includes(value));

          show = !!common.length;
        }

        return show;
      });

    return styles;
  }

  function updateFilterParams(state, oldParams, callbackSetState) {
    const _clone = [...oldParams];

    for (const key in state) {
      const value = state[key];

      if (value) {
        if (!_clone.includes(key)) {
          _clone.push(key);
        }
      } else {
        if (_clone.includes(key)) {
          const idx = _clone.findIndex(item => item === key);

          _clone.splice(idx, 1);
        }
      }
    }

    callbackSetState(_clone);

    return _clone;
  }

  function clearFilter() {
    setFilterCategories([]);
    setFilterTemplates([]);
    setStyles(data.styles || []);
  }

  return (
    <>
      <div className="fl-preview-wrap">
        <div className="fl-preview-sidebar">
          <Sidebar
            updateFilter={updateFilter}
            filterTemplates={filterTemplates}
            filterCategories={filterCategories}
            categories={categories}
            templates={templates}
          />
          <button type="button" onClick={clearFilter} className="btn btn-secondary btn-clear">
            Clear
          </button>
        </div>
        <Content styles={styles} />
        <span onClick={() => setIsOpen(false)} className="btn-close"><i className="fa fa-times"></i></span>
      </div>
    </>
  );
};
