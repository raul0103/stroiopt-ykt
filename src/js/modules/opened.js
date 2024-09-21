/**
 * Скрипт для открытия разных элементов
 *
 * data-opened-btn - У кнопки. Установит класс active
 * data-opened-element - У элемента который необходимо открыть. Установит класс opened
 */

export default function initOpened() {
  document.querySelectorAll("[data-opened-btn]").forEach((open_btn) => {
    open_btn.addEventListener("click", () => {
      let elem_id = open_btn.dataset.openedBtn;
      if (!elem_id) return;

      let find_open_elem = document.querySelector(
        `[data-opened-element="${elem_id}"]`
      );

      if (!find_open_elem) return;

      open_btn.classList.toggle("active");
      find_open_elem.classList.toggle("opened");
    });
  });
}
