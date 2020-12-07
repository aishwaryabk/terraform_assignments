
provider "docker" {
#  host = "tcp://127.0.0.1:/25678"
}

resource "random_id" "random" {
  byte_length = 4
}

resource "docker_network" "network" {
  name = "my_network"
}

resource "docker_volume" "shared_volume" {
  name = "${var.volume_name}-${var.my_name}"
}


# Create a container
resource "docker_container" "ubuntu" {
  image = "ubuntu:latest"
  name  = "${random_id.random.hex}-${var.part_container_name}"

   ports {
      internal = "8080"
      external = "25678"
    }
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}


output "ip_address" {
  depends_on = [docker_container.ubuntu]
  value = "container IP = ${docker_container.ubuntu.ip_address}"
}

