resource "aws_s3_bucket" "dynamodb_lambda_bucket" {
bucket = "dynamodb-lambda-bucket-20233"
acl    = "private"
}


resource "aws_s3_bucket_notification" "dynamodb_lambda_notification" {
  bucket = aws_s3_bucket.dynamodb_lambda_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.dynamodb_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.dynamodb_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.dynamodb_lambda_bucket.arn
}