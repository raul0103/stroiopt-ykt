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

  let phone = $('[href^="tel:"]').eq(0).text().trim();
  let baloon =
    '<div style="text-align: center;">Часы работы: ежедневно с 8:00 до 21:00<br>Стоимость доставки до 30 км: 1100 рублей<br>Телефон склада: <a href="tel:' +
    phone +
    '">' +
    phone +
    "</a></div>";

  warehouse.geoObjects
    .add(
      new ymaps.Placemark(
        [55.955882, 37.82485],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Ярославское шоссе</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.901516, 37.681362],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Мытищи</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.683899, 37.895493],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Люберцы</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.643404, 37.837642],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Дзержинский</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.583469, 37.711168],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад МКАД 25</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.607611, 37.457493],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Калужское шоссе</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.700106, 37.385295],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Новоивановское</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.921067, 37.409163],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Химки</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.712442, 37.797676],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Ферганский 1</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.829896, 37.373347],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Волоколамское шоссе</div>',
          balloonContent: baloon,
        },
        options
      )
    )
    .add(
      new ymaps.Placemark(
        [55.454097, 37.757867],
        {
          balloonContentHeader:
            '<div style="text-align: center;">Склад Каширское шоссе</div>',
          balloonContent: baloon,
        },
        options
      )
    );
}
