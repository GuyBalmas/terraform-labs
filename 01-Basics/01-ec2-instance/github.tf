terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the GitHub Provider
variable "TF_VAR_GITHUB_TOKEN" {
  default = ""
}
provider "github" {
  token = GITHUB_TOKEN
}

resource "github_repository" "my_repo" {
  name        = "terraform-infra"
  description = "My terraform github repository"

  visibility = "private"
  #
  # template {
  #   owner      = "github"
  #   repository = "terraform-module-template"
  # }
}
