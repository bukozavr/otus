Role Name
=========

Для ВМ proxmox добавляются сетевые интерфейсы. Плейбук управляет настрйками ВМ через сервер виртуализации proxmox.
ВМ выключается, для нее добавляются сетевые интерфейсы, заданные в переменных, затем ВМ включается.
Все интерфейсы по умолчанию добавляются к виртуальному коммутатору vmbr1

Requirements
------------

Протестировано с Proxmox 8.3 для ВМ Ubuntu 24.04

Role Variables
--------------

vm_last_octet: "152" - идентификатор ВМ в Proxmox. В лабе совпадает с послежним октетом ip адреса
vm_bridge: "vmbr1" - имя виртуального коммутатора
nic: 
  - { nic_id: "1", nic_ip: "192.168.0.1/28" }
  - { nic_id: "2", nic_ip: "192.168.255.9/30" }
  - { nic_id: "3", nic_ip: "192.168.0.33/28" }
список параметров для новых сетевых интерфейсов. Предполагается, что nic0 у ВМ используется для управления ВМ. Дополнительные интерфейсы создаются, начиная с номера nic1. IP адрес ВМ задается с маской (формат CIDR). Шлюз по умолчанию не настраивается. Это делается отдельными настройками.

Dependencies
------------

Proxmox

Example Playbook
----------------

- name: work on proxmox - create nics on s152 ubuntu
  hosts: proxmox_root
  gather_facts: 0
  vars:
    vm_last_octet: 152
    vm_bridge: "vmbr1"
    nic:
      - { nic_id: "1", nic_ip: "192.168.0.1/28" }
      - { nic_id: "2", nic_ip: "192.168.255.9/30" }
      - { nic_id: "3", nic_ip: "192.168.0.33/28" }

  roles:
    - role: add_nics
      hosts: proxmox_root


License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
