export default class Modals {
  constructor() {
    this.selectors = {
      close: "[data-modal-close]",
    };

    this.events_init = {}; // События которые уже определены
  }

  events = {
    open: (modal_id) => {
      if (!modal_id) return;

      let modal = document.getElementById(modal_id);
      if (!modal) return;

      modal.classList.add("opened");

      // Записали для каких модалок уже была инициализация события
      if (!this.events_init[modal_id]) {
        this.events_init[modal_id] = true;
        this.events.close(modal);
      }
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
