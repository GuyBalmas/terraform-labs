variable "TF_VAR_AWS_ACCESS_KEY" {
  default = ""
}
variable "TF_VAR_AWS_SECRET_KEY" {
  default = ""
}
provider "aws" {
  region = "us-west-1"
  access_key = var.TF_VAR_AWS_ACCESS_KEY
  secret_key = var.TF_VAR_AWS_SECRET_KEY
}

resource "aws_iam_user" "lb" {
  name = "user-${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
