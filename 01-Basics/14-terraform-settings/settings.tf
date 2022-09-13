terraform {
  required_version = "> 0.12.0"
  required_providers {
    aws = "~> 4.0"
  }
}


provider "aws" {
  region = "us-west-1"

}

resource "aws_instance" "ec2" {
  ami = "ami-018d291ca9ffc002f"
  instance_type = "t2.micro"
}
