resource "aws_key_pair" "loginkey" {
  key_name   = "ec2-key"
  # file - returns as a string the content of 'id_rsa.pub' file, located under the root folder '.'
  public_key = file("${path.module}/id_rsa.pub")
}
