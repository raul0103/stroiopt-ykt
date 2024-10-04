// modules
import Modals from "./modals/js/Modals.js";
import CatalogInit from "./catalog/js/main.js";
import MobileMenuInit from "./mobile-menu/js/main.js";
import popCatInit from "./popular-categories/js/main.js";
import MltReviewAjaxForm from "./reviews/js/main.js";
import Favorites from "./favorites/js/main.js";
import Cart from "./cart/frontend/js/main.js";
import initProductCart from "./product-cards/js/main.js";
import FastSearch from "./fast-search/js/main.js";

document.addEventListener("DOMContentLoaded", function () {
  let functions = [
    {
      init: CatalogInit,
      name: "CatalogInit",
    },
    {
      init: MobileMenuInit,
      name: "MobileMenuInit",
    },
    {
      init: popCatInit,
      name: "popCatInit",
    },
    {
      init: MltReviewAjaxForm.init,
      name: "MltReviewAjaxForm",
    },
    {
      init: initProductCart,
      name: "initProductCart",
    },
  ];

  functions.forEach((_function) => {
    try {
      _function.init();
    } catch (e) {
      console.error(`Ошибка в функции ${_function.name}: ${e}`);
    }
  });

  let classes = [
    {
      constructor: Favorites,
      name: "Favorites",
    },
    {
      constructor: FastSearch,
      name: "FastSearch",
    },
  ];

  classes.forEach((_class) => {
    try {
      new _class.constructor().init();
    } catch (e) {
      console.error(`Ошибка в классе ${_class.name}: ${e}`);
    }
  });

  // Подключение корзины
  try {
    window.cart = new Cart();
  } catch (e) {
    console.error(`Ошибка в классе Cart: ${e}`);
  }

  try {
    window.modals = new Modals();
  } catch (e) {
    console.error(`Ошибка в классе Modals: ${e}`);
  }
});
