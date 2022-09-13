
provider "aws" {
  region = "us-west-1"

}

resource "aws_iam_user" "lb" {
  name = "user-${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
