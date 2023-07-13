terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.5"
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "rainierteope-aws-main"
}

provider "random" {}