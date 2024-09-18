// modules
import ModalsInit from "./modals/js/main.js";
import CatalogInit from "./catalog/js/main.js";
import MobileMenuInit from "./mobile-menu/js/main.js";
import popCatInit from "./popular-categories/js/main.js";

document.addEventListener("DOMContentLoaded", function () {
  ModalsInit();
  CatalogInit();
  MobileMenuInit();
  popCatInit();
});
