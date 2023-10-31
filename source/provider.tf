terraform {
  #comment the backend config below, to run the code in your local environment
  backend "s3" {
    bucket exists already
    bucket = "tproject1"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "jmtfproject_region"
}
