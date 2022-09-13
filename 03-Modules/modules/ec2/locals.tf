locals {
  tags = {
      Name = "Terraform-${var.name_tag}"
      Module = var.module_tag
  }
}
