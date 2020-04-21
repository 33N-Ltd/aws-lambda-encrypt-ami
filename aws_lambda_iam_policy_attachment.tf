resource "aws_iam_policy_attachment" "ami_encryption_policy" {
  name       = "${var.environment}-ami-encryption-attachment"
  roles      = [aws_iam_role.ami_encrypt_lambda.name]
  policy_arn = aws_iam_policy.ami_encryption_policy.arn
}
