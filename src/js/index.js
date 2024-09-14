// modules
import Modals from "../../core/elements/modules/modals/js/main.js";

document.addEventListener("DOMContentLoaded", function () {
  try {
    new Modals().init();
  } catch (e) {
    console.error(`Ошибка модуля Modals: ${e}`);
  }
});
