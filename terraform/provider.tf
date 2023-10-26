# PROVIDER
terraform {

  required_version = "~> 1.5"

  backend "s3" {
    bucket         = "salles-salles"
    key            = "dev/terraform.tfstate"
    dynamodb_table = "salles-salles"
    region         = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = "us-east-1"
}