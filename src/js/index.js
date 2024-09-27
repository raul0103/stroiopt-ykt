import "../scss/index.scss";

// Библиотеки
import GLightbox from "glightbox";
import "glightbox/dist/css/glightbox.min.css";

// Модули JS
import initSliders from "./modules/sliders.js";
import initOpened from "./modules/opened.js";
import FilterWindow from "./modules/filter-window.js";

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
  ];

  classes.forEach((_class) => {
    try {
      new _class.class().init();
    } catch (e) {
      console.error(`Ошибка в функции ${_class.name}: ${e}`);
    }
  });

  // Библиотеки
  GLightbox({
    touchNavigation: true,
    loop: true,
  });
});
