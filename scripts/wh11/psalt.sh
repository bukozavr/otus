#!/bin/bash

# аналог команды ps ax
# выводит список процессов

# Получение списка всех директорий в /proc
pids=$(ls /proc | grep -E '^[0-9]+$' | sort -n)

# Подсчет количества процессов
count=0
echo -e "COUNT\tPID\tTTY\tSTAT\tTIME\tCOMMAND"
# Вывод результатов в формате "порядковый номер, pid, stat, cmdline" для всех процессов
for pid in $pids; do
    if [[ -f "/proc/$pid/comm" ]]; then
        comm=$(cat /proc/$pid/comm)
        count=$((count + 1))
        stat=$(awk '{print $3}' /proc/$pid/stat)
        # время работы процесса utime+stime, сек
        my_time_sec=$(cat /proc/$pid/stat | awk '{total = (($14 + $15)/100); printf "%.0f\n",total}')
         # Вычисляем минуты и остаток секунд
        minutes=$(( my_time_sec / 60 ))
        remaining_seconds=$(( my_time_sec % 60 ))
        # Форматируем вывод в формате mm:ss
        my_time=$(printf "%d:%02d" $minutes $remaining_seconds)

        # Получение tty, если он назначен
        tty=$(readlink /proc/$pid/fd/0 | awk '{gsub(/\/dev\//, ""); print}')
        if [[ $tty != *"pts"* ]]; then
          tty="?"
        fi
        # получение командной строки. Для обычных процессов и процессов ядра это разливается
        cmdline=$(tr '\0' ' ' < /proc/$pid/cmdline)

        # Проверка, является ли процесс процессом ядра
        if [ ${#cmdline} -lt 1 ]; then
            cmdline=$(tr '\0' ' ' < /proc/$pid/comm)
        else
            cmdline=$(tr '\0' ' ' < /proc/$pid/cmdline)
        fi


        echo -e "$count\t$pid\t$tty\t$stat\t$my_time\t$cmdline" | cut -c 1-$columns

    fi
done
