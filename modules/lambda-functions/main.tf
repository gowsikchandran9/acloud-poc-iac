output "lambda_arn" {
  value = aws_lambda_function.lambda-function.arn
}
output "lambda_invoke_arn" {
  value = aws_lambda_function.lambda-function.invoke_arn
}
output "lambda_name" {
  value = aws_lambda_function.lambda-function.function_name
}

resource "aws_lambda_function" "lambda-function" {
  s3_bucket     = "lambda-functions-${var.account_id}"
  s3_key        = "${var.function_name}.zip"
  function_name = var.function_name
  role          = var.aws_lambda_function_role_arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = 60
  layers        = var.layers
  description   = var.description

  environment {
    variables = {
      account_id        = var.account_id
      region            = var.region
      stage             = var.stage
    }
  }

  #tags = var.dt_tags
}