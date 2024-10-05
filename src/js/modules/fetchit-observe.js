/**
 * Слушает отправки форм
 */

export default function fetchItObserve() {
  document.addEventListener(FetchIt.events.success, function (event) {
    notifications.success("Форма успшено отправлена");
    console.log(event.detail);
  });
  document.addEventListener(FetchIt.events.error, function (event) {
    notifications.error("Ошибка при отправке формы");
    console.log(event.detail);
  });
}
