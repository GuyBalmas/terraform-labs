data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my-ec2" {
  ami = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.sec_groups
  tags = local.tags
}
