/**
 * Добавляет в первый td последний td. На мобиле
 * необходимо указать у родительского tr data-swap-table
 * data-swap-table="1" Можно передать индекс элемента куда будет замена. От 0
 */

export default function initSwapTable() {
  if (window.innerWidth > 767) return;

  let swap_tables = document.querySelectorAll("[data-swap-table]");

  swap_tables.forEach((swap_table) => {
    let trs = swap_table.querySelectorAll("tbody tr");

    trs.forEach((tr) => {
      let index = swap_table.dataset.swapTable
        ? swap_table.dataset.swapTable
        : 0;

      let childrens = tr.children;
      let first_child = childrens[index];
      let last_child = childrens[childrens.length - 1];
      let container = document.createElement("div");
      container.classList.add("swap-table-container");

      container.innerHTML = first_child.innerHTML + last_child.innerHTML;
      first_child.innerHTML = "";

      first_child.appendChild(container);
      last_child.remove();
    });

    let last_th = swap_table.querySelector("thead th:last-child");
    last_th.remove();
  });
}
