/**
 * Работа с меню каталога
 */

export default class Menu {
  /**
   * @param {DOMElement} catalog
   */
  constructor(catalog) {
    this.catalog = catalog;
    this.selectors = {
      open: "[data-subcategories-open]",
    };
  }

  init() {
    let subcat_open_btns = this.catalog.querySelectorAll(this.selectors.open);
    let active_subcategory = null;

    subcat_open_btns.forEach((subcat_open_btn) => {
      subcat_open_btn.addEventListener("mouseover", () => {
        if (active_subcategory) active_subcategory.classList.remove("opened");

        let subcat_id = subcat_open_btn.dataset.subcategoriesOpen;
        if (!subcat_id) return;

        let subcategory = this.catalog.querySelector(`#${subcat_id}`);
        if (!subcategory) return;

        subcategory.classList.add("opened");

        active_subcategory = subcategory;
      });
    });
  }
}
