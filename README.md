# MODX. Интернет-магазин. minishop2

## Рекомендации

В данном проекте сложные блоки выведены в модули modules/

В статичных блоках сертификаты, партнеры, преимущества и тд данные необходимо хранить в JSON

## Установка

- Распаковать данные папки и файлы в корень проекта modx
- npm install
- Разработка
  - npm run dev - Запустит devServer
  - В webpack.config.js указать
    - devServer.proxy.target - домен проекта
    - devServer.host - домен проекта
- Прод
  - npm run build

## Опции контекста

Основные опции контекста которые используются в проекте

- catalog_id
- related-services-id
- email
- phone
- phone-2
- whatsapp-link
- telegram-link
- company_name
- footer_menu_ids - Перечисляем ID для 3х блоков = [[1,2,3],[6,4,23],[6,9,13,14]]
- header_menu_ids - Строка с ID ресурсов через запятую '1,2,3,4'
- descriptor
- google_tag_manager
- ids_plitperekritiya - Категории плит перекрытия
- ids_plitdorozh - Категории плит дорожных

## Хранение глобальных данных

Плейсхолдеры с глобальными данными хранятся в core\elements\snippets\placeholders\index.php
