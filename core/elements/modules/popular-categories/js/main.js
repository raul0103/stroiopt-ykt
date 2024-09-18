export default function popCatInit() {
  let pop_cat_section = document.getElementById("pop-cat");
  if (!pop_cat_section) return;

  /**
   * Удаление кнопок "Показать еще" если высота блока меньше 141px согласно максимальной высоте в стилях
   */
  let pop_cat_blocks = pop_cat_section.querySelectorAll("[data-pop-cat]");
  pop_cat_blocks.forEach((pop_cat_block) => {
    let true_height = pop_cat_block.scrollHeight;
    // + 5 небольшой запас
    if (true_height < 141 + 5) {
      let pop_cat_id = pop_cat_block.dataset.popCat;

      let show_more_btn = pop_cat_section.querySelector(
        `[data-pop-cat-more="${pop_cat_id}"]`
      );
      if (show_more_btn) show_more_btn.remove();
    }
  });

  /**
   * Событие открытия
   */
  let show_more_btns = pop_cat_section.querySelectorAll("[data-pop-cat-more]");

  show_more_btns.forEach((show_more_btn) => {
    show_more_btn.addEventListener("click", () => {
      let pop_cat_id = show_more_btn.dataset.popCatMore;
      if (!pop_cat_id) return;

      let pop_cat_block = pop_cat_section.querySelector(
        `[data-pop-cat="${pop_cat_id}"]`
      );

      show_more_btn.classList.toggle("active");
      pop_cat_block.classList.toggle("opened");

      if (show_more_btn.classList.contains("active")) {
        show_more_btn.textContent = show_more_btn.dataset.activeText;
      } else {
        show_more_btn.textContent = show_more_btn.dataset.defaultText;
      }
    });
  });
}
