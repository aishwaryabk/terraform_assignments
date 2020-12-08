Terraform assignments.

Create a Terraform module for generating a password.
· The password string should contain at least 1 special characters except '@'.
· The password length should be 8.
· The password should include minimum 1 upper and 1 lower case alphabet characters.
· Display the information in Terraform output via CLI in format: "Hi <User>, your password is <password>"
· User value should be taken from an input variable.
Hint: Make use for “random_password"

---------------------------------------------------------------

Assignment I: OpenStack, AWS, GCP, IBM Cloud, etc.
Create a compute server instance (Ubuntu/CentOS) on your cloud provider.
Create and attach a storage volume to the server instance
Create key-pair by providing the SSH public key.
-------------------------- OR --------------------------

Assignment II: Docker
Create a container by pulling a Docker image (Ubuntu/CentOS) from a Docker registry.
Export port internal TCP port 8080 to port 25678 on the host.
Create a Docker volume and use it in the container created above.
Create a Docker network and use it in the container created above.

Instructions:

· Take inputs from user for instance/volume configurations.
· Prefix the name of the volume with your name.
· Suffix the name of the instance/container with random HEX string of length 4.
· Output the instance/container IP in Terraform output once all the resources are processed (Use “depends_on” on last resource).
· Variables should have proper description and type mentioned.
· Exclusive files for input variables and output values blocks.

---------------------------------------------------------------------------------------------------------------------
This assignment is follow-up on the previous assignment
· Install an HTTP service and host an index.html file on the server created in the previous assignment.
· Use the file-provisioner to copy the index.html file from local machine.
· Steps to install and configure httpd should be done via remote-exec resource.
· Once the index.html file is hosted on the server, download the file via “HTTP URL” using HTTP Provider (https://www.terraform.io/docs/providers/http/index.html).
· Index.html content should be displayed in Terraform output.
· Whenever the server is destroyed (via ‘terraform destroy’) the index.html and httpd service (including the changed file) should be uninstalled from the remote server.
Note: For Docker assignment you may need to install an SSH service on the container and expose port 22. See https://docs.docker.com/engine/examples/running_ssh_service/ for more information.



