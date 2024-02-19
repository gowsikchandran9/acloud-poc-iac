resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.AWSEntry.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_rest_api.AWSEntry.id
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}
