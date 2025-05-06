Role Name
=========

Подготавливает сервер для borgbackup.
Роль создает каталог /var/backup, пользователя borg, ~borg/.ssh, и файл authorized_keys

Requirements
------------

Протестировано в ОС Ubuntu 24.04
ПО borgbackup инсталируется отдельно. Должно быть установлено для правильной работы данного плейбука

Role Variables
--------------

Не используется переменных

Dependencies
------------

Не использует зависимости

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:


  roles:
    - role: borgbackup_install
    - role: borgbackup_config_server
  tags: [never, init]


License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
