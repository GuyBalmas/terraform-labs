

# Create an EC2 DEV instance
resource "aws_instance" "ec2-dev" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.nano"
 count = var.env_type == "dev" ? var.instance_count : 0
}

# Create an EC2 STAGING instance
resource "aws_instance" "ec2-staging" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.micro"
 count = var.env_type == "staging" ? var.instance_count : 0
}

# Create an EC2 PREPROD instance
resource "aws_instance" "ec2-preprod" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.medium"
 count = var.env_type == "preprod" ? var.instance_count : 0
}

# Create an EC2 PROD instance
resource "aws_instance" "ec2-prod" {
 ami = "ami-018d291ca9ffc002f"
 instance_type = "t2.large"
 count = var.env_type == "prod" ? var.instance_count : 0
}
