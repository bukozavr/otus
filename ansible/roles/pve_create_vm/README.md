Role Name pve_create_vm
=========

Роль для создания виртуальной машины в среде Proxmox.
Создает на основе образа cloud-init виртуальную машину с задаными параметрами. Устанавливает настройки сети в режиме bridge со статическим ip адресом, копирует ssh ключи. Для настройки параметров используется механизми cloud-init. Добавляет дополнительные диски. Если в ВМ какие-то диски удалить, то при повторном запуске плейбука они снова будут добавлены.

Requirements
------------

Требует наличие Proxmox и учетной записи с правами на создание ВМ

Role Variables
--------------

Переменные заданы в разделе Defaults и могут быть перезаписаны при вызовах из других плейбуков

vm_last_octet: 222 - последний октет ip адреса. Используется как идентификатор ВМ, используется в имени ВМ, используется при формировании ip адреса ВМ 192.168.1.ххх
vmuser: user - имя пользователя ВМ по умолчанию. Имеет права суперпользователя
vmpass: 12345678 - пароль пользователя
img_alias: noble - алиас образа ВМ
add_disks: 0 - количество дополнительных дисков кроме системного.
add_disks_size: 1 - размер дополнительного диска в ГБ

Переменная задана в Vars
img_dir: "/srv/images" - путь к образам cloud-init

Dependencies
------------

Ожидается, что образы ВМ уже скачаны в Proxmox в рамках исполнения роли pve_load_images. Каждый образ имеет ссылку - алиас

Example Playbook
----------------

```
- name: work on proxmox - create vm s232 astra
  hosts: proxmox_root
  gather_facts: 0
  vars:
    vm_last_octet: 232
    img_alias: astra
    add_disks: 5
    add_disks_size: 2
  roles:
    - role: pve_create_vm
      hosts: proxmox_root
      tags: [never, init, restore]
```

License
-------

Education

Author Information
------------------
Roman Kluev
bukozavr@gmail.com