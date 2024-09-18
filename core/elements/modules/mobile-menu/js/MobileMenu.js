export default class MobileMenu {
  constructor() {
    this.selectors = {
      open_menu: "[data-mobile-menu-open]",
      open_modal: "[data-mobile-modal-open]",
      back_modal: "[data-mobile-modal-back]",
      modal: "[data-mobile-modal]",
    };

    this.events = this.events();
    this.events_init = {};

    this.history_active_menus = []; // Активные меню, сохарняем в стек для открытия по очереди на кнопку "назад"
  }
  init() {
    this.menu();
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

      mobile_menu.classList.toggle("opened");
      document.querySelector("body").classList.toggle("block-scroll");

      if (!this.events_init.open_mobile_modals) {
        this.events_init.open_mobile_modals = true;
        this.events.openModal(mobile_menu);
      }
      if (!this.events_init.back_mobile_modal) {
        this.events_init.back_mobile_modal = true;
        this.events.backModal(mobile_menu);
      }
    });
  }
  events() {
    return {
      openModal: (mobile_menu) => {
        let open_mobile_modals = mobile_menu.querySelectorAll(
          this.selectors.open_modal
        );

        open_mobile_modals.forEach((open_mobile_modal) => {
          open_mobile_modal.addEventListener("click", () => {
            let modal_id = open_mobile_modal.dataset.mobileModalOpen;
            if (!modal_id) return;

            let modal = mobile_menu.querySelector(
              `[data-mobile-modal="${modal_id}"]`
            );
            if (!modal) return;

            let active_menu = this.events.hideActiveModal(mobile_menu);
            // кидаем ее в стек ранее открытых
            this.history_active_menus.push(active_menu);

            // Открываем новую
            modal.classList.add("opened");
          });
        });
      },
      hideActiveModal: (mobile_menu) => {
        // Закрываем текущую модалку
        let active_menu = mobile_menu.querySelector(
          "[data-mobile-modal].opened"
        );
        if (!active_menu) return;

        active_menu.classList.remove("opened");
        return active_menu;
      },
      backModal: (mobile_menu) => {
        let back_modals = mobile_menu.querySelectorAll(
          this.selectors.back_modal
        );
        back_modals.forEach((back_modal) => {
          back_modal.addEventListener("click", () => {
            this.events.hideActiveModal(mobile_menu);

            let prev_menu = this.history_active_menus.pop();
            if (!prev_menu) return;

            prev_menu.classList.add("opened");
          });
        });
      },
    };
  }
}
