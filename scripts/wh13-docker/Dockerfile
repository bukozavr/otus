# Используем базовый образ Alpine Linux
FROM alpine:latest

# Устанавливаем зависимости для Nginx
RUN apk add --no-cache nginx

# Копируем конфигурационный файл Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Создаем директорию для статических файлов
RUN mkdir -p /var/www/html

# Копируем домашнюю страницу
COPY index.html /var/www/html/index.html

# Описываем порт 80 для HTTP трафика. Это просто комментарий
EXPOSE 80

# Запускаем Nginx при старте контейнера
CMD ["nginx", "-g", "daemon off;"]

