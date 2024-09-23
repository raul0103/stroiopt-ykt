/**
 * Скрипт управляет кнопками для добавления в избранное
 * Создаст глобальную функцию window.addFavorite, указать ее на кнопке onclick="addFavorite(this,resource_id)", так как товары будут подгружать по ajax
 *
 * Аттрибуты необходимые для работы
 * data-favorite-count="cookie_key" - Кол-во товаров в избранном, можно установить на несколько элементов
 *    - Указываем в аттрибуте cookie_key для разделения, вдруг будут избранные товаров, статей и тд
 */
import Cookie from "../../../../../src/js/classes/Cookie";

export default class Favorites {
  cookie = new Cookie();
  find_elements = {};

  init() {
    window.addFavorites = this.addFavorites;
  }

  /**
   * Добавит ID ресурса в куки избранного
   * @param {DOMElement} target - кнопка по которой было нажатие
   * @param {integer} resource_id - ID ресурса
   * @param {string} cookie_key - Ключ для куки куда будет сохранен результат
   * @returns
   */
  addFavorites = (target, resource_id, cookie_key) => {
    if (!cookie_key) {
      console.warn("[addFavorites] Не задан cookie_key");
      return;
    }

    resource_id = +resource_id;

    let favorites = this.cookie.get(cookie_key);
    if (favorites) favorites = favorites.split(",").map(Number);
    else favorites = [];

    if (favorites.indexOf(resource_id) > -1) {
      favorites = favorites.filter((favorite) => favorite != resource_id);
      target.classList.remove("active");
    } else {
      favorites.push(resource_id);
      target.classList.add("active");
    }

    this.cookie.set(cookie_key, favorites);

    this.updateCounts(cookie_key, favorites.length);
  };
  /**
   *
   * @param {string} cookie_key - Ключ для куки куда будет сохранен результат
   * @param {integer} count - кол-во ресурсов в избранном
   */
  updateCounts(cookie_key, count) {
    // Что-бы не бегать по странице скриптом при каждом нажатии
    let counter_elements;
    if (this.find_elements.counters) {
      counter_elements = this.find_elements.counters;
    } else {
      counter_elements = document.querySelectorAll(
        `[data-favorite-count="${cookie_key}"]`
      );
      this.find_elements.counters = counter_elements;
    }

    counter_elements.forEach((counter_element) => {
      counter_element.textContent = count;
    });
  }
}
