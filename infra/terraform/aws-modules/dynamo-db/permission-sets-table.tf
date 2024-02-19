resource "aws_dynamodb_table" "permission-sets-table" {
  name         = "PermissionSets"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "PermissionsSet"
  range_key    = "CreatedBy"

  attribute {
    name = "PermissionsSet"
    type = "S"
  }

  attribute {
    name = "CreatedBy"
    type = "S"
  }

#  tags = data.external.json_tags.result
}