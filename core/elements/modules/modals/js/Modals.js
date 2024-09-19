export default class Modals {
  constructor() {
    this.selectors = {
      open: "[data-modal-open]",
      close: "[data-modal-close]",
    };
    this.events = this.events();
    this.events_init = {}; // События которые уже определены
  }
  init() {
    this.events.open();
  }
  events() {
    return {
      open: () => {
        let modal_open_btns = document.querySelectorAll(this.selectors.open);
        modal_open_btns.forEach((modal_open_btn) => {
          modal_open_btn.addEventListener("click", () => {
            let modal_id = modal_open_btn.dataset.modalOpen;
            if (!modal_id) return;

            let modal = document.getElementById(modal_id);
            if (!modal) return;

            modal.classList.add("opened");

            // Записали для каких модалок уже была инициализация события
            if (!this.events_init[modal_id]) {
              this.events_init[modal_id] = true;
              this.events.close(modal);
            }
          });
        });
      },
      close: (modal) => {
        let modal_close_btns = modal.querySelectorAll(this.selectors.close);
        modal_close_btns.forEach((modal_close_btn) => {
          modal_close_btn.addEventListener("click", () => {
            modal.classList.remove("opened");
          });
        });
      },
    };
  }
}
