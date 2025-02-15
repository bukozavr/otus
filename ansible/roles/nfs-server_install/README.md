Role Name
=========

Роль устанавливает серверные компоненты для работы с NFS, создает корневой каталог для общего ресурса

Requirements
------------
Протестировано в ОС Astra Linux 1.7

Role Variables
--------------

nfs_root: "/srv/share-nfs"
Переменная, где указан путь к корневому каталогу. Если при вызове роли не будет задан иной путь, будет использован путь по умолчанию

Dependencies
------------
Роль рекомендуется использовать в паре с ролью nfs-server_export, где выполняется экспорт каталога для общего ресурса

Example Playbook
----------------

```
- name: work on nfs server
  hosts: nfss
  gather_facts: 0
  become: true
  vars:
    nfs_root: "/srv/share"
    nfs_share: "upload"
    nfs_client: "192.168.1.232"
  roles:
    - role: nfs-server_install
    - role: nfs-server_export
  tags: [never, init]
```

License
-------

Education

Author Information
------------------
Roman Kluev
bukozavr@gmail.com
