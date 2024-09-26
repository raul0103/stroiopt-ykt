const product_data = {
  // По ID input будут записаны ссылки на элементы, что-бы повторно не бегать по странице и не искать
  find_elements: {
    product_form: {},
  },

  // Обязательные поля которые должны быть получены с формы товара
  required_data_fields: ["id", "price", "unit"],

  /**
   * Находит форму с данными по товару для передачи данных на бэк
   * data-cart-form="PRODUCT_ID" - Обязателльный атрибут у формы
   * @param {*} control_btn - Кнопка по которой был клик
   * @param {*} product_id
   * @returns - Объект с полями формы {id: '88', price: '1 750', unit: ''}
   */
  getFormData(control_btn = null, product_id) {
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
      console.warn("[getFormData] Не найдена форма с данными товара");
      return null;
    }

    this.find_elements.product_form[product_id] = product_form;

    let result = {};
    this.required_data_fields.forEach((required_data_field) => {
      result[required_data_field] =
        product_form.elements[required_data_field].value;
    });

    return result;
  },
};

export default product_data;
