variable region {
  type = string
  default = "us-west-1"
}

variable ami_id {
  type = map
  default = {
    "us-west-1" = "ami-018d291ca9ffc002f"
    "us-east-2" = "ami-0568773882d492fc8"
    "ap-northeast-1" = "ami-0f36dcfcc94112ea1"
  }
}

variable names {
  type = list
  default = ["first-ec2", "second-ec2"]
}
