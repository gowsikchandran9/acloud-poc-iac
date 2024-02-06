resource "aws_api_gateway_rest_api" "XEntry" {
 name        = var.api_name
 description = var.api_description
 #tags        = data.external.json_tags.result


}

resource "aws_api_gateway_resource" "permission_set" {
 rest_api_id = aws_api_gateway_rest_api.XEntry.id
 parent_id   = aws_api_gateway_rest_api.XEntry.root_resource_id
 path_part   = "permission-set"
}
