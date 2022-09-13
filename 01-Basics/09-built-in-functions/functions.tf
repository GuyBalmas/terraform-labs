# Terraform docs - https://www.terraform.io/language/functions


provider "aws" {
  region = var.region

}

locals {
  # timestamp - raw time stamp data
  # formatdate - formats the date string according the the given regex.
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  # file - returns as a string the content of 'id_rsa.pub' file, located under the root folder '.'
  public_key = file("${path.module}/id_rsa.pub")
}

# Create an EC2 instance
resource "aws_instance" "ec2-instance" {
 # lookup (for map) - returns the value of the key 'region' from map 'ami_id'.
 # ami_id.get(region)
 ami = lookup(var.ami_id, var.region)
 instance_type = "t2.micro"
 key_name = aws_key_pair.loginkey.key_name
 count = 2
 tags = {
   # element (for list) - returns the value of the 'count.index' element in the list 'names'.
   # names.get(count.index)
  Name = element(var.names, count.index)
  region = var.region
 }
}

output "timestamp" {
  value = local.time
}
