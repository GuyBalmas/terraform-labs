data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2" {
  ami = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  key_name = "ec2-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh_conn.id]
}
