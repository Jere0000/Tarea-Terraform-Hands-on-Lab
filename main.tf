terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# --- REDES PARA AISLAR LOS ENTORNOS (DEV y QA) ---
resource "docker_network" "net_dev" {
  name = "dev-network-12541"
}

resource "docker_network" "net_qa" {
  name = "qa-network-12541"
}

# ==========================================
# --- ENTORNO DEV (Puertos 4001, 4002, 4003) ---
# ==========================================

resource "docker_container" "web_dev" {
  name  = "web-dev"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 4001
  }
  networks_advanced {
    name = docker_network.net_dev.name
  }
}

resource "docker_container" "api_dev" {
  name  = "api-dev"
  image = "node:alpine"
  ports {
    internal = 3000
    external = 4002
  }
  networks_advanced {
    name = docker_network.net_dev.name
  }
}

resource "docker_container" "bd_dev" {
  name  = "bd-dev"
  image = "postgres:latest"
  ports {
    internal = 5432
    external = 4003
  }
  networks_advanced {
    name = docker_network.net_dev.name
  }
}

# ==========================================
# --- ENTORNO QA (Puertos 5001, 5002, 5003) ---
# ==========================================

resource "docker_container" "web_qa" {
  name  = "web-qa"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 5001
  }
  networks_advanced {
    name = docker_network.net_qa.name
  }
}

resource "docker_container" "api_qa" {
  name  = "api-qa"
  image = "node:alpine"
  ports {
    internal = 3000
    external = 5002
  }
  networks_advanced {
    name = docker_network.net_qa.name
  }
}

resource "docker_container" "bd_qa" {
  name  = "bd-qa"
  image = "postgres:latest"
  ports {
    internal = 5432
    external = 5003
  }
  networks_advanced {
    name = docker_network.net_qa.name
  }
}