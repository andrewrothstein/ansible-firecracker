andrewrothstein.firecracker
=========
![Build Status](https://github.com/andrewrothstein/ansible-firecracker/actions/workflows/build.yml/badge.svg)

Installs [firecracker](https://firecracker-microvm.github.io/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.firecracker
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
