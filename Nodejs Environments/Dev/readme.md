# Terraform Commands — Quick Reference

## First Time Setup
```bash
# login to azure
az login

# verify subscription
az account show

# initialise with backend
terraform init -backend-config=backend.hcl
```
## Daily Workflow
```bash
# format code
terraform fmt -recursive

# validate syntax
terraform validate

# preview changes
terraform plan

# deploy
terraform apply

# destroy all resources
terraform destroy
```

## State Commands
```bash
# list all resources
terraform state list

# inspect specific resource
terraform state show <resource>

# view outputs
terraform output
```

## Migrate Local State to Azure (one time)
```bash
terraform init -backend-config=backend.hcl -migrate-state

# delete local state after migration
rm terraform.tfstate
rm terraform.tfstate.backup
```

## Useful Flags
```bash
terraform apply -auto-approve      # skip confirmation
terraform plan -var-file=dev.tfvars  # use specific tfvars
terraform init -upgrade            # upgrade provider version
```