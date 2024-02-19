resource "aws_api_gateway_method" "method" {
  rest_api_id      = var.rest_api_id
  resource_id      = var.resource_id
  http_method      = var.http_method
  authorization    = var.authorization
  authorizer_id    = var.authorizer_id
  api_key_required = var.api_key_required

  request_models       = var.request_models
  request_parameters   = var.request_parameters
  request_validator_id = var.request_validator_id

}

resource "aws_api_gateway_integration" "method_integration" {
  rest_api_id             = var.rest_api_id
  resource_id             = var.resource_id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.uri

  cache_key_parameters = var.cache_key_parameters

  request_parameters = var.integration_request_parameters
}

resource "aws_api_gateway_method_response" "method_response" {
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_integration.method_integration.http_method
  status_code = var.status_code

  response_parameters = var.response_parameters
  response_models     = var.response_models

}

resource "aws_api_gateway_integration_response" "integration_response" {
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.method.http_method
  status_code = aws_api_gateway_method_response.method_response.status_code

  response_templates = {
    "application/json" = "#set($allParams = $input.params())\n$input.json('$')"
  }

  response_parameters = var.integration_response_parameters

}