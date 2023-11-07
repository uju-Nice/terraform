

# Creation an AWS DataBase instance resource which requires secrets in this config file using jsondecode function
resource "aws_db_instance" "bjss_db" {
  allocated_storage    = 10
  db_name              = "bjss_database"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["db_username"]
  password             = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["db_password"]
  parameter_group_name = "mydb.mysql5.7"
  skip_final_snapshot  = true
}




