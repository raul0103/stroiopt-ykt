/**
 * Управление модальными окнами
 * data-show-body-before - Если есть такой аттрибут на модальном окне -
 *                         то закрыть сообщение об успешной отправке и
 *                         открыть основное окно после пторного открытия модалки
 * 
 * Вторичные элементы
 *  - data-modal-body-before - Блок который отображается до отправки формы
 *  - data-modal-body-after - Блок после отправки формы
 */
export default class Modals {
  constructor() {
    this.selectors = {
      close: "[data-modal-close]",
      show_body_before: "[data-modal-body-before]",
      show_body_after: "[data-modal-body-after]",
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

      /**
       * Показать основное окно
       * На случай если форма была успешно отправлена и сейчас открыто окно об отправке
       */

      if (modal.dataset.showBodyBefore == "true") {
        this.showBodyBefore(modal);
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

  showBodyBefore(modal) {
    let show_body_before = modal.querySelector(this.selectors.show_body_before);
    console.log(this.selectors.show_body_before);

    if (!show_body_before) return;

    let show_body_after = modal.querySelector(this.selectors.show_body_after);
    if (!show_body_after) return;

    show_body_before.classList.remove("hide");
    show_body_after.classList.remove("show");
  }
}
