resource "aws_eip" "apple-lb" {
  vpc      = true
  tags = {
    Name = "apple"
  }
}

resource "aws_eip" "banana-lb" {
  vpc      = true
  provider = aws.banana
  tags = {
    Name = "banana"
  }
}

output "apple_public_ip" {
  value = aws_eip.apple-lb.public_ip
}

output "banana_public_ip" {
  value = aws_eip.banana-lb.public_ip
}