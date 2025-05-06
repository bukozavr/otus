Role Name
=========

Копирует с удаленного сервера на сервер ansible публичный ssh ключ заданного пользователя. 

Requirements
------------

Протестировано на ОС Ubuntu 24.04
Ключ копируется в жестко заданный каталог. При обработке плейбуком нескольких серверов останется только ключ с последнего сервера. Не рекомендуется запускать плейбук для нескольких серверов

Role Variables
--------------

key_user: "root" - пользователь, чей ключ будет скопирован с удаленного сервера

Dependencies
------------

Используется обычно в паре с плейбуком pull_ssh_key, который копирует ключ на другой удаленный сервер. Используется чтбоы настроить возможность подключения по ssh ключам с одного сервера на другой при отсутствии начального доверия между серверами и при невозможности подключения с паролем

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
