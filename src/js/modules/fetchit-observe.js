/**
 * Слушает отправки форм
 */

export default function fetchItObserve() {
  document.addEventListener(FetchIt.events.success, function (event) {
    notifications.success("Форма успшено отправлена");

    let modal_id = event.detail.form.dataset.modalId;
    if (modal_id) {
      let modal = document.getElementById(modal_id);
      if (!modal) return;
      modal.querySelector("[data-modal-body-after]")?.classList.add("show");
      modal.querySelector("[data-modal-body-before]")?.classList.add("hide");
    }

    console.log(event.detail);
  });
  document.addEventListener(FetchIt.events.error, function (event) {
    notifications.error("Ошибка при отправке формы");
    console.log(event.detail);
  });
}
