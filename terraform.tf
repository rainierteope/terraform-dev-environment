terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.5"
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile != null ? var.aws_profile : null
}

provider "random" {}