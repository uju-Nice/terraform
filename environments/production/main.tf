
module "production" {
  source = "../terraform_training/environments/production"
    # source = "github.com//terraform_training/environments/production?ref=v1.0.0"

#   variables here 
aws_region =  var.aws_region
devops_vpc = var.devops_vpc
devops_subnet = var.devops_subnet
availability_zones = var.availability_zones
instance_type = var.instance_type
environment = var.Environment
bucket_name = var.bucket_name
database_name = var.database_name
db_username = var.db_username
db_password = var.db_password

}

