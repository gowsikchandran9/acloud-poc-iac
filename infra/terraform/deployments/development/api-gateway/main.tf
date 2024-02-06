terraform {
  backend "s3" {
    bucket         = "tf-backend-eu-central-1-905418153167"
    key            = "terraform/xentry/api-gateway.tfstate"
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
# test comment
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "api-gateway" {
  source     = "../../../aws-modules/api-gateway"
  api_name = var.api_name
  api_description = var.api_description

}
