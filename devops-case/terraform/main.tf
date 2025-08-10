# Terraform and Provider settings
terraform {
  required_providers {
    # Existing docker provider
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    # Add the local provider here
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}



provider "docker" {}


resource "docker_network" "hepsi_devops_net" {
  name = "hepsi_devops_net"
}

# Gerekli Docker imajlarını çekiyoruz.
resource "docker_image" "vault" {
  name = "hashicorp/vault:latest"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}


resource "docker_container" "vault_server" {
  name  = "vault-server"
  image = docker_image.vault.image_id

  capabilities {
    add = ["IPC_LOCK"]
  }
  
  command = ["server", "-dev", "-dev-root-token-id=root", "-dev-listen-address=0.0.0.0:8200"]
  
  ports {
    internal = 8200
    external = 8200
  }
  
  networks_advanced {
    name = docker_network.hepsi_devops_net.name
  }

  depends_on = [docker_network.hepsi_devops_net]
}

resource "docker_container" "proxy_node" {
  name  = "proxy-node"
  image = docker_image.nginx.image_id
  
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 443
    external = 443
  }
  

  networks_advanced {
    name = docker_network.hepsi_devops_net.name
  }

  depends_on = [docker_network.hepsi_devops_net]
}