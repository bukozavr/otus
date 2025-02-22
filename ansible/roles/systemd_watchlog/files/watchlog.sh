#!/bin/bash

#LOGFILE="/var/log/watchlog.log"  # Укажите путь к вашему файлу лога
#KEYWORD="alert"          # Укажите ваше ключевое слово
KEYWORD=$1
LOGFILE=$2


COUNT=$(grep -c "$KEYWORD" "$LOGFILE")

if [ $COUNT -eq 0 ]; then
    echo "$(date): Ключевое слово '$KEYWORD' не найдено в логе." | logger -t watchlog
    exit 1
else
    echo "$(date): Ключевое слово '$KEYWORD' найдено в логе $COUNT раз." | logger -t watchlog
    exit 0
fi
