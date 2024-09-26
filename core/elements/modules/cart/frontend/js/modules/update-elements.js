// Обновления элементов
const update_elements = {
  // По ID input будут записаны ссылки на элементы, что-бы повторно не бегать по странице и не искать
  find_elements: {
    input_counts: {},
    product_totals: [],
    product_summs: [],
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
    product_count = product_count ?? 0;

    // Товаров на странице может быть несколько (избранные, просмотренные и тд)
    let input_counts = this.find_elements.input_counts[product_id];

    if (!input_counts) {
      input_counts = document.querySelectorAll(
        `[data-cart-product-count="${product_id}"]`
      );
      this.find_elements.input_counts[product_id] = input_counts;
    }

    if (input_counts.length == 0) {
      console.warn(
        `Не найдены input с кол-вом товаров: [data-cart-product-count="${product_id}"]`
      );
      return;
    }

    input_counts.forEach((input_count) => {
      input_count.value = product_count;
    });
  },

  /**
   * Обновит товару сумму в найденных элементах по аттрибуту
   * data-cart-product-summ="PRODUCT_ID" - Обязательный аттрибут
   *
   * @param {*} product_id
   * @param {*} product_count
   * @returns
   */
  productSumm(product_id, product_summ_value = 0) {
    let product_summs = this.find_elements.product_summs;
    if (!product_summs.length) {
      product_summs = document.querySelectorAll(
        `[data-cart-product-summ="${product_id}"]`
      );
    }

    if (!product_summs.length) {
      console.warn(
        "[updates.productSumm] Не найдены элементы для обновления summ"
      );
      return null;
    }

    this.find_elements.product_summs = product_summs;

    product_summs.forEach((product_summ) => {
      product_summ.textContent = product_summ_value;
    });
  },

  /**
   * Обновит на странице общее кол-во товаров на странице у элементов с аттрибутом
   * data-cart-product-total
   * @param {*} product_total
   */
  productTotal(product_total_value) {
    let product_totals = this.find_elements.product_totals;
    if (!product_totals.length) {
      product_totals = document.querySelectorAll("[data-cart-product-total]");
    }

    if (!product_totals.length) {
      console.warn(
        "[updates.productTotal] Не найдены элементы для обновления total"
      );
      return null;
    }

    this.find_elements.product_totals = product_totals;

    product_totals.forEach((product_total) => {
      product_total.textContent = product_total_value;
    });
  },
};

export default update_elements;
