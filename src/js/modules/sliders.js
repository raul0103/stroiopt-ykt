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
        slidesPerView: 3,
        spaceBetween: 8,
      },
      320: {
        slidesPerView: 3,
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
        slidesPerView: 3,
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
        slidesPerView: 2,
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
}
