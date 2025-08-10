[all:vars]
ansible_connection=docker
ansible_python_interpreter=/usr/bin/python3

[vault-servers]
vault1 ansible_host=vault-server

[proxy-nodes]
proxy1 ansible_host=proxy-node