
aws_account =  "2222222222"
aws_region =  "eu-west-2"
devops_vpc = "10.0.0.0/16"
devops_subnet = "10.0.0.0/24"
availability_zones = ["eu-west-2a", "eu-west-2b"]
instance_type = "t2.micro"
environment = terraform.workspace == "production" ? true : false
bucket_name = "bjss_bucket"
database_name = "bjss_database"
db_username = ""
db_password = ""
  






