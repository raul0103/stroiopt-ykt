import Swiper from "swiper";
import { Navigation, Autoplay, Thumbs } from "swiper/modules";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

export default function iniSliders() {
  new Swiper('[data-slider="certificates"]', {
    modules: [Autoplay],
    slidesPerView: "auto",
    loop: false,
    slidesPerView: 6,
    spaceBetween: 24,
    lazy: { loadPrevNext: true },
    autoplay: {
      delay: 4000,
      disableOnInteraction: false,
    },
    breakpoints: {
      1200: {
        slidesPerView: 6,
      },
      992: {
        slidesPerView: 4,
      },
      576: {
        slidesPerView: 3.1,
        spaceBetween: 8,
      },
      320: {
        slidesPerView: 3.1,
        spaceBetween: 8,
      },
    },
    // navigation: {
    //   nextEl: ".swiper-button-next",
    //   prevEl: ".swiper-button-prev",
    // },
    direction: "horizontal",
  });

  new Swiper('[data-slider="thankful-letters"]', {
    modules: [Autoplay],
    slidesPerView: "auto",
    loop: false,
    slidesPerView: 5,
    spaceBetween: 24,
    lazy: { loadPrevNext: true },
    autoplay: {
      delay: 8000,
      disableOnInteraction: false,
    },
    breakpoints: {
      1200: {
        slidesPerView: 5,
      },
      992: {
        slidesPerView: 4,
      },
      576: {
        slidesPerView: 3,
        spaceBetween: 8,
      },
      320: {
        slidesPerView: 3.1,
        spaceBetween: 8,
      },
    },
    // navigation: {
    //   nextEl: ".swiper-button-next",
    //   prevEl: ".swiper-button-prev",
    // },
    direction: "horizontal",
  });

  new Swiper('[data-slider="works-slider"]', {
    modules: [Autoplay],
    slidesPerView: "auto",
    loop: false,
    slidesPerView: 6,
    spaceBetween: 24,
    lazy: { loadPrevNext: true },
    autoplay: {
      delay: 8000,
      disableOnInteraction: false,
    },
    breakpoints: {
      1200: {
        slidesPerView: 6,
      },
      992: {
        slidesPerView: 4,
      },
      576: {
        slidesPerView: 2,
        spaceBetween: 8,
      },
      320: {
        slidesPerView: 2.1,
        spaceBetween: 8,
      },
    },
    direction: "horizontal",
  });

  ["left", "right"].forEach((rtl) => {
    new Swiper(`[data-slider="partners-logo-${rtl}"]`, {
      modules: [Autoplay],
      slidesPerView: "auto",
      loop: true,
      slidesPerView: 9,
      spaceBetween: 20,
      rtl: rtl == "right" ? true : false,
      lazy: { loadPrevNext: true },
      freeMode: true,
      autoplay: {
        delay: 0,
        disableOnInteraction: false,
      },
      speed: 15000,
      breakpoints: {
        1200: {
          slidesPerView: 9,
        },
        992: {
          slidesPerView: 6,
        },
        576: {
          slidesPerView: 6,
          spaceBetween: 8,
        },
        320: {
          slidesPerView: 3,
          spaceBetween: 8,
        },
      },
    });
  });

  let product_thumbs = new Swiper('[data-slider="product-gallery-thumbs"]', {
    modules: [Navigation],
    slidesPerView: 4,
    freeMode: true,
    watchSlidesProgress: true,
    direction: "vertical",
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
  new Swiper('[data-slider="product-gallery-preview"]', {
    modules: [Thumbs],

    thumbs: {
      swiper: product_thumbs,
    },
  });

  new Swiper('[data-slider="product-interesting"]', {
    modules: [Navigation],
    slidesPerView: 5,
    spaceBetween: 16,
    breakpoints: {
      1200: {
        slidesPerView: 5,
      },
      992: {
        slidesPerView: 4,
      },
      890: {
        slidesPerView: 3,
        spaceBetween: 8,
      },
      200: {
        slidesPerView: 2,
        spaceBetween: 8,
      },
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  if (window.innerWidth <= 767) {
    // Если с бэка расставить классы то блок ломается, поэтому ставим только на мобиле
    ["manufacture", "unloading"].forEach((slider_name) => {
      let slider = document.querySelector(
        '[data-slider="' + slider_name + '"]'
      );
      console.log(slider);

      if (!slider) return;
      slider.classList.add("swiper");

      let slider_wrapper = slider.querySelector(
        '[data-slider-wrapper="' + slider_name + '"]'
      );
      slider_wrapper.classList.add("swiper-wrapper");

      let slider_items = slider.querySelectorAll(
        '[data-slider-item="' + slider_name + '"]'
      );
      slider_items.forEach((slider_item) => {
        slider_item.classList.add("swiper-slide");
      });

      new Swiper('[data-slider="' + slider_name + '"]', {
        slidesPerView: 1.1,
        spaceBetween: 12,
      });
    });
  }
}
