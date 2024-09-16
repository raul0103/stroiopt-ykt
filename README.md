# MODX. Интернет-магазин. minishop2

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
- email
- phone
- whatsapp-link
- telegram-link
