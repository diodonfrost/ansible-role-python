# ansible-role-python

[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-python.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-python)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.python-660198.svg)](https://galaxy.ansible.com/diodonfrost/python)

Ansible role for compile and install Python 3.

## Requirements

This role was developed using Ansible 2.5 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.python` to install the role on your system.
*   Ansible >= 2.5

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 7
    - 6
- name: Fedora
  versions:
    - 32
    - 31
    - 30
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - buster
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - disco
    - bionic
    - xenial
    - trusty
- name: OracleLinux
  versions:
    - 8
    - 7
    - 6
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
- name: ArchLinux
  versions:
    - any
```

## Role Variables

This role has multiple variables. The defaults for all these variables are the following:

```yaml
---
# defaults file for ansible-role-python

# The version of Python to install
python_version: 3.7.6

# The location where to download the Python archive
python_tarball_url: https://www.python.org/ftp/python/{{ python_version }}/Python-{{ python_version }}.tgz

# Install python-pip
# Valid values: install, upgrade
ensure_pip: install

# Allow N jobs at once
# Default use number of vcpu on the system
make_num_threads: "{{ ansible_processor_vcpus }}"

# Clean dependency use for python compilation
clean_package_requirements: false
```

## Dependencies

None

## Example Playbook

This role can also install a specific version of Python.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.python
      vars:
        - python_version: 3.7.6
```

Install Python 3.7.6 and Python 3.6.10

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.python
      vars:
        - python_version: 3.7.6
    - role: diodonfrost.python
      vars:
        - python_version: 3.6.10
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.
For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# test python 3.7 install on CentOS 8
kitchen test python-37-centos-8

# for development, create environment
kitchen create python-37-centos-8

# Apply ansible playbook
kitchen converge python-37-centos-8

# Apply inspec tests
kitchen verify python-37-centos-8
```

## License

Apache 2

## Author Information

This role was created in 2020 by diodonfrost.
