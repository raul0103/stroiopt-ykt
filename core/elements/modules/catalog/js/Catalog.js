/**
 * Подгрузка по AJAX каталога
 * Открытие модалки каталога
 */
import Menu from "./Menu.js";

export default class Catalog {
  constructor() {
    this.selectors = {
      open: "[data-catalog-open]",
      close: "[data-catalog-close]",
      catalog_container: "[data-catalog-container]",
    };
    this.events = this.events();
    this.events_init = {};
    this.catalog_api_ready = false;
  }
  init() {
    this.events.open();
    window.catalog = this;
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

            this.catalog = catalog;

            let menu = new Menu(catalog);
            menu.init();

            if (catalog.classList.contains("opened")) {
              catalog.classList.remove("opened");
            } else {
              catalog.classList.add("opened");
            }

            // Записали для каких каталогов уже была инициализация события
            if (!this.events_init[catalog_id]) {
              this.events_init[catalog_id] = true;
              this.events.close(catalog);
            }
          });
        });
      },
      close: (catalog) => {
        let catalog_close_btns = catalog.querySelectorAll(this.selectors.close);
        catalog_close_btns.forEach((catalog_close_btn) => {
          catalog_close_btn.addEventListener("click", () => {
            catalog.classList.remove("opened");
          });
        });
      },
    };
  }
  api = {
    getCatalog: async (cache_name, device) => {
      if (this.catalog_api_ready) return;

      try {
        const response = await fetch("/", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            action: "get-catalog",
            device,
            ajax_connect: true,
            cache_name,
          }),
        });
        if (!response.ok) {
          throw new Error(`Response status: ${response.status}`);
        }

        if (device == "desktop") {
          let catalog_menu_desktop = document.getElementById(
            "catalog-menu-desktop"
          );
          catalog_menu_desktop.innerHTML = await response.text();
        } else if (device == "mobile") {
          let data = await response.json();
          let catalog_menu_items =
            document.getElementById("catalog-menu-items");
          catalog_menu_items.innerHTML = data["menu-items"];

          let catalog_menu_modals = document.getElementById(
            "catalog-menu-modals"
          );
          catalog_menu_modals.innerHTML = data["menu-modals"];

          window.mobile_menu.events.openModal();
          window.mobile_menu.events.backModal();
        }

        this.catalog_api_ready = true;

        let menu = new Menu(this.catalog);
        menu.init();
      } catch (error) {
        console.error(error.message);
      }
    },
  };
}
