variable "my_name" {
    description = "My name is to be appended as suffix to docker volume"
    default     = "Abcd"
}

variable "volume_name" {
    description = "the volume ne will be provided by the user"
}

variable "part_container_name" {
    description = "partly generated container name to be appended the hex number"
    default     = "Ubuntu_latest"
}
