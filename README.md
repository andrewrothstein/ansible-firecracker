andrewrothstein.firecracker
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-firecracker.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-firecracker)

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
