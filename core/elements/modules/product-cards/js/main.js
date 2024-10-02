/**
 * Необходимо отследить первое добавление в корзину, что бы скрыть большую кнопку и показать маленькие + -
 */
export default function initProductCart() {
  // Глобально для использования в кнопках на onclick
  window.product_card = {
    events: {
      // Добавляет первый товар в корзину
      addFirstProductToCart(product_id) {
        cart.event("plus", null, product_id); // Глобальный объект корзины

        changeClassProductCartControls("add", product_id);
      },
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

    changeClassProductCartControls("remove", event.detail.product_data.id);
  });
}

/**
 * Поиск блока в котором лежат кнопки для присвоения класса
 * @param {*} class_action - [add,remove]
 */
function changeClassProductCartControls(class_action, product_id) {
  let product_cart_controls = document.querySelector(
    `[data-product-cart-controls="${product_id}"]`
  );

  if (product_cart_controls)
    product_cart_controls.classList[class_action]("active");
}
