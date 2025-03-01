#!/bin/bash

# домашняя работа 10. Скрипты bash
# bukozavr@gmail.com

# формат даты в логе
#date 14/Aug/2019:04:12:10 +0300

# путь к проверяемому логу сервера
my_log="/var/log/access-4560-644067.log"
# файл проверки. Содержит обрабатываемую часть лога
check_file="/tmp/check.tmp"
# таймаут хранения файла проверки
check_file_timeout=600
# текст отчета. Отправляется по почте
result_file="/tmp/result.txt"
# адрес получателя отчета
mail_to="root@test.local"

# # # # # # # # #  Дальше ничего менять не нужно

# дата в тестовом логе
my_date="14/Aug/2019"
# дата для реального лога. Раскомментировать эту строку для анализа реального лога
#my_date=$(LC_ALL=en_US.utf8 date +%d/%b/%Y)

my_hour=$(date +%H)
my_hour=$(($my_hour - 1))
log_date=$my_date:$my_hour
echo "check date and hour $log_date"
echo "check log $my_log"

# Проверка наличия файла и его возраста. 
# Если скрипт работает слишком долго, то что-то пошло не так
# Скорее всего скрипт завершился аварийно и не удали файл сам
# Файл удалить для обеспечения возможности запуска
if [ -f "$check_file" ] && [ $(($(date +%s) - $(stat -c %Y "$check_file"))) -gt $check_file_timeout ]; then
    rm "$check_file"
    echo "Check file is too old. Deleted: $check_file"
fi

# если файл существует, значит другой экземпляр скрипта уже работает.
if [[ -e $check_file ]]; then
   echo -e "Another instance of script already running \n Exit"
else
   echo -e "Working... \n"

grep "$log_date" "$my_log" > "$check_file"

echo "Worked $(cat $check_file | wc -l) lines"

# формируем файл с текстом отчета
echo -e "Hello," > $result_file
echo -e "Report from $(head -n 1 $check_file | awk '{print $4 $5}') to $(tail -n 1 $check_file | awk '{print $4 $5}')" >> $result_file

# 1. ip address
# Объявляем ассоциативный массив
declare -A my_hash

# Добавляем элементы в хеш-таблицу

# $1 = ip address in log file
echo -e "\n Top 3 IP addresses:" >> $result_file
for myx in $(cat $check_file | awk '{print $1}')
do
  if [[ ${my_hash[$myx]+exists} ]]; then
    my_hash[$myx]=$(( ${my_hash[$myx]} + 1 ))
  else
    # Добавляем новый элемент в массив и устанавливаем значение 1, если ключ не найден
    my_hash[$myx]=1
  fi
done
# Выводим обновленный ассоциативный массив
for key in "${!my_hash[@]}"; do
    echo "$key ${my_hash[$key]}"
done | sort -k 2 -r | head -n 3 >> $result_file

# 2. url address

# Объявляем ассоциативный массив
my_hash=()

# Добавляем элементы в хеш-таблицу

# $11 = url address in log file
echo -e "\n Top 3 URL addresses:" >> $result_file
for myx in $(cat $check_file | awk '{print $11}' | grep -iG [a-z] )
do
  if [[ ${my_hash[$myx]+exists} ]]; then
    my_hash[$myx]=$(( ${my_hash[$myx]} + 1 ))
  else
    # Добавляем новый элемент в массив и устанавливаем значение 1, если ключ не найден
    my_hash[$myx]=1
  fi
done
# Выводим обновленный ассоциативный массив
for key in "${!my_hash[@]}"; do
    echo "$key ${my_hash[$key]}"
done | sort -g -k 2 -r | head -n 3 >> $result_file


# 3. all server errors 5xx

echo -e "\n All server errors (if exist):" >> $result_file
cat $check_file | awk '{print $1 $4 $5 $6 $7 $8 $9}'  | grep 5[0-9][0-9]$ >> $result_file

# 4. all response code

# Объявляем ассоциативный массив
my_hash=()
#declare -A my_hash

# Добавляем элементы в хеш-таблицу

# $9 = response code in log file
echo -e "\n All response codes:" >> $result_file
for myx in $(cat $check_file | awk '{print $9}' | grep [0-9][0-9][0-9])
do
  if [[ ${my_hash[$myx]+exists} ]]; then
    my_hash[$myx]=$(( ${my_hash[$myx]} + 1 ))
  else
    # Добавляем новый элемент в массив и устанавливаем значение 1, если ключ не найден
    my_hash[$myx]=1
  fi
done
# Выводим обновленный ассоциативный массив
for key in "${!my_hash[@]}"; do
    echo "$key ${my_hash[$key]}"
done | sort -g -k 2 -r  >> $result_file

# выподим итоговый отчет на экран
cat $result_file


mail_subject="web log $log_date"
# отправляем отчет по почте
cat $result_file | mail -s "$mail_subject" "$mail_to"

# удаляем проверочный файл
rm $check_file
fi


