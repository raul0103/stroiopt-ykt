// Обновления элементов
const update_elements = {
  // По ID input будут записаны ссылки на элементы, что-бы повторно не бегать по странице и не искать
  find_elements: {
    counters: [],
    total: {
      count: [],
      summ: [],
    },
    product_summs: [],
  },

  /**
   * Функция контсруктор для всех остальных
   * @param {*} value - Значение элемента
   * @param {*} finds - Уже найденные на сранице элементы
   * @param {*} selector - Селектор для поиска элементов
   * @param {*} warn - Предупреждение
   * @param {*} field - Поле для замены
   * @returns
   */
  main(value, finds, selector, warn, field) {
    let elements = this.find_elements[finds];

    if (!elements || !elements.length) {
      console.log("finds", this.find_elements[finds]);

      elements = document.querySelectorAll(selector);
      this.find_elements[finds] = elements;
    }

    if (elements.length == 0) {
      console.warn(warn);
      return;
    }

    elements.forEach((element) => {
      element[field] = value;
    });
  },

  /**
   * Обновит товару его кол-во на странице в input
   * data-cart-product-count="PRODUCT_ID" - Обязательный аттрибут на input кол-ва товара. Будет обновляться по AJAX
   *
   * @param {*} product_id
   * @param {*} product_count
   * @returns
   */
  productCount(product_id, product_count = 0) {
    // product_count = product_count ?? 0;
    let selector = `[data-cart-product-count="${product_id}"]`;
    this.main(
      product_count,
      "counters",
      selector,
      `Не найдены input с кол-вом товаров: ${selector}`,
      "value"
    );
  },

  /**
   * Обновит товару сумму в найденных элементах по аттрибуту
   * data-cart-product-summ="PRODUCT_ID" - Обязательный аттрибут
   *
   * @param {*} product_id
   * @param {*} product_summ
   * @returns
   */
  productSumm(product_id, product_summ = 0) {
    let selector = `[data-cart-product-summ="${product_id}"]`;
    this.main(
      product_summ,
      "product_summs",
      selector,
      `Не найдены элементы для обновления суммы товара: ${selector}`,
      "textContent"
    );
  },

  /**
   * Обновит на странице общее кол-во товаров на странице у элементов с аттрибутом
   * data-cart-total-count
   * @param {*} count
   */
  cartTotalCount(count) {
    let selector = `[data-cart-total-count]`;
    this.main(
      count,
      this.find_elements.total.count,
      selector,
      `Не найдены элементы для обновления общего кол-ва товара в корзине: ${selector}`,
      "textContent"
    );
  },

  /**
   * Обновит на странице общую сумму товаров в корзине
   * data-cart-total-summ
   * @param {*} summ
   */
  cartTotalSumm(summ) {
    let selector = `[data-cart-total-summ]`;
    this.main(
      summ,
      this.find_elements.total.count,
      selector,
      `Не найдены элементы для обновления общей суммы товаров в корзине: ${selector}`,
      "textContent"
    );
  },
};

export default update_elements;
