Role Name
=========

при первом подключении по ssh к удаленному серверу с помощью ранее установленных ssh ключей возникает запрос доверия в удаленному серверу. Данный плейбук выполняет подключение к удаленному хосту чтобы информация о нем добавилась в known_hosts текущего пользователя.

Requirements
------------

Протестровано в ОС Ubuntu 24.04

Role Variables
--------------

new_host - имя или ip удаленного сервера

Dependencies
------------


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
