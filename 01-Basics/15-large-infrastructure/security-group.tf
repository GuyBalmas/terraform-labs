resource "aws_security_group" "allow_ssh_conn" {
  name        = "allow_ssh_conn"
  description = "Allow SSH inbound traffic"

  dynamic "ingress" {
    for_each = var.inbound_security_group_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # dynamic "egress" {
  #   for_each = var.outbound_security_group_from_port
  #   iterator = from_port
  #   target_port = var.outbound_security_group_from_port[0]
  #   content {
  #     from_port = from_port.value
  #     to_port = target_port.value
  #     protocol = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #  }
}
