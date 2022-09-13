
provider "aws" {
  region = "us-west-1"

}

resource "aws_security_group" "dynamic-security-group" {
  name = "dynamic-security-group"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group" "dynamic-iterator-sg" {
  name = "dynamic-iterator-sg"
  description = "Ingress using an iterator"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port

    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    iterator = port

    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
