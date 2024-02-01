resource "aws_iam_role" "iam_for_lambda" {
  name = "${var.resource_prefix}-lambda"
  #tags = data.external.json_tags.result

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "iam_for_lambda_attach_policy_dynamodb" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.policy_idc.arn
}

resource "aws_iam_policy" "policy_idc" {
  name = "${var.resource_prefix}-trigger-idc"
  #tags = data.external.json_tags.result

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sso:ListInstances",
                "sso:CreatePermissionSet",
                "sso:ListManagedPoliciesInPermissionSet",
                "sso:ListPermissionSets",
                "sso:DescribePermissionSet",
                "sso:DescribePermissionSetProvisioningStatus",
                "sso:AttachCustomerManagedPolicyReferenceToPermissionSet",
                "sso:AttachManagedPolicyToPermissionSet",
                "sso:UpdatePermissionSet",
                "sso:CreateAccountAssignment"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}