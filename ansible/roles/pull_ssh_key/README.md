Role Name
=========

Копирует с сервера ansible на удаленный сервер имеющийся публичный ssh ключ в профиль заданного пользователя. Добавляет ключ в authorized_key

Requirements
------------

Протестировано на ОС Ubuntu 24.04
Ключ копируется из жестко заданного каталога на сервере ansible. 

Role Variables
--------------

key_user: "borg" - пользователь, в чей профиль будет скопирован имеющийся публичный ключ для возможности удаленного подключения к данному серверу

Dependencies
------------

Используется обычно в паре с плейбуком get_ssh_key, который копирует ключ на другой удаленный сервер. Используется чтбоы настроить возможность подключения по ssh ключам с одного сервера на другой при отсутствии начального доверия между серверами и при невозможности подключения с паролем

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
