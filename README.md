# 🚀 AWS Infrastructure Bootstrap Pipeline

A production-ready, modularized AWS infrastructure provisioned with **Terraform** and deployed via **GitHub Actions**. This project demonstrates a full CI/CD pipeline for a containerized application using AWS Free Tier services.

---

## 🏗️ Architecture Overview

This project provisions a highly available and secure environment:

- **VPC Module**: Custom network with 2 Public Subnets (for ALB) and 2 Private Subnets (for RDS), including an Internet Gateway.
- **ECS Module**: AWS Fargate cluster running containerized services with auto-scaling capabilities.
- **RDS Module**: Managed PostgreSQL instance secured in private subnets.
- **S3 Module**: Encrypted bucket for application assets and logs.
- **Remote State**: Terraform state is managed remotely in an S3 bucket with encryption.
- **CI/CD**: Fully automated pipeline that runs `terraform plan` on PRs and `terraform apply` on merges to `main`.

---

## ⚡ Features

- [x] **Infrastructure as Code (IaC)**: Fully modular Terraform code.
- [x] **Automated CI/CD**: No manual deployments; everything goes through GitHub Actions.
- [x] **Security First**: IAM roles with least-privilege, private subnets for DB, and encrypted state.
- [x] **Resilience**: Random suffixes on resources to prevent naming collisions.
- [x] **Monitoring**: CloudWatch Log Groups for container logs.

---

## 📸 Project in Action

### 1. GitHub Actions Success
<!-- [PLACEHOLDER: Add your screenshot of the Green GitHub Action here] -->

### 2. Live Application
<!-- [PLACEHOLDER: Add your screenshot of the "Welcome to nginx" page here] -->

---

## 🛠️ How to Use

1. **Prerequisites**: 
   - AWS Account (Free Tier)
   - GitHub Repository
2. **Setup Secrets**:
   - Add `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`
   - Add `DB_PASSWORD`, `S3_BUCKET_NAME`, `S3_STATE_BUCKET`, `CONTAINER_IMAGE`
3. **Deploy**:
   - Push code to the `main` branch.
   - Watch the GitHub Actions tab!

---

## 🗑️ Cleanup

To avoid any costs, run:
```bash
terraform destroy
```

---

*Built with ❤️ by Farheen Fathima*