provider "openstack" {
}

resource "random_password" "password" {
  length = 8
  special = true
  upper = true
  min_upper = 1
  min_lower = 1
  min_special = 1
  lower = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "user" {
}

output "passwd" {
  value = random_password.password.result
}

output "username" {
  value = var.user
}

output "content" {
  value = "Hi, ${var.user}, your password is ${random_password.password.result}"
}
