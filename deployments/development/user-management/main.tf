terraform {
  backend "s3" {
    bucket         = "tf-backend-eu-central-1-905418153167"
    key            = "terraform/xentry/user-management.tfstate"
    region         = "eu-central-1"
    #dynamodb_table = "-terraform"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "user-management" {
  source     = "../../../modules/users-management"
  aws_region = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
  stage      = "dev"
}