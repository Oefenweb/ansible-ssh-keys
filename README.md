## ssh-keys

[![Build Status](https://travis-ci.org/Oefenweb/ansible-ssh-keys.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-ssh-keys) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-ssh--keys-blue.svg)](https://galaxy.ansible.com/list#/roles/4176)

Manage ssh authorized keys and known hosts in Debian-like systems.

#### Requirements

None

#### Variables

* `ssh_keys_users`: [default: `[]`]: Users
* `ssh_keys_users.{n}.name`: [required]: Destination username
* `ssh_keys_users.{n}.authorized_keys`: [required]: Authorized keys
* `ssh_keys_users.{n}.authorized_keys.{n}.key`: [required]: Filename of public key
* `ssh_keys_users.{n}.authorized_keys.{n}.state`: [default: 'present']: State
* `ssh_keys_known_hosts`: [default: `[]`]: Known hosts
* `ssh_keys_known_hosts.{n}.hostname`: [required]: Hostname
* `ssh_keys_known_hosts.{n}.enctype`: [required]: Type of the fingerprint
* `ssh_keys_known_hosts.{n}.fingerprint`: [required]: Fingerprint

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
      - name: root
        authorized_keys:
          - key: /root/.ssh/id_rsa.pub
            state: present
    ssh_keys_known_hosts:
      - hostname: bitbucket.org
        enctype: ssh-rsa
        fingerprint: 'AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw=='
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
