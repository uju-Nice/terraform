
provider "aws" {
 region     = var.aws_region
}

resource "aws_s3_bucket" "bjss_bucket" {
  bucket = "nice_bucket"

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
  depends_on = [aws_s3_bucket_versioning.bucket_versioning]
  key        = "nice_object"
  bucket     = aws_s3_bucket.bjss_bucket.id
  source     = "app.js"
  server_side_encryption = "aws:kms"

   tags = {
    Env = "test"
  }

}


# This is storing database secret using aws secrets manager (assuming the secrets have been created in the aws console )

data "aws_secretsmanager_secret" "nice_credentials" {
 name = "nice_credentials"
}

data "aws_secretsmanager_secret_version" "secret_credentials" {
 secret_id = data.aws_secretsmanager_secret.nice_credentials.id
}

# Creation an AWS DataBase instance resource which requires secrets in this config file using jsondecode function
resource "aws_db_instance" "bjss_db" {
 allocated_storage    = 10
 db_name              = "bjss_db"
 engine               = "mysql"
 engine_version       = "5.7"
 instance_class       = "db.t3.micro"
 username             = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["db_username"]
 password             = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["db_password"]
 parameter_group_name = "mydb.mysql5.7"
 skip_final_snapshot  = true
}



















