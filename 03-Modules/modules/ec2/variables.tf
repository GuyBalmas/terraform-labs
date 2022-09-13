variable instance_type {
  type = string
  default = "t2.micro"
}

variable sec_groups {
  type = list
  default = ["sg-0c056419b20ffad1e"]
}

variable module_tag {
  type = string
  default = "ec2"
}

variable name_tag {
  type = string
  default = "ec2"
}
