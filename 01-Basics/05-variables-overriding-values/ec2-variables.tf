# Configure the AWS Provider

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

# Create an EC2 instance
resource "aws_instance" "my_ec2" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = var.instanceType
 # subnet_id = var.subnet_id
}
