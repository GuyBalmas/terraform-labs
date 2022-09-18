## Install vault on Windows 10

### Prerequisites:
1. Install `chocolaty`:
``` https://chocolatey.org/install ```


From Windows PowerShell, run the following commands as administrator:
```
# install vault
choco install vault

# run vault in dev mode
vault server -dev 
```

Save the output in a temporary file, as it contains the root token 
The output should look similar to this:
```
You may need to set the following environment variable:

PowerShell:
    $env:VAULT_ADDR="http://127.0.0.1:8200"
cmd.exe:
    set VAULT_ADDR=http://127.0.0.1:8200

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: LkVVtcdNNUiiWZ1CLlX1b4JXcqBvUQU8l/WEdH8xvF4=
Root Token: hvs.ZeCloEwZ5znAQDDqnwllWxYL

Development mode should NOT be used in production installations!
```

### Insert a secret into vault:
1. login into vault using the root token:
``` 
http://127.0.0.1:8200/ 
```
2. go to `/secret` (already initiallized Key-Value secrets engine) and, click on `create a new secret`.
3. name the new secret `db-cred`.
4. insert secret values, for example: 
```
username: my-db-user-1
password: my-strong-password-!
```

### Run Terraform apply
```
terraform init
terraform apply -auto-approve
```