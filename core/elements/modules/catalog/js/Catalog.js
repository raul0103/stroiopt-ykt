/**
 * Подгрузка по AJAX каталога
 * Открытие модалки каталога
 */
import Events from "./Events.js";

export default class Catalog {
  constructor() {
    this.selectors = {
      open: "[data-catalog-open]",
      close: "[data-catalog-close]",
      catalog_container: "[data-catalog-container]",
    };
    this.events = this.events();
    this.events_init = [];
  }
  init() {
    this.events.open();
  }
  events() {
    return {
      open: () => {
        let catalog_open_btns = document.querySelectorAll(this.selectors.open);
        catalog_open_btns.forEach((catalog_open_btn) => {
          catalog_open_btn.addEventListener("click", () => {
            let catalog_id = catalog_open_btn.dataset.catalogOpen;
            if (!catalog_id) return;

            let catalog = document.getElementById(catalog_id);
            if (!catalog) return;

            this.getCatalogMenu(catalog);

            if (catalog.classList.contains("opened")) {
              catalog.classList.remove("opened");
            } else {
              catalog.classList.add("opened");
            }

            this.events.close(catalog);
          });
        });
      },
      close: (catalog) => {
        if (this.events_init.indexOf("close") > -1) return;
        this.events_init.push("close");

        let catalog_close_btns = catalog.querySelectorAll(this.selectors.close);
        catalog_close_btns.forEach((catalog_close_btn) => {
          catalog_close_btn.addEventListener("click", () => {
            catalog.classList.remove("opened");
          });
        });
      },
    };
  }
  async getCatalogMenu(catalog) {
    let catalog_coontainer = catalog.querySelector(
      this.selectors.catalog_container
    );
    if (catalog_coontainer.innerHTML) return;

    let catalog_menu = await this.ajax();
    if (!catalog_menu) return;

    catalog_coontainer.innerHTML = catalog_menu;

    let events = new Events(catalog_coontainer);
    events.init();
  }
  async ajax() {
    const response = await fetch("/", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: "action=get-catalog-menu",
    });

    const data = await response.json();
    if (data.status == "success") {
      return data.message;
    } else if (data.status == "error") {
      console.error(data.message);
    }
  }
}
