resource "tls_private_key" "example_tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "loginkey" {
  key_name   = "terraform-key"
  public_key = "${tls_private_key.example_tls_key.public_key_openssh}"
}
