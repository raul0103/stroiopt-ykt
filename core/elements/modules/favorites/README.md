- Вызвать в начале страницы сниппет setFavoritesPlaceholder.php, для записи массива ID избранных товаров
- В дальнешем можно проверкой ID в массиве манипулировать ресурсами

## Элементы для товара

- Кнопка для добавления товара в избранное
  - {include "file:modules/favorites/chunks/products/add-favorite-btn.tpl" product_id=$id}
- Счетчик избранных товаров
  - {include "file:modules/favorites/chunks/products/header-counters.tpl"}

## Особые моменты

- При AJAX подгрузке данных, необходимо снова формировать плейсхолдер с данными через setFavoritesPlaceholder.php. Как вариант в чанке товара проверять если нет плейсхолдера то вызвать setFavoritesPlaceholder.php
