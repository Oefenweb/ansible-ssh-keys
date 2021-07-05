FROM ubuntu:20.04
MAINTAINER Mischa ter Smitten <mtersmitten@oefenweb.nl>

# python
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
	ansible && \
  apt-get clean && \
  rm -rf $HOME/.cache /var/lib/apt/lists

# provision
COPY . /etc/ansible/roles/ansible-role
WORKDIR /etc/ansible/roles/ansible-role
RUN ansible-playbook -i tests/inventory tests/test.yml --connection=local
