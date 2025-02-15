Role Name
=========

Роль устанавливает клиентские компоненты для работы с NFS

Requirements
------------
Протестировано в ОС Astra Linux 1.7

Role Variables
--------------

Dependencies
------------

Example Playbook
----------------

```
- name: work on nfs client
  hosts: nfsc
  gather_facts: 0
  become: true
  roles:
    - role: nfs-client_install
```

License
-------

Education

Author Information
------------------
Roman Kluev
bukozavr@gmail.com
