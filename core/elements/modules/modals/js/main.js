import Modals from "./Modals.js";

export default function init() {
  try {
    new Modals().init();
  } catch (e) {
    console.error(`Ошибка модуля Modals: ${e}`);
  }
}
