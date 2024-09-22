/**
 * Скрипт для открытия разных элементов
 *
 * data-opened-btn - У кнопки. Установит класс active
 * data-opened-element - У элемента который необходимо открыть. Установит класс opened
 * data-active-text - Текст кнопки при активном состоянии
 */

export default function initOpened() {
  document.querySelectorAll("[data-opened-btn]").forEach((open_btn) => {
    let button_text = open_btn.textContent; // Соханяем для дальнейших манипуляций
    open_btn.addEventListener("click", () => {
      let elem_id = open_btn.dataset.openedBtn;
      if (!elem_id) return;

      let find_open_elem = document.querySelector(
        `[data-opened-element="${elem_id}"]`
      );

      if (!find_open_elem) return;

      open_btn.classList.toggle("active");
      find_open_elem.classList.toggle("opened");

      if (open_btn.dataset.activeText) {
        if (open_btn.classList.contains("active")) {
          open_btn.textContent = open_btn.dataset.activeText;
        } else {
          open_btn.textContent = button_text;
        }
      }
    });
  });
}
