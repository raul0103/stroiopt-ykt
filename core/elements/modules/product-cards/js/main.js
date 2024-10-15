/**
 * Необходимо отследить первое добавление в корзину, что бы скрыть большую кнопку и показать маленькие + -
 */
export default function initProductCart() {
  // Глобально для использования в кнопках на onclick
  window.product_card = {
    events: {
      // Покупка в один клик
      async buyOneClick(product_id) {
        if (!product_id) {
          console.warn("Не передан product_id");
          return;
        }

        let buy_click_container = document.getElementById(
          "buy-click-container"
        );
        if (!buy_click_container) {
          console.warn("Не найден контейнер для товара");
        }

        buy_click_container.innerHTML = "";
        buy_click_container.classList.add("loading-block");

        // Запрос на получение данных о товаре
        const response = await fetch("/", {
          method: "POST",
          headers: {
            "Content-Type": "application/text",
          },
          body: JSON.stringify({
            action: "get-product-data",
            ajax_connect: true,
            product_id,
          }),
        });

        if (!response.ok) {
          throw new Error(`Response status: ${response.status}`);
        }

        buy_click_container.classList.remove("loading-block");
        buy_click_container.innerHTML = await response.text();
      },
    },
  };

  // Отслеживаем событие корзины для скрытия кнопок + - и вывода большой кнопки
  document.addEventListener("CartEvent", function (event) {
    // Если у товара есть остаток ничего не меняем
    if (
      "count" in event.detail.product_data &&
      +event.detail.product_data.count > 0
    )
      return;

    let forms = document.querySelectorAll(
      `[data-cart-form="${event.detail.product_data.id}"]`
    );
    forms.forEach((form) => {
      form.classList.remove("active");
    });
  });
}
