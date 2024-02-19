module "create-permissions-set" {
  source      = "api-endpoint"
  rest_api_id = aws_api_gateway_rest_api.AWSEntry.id
  resource_id = aws_api_gateway_resource.permission_set.id

  http_method          = "POST"
  authorization        = "CUSTOM"
  authorizer_id        = aws_api_gateway_authorizer.authorizer.id
  api_key_required     = "false"
  status_code          = "200"
  request_validator_id = ""

  uri = var.create_permissions_set_invoke_arn

  request_parameters = {
    "method.request.header.Authorization" = true
  }

  request_models                  = {}
  integration_response_parameters = {}
  response_parameters             = {}
  response_models                 = {}

  integration_request_parameters = {}
  cache_key_parameters           = []
}