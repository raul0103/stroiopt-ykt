/**
 * Скрипт для открытия разных элементов
 *
 * data-opened-btn - У кнопки. Установит класс active
 * data-opened-element - У элемента который необходимо открыть. Установит класс opened
 * data-active-text - Текст кнопки при активном состоянии
 * data-close-early - Закрыть передыдущие элементы
 * data-toggle-not - Имея такой аттрибут элемент не будет закрыт при повторном нажатии
 */

export default function initOpened() {
  // Ранее открытые элементы
  let early_elements = {
    btn: document.querySelector("[data-opened-btn].active"),
    element: document.querySelector("[data-opened-element].opened"),
  };

  document.querySelectorAll("[data-opened-btn]").forEach((open_btn) => {
    let open_btn_text = open_btn.textContent; // Соханяем для дальнейших манипуляций
    let open_btn_close_early = open_btn.dataset.closeEarly; // Если надо закрывать предыдущие элменты
    let open_btn_toggle_not = open_btn.dataset.toggleNot;

    open_btn.addEventListener("click", () => {
      let elem_id = open_btn.dataset.openedBtn;
      if (!elem_id) return;

      let find_open_elem = document.querySelector(
        `[data-opened-element="${elem_id}"]`
      );

      if (!find_open_elem) return;

      if (open_btn_toggle_not) {
        open_btn.classList.add("active");
        find_open_elem.classList.add("opened");
      } else {
        open_btn.classList.toggle("active");
        find_open_elem.classList.toggle("opened");
      }

      if (open_btn.dataset.activeText) {
        if (open_btn.classList.contains("active")) {
          open_btn.textContent = open_btn.dataset.activeText;
        } else {
          open_btn.textContent = open_btn_text;
        }
      }

      if (open_btn_close_early) {
        if (early_elements.btn && early_elements.btn !== open_btn)
          early_elements.btn.classList.remove("active");
        if (early_elements.element && early_elements.element !== find_open_elem)
          early_elements.element.classList.remove("opened");

        early_elements.btn = open_btn;
        early_elements.element = find_open_elem;
      }
    });
  });
}
