
output "vault_server_ip" {
  description = "The IP address of the Vault Server container."
  value       = docker_container.vault_server.network_data[0].ip_address
}

output "proxy_node_ip" {
  description = "The IP address of the Proxy Node container."
  value       = docker_container.proxy_node.network_data[0].ip_address
}