terraform {
  required_version = "> 0.12.0"
  required_providers {
    aws = "~> 4.0"
  }
}

variable "TF_VAR_AWS_ACCESS_KEY" {
  default = ""
}
variable "TF_VAR_AWS_SECRET_KEY" {
  default = ""
}
provider "aws" {
  region = var.region
  access_key = var.TF_VAR_AWS_ACCESS_KEY
  secret_key = var.TF_VAR_AWS_SECRET_KEY
}
