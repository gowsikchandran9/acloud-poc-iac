locals {
  lambda_layers = {
    "create-permission-set" = [
     # aws_lambda_layer_version.lambda_layer_boto3.arn,
     # aws_lambda_layer_version.lambda_layer_requests.arn,
    ],
    "attach-managed-policy-to-permission-set" = [],
    "associate-permission-set-to-account-and-users" = []
  }
    lambda_description = {
    "create-permission-set"                  = "A function to create permission set",
    "attach-managed-policy-to-permission-set" = "A function to attach managed policies to permission set",
    "associate-permission-set-to-account-and-users" = "A function to associate permission set to the account"
    }
}
