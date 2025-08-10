locals {
  inventory_content = templatefile("${path.module}/inventory.tpl", {
    vault_name = docker_container.vault_server.name
    proxy_name = docker_container.proxy_node.name
  })
}

resource "local_file" "ansible_inventory" {
  content  = local.inventory_content
  filename = "${path.module}/../ansible/inventory.ini"
}