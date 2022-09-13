variable region {
  type = string
  default = "us-west-1"
}

variable instance_type {
  type = map
  default = {
    default = "t2.nano"
    dev = "t2.micro"
    staging = "t2.medium"
    production = "t2.large"
  }
}
