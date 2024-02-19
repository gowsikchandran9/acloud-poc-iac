resource "aws_api_gateway_rest_api" "AWSEntry" {
  name        = var.api_name
  description = var.api_description
  #tags        = data.external.json_tags.result
}

resource "aws_api_gateway_resource" "permission_set" {
  rest_api_id = aws_api_gateway_rest_api.AWSEntry.id
  parent_id   = aws_api_gateway_rest_api.AWSEntry.root_resource_id
  path_part   = "permission-set"
}

resource "aws_api_gateway_authorizer" "authorizer" {
  name                             = "authorizer"
  rest_api_id                      = aws_api_gateway_rest_api.AWSEntry.id
  authorizer_uri                   = ""
  authorizer_result_ttl_in_seconds = 0
}