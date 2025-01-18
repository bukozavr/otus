# OTUS Linux Administrator Pro

Клюев Роман (Kluev Roman)

## Описание тетсового стенда

Для тестирования плейбуков Ansible развернуто несколько ВМ с ОС Ubuntu 22.04, Ubuntu 24.04, AstraLinux 1.7.
Команды запуска плейбуков:
ansible-playbook playbook.yml -i inventory -l ubuntu
ansible-playbook playbook.yml -i inventory -l astra
ansible-playbook playbook.yml -i inventory -l all

## ДЗ 1. Обновление ядра

- Vagrant - пропущено. Недоступен официально с территории РФ в связи с этим невозможно использование в продуктивной среде предприятия
- Kernel update - написана роль Ansible для обновления ядра для ОС Ubuntu 22.04, 24,04
  https://github.com/bukozavr/otus/blob/master/ansible/run_kernel_update.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/kernel_update

## ДЗ 2. Установка и настройка NGINX

- nginx_install - написана роль Ansible для установки и настройки web сервера NGINX
  https://github.com/bukozavr/otus/blob/master/ansible/run_nginx_install.yml
  https://github.com/bukozavr/otus/tree/master/ansible/roles/nginx_install

