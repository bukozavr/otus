Role Name
=========

Роль создает подкаталог в корневом каталоге NFS и выполняет экспорт каталога для использования в качестве общего ресурса
Информация об экспортированном ресурсе добавляется в /etc/exportfs

Requirements
------------
Протестировано в ОС Astra Linux 1.7

Role Variables
--------------

nfs_root: "/srv/share-nfs" - путь к корневому каталогу NFS. Используется в качестве части пути к каталогу для экспорта
nfs_share: "share" - путь к подкаталогу. Используется в качестве части пути к каталогу для экспорта
nfs_client: "*" - ip адрес клиента, для которого будет экспортирован ресурс
Если при вызове роли не будут заданы иные значения переменных, будут использоваться значения по умолчанию

Dependencies
------------

Роль рекомендуется использовать в паре с ролью nfs-server_install, где устанавливаются компоненты сервера NFS и создается корневой каталог NFS

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
