# mapResources

Отдает древовидный массив данных по ресурсам

Идея скрипта следующая - Часто требуется на одной странице отобразить ресурсы из одного и того же родителя. Например на gbi78 ресурсы из каталога используются в сайдбаре, мобильном меню, блоке с категориями на главной странице.

## Вызов

- Вызываем один раз данный сниппет в начале страницы.

```php
{"@FILE snippets/map-resources/mapResources.php" | snippet}
```

- Получим массив данных по ресурсам:

```php
$data = [
	["id" => 10, "pagetitle" => "Бетон", "children" => [...]]
];
```

## Логика

- Скрипт находит ресурсы по заданным параметрам переданным по аналогии с pdoResources через json в поле 'where' => '{"id:in":[]}'

## Параметры

- `parents` (string) - ID родителей через запятую
- `resources` (string) - ID ресурсов через запятую
- `depth` (number) - Уровень вложенности. По умолчанию 1
- `where` (json) - Условие для выборки
- `toPlaceholder` (string) - Если не пусто, сниппет сохранит все данные в плейсхолдер с этим именем, вместо вывода на экран
- `transfer_ids` (array) - Массив формата [10=>200] ID ресурса => ID родителя куда перенести ресурс
- `transfer_only` (bool) - Если true то оставит только перемещенные ресурсы в родителе. Наример передан массив [10=>200] значит ресурс с ID 10 улетит в родителя с ID 200 и выведется только он в ней
- `sortby` (array) - Массив ID для сортировки

## Скрипты в пакете

- mapMenu.php - Генерация меню на основе полученных данных из mapResources.php
  - Параметры:
    - `data` - Массив карты ресурсов
- mapHandler.php - Управление картой ресурсов. Вернет новый обработанный массив полученный в `data`
  - Параметры:
    - `data` - Массив карты ресурсов
    - `where` (json) - Условия для выборки
      - {"parent:in" : [1,2,3]}
      - С `where` можно передать `depth`. Тогда выбрал ресурсы по parent:in скрипт пойдет ниже на значение deph и получит детей
    - `sortby` (json) - Поля сортировки. {"pagetitle" : ["Плиты","Бетон"]} - Массив будет отсортирован по переданым pagetitle, остальные данные останутся не тронутыми
