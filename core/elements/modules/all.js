// modules
import ModalsInit from "./modals/js/main.js";
import CatalogInit from "./catalog/js/main.js";
import MobileMenuInit from "./mobile-menu/js/main.js";
import popCatInit from "./popular-categories/js/main.js";
import MltReviewAjaxForm from "./reviews/js/main.js";

document.addEventListener("DOMContentLoaded", function () {
  let functions = [
    {
      init: ModalsInit,
      name: "ModalsInit",
    },
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
      init: ModalsInit,
      name: "ModalsInit",
    },
  ];

  functions.forEach((_function) => {
    try {
      _function.init();
    } catch (e) {
      console.error(`Ошибка в функции ${_function.name}: ${e}`);
    }
  });
});
