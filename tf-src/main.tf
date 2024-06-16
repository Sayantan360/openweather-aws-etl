terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "openweather-tf-state"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
}
}

provider "aws" {
  region  = "us-east-1"
}  

module "vpc" {
    source = "./modules/vpc"
}

module "security-group" {
    source = "./modules/security-group"
    # vpc-id = module.vpc.vpc-id
}