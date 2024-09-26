# Модуль корзины для minishop2

- Фронт передает данные по товару (цена, ID, единица измерения) на бэк. Таким образом можно динамически менять единицы измерения, цены и в корзине будут данные по выбранной еденице
  - AJAX запросы летят на `snippets/ajax.php` который перенаправляет на процессоры `core/elements/modules/cart/backend/processors`
  - Решил делать через сниппет `ajax.php` а не через коннектор, так как экземпляр $modx в любом случае будет получен и не ннужно возиться и подключать его.
- Вся логика расчета в `processors/`
- Корзина хранится в сессиях
- Так как JS корзины глобален, можно из любой точки сайта вызвать функцию

```js
cart.event("plus", null, PRODUCT_ID);
```

и добавить или удалить товар из корзины

## FRONTEND

- `frontend/chunks/cart-product-controls.tpl`
  - Кнопки для регулирования товара в корзине
  - Тут необходимо указать кнопкам глобальные события на onclick и onchange

```js
cart.event("plus", this, PRODUCT_ID);
cart.event("minus", this, PRODUCT_ID);
cart.event("change", this, PRODUCT_ID);

cart.second_events.clear(); // Полностью очистит корзину
```

- Для кнопки кол-ва указать аттрибу. Необходим для изменения кол-ва при кликах на + -
  - `data-cart-product-count="PRODUCT_ID"`
- Рядом с кнопками расположить форму со скрытыми полями для передачи данных по товару в калькулятор. Желательно рядом с кнопками так как при клике на + - сначала будет поиск формы по общему parentNode для легкости JS
  - `data-cart-form="PRODUCT_ID"`
  - ```html
    <form data-cart-form="PRODUCT_ID">
      <input type="hidden" name="id" value="PRODUCT_ID" />
      <input type="hidden" name="price" value="PRODUCT_PRICE" />
      <input type="hidden" name="unit" value="PRODUCT_UNIT" />
    </form>
    ```
- Для обновления на фронте общего кол-ва в корзине использовать элемент с аттрибутом `data-cart-product-total`
- С бэка данные о текущем кол-ве товаров можно получить сниппетом `backend/snippets/getProductTotal.php`
- Для вывода суммы по товару установить аттрибут data-cart-product-summ="PRODUCT_ID"

## BACKEND

- `backend/classes` - Основные классы для работы с корзиной. Могут использоваться и в сниппетах
- `backend/console` - Скрипты для запуска в консоли. Пока там установка нужных опций
- `backend/processors` - Основные процессоры для работы с изменением кол-ва товаров в корзине
- `backend/snippets` - Сниппеты
- `snippets/getProductData.php` - Отдает на страницу по PRODUCT_ID Данные по товару в корзине
- `snippets/getProductTotal.php` - Отдает на страницу общее кол-во позиций в корзине

## Установка

- Запустить `backend/console/setOptions.php`
  - Укажите верные параметры
  - Создаст необходимые настройки для работы
  - Можно создать вручню
- Вызвать `{'@FILE modules/cart/backend/snippets/ajax.php' | snippet}` в начале страницы
- В карточках товара вызывать `modules/cart/backend/frontend/cart-product-controls.tpl`

## Опции необходимые для работы скрипта

- `cart_module_path` - Путь до модуля корзины
  - По умолчанию `/core/elements/modules/cart/`
  - Можно установить через `console/setOptions.php`
