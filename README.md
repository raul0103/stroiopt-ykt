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

- address
- catalog_id
- related-services-id
- email
- phone
- whatsapp-link
- telegram-link

## Хранение глобальных данных

Плейсхолдеры с глобальными данными хранятся в core\elements\snippets\placeholders\index.php
