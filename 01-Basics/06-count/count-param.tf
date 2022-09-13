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
resource "aws_instance" "ec2-instance" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.micro"
 count = 2
}

resource "aws_iam_user" "lb" {
  name = "load-balancer.${var.env_name[count.index]}"
  path = "/system/"
  count = 4
}
