terraform {
  required_version = ">= 1.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"  
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}