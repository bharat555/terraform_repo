### variables definition
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {default = "mykey"}


### modules definition
module "child" {
  source = "./child"

  # these are not parameters, but variables as defined in variables in the 'child' module
  name = "exmaple"
  description = "example"
  memory = "8GB"
  project_name = "ubuntu"
}

### providers defenition
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret.key
  region = "us-east-1"
}

### resource definition
resource "aws_instance" "webserver" {
  ami = "ami-b2527ad2"
  instance_type = "t2.micro"
  key_name = var.key_name

  provisioner "remote-exec" {
  inline = [
  "sudo apt-get update",
  "sudo apt-get install Nginx -y",
  "sudo service nginx start"
  ]

  connection {
      user = "ubuntu"
      private_key = "${file(var.private_key_path)}"
  }
  }
  }

### output definitions
output "aws_instance_public_dns" {
  value = "${aws_instance.webserver.public_dns}"
}

output "child_memory" {
  value = "${module.child.received}"
}

output "child_space" {
  value = "${module.child.space}"
}

output "child_resource" {
  value = "${module.child.project_resource_type}"
 }
