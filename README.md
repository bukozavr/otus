# OTUS Linux Administrator Pro

Клюев Роман (Kluev Roman)

## Описание тестового стенда

Для тестирования плейбуков Ansible развернуто несколько ВМ с ОС Ubuntu 22.04, Ubuntu 24.04, AstraLinux 1.7.
Команды запуска плейбуков:

```
ansible-playbook playbook.yml -i inventory -l ubuntu
ansible-playbook playbook.yml -i inventory -l astra
ansible-playbook playbook.yml -i inventory -l all
```

## ДЗ 1. Обновление ядра

- Vagrant - пропущено. Недоступен официально с территории РФ в связи с этим невозможно использование в продуктивной среде предприятия
- Kernel update - написана роль Ansible для обновления ядра для ОС Ubuntu 22.04, 24,04
  https://github.com/bukozavr/otus/blob/master/ansible/run_kernel_update.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/kernel_update

## ДЗ 2. Установка и настройка NGINX

- nginx_install - написана роль Ansible для установки и настройки web сервера NGINX
  https://github.com/bukozavr/otus/blob/master/ansible/run_nginx_install.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/nginx_install

## ДЗ 6. Работа с NFS

- написаны роли Ansible для установки и настройки сервера и клиента NFS
  * nfs-client_install - установка клиента
  * nfs-client_mount - монтирование ресурса на клиенте
  * nfs-server_export - экспортирование ресурса на сервере
  * nfs-server_install - установка сервера

  https://github.com/bukozavr/otus/blob/master/ansible/run_pve_lab_nfs.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/

```
ansible-playbook run_pve_lab_nfs.yml -i pve.ini --tags init --ask-become-pass
```

## ДЗ 9. Инициализация системы. Systemd

- написаны роли Ansible для установки и настройки сервисов
  * systemd_watchlog - сервис с таймером
  * systemd_spawn-fcgi - сервис из инит файла
  * systemd_nginx - запуск нескольких nginx
  
  https://github.com/bukozavr/otus/blob/master/ansible/run_systemd_astra.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/

```
ansible-playbook run_systemd_astra.yml -i pve.ini
```

## ДЗ 16. сбор логов. rsyslog

- написаны роли Ansible для установки и настройки сервисов
  * auditd_install, rsyslog_install – установка служб
  * rsyslog_config_server – настройка параметров rsyslog на log сервере
  * rsyslog_config_client – настройка параметров rsyslog на web сервере


  https://github.com/bukozavr/otus/blob/master/ansible/run_pve_lab_wh16_ubuntu.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/

```
ansible-playbook run_pve_lab_wh16_ubuntu.yml -i pve.ini --tags init --ask-become-pas
```

## ДЗ 17. Резервное копирование. BorgBackup

- написаны роли Ansible для установки и настройки сервисов
  * auditd_install, rsyslog_install – установка служб
  * rsyslog_config_server – настройка параметров rsyslog на log сервере
  * rsyslog_config_client – настройка параметров rsyslog на web сервере
  * borgbackup_install – установка borgbackup, без настроек
  * borgbackup_config_server – создает каталог /var/backup, пользователя borg, ~borg/.ssh, и файл authorized_keys
  * borgbackup_config_backup – конфигурирует сервис и таймер для запуска бэкапа
  * generate_ssh_key – генерация ssh ключей. 
  * get_ssh_key – скопировать публичный ключ с удаленной машины
  * pull_ssh_key – скопировать публичный ключ на удаленную машину в authorized_keys указанного пользователя
  * add_known_host – добавить ключ удаленного хоста в список известных хостов на управляющем узле (клиенте).



  https://github.com/bukozavr/otus/blob/master/ansible/run_pve_lab_wh17_ubuntu.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/

```
ansible-playbook run_pve_lab_wh17_ubuntu.yml -i pve.ini --tags init --ask-become-pas
```
