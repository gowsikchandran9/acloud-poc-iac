resource "aws_api_gateway_rest_api_policy" "awsentry-api-policy" {
  rest_api_id = aws_api_gateway_rest_api.AWSEntry.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "execute-api:Invoke",
            "Resource": [
              "execute-api:/*/*/api-docs",
              "execute-api:/*/*/api-docs/*",
              "execute-api:/*/*/auth",
              "execute-api:/*/*/auth/*"
            ]
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "execute-api:Invoke",
            "Resource": [
              "execute-api:/*/*/permissions-set",
              "execute-api:/*/*/permissions-set/*"
            ],
            "Condition" : {
                "NotIpAddress": {
                    "aws:SourceIp": ["46.128.60.181"]
                }
            }
        }
    ]
}
EOF
}