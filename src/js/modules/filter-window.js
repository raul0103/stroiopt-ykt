/**
 * Управление окном Фильтров
 * data-filter-window - Окно фильтров
 * data-filter-window-open - Аттрибут для кнопки открытия
 * data-filter-window-close - Устал писать
 */
export default class FilterWindow {
  elements = {
    filter_window: null,
    body: null,
  };
  init_events = {
    close: false,
  };

  init() {
    this.events.open();
  }

  events = {
    open: () => {
      let btns = document.querySelectorAll("[data-filter-window-open]");
      btns.forEach((btn) => {
        btn.addEventListener("click", () => {
          let filter_window = this.elements.filter_window;
          if (!filter_window) {
            filter_window = document.querySelector("[data-filter-window]");
            this.elements.filter_window = filter_window;
          }

          if (!filter_window) return;

          filter_window.classList.add("opened");

          let body = this.elements.body;
          if (!body) {
            body = document.querySelector("body");
            this.elements.body = body;
          }

          body.classList.add("block-scroll");

          if (!this.init_events.close) {
            this.init_events.close = true;
            this.events.close();
          }
        });
      });
    },
    close: () => {
      let btns = document.querySelectorAll("[data-filter-window-close]");
      btns.forEach((btn) => {
        btn.addEventListener("click", () => {
          this.elements.filter_window.classList.remove("opened");
          this.elements.body.classList.remove("block-scroll");
        });
      });
    },
  };
}
