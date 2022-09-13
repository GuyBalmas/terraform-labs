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
  key_name = "terraform-key"
  tags = {
    Name = "Terraform"
    Key = "terraform-key"
  }

  provisioner "local-exec" {
    command = "echo exporting ips into private-ips.txt"
    on_failure = continue
  }
  # Define the provisioner inside the EC2 template - runs on the machine Terraform is invoked upon
  provisioner "local-exec" {
    command = "echo ${aws_instance.my-ec2.private_ip} >> private-ips.txt"
  }
}
