# Configure the AWS Provider


provider "aws" {
  region = "us-west-1"

}

# Create an EC2 instance
resource "aws_instance" "my_ec2" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = var.instanceType
 # subnet_id = var.subnet_id
}
