# Terraform Starter (OIDC + Portable Backend)

This starter uses **AWS OIDC** (no long‑lived keys) and a **portable backend** (all backend values come from GitHub Secrets).

## Required GitHub Secrets (repo → Settings → Secrets and variables → Actions)
- `TF_BACKEND_BUCKET`  (your S3 state bucket)
- `TF_BACKEND_KEY`     (e.g., `starter/dev/terraform.tfstate`)
- `TF_BACKEND_REGION`  (e.g., `us-east-1`)
- `TF_BACKEND_DDB_TABLE` (your DynamoDB lock table)

> No AWS keys needed. Workflows assume role: `arn:aws:iam::579989519757:role/GitHubTerraformRole`

## Local usage
```bash
terraform fmt -recursive
terraform init   -backend-config="bucket=$TF_BACKEND_BUCKET"   -backend-config="key=$TF_BACKEND_KEY"   -backend-config="region=$TF_BACKEND_REGION"   -backend-config="dynamodb_table=$TF_BACKEND_DDB_TABLE"
terraform validate
terraform plan -var-file=terraform.tfvars
```

## Files
- `backend.tf` (empty s3 backend; params injected at init)
- `providers.tf`, `versions.tf`, `variables.tf`, `main.tf`
- `terraform.tfvars.example`
- `.github/workflows/terraform-ci.yml` (PR/push: fmt → init → validate → plan)
- `.github/workflows/terraform-deploy.yml` (manual: init → plan → apply)

