
provider "aws" {
  region = "us-west-1"

}

locals {
  # local variable using conditional expression
  environment = "${var.env_type != "" ? var.env_type : ""}"

  common_tags = {
    service = local.service
    owner = local.owner
  }
}

# Create an EC2 DEV instance
resource "aws_instance" "ec2-dev" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.nano"
 count = local.environment == "dev" ? 1 : 0
 tags = local.common_tags
}

# Create an EC2 STAGING instance
resource "aws_instance" "ec2-staging" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.micro"
 count = local.environment == "staging" ? 1 : 0
 tags = local.common_tags
}

# Create an EC2 PREPROD instance
resource "aws_instance" "ec2-preprod" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.medium"
 count = local.environment == "preprod" ? 1 : 0
 tags = local.common_tags
}

# Create an EC2 PROD instance
resource "aws_instance" "ec2-prod" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.large"
 count = local.environment == "prod" ? 1 : 0
 tags = local.common_tags
}
