# Configure the AWS Provider

provider "aws" {
  region = "us-west-1"

}

# Create an EC2 instance
resource "aws_instance" "my_ec2" {
  ami = "ami-018d291ca9ffc002f"
  instance_type = "t2.micro"
}

# Create an output for the EC2 instance
output "ec2_out" {
  value = aws_instance.my_ec2.id
}

# Create an Elastic IP
resource "aws_eip" "my_eip" {
  vpc = true
}

# Create an output for the Elastic IP
output "eip_out" {
  value = aws_eip.my_eip.id
}

# Create a reference between the EC2 instance and the Elastic IP
resource "aws_eip_association" "eip_assoc" {
  # EC2 instance ID
  instance_id = aws_instance.my_ec2.id
  # Elastic IP instance ID
  allocation_id = aws_eip.my_eip.id
}

# Create S3 storage
resource "aws_s3_bucket" "my_s3" {
  bucket = "terraform-labs-demo"
}
