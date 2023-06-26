terraform {
  required_version = ">= 1.0.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.0"
    }
  }

}

provider "aws" {
  region = "eu-west-1"
}

data "aws_caller_identity" "current" {}