## ssh-keys

[![CI](https://github.com/Oefenweb/ansible-ssh-keys/workflows/CI/badge.svg)](https://github.com/Oefenweb/ansible-ssh-keys/actions?query=workflow%3ACI)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-ssh--keys-blue.svg)](https://galaxy.ansible.com/Oefenweb/ssh_keys)

Manage ssh public key authentication (public / private / authorized keys and known hosts) in Debian-like systems.

#### Requirements

None

#### Variables

* `ssh_keys_generate_keys`: [default: `[]`]: Keys to generate locally
* `ssh_keys_generate_keys.{n}.path`: [required] The local path where the key should be generated
* `ssh_keys_generate_keys.{n}.cipher`: [default: `None`]: The cipher to encrypt the private key
* `ssh_keys_generate_keys.{n}.format`: [default: `OpenSSH`]: The format of the public key
* `ssh_keys_generate_keys.{n}.force`: [default: `false`]: Whether to regenerate the key pair if it already exists
* `ssh_keys_generate_keys.{n}.owner`: [required]: The name of the user that should own the key pair
* `ssh_keys_generate_keys.{n}.group`: [default: `owner`]: The name of the group that should own the key pair
* `ssh_keys_generate_keys.{n}.mode`: [default: `0600`]: The UNIX permission mode bits of the key pair
* `ssh_keys_generate_keys.{n}.passphrase`: [default: `''`]: The passphrase for the private key
* `ssh_keys_generate_keys.{n}.size`: [default: `4096`]: Size in bits of the TLS/SSL key to generate
* `ssh_keys_generate_keys.{n}.type`: [default: `RSA`]: The algorithm used to generate the private key

* `ssh_keys_generate_keys_command`: [optional, default: `_ssh_keys_generate_keys_command`]:
* `ssh_keys_generate_keys_become`: [optional, default: `false`]: Whether or not to use `sudo` when generating ssh keys (locally)

* `ssh_keys_private_keys`: [default: `[]`]: Private key declarations
* `ssh_keys_private_keys.{n}.owner`: [required]: The name of the user that should own the file
* `ssh_keys_private_keys.{n}.group`: [default: `owner`]: The name of the group that should own the file
* `ssh_keys_private_keys.{n}.mode`: [default: `0600`]: The UNIX permission mode bits of the file
* `ssh_keys_private_keys.{n}.src`: [required]: The local path of the key
* `ssh_keys_private_keys.{n}.dest`: [default: `id_rsa`]: The remote path of the key (relative to `home/.ssh/`)
* `ssh_keys_private_keys.{n}.dest_absolute`: [optional]: The remote path of the key
* `ssh_keys_private_keys.{n}.dest_managed`: [default: `true`]: Whether or not the remote path of the key should be created
* `ssh_keys_private_keys.{n}.state`: [default: `present`]: State

* `ssh_keys_public_keys`: [default: `[]`]: Public key declarations
* `ssh_keys_public_keys.{n}.owner`: [required]: The name of the user that should own the file
* `ssh_keys_public_keys.{n}.group`: [default: `owner`]: The name of the group that should own the file
* `ssh_keys_public_keys.{n}.mode`: [default: `0644`]: The UNIX permission mode bits of the file
* `ssh_keys_public_keys.{n}.src`: [required]: The local path of the key
* `ssh_keys_public_keys.{n}.dest`: [default: `id_rsa.pub`]: The remote path of the key (relative to `home/.ssh/`)
* `ssh_keys_public_keys.{n}.dest_absolute`: [optional]: The remote path of the key
* `ssh_keys_public_keys.{n}.dest_managed`: [default: `true`]: Whether or not the remote path of the key should be created
* `ssh_keys_public_keys.{n}.state`: [default: `present`]: State

* `ssh_keys_authorized_keys`: [default: `[]`]: Authorized key declarations
* `ssh_keys_authorized_keys.{n}.owner`: [required]: The name of the user that should own the file
* `ssh_keys_authorized_keys.{n}.src`: [required]: The local path of the key
* `ssh_keys_authorized_keys.{n}.state`: [optional, default: `present`]: State
* `ssh_keys_authorized_keys.{n}.path`: [optional, default: `authorized_keys`]: Authorized keys file (absolute path, default to `~/.ssh/authorized_keys`)

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
    ssh_keys_generate_keys:
      - path: ../../../files/ssh-keys/id_rsa
        comment: RSA key
    ssh_keys_private_keys:
      - owner: root
        src: ../../../files/ssh-keys/id_rsa
    ssh_keys_public_keys:
      - owner: root
        src: ../../../files/ssh-keys/id_rsa.pub
    ssh_keys_authorized_keys:
      - owner: root
        src: ../../../files/ssh-keys/id_rsa.pub
    ssh_keys_known_hosts:
      - hostname: github.com
        enctype: ssh-rsa
        fingerprint: 'AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=='
```

#### License

MIT

#### Author Information

* Mark van Driel
* Mischa ter Smitten

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Oefenweb/ansible-ssh-keys/issues)!
