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

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = "${tls_private_key.example_tls_key.private_key_pem}"
  }

  # Define the provisioner inside the EC2 template
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "echo \"Successfully installed Nginx for the demo!\"",
      "sudo systemctl start nginx"
    ]
  }
}
