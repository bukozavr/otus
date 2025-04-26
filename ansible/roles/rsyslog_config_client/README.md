Role Name
=========

Настройка на клиентском сервере журналирования, в том числе отправка на удаленынй сервер
На сервере настраиваются две службы – auditd и rsyslog
Служба auditd в данном сценарии обеспечивает контроль за изменениями в файлах и каталогах, связанных с nginx
Служба rsyslog обеспечивает запись событий в локальные журналы и отправку на Log сервер. Настройка журналирования описана в отдельном файле конфигурации.
Критичные события будут записываться локально в /var/log/otus/crit.log и на удаленный сервер
Событиям, записываемым в файл audit.log будет присваиваться категория local6, уровень критичности info. События будут отправляться на удаленный сервер.
Также настраивается журналирование событий для nginx

Requirements
------------

На сервере должны быть установлены службы auditd, rsyslog, nginx

Role Variables
--------------

rsyslog_server - ip адрес или DNS имя сервера rsyslog

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

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
