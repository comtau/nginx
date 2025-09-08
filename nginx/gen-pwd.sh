#!/bin/bash

# Запрос логина
read -p "Введите логин: " LOGIN

# Запрос пароля (скрытый ввод)
read -p "Введите пароль: " PASSWORD
echo

# Генерация htpasswd через Docker
docker run --rm --entrypoint htpasswd httpd:2.4-alpine \
  -Bbn "$LOGIN" "$PASSWORD" > passwd/htpasswd

# Проверка
echo "Содержимое passwd/htpasswd:"
cat passwd/htpasswd
