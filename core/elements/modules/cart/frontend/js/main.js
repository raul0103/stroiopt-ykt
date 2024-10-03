/**
 * Класс управления корзиной
 */
import api from "./services/api";
import helpers from "./utils/helpers";
import dispatch from "./utils/dispatch";
import update_elements from "./modules/update-elements";
import product_data from "./modules/product-data";
import notificationService from "./services/notification-service";

export default class Cart {
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
    let data = product_data.getFormData(e, product_id);

    // Если это input с кол-вом тогда устанавливаем кол-во его значение
    if (action == "change") {
      data.count = e.value;
    }

    this.states.loading(e);

    let response = await api.response(action, data);
    if (!response && !response?.success) return;

    this.states.completion(e);

    update_elements.productSumm(
      product_id,
      response.data && response.data.product_data.summ
    );

    update_elements.cartTotalSumm(response.data && response.data.total.summ);
    update_elements.cartTotalCount(response.data && response.data.total.count);

    // Если событие было по input с кол-ом, то не зачем менять в нем же кол-во
    if (action !== "change") {
      update_elements.productCount(
        product_id,
        response.data && response.data.product_data.count
      );
    }

    // Уведомление
    notificationService(
      action,
      response.data && response.data.product_data.count
    );

    // Событие что корзина сработала
    dispatch({
      detail: {
        action,
        product_data: response.data.product_data,
      },
    });
  };

  // Второстепенные события
  second_events = {
    // Полностью очищает корзину
    clear: async () => {
      let action = "clear";
      await api.response(action, {});

      // Уведомление
      notificationService(action);
    },
    // Удаляет товар из корзины
    remove: async (product_id) => {
      let action = "remove";

      let response = await api.response(action, { id: product_id });
      if (!response && !response?.success) return;

      // Уведомление
      notificationService(action);

      update_elements.cartTotalSumm(response.data && response.data.total.summ);
      update_elements.cartTotalCount(
        response.data && response.data.total.count
      );
    },
  };

  states = {
    loading: (e) => {
      if (!e) return;
      e.parentNode.style.opacity = ".5";
      e.parentNode.style["pointer-events"] = "none";
    },
    completion: (e) => {
      if (!e) return;
      e.parentNode.style.opacity = "1";
      e.parentNode.style["pointer-events"] = "all";
    },
  };
}
