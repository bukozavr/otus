Role Name
=========

Установка компонентов docker на ОС ubuntue.

Requirements
------------

Протестировано на ubuntu 24.04

Role Variables
--------------

Не используются переменные

Dependencies
------------

Нет зависимостей

Example Playbook
----------------

- name: create_docker
  hosts: docker
  become: true  # sudo privileges
  gather_facts: 1
  roles:
    - role: docker_install
  tags: [never, init]


License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
