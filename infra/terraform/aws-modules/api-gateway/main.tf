resource "aws_api_gateway_rest_api" "XEntry" {
 name        = var.api_name
 description = var.api_description
 #tags        = data.external.json_tags.result


}
