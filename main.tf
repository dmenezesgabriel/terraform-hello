terraform {
  # https://registry.terraform.io/browse/providers
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# provider "{provider_name}" {
provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

# resource "{provider-name}_{resource-type}" "{resource_name}" {
resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

# resource "{provider-name}_{resource-type}" "{resource_name}" {
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
