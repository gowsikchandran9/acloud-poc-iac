module "lambda_function_python" {

  for_each = toset([
    "create-permission-set",
    "attach-managed-policy-to-permission-set",
    "associate-permission-set-to-account-and-users"


  ])
  source = "../lambda-functions"

  function_name                = each.key
  description                  = local.lambda_description[each.key]
  aws_lambda_function_role_arn = aws_iam_role.iam_for_lambda.arn
  #tags                         = data.external.json_tags.result
  account_id                   = var.account_id
  layers                       = local.lambda_layers[each.key]
  region                       = var.aws_region
  stage                        = var.stage
  handler                      = "main.lambda_handler"
  runtime                      = "python3.12"

}

module "api-gateway" {
  source                            = "../api-gateway"
  api_description                   = var.api_description
  api_name                          = var.api_name
  create_permissions_set_invoke_arn = module.lambda_function_python['create-permission-set'].lambda_invoke_arn
}

module "dynamo-db" {
  source = "../dynamo-db"
}