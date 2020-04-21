resource "aws_cloudwatch_event_rule" "build_alert" {
  name = "${upper(var.environment)}-AMI-CODEBUILD-SUCESS-ALERT"
  description = "Send alerts to encrypt AMI on build success."

  event_pattern = <<PATTERN
        {
          "source": [
            "com.ami.builder"
          ],
          "detail-type": [
            "AmiBuilder"
          ],
          "detail": {
            "AmiStatus": [
              "Created"
            ]
          }
        }
      PATTERN
}

resource "aws_cloudwatch_event_target" "lamba_alert" {
  rule      = aws_cloudwatch_event_rule.build_alert.name
  target_id = "ami-encryption-lambda"
  arn       = aws_lambda_function.ami_encryption_lambda.arn
}

