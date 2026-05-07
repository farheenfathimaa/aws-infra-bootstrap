# AWS Infrastructure Bootstrap

This project provisions a minimal but production-ready AWS infrastructure using Terraform.

## Infrastructure Components
- **ECS (Fargate)**: Runs a containerized FastAPI backend.
- **RDS (PostgreSQL)**: Managed database instance in private subnets.
- **S3**: Storage bucket for static assets or logs.
- **VPC**: Custom networking with public and private subnets.
- **CloudWatch**: Monitoring alarms for ECS service.

## Project Structure
```text
.
├── .github/workflows/       # CI/CD pipelines
├── app/                     # FastAPI application source code
├── terraform/
│   ├── modules/             # Reusable infrastructure modules
│   │   ├── vpc/             # Networking
│   │   ├── ecs/             # Container orchestration
│   │   ├── rds/             # Database
│   │   ├── s3/              # Storage
│   │   └── cloudwatch/      # Monitoring
│   ├── main.tf              # Root configuration
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Project outputs
│   └── providers.tf         # Provider definitions
└── README.md
```

## Getting Started

### 1. Prerequisites
- AWS Account
- GitHub Repository
- Terraform installed (for local testing)
- Docker (for building the app image)

### 2. AWS IAM Setup
1. Create an IAM User named `github-actions-terraform`.
2. Attach the `AdministratorAccess` policy.
3. Create an Access Key and save the **Access Key ID** and **Secret Access Key**.

### 3. GitHub Secrets
Add the following secrets to your GitHub repository:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION` (e.g., `us-east-1`)
- `DB_PASSWORD` (Password for the RDS instance)
- `CONTAINER_IMAGE` (Your Docker image URI, e.g., `<aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/my-app:latest`)
- `S3_BUCKET_NAME` (A unique name for your S3 bucket)

### 4. Remote State Setup (Recommended)
By default, this project uses local state. For CI/CD, you should configure a remote S3 backend.
1. Create an S3 bucket for terraform state.
2. Uncomment the `backend "s3" {}` block in `terraform/providers.tf`.
3. Provide the backend config during `terraform init`:
   ```bash
   terraform init -backend-config="bucket=my-terraform-state-bucket" -backend-config="key=dev/terraform.tfstate" -backend-config="region=us-east-1"
   ```

## Deployment
- **Plan**: Create a Pull Request to `main`. GitHub Actions will run `terraform plan`.
- **Apply**: Merge the Pull Request to `main`. GitHub Actions will run `terraform apply`.

## Accessing the App
Once deployed, check the `alb_dns_name` output in the GitHub Actions logs or run `terraform output` locally. You can access the API at `http://<alb_dns_name>/`.