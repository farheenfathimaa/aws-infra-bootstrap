terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # These will be provided via CLI or a .tfbackend file in GitHub Actions
  }
}

provider "aws" {
  region = var.aws_region
}
