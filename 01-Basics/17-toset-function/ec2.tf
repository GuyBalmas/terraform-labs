data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Creates 3 instances of EC2 (one of each)
resource "aws_instance" "my-ec2" {
  ami = data.aws_ami.app_ami.id
  for_each = {
    key1 = "t2.micro"
    key2 = "t2.medium"
    key3 = "t2.large"
  }
  instance_type = each.value
  key_name = each.key

  tags = {
    Name = each.value
    key_name = each.key
  }
}
