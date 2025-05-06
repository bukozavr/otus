Role Name
=========

Плейбук конфигурирует на клиенте сервис и таймер для запуска бэкапов с помощью borgbackup.

Requirements
------------

Протестировано в ОС Ubuntu 24.04
На клиенте и сервере должен быть установлен borgbackup. Должно быть настроено подключение к borg серверу с помощью ssh ключей под учеткой borg_user

Role Variables
--------------

borg_server: "192.168.1.233" - имя или ip borg сервера хранения бэкапов
borg_user: "borg" - учетная запись на borg сервере
repo_pass: "12345678" - пароль на репозиторий на borg сервере
repo_path: "/var/backup/borg/" - пусть к репозиторию
backup_root_path: "/" - корневой путь к каталогу, который будет копироваться
backup_dir: "etc" - каталог, который будет копироваться. Имя каталога использутся в формировании имени архивной копии


Dependencies
------------

Предварительно должен быть инициализирован репозиторий на сервере хранения бэкапов borg. Если репозиторий не инициализирован, при запуске плейбука возникнет ошибка поскольку сервис не сможет стартовать

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
