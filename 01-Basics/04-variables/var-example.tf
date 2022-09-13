# Specify the providers

provider "aws" {
  region = "us-west-1"

}

# Create a VPC instance (Virtual Private Cloud)
resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_ip
}

# Create a Security Group (associated with the VPC)
resource "aws_security_group" "my-sg" {
  name = "sec-grp-variable"
  description = "Allow HTTP and SSH traffic via Terraform using variables"

  # A reference to the VPC is mandatory since August 15th, 2022 (Retirement of EC2-Classic)
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}
