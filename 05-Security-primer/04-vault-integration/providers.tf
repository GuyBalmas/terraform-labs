provider "vault" {
  # vault address
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "demo" {
  # secret's path inside of vault
  path = "secret/db-cred"
}

output "vault_secrets" {
  # extract the secret values as JSON format
  value = data.vault_generic_secret.demo.data_json
  # must declare as 'sensetive' data
  sensitive = "true"
}