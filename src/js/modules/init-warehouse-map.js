export default function initWarehouseMap() {
  let warehouse = new ymaps.Map("warehouse-map", {
    center: [55.755864, 37.617698],
    zoom: 9,
  });

  let options = {
    iconLayout: "default#image",
    iconImageHref: "assets/template/images/sections/delivery-map/tool.png",
    iconImageSize: [42, 42], // Размеры метки.
    iconImageOffset: [-21, -21], // Смещение левого верхнего угла иконки относительно её "ножки" (точки привязки).
  };
  let options_v2 = Object.assign(structuredClone(options), {
    iconImageHref: "assets/template/images/sections/delivery-map/tool-2.png",
  });

  let phone = $('[href^="tel:"]').eq(0).text().trim();
  let baloon =
    '<div style="text-align: center;">Часы работы: ежедневно с 8:00 до 21:00<br>Стоимость доставки до 30 км: 1100 рублей<br>Телефон склада: <a href="tel:' +
    phone +
    '">' +
    phone +
    "</a></div>";

  let items = [
    {
      coords: [55.955882, 37.82485],
      header: '<div style="text-align: center;">Склад Ярославское шоссе</div>',
      options,
    },
    {
      coords: [55.700106, 37.385295],
      header: '<div style="text-align: center;">Склад Новоивановское</div>',
      options,
    },
    {
      coords: [55.607611, 37.457493],
      header: '<div style="text-align: center;">Склад Калужское шоссе</div>',
      options,
    },
    {
      coords: [55.583469, 37.711168],
      header: '<div style="text-align: center;">Склад МКАД 25</div>',
      options,
    },
    {
      coords: [55.643404, 37.837642],
      header: '<div style="text-align: center;">Склад Дзержинский</div>',
      options,
    },
    {
      coords: [55.683899, 37.895493],
      header: '<div style="text-align: center;">Склад Люберцы</div>',
      options,
    },
    {
      coords: [55.901516, 37.681362],
      header: '<div style="text-align: center;">Склад Мытищи</div>',
      options,
    },

    {
      coords: [55.454097, 37.757867],
      header: '<div style="text-align: center;">Склад Каширское шоссе</div>',
      options,
    },
    {
      coords: [55.829896, 37.373347],
      header:
        '<div style="text-align: center;">Склад Волоколамское шоссе</div>',
      options,
    },
    {
      coords: [55.712442, 37.797676],
      header: '<div style="text-align: center;">Склад Ферганский 1</div>',
      options,
    },
    {
      coords: [55.921067, 37.409163],
      header: '<div style="text-align: center;">Склад Химки</div>',
      options,
    },
    {
      coords: [55.909665, 37.423249],
      header: '<div style="text-align: center;"></div>',
      options: options_v2,
    },
    {
      coords: [55.578131, 37.609299],
      header: '<div style="text-align: center;">ФБС БЛОКИ</div>',
      options: options_v2,
    },
    {
      coords: [55.8836, 37.626627],
      header: '<div style="text-align: center;">ФБС БЛОКИ</div>',
      options: options_v2,
    },
    {
      coords: [55.583942, 37.610655],
      header: '<div style="text-align: center;">ФБС БЛОКИ</div>',
      options: options_v2,
    },
    {
      coords: [55.701125, 37.700325],
      header: '<div style="text-align: center;">ФБС БЛОКИ</div>',
      options: options_v2,
    },
    {
      coords: [54.652782, 39.645268],
      header: '<div style="text-align: center;">Все виды ЖБИ</div>',
      options: options_v2,
    },
    {
      coords: [55.73629, 38.226361],
      header:
        '<div style="text-align: center;">Дорожные плиты, ФБС блоки</div>',
      options: options_v2,
    },
    {
      coords: [55.587499, 38.469337],
      header:
        '<div style="text-align: center;">Дорожные плиты, ФБС блоки</div>',
      options: options_v2,
    },
    {
      coords: [55.56308, 37.944353],
      header:
        '<div style="text-align: center;">Аэродромные плиты, дорожные плиты</div>',
      options: options_v2,
    },
    {
      coords: [55.367679, 36.711999],
      header: '<div style="text-align: center;">Аэродромные плиты</div>',
      options: options_v2,
    },
    {
      coords: [55.833304, 37.156476],
      header:
        '<div style="text-align: center;">Дорожные плиты, ФБС блоки, аэродромные плиты</div>',
      options: options_v2,
    },
  ];
  items.forEach((item) => {
    warehouse.geoObjects.add(
      new ymaps.Placemark(
        item.coords,
        {
          balloonContentHeader: item.header,
          balloonContent: baloon,
        },
        item.options
      )
    );
  });
}
