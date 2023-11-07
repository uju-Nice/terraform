variable "aws_access_key" {

}

variable "aws_secret_key" {

}

variable "aws_region" {
  default = "eu-west-2"
}

variable "devops_vpc" {
  type = list(any)
  # default = {
  #   test        = "10.0.0.0/16"
  #   production = "10.0.1.0/16"
}


variable "devops_subnet" {
  type = list(any)
  #   default = {
  #   test        = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
  #   production = ["10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24"]
  #  }
}


variable "availability_zones" {
  default = ["eu-west-2a", "eu-west-2b"]
  type    = list(any)
}

variable "instance_type" {
  description = "An ec2 instance"
  type        = string
}

variable "bucket_name" {
}

variable "database_name" {

}

variable "environment" {

}

variable "db_username" {
}


variable "db_password" {
}









