terraform {
  required_version = "> 0.12.0"
  required_providers {
    aws = "~> 4.0"
  }
}

variable "TF_VAR_AWS_ACCESS_KEY" {
  default = ""
}
variable "TF_VAR_AWS_SECRET_KEY" {
  default = ""
}
provider "aws" {
  region = "us-west-1"
  access_key = var.TF_VAR_AWS_ACCESS_KEY
  secret_key = var.TF_VAR_AWS_SECRET_KEY
}

resource "aws_instance" "ec2" {
  ami = "ami-018d291ca9ffc002f"
  instance_type = "t2.micro"
}
