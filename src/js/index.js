import "../scss/index.scss";

// Библиотеки
import GLightbox from "glightbox";
import "glightbox/dist/css/glightbox.min.css";

// Модули JS
import initSliders from "./modules/sliders.js";
import initOpened from "./modules/opened.js";
import FilterWindow from "./modules/filter-window.js";
import SearchByWords from "./modules/search-by-words.js";
import initCustomUpload from "./modules/custom-upload.js";
import Notifications from "./modules/notifications.js";
import initSwapTable from "./modules/swap-table.js";
import initWarehouseMap from "./modules/init-warehouse-map.js";
import initInputMask from "./modules/input-mask.js";
import fetchItObserve from "./modules/fetchit-observe.js";
import "../js/modules/gost-tu--buttons.js";

// Модули
import "../../core/elements/modules/all.js";

document.addEventListener("DOMContentLoaded", function () {
  let functions = [
    {
      init: initSliders,
      name: "initSliders",
    },
    {
      init: initOpened,
      name: "initOpened",
    },
    {
      init: initCustomUpload,
      name: "initCustomUpload",
    },
    {
      init: initSwapTable,
      name: "initSwapTable",
    },
    {
      init: initInputMask,
      name: "initInputMask",
    },
    {
      init: fetchItObserve,
      name: "fetchItObserve",
    },
  ];

  functions.forEach((_function) => {
    try {
      _function.init();
    } catch (e) {
      console.error(`Ошибка в функции ${_function.name}: ${e}`);
    }
  });

  // Classes
  let classes = [
    {
      class: FilterWindow,
      name: "FilterWindow",
    },
    {
      class: SearchByWords,
      name: "SearchByWords",
    },
  ];

  classes.forEach((_class) => {
    try {
      new _class.class().init();
    } catch (e) {
      console.error(`Ошибка в классе ${_class.name}: ${e}`);
    }
  });

  // Библиотеки
  GLightbox({
    touchNavigation: true,
    loop: true,
  });

  window.notifications = new Notifications();
  window.warehouseMap = initWarehouseMap;
});
