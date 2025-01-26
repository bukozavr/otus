Role Name pve_update_vm
=========

В ВМ устанавливает гостевые дополнения Proxmox. Обновляет установленные пакеты. Используется для настройки ВМ в среде Proxmox.
Если обновления были установлены, ВМ перезагрузится. Перезагрузка требуется чтобы ВМ нормально управлялясь внутри Proxmox.

Requirements
------------

Требует подключения к ВМ по ssh или с помощью учетных данных из файла конфигурации ansible

Role Variables
--------------

Не использует переменных

Dependencies
------------

Нет зависимостей

Example Playbook
----------------

```
- name: work on vm
  hosts: astra
  gather_facts: 0
  become: true
  roles:
    - role: pve_update_vm
```

License
-------

Education

Author Information
------------------
Roman Kluev
bukozavr@gmail.com