data "aws_caller_identity" "current" {}

resource "aws_kms_key" "Key-Terraform-S3Bucket" {
  deletion_window_in_days  = 7
  tags                     = var.tags
  is_enabled               = var.kms_enabled
  enable_key_rotation      = var.enable_key_rotation
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  description              = "Key for SSE in S3 for ssetest"
  policy                   = <<Policy
{
  "Version": "2012-10-17",
  "Id": "${var.base_name}",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
Policy
}

resource "aws_kms_alias" "Key-Terraform-S3Bucket" {
  name          = "alias/Key-Terraform-S3Bucket"
  target_key_id = aws_kms_key.Key-Terraform-S3Bucket.id
}
