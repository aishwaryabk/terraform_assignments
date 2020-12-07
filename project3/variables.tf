variable "user_name" {
    description = "The user name used to connect to OpenStack"
    default     = "my_user_name"
}

variable "tenant_name" {
    description = "the name of the tenant used"
}

variable "password" {
    description = "password used"
}

variable "auth_url" {
    description = "URL used to connect to OpenStack"
}

variable "my_name" {
    description = "The name will be appended to the volume"
    default     = "Abcd"
}

variable "image_id" {
    description = "The id of the image to be used"
}

variable "flavour_id" {
    description = "Flavour of the instance created"
}

variable "pb_key_file" {
    description = "public key file name which contains the key"
}

variable "my_network" {
    description = "Network name"
    default     = "network1"
}

variable "vol_size" {
    description = "Volume size"
    default     = "1"
}

root@alisha-terr-ub:~/Amey/automation/Amey2/temp-terraform/proj3# cat variables.tf
variable "user_name" {
    description = "The user name used to connect to OpenStack"
    default     = "my_user_name"
}

variable "tenant_name" {
    description = "the name of the tenant used"
}

variable "password" {
    description = "password used"
}

variable "auth_url" {
    description = "URL used to connect to OpenStack"
}

variable "my_name" {
    description = "The name will be appended to the volume"
    default     = "Abcd"
}

variable "pb_key_file" {
    description = "public key file name which contains the key"
}

variable "my_network" {
    description = "Network name"
    default     = "network1"
}

variable "vol_size" {
    description = "Volume size"
    default     = "1"
}

