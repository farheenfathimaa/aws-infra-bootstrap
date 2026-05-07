terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration will be injected via CLI or a separate file for remote state
  # backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}
