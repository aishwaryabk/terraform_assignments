output "ip_address" {
  depends_on = [openstack_compute_keypair_v2.test-keypair]
  value      = "container IP = ${openstack_compute_instance_v2.basic-instance.network.0.fixed_ip_v4}"
}

output "index-content" {
  depends_on = [null_resource.remote-machine] 
  value      = "Html file: ${data.http.http-example.body}"
}
