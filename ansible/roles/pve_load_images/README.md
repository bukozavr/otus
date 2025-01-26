Role Name pve_load_images
=========
Роль для скачивания образов cloud-init в среде Proxmox.
Образы скачиваются. Создаются символьные ссылки на образы общего вида типа noble, astra. Это позволяет указывать алиасы образов в других ролях и не зависеть от конкретной подверсии образа

Requirements
------------
Требует наличие Proxmox и учетной записи с доступом к серверу Proxmox

Role Variables
--------------
В переменных задаются ссылки для скачивания образов

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

```
- name: work on proxmox - update images
  hosts: proxmox_root
  gather_facts: 0
  roles:
    - role: pve_load_images
      hosts: proxmox_root
      tags: [never, init]
```

License
-------

Education

Author Information
------------------
Roman Kluev
bukozavr@gmail.com
