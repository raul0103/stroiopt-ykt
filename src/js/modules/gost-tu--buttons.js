let gost_tu__price = document.querySelector("[data-gost-tu--price]");

if (gost_tu__price) {
  let price_gost = gost_tu__price.textContent?.replace(/\D/g, "");
  let price_tu = Math.round(price_gost - (price_gost * 20) / 100); // ниже на 20%

  let active_btn = document.querySelector("button.active[data-gost-tu--btn]");
  document.querySelectorAll("[data-gost-tu--btn]").forEach((btn) => {
    btn.addEventListener("click", () => {
      if (active_btn == btn) return;

      switch (btn.dataset.value) {
        case "gost":
          gost_tu__price.textContent = price_gost;
          break;
        case "tu":
          gost_tu__price.textContent = price_tu;
          break;
      }

      if (active_btn) {
        active_btn.classList.remove("active");
      }

      btn.classList.add("active");
      active_btn = btn;
    });
  });
}
