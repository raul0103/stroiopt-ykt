/**
 * Слушает отправки форм
 */

export default function fetchItObserve() {
  document.addEventListener(FetchIt.events.success, function (event) {
    /**
     * Скрывает контент модалки и открывает окно после отправки формы
     */
    let modal_id = event.detail.form.dataset.modalId;
    if (modal_id) {
      let modal = document.getElementById(modal_id);
      if (!modal) return;
      modal.querySelector("[data-modal-body-after]")?.classList.add("show");
      modal.querySelector("[data-modal-body-before]")?.classList.add("hide");
    }

    /**
     * Если форма заказа то
     * - Другой текст уведомления
     * - Очистить козину
     * - Перезагрузить страницу
     */
    let form_id = event.detail.form.dataset.formId;
    if (form_id == "order-form") {
      cart.events.clear(false);

      modals.events.open("modal-order-success", () => {
        location.reload();
      });
    } else {
      notifications.success("Форма успешно отправлена");
    }

    console.log(event.detail);
  });
  document.addEventListener(FetchIt.events.error, function (event) {
    notifications.error("Ошибка при отправке формы");
    console.log(event.detail);
  });
}
