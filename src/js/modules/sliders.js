import Swiper from "swiper";
import { Navigation } from "swiper/modules";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

export default function iniSliders() {
  new Swiper('[data-slider="certificates"]', {
    modules: [Navigation],
    slidesPerView: "auto",
    loop: false,
    slidesPerView: 6,
    spaceBetween: 24,
    lazy: { loadPrevNext: true },
    breakpoints: {
      1200: {
        slidesPerView: 6,
      },
      992: {
        slidesPerView: 4,
      },
      576: {
        slidesPerView: 3,
      },
      320: {
        slidesPerView: 2,
      },
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    direction: "horizontal",
  });

  new Swiper('[data-slider="thankful-letters"]', {
    modules: [Navigation],
    slidesPerView: "auto",
    loop: false,
    slidesPerView: 5,
    spaceBetween: 24,
    lazy: { loadPrevNext: true },
    breakpoints: {
      1200: {
        slidesPerView: 5,
      },
      992: {
        slidesPerView: 4,
      },
      576: {
        slidesPerView: 3,
      },
      320: {
        slidesPerView: 2,
      },
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    direction: "horizontal",
  });
}
