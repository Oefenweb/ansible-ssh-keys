## ssh-keys

[![Build Status](https://travis-ci.org/Oefenweb/ansible-ssh-keys.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-ssh-keys) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-ssh--keys-blue.svg)](https://galaxy.ansible.com/list#/roles/4176)

Manage ssh public key authentication (public / private / authorized keys and known hosts) in Debian-like systems.

#### Requirements

None

#### Variables

* `ssh_keys_users`: [default: `[]`]: User declarations
* `ssh_keys_users.{n}.owner`: [required]: The name of the user that should own the file(s)
* `ssh_keys_users.{n}.group`: [optional, default `owner`]: The name of the group that should own the file(s)
* `ssh_keys_users.{n}.home`: [required]: The path of the home directory (of `owner`)
* `ssh_keys_users.{n}.private_keys`: [default: `[]`]: Private keys declarations
* `ssh_keys_users.{n}.private_keys.{n}.src`: [required]: The local path of the key
* `ssh_keys_users.{n}.private_keys.{n}.dest`: [required]: The remote path of the key (relative to `home/.ssh/`)
* `ssh_keys_users.{n}.private_keys.{n}.state`: [default: 'present']: State
* `ssh_keys_users.{n}.public_keys`: [default: `[]`]: Public keys declarations
* `ssh_keys_users.{n}.public_keys.{n}.src`: [required]: The local path of the key
* `ssh_keys_users.{n}.public_keys.{n}.dest`: [required]: The remote path of the key (relative to `home/.ssh/`)
* `ssh_keys_users.{n}.public_keys.{n}.state`: [default: `present`]: State
* `ssh_keys_users.{n}.authorized_keys`: [default: `[]`]: Authorized keys declarations
* `ssh_keys_users.{n}.authorized_keys.{n}.src`: [required]: The local path of the key
* `ssh_keys_users.{n}.authorized_keys.{n}.state`: [default: `present`]: State

* `ssh_keys_known_hosts`: [default: `[]`]: Known hosts declarations
* `ssh_keys_known_hosts.{n}.hostname`: [required]: The hostname
* `ssh_keys_known_hosts.{n}.enctype`: [required]: The type of the fingerprint
* `ssh_keys_known_hosts.{n}.fingerprint`: [required]: The actual fingerprint

## Dependencies

None

#### Example

```yaml
---
- hosts: all
  roles:
  - ssh-keys
  vars:
    ssh_keys_users:
      - owner: root
        home: /root
        private_keys:
          - src: ../../../files/ssh-keys/id_rsa
            dest: id_rsa
            state: present
        public_keys:
          - src: ../../../files/ssh-keys/id_rsa.pub
            dest: id_rsa.pub
            state: present
        authorized_keys:
          - src: ../../../files/ssh-keys/id_rsa.pub
            state: present
    ssh_keys_known_hosts:
      - hostname: github.com
        enctype: ssh-rsa
        fingerprint: 'AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=='
```

The `fingerprint` and `enctype` can be obtained using `ssh-keyscan`: `ssh-keyscan github.com`.

#### License

MIT

#### Author Information

Mark van Driel
Mischa ter Smitten

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Oefenweb/ansible-ssh-keys/issues)!
