export default class MobileMenu {
  constructor() {
    this.selectors = {
      open_menu: "[data-mobile-menu-open]",
      open_modal: "[data-mobile-modal-open]",
      back_modal: "[data-mobile-modal-back]",
      modal: "[data-mobile-modal]",
    };

    this.events_init = {};

    this.history_active_menus = []; // Активные меню, сохарняем в стек для открытия по очереди на кнопку "назад"
  }
  init() {
    this.menu();
    window.mobile_menu = this;
  }
  menu() {
    let open_menu = document.querySelector(this.selectors.open_menu);
    if (!open_menu) return;

    open_menu.addEventListener("click", () => {
      open_menu.classList.toggle("active");

      let mobile_menu_id = open_menu.dataset.mobileMenuOpen;
      if (!mobile_menu_id) return;

      let mobile_menu = document.getElementById(mobile_menu_id);
      if (!mobile_menu) return;

      this.mobile_menu = mobile_menu;

      mobile_menu.classList.toggle("opened");
      document.querySelector("body").classList.toggle("block-scroll");

      if (!this.events_init.open_mobile_modals) {
        this.events_init.open_mobile_modals = true;
        this.events.openModal();
      }
      if (!this.events_init.back_mobile_modal) {
        this.events_init.back_mobile_modal = true;
        this.events.backModal();
      }
    });
  }
  events = {
    openModal: () => {
      let open_mobile_modals = Array.from(
        this.mobile_menu.querySelectorAll(this.selectors.open_modal)
      ).filter((el) => !el.classList.contains("isinit"));

      open_mobile_modals.forEach((open_mobile_modal) => {
        open_mobile_modal.classList.add("isinit");
        open_mobile_modal.addEventListener("click", () => {
          let modal_id = open_mobile_modal.dataset.mobileModalOpen;
          if (!modal_id) return;

          let modal = this.mobile_menu.querySelector(
            `[data-mobile-modal="${modal_id}"]`
          );
          if (!modal) return;

          let active_menu = this.events.hideActiveModal();
          // кидаем ее в стек ранее открытых
          this.history_active_menus.push(active_menu);

          // Открываем новую
          modal.classList.add("opened");
        });
      });
    },
    hideActiveModal: () => {
      // Закрываем текущую модалку
      let active_menu = this.mobile_menu.querySelector(
        "[data-mobile-modal].opened"
      );
      if (!active_menu) return;

      active_menu.classList.remove("opened");
      return active_menu;
    },
    backModal: () => {
      let back_modals = Array.from(
        this.mobile_menu.querySelectorAll(this.selectors.back_modal)
      ).filter((el) => !el.classList.contains("isinit"));

      back_modals.forEach((back_modal) => {
        back_modal.classList.add("isinit");

        back_modal.addEventListener("click", () => {
          this.events.hideActiveModal(this.mobile_menu);

          let prev_menu = this.history_active_menus.pop();
          if (!prev_menu) return;

          prev_menu.classList.add("opened");
        });
      });
    },
  };
}
