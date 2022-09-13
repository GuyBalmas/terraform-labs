# Configure the AWS Provider

provider "aws" {
  region = "us-west-1"

}

resource "aws_vpc" "main" {
  cidr_block = "10.20.0.0/16"
}


resource "aws_security_group" "my-sg" {
  name = "sec-grp"
  description = "Allow HTTP and SSH traffic via Terraform"

  # A reference to the VPC is mandatory since August 15th, 2022 (Retirement of EC2-Classic)
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
}
