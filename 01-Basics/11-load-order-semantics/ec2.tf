resource "aws_instance" "myec2" {
   ami = var.ami_id
   instance_type = "t2.micro"
}

resource "aws_instance" "newec2" {
   ami = var.ami_id
   instance_type = "t2.micro"
}
