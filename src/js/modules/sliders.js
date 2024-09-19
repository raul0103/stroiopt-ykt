import Swiper from "swiper";
import { Navigation, Autoplay } from "swiper/modules";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

export default function iniSliders() {
  new Swiper('[data-slider="certificates"]', {
    modules: [Navigation, Autoplay],
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
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    direction: "horizontal",
  });

  new Swiper('[data-slider="thankful-letters"]', {
    modules: [Navigation, Autoplay],
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
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
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
}
