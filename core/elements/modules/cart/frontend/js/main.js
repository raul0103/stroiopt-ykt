/**
 * Класс управления корзиной
 */
import api from "./api";
import helpers from "./helpers";

export default class Cart {
  // По ID input будут записаны ссылки на элементы, что-бы повторно не бегать по странице и не искать
  find_elements = {
    product_form: {},
    input_counts: {},
    product_totals: [],
  };

  // Обязательные поля которые должны быть получены с формы товара
  required_data_fields = ["id", "price", "unit"];

  /**
   * @param {*} action [minus,plus,change]
   * @param {*} e - Кнопка по которой был клик
   * @param {*} product_id
   * @returns
   */
  event = async (action, e, product_id) => {
    let valid_params = helpers.checkParams(`events.${action}`, {
      product_id,
    });
    if (!valid_params) return;

    // Получаем данные товара из html формы
    let data = this.getProductFormData(e, product_id);

    // Если это input с кол-вом тогда устанавливаем кол-во его значение
    if (action == "change") {
      data.count = e.value;
    }

    let response = await api.response(action, data);
    if (!response && !response?.success) return;

    this.updateProductTotal(response.data && response.data.product_total);

    // Если событие было по input с кол-ом, то не зачем менять в нем же кол-во
    if (action !== "change") {
      this.updateProductCount(
        product_id,
        response.data && response.data.product_data.count
      );
    }

    // Событие что корзина сработала
    this.dispacth({
      detail: {
        product_data: response.data.product_data,
      },
    });
  };

  /**
   * Запускает событие при действиях с корзиной
   * @param {*} detail - Параметры
   */
  dispacth(detail) {
    let cart_event = new CustomEvent("CartEvent", detail);
    document.dispatchEvent(cart_event);
  }

  /**
   * Обновит товару его кол-во на странице в input
   * data-cart-product-count="PRODUCT_ID" - Обязательный аттрибут на input кол-ва товара. Будет обновляться по AJAX
   *
   * @param {*} product_id
   * @param {*} product_count
   * @returns
   */
  updateProductCount = (product_id, product_count = 0) => {
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
  };

  /**
   * Находит форму с данными по товару для передачи данных на бэк
   * data-cart-form="PRODUCT_ID" - Обязателльный атрибут у формы
   * @param {*} control_btn - Кнопка по которой был клик
   * @param {*} product_id
   * @returns - Объект с полями формы {id: '88', price: '1 750', unit: ''}
   */
  getProductFormData(control_btn = null, product_id) {
    let product_form = this.find_elements.product_form[product_id];
    if (!product_form && control_btn) {
      // Сначала ищем форму по общему родителю с кнопками, сделано для упрощения циклов поиска
      let parent_node = control_btn.parentNode;
      product_form = parent_node.querySelector(
        `[data-cart-form="${product_id}"]`
      );
    }
    if (!product_form) {
      product_form = document.querySelector(`[data-cart-form="${product_id}"]`);
    }
    if (!product_form) {
      console.warn("[getProductFormData] Не найдена форма с данными товара");
      return null;
    }

    this.find_elements.product_form[product_id] = product_form;

    let result = {};
    this.required_data_fields.forEach((required_data_field) => {
      result[required_data_field] =
        product_form.elements[required_data_field].value;
    });

    return result;
  }

  /**
   * Обновит на странице общее кол-во товаров на странице у элементов с аттрибутом
   * data-cart-product-total
   * @param {*} product_total
   */
  updateProductTotal(product_total_value) {
    let product_totals = this.find_elements.product_totals;
    if (!product_totals.length) {
      console.log("find");

      product_totals = document.querySelectorAll("[data-cart-product-total]");
    }

    if (!product_totals.length) {
      console.warn(
        "[updateProductTotal] Не найдены элементы для отображения кол-ва товаров в корзине"
      );
      return null;
    }

    this.find_elements.product_totals = product_totals;

    product_totals.forEach((product_total) => {
      product_total.textContent = product_total_value;
    });
  }
}
