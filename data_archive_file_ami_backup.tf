data "archive_file" "ami_encryption" {
  type        = "zip"
  source_file = "${path.module}/functions/ami_encryption.py"
  output_path = data.null_data_source.lambda_archive.outputs.filename
}
