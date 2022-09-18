locals {
  db_password = {
    admin = "admin-password-!"
  }
}

output "db_password" {
  value = local.db_password
  sensitive   = true
}