# By default Terraform ignores this file, and to avoid that you need to reference the 'custom.tfvars' file from the CLI
# Run:
#     > terraform plan -var-file="custom.tfvars"
# or:
#     > terraform apply -auto-approve -var-file="custom.tfvars"
instanceType = "t2.large"
