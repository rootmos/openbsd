terraform {
  backend "s3" {
    bucket = "rootmos-terraform"
    key = "openbsd-playground"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
