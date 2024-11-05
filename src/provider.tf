terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }

  # Configure the backend remote state
  # backend "s3" {
  #   bucket   = "XXXXXXXXXXXX"
  #   role_arn = "arn:aws:iam::XXXXXXXXX:role/BackendAccessPipeline"
  #   key      = "XXXXXXXXXXXXXXX/XXXXXXXX/terraform.tfstate"
  #   region   = "us-east-1"
  #   backend  = true
  # }
}

provider "aws" {
  # Configuration options
}
