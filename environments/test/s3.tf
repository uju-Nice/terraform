
provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "bjss_bucket" {
  bucket = "bjss_bucket"

  tags = {
    Name        = "bjss_bucket"
    Environment = "Test"
  }
}

resource "aws_kms_key" "nice_key" {
  description             = "Decryption of objects in bucket"
  deletion_window_in_days = 7
}


resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.bjss_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bjss_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "bjss_object" {
  depends_on             = [aws_s3_bucket_versioning.bucket_versioning]
  key                    = "nice_object"
  bucket                 = aws_s3_bucket.bjss_bucket.id
  source                 = "app.js"
  server_side_encryption = "aws:kms"

  tags = {
    Env = "test"
  }

}

















