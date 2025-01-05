# Role Name: kernel_update

=========
Роль для обновления ядра ОС с помощью mainline из репозитория ppa:cappelikan/ppa. 
Неофициальный метод! Используются неподписанные ядра! Применять только в учебных и тестовых целях!
https://learnubuntu.com/upgrade-kernel/

При запуске роли устанавливаются требуемые дополнительные репозитории, компоненты. 
Выполняется обновление ядра на самую свежую версию. Выполняется перезагрузка хоста.
В конце выводится информация о версии загруженного ядра

Если версия ядра уже самая новая, то никаких изменений в системе не выполняется.

Requirements
------------
Протестировано на ОС Ubuntu 22.04 LTS, 24.04 LTS

Для успешного запуска роли требуется настроить следующее:
- подключение к целевым хостам с помощью ssh ключей
- отключить запрос пароля для повышения привилегий root. 

Role Variables
--------------
Для запуска роли не используются дополнительные переменные.
В глобальном файле ansible.cfg отключена проверка ключей хостов и несоответствие версий интерпретатора python

````
[defaults]
host_key_checking = False
interpreter_python=auto_silent
````

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------
Пример вызова роли в плейбуке. Поскольку для выполнения задач в роли требуются повышенные привилегии, то в плейбуке требуется установить режим become

````
- hosts: all
  roles:
    - role: kernel_update
      become: true
````

License
-------

Education

Author Information
------------------
Roman Kluev
bukozavr@gmail.com

