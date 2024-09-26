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
  };

  // Обязательные поля которые должны быть получены с формы товара
  required_data_fields = ["id", "price", "unit"];

  events = {
    plus: async (e, product_id) => {
      let valid_params = helpers.checkParams("events.plus", {
        product_id,
      });
      if (!valid_params) return;

      let data = this.getProductFormData(e, product_id);

      let response = await api.response("plus", data);
      if (!response && !response?.success) return;

      this.updateProductCount(product_id, response.data.count);
    },
    minus: async (e, product_id) => {
      let valid_params = helpers.checkParams("events.minus", {
        product_id,
      });
      if (!valid_params) return;

      let data = this.getProductFormData(e, product_id);

      let response = await api.response("minus", data);
      if (!response && !response?.success) return;

      this.updateProductCount(product_id, response.data && response.data.count);
    },
    change: () => {},
  };

  /**
   * Обновит товару его кол-во в корзине
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
  getProductFormData(control_btn, product_id) {
    let product_form = this.find_elements.product_form[product_id];
    if (!product_form) {
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
}
