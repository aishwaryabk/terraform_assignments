
provider "openstack" {
  user_name   = var.user_name
  tenant_name = var.tenant_name
  password    = var.password
  auth_url    = var.auth_url
  insecure    = true
}

resource "random_id" "random" {
  byte_length = 4
}

resource "openstack_compute_instance_v2" "basic-instance" {
  name            = "Amey-${random_id.random.hex}-basic-instance"
  image_id        = "${var.image_id}"
  flavor_id       = "${var.flavour_id}"
  key_pair        = "${openstack_compute_keypair_v2.test-keypair.name}"

  network {
    name = "${var.my_network}"
  }
}


resource "openstack_blockstorage_volume_v2" "basic-volume" {
  name = "basic-volume-${var.my_name}"
  size = "${var.vol_size}"
}

resource "openstack_compute_volume_attach_v2" "basic-va" {
  instance_id = "${openstack_compute_instance_v2.basic-instance.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.basic-volume.id}"
}

resource "openstack_compute_keypair_v2" "test-keypair" {
  name       = "my-keypair"
  public_key = "${file("${var.pb_key_file}.pub")}"
}

resource "null_resource" "remote-machine" {
 connection {
    host = "${openstack_compute_instance_v2.basic-instance.network.0.fixed_ip_v4}"
    private_key = "${file(var.pb_key_file)}"
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html",
    ]
  }


  provisioner "remote-exec" {
    when        = destroy
    on_failure  = continue

    inline      = [
        "sudo stop httpd",
        "rm -f /tmp/index.html",
        "sudo yum uninstall httpd -y"
    ]
  }

}

data "http" "http-example" {
  depends_on = [null_resource.remote-machine]
  url        = "http://${openstack_compute_instance_v2.basic-instance.network.0.fixed_ip_v4}:80"
}
