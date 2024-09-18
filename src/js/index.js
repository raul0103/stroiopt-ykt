import "../scss/index.scss";

// Библиотеки
import GLightbox from "glightbox";
import "glightbox/dist/css/glightbox.min.css";

// Модули JS
import initSliders from "./modules/sliders.js";

// Модули
import "../../core/elements/modules/all.js";

document.addEventListener("DOMContentLoaded", function () {
  let functions = [
    {
      init: initSliders,
      name: "initSliders",
    },
  ];

  functions.forEach((_function) => {
    try {
      _function.init();
    } catch (e) {
      console.error(`Ошибка в функции ${_function.name}: ${e}`);
    }
  });

  // Библиотеки
  GLightbox({
    touchNavigation: true,
    loop: true,
  });
});
