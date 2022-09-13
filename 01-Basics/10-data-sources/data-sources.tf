variable "TF_VAR_AWS_ACCESS_KEY" {
  default = ""
}
variable "TF_VAR_AWS_SECRET_KEY" {
  default = ""
}
provider "aws" {
  region = "ca-central-1"
  access_key = var.TF_VAR_AWS_ACCESS_KEY
  secret_key = var.TF_VAR_AWS_SECRET_KEY
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance-1" {
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}
