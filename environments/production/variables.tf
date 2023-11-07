variable "aws_access_key" {
  
}

variable "aws_secret_key" {
  
}

variable "aws_region" {
 default = "eu-west-2"
}

variable "devops_vpc" {
  default = "10.0.0.0/16"
}

variable "devops_subnet" {
  default = "10.0.0.0/24"
}

variable "availability_zones" {
  default = ["eu-west-2a", "eu-west-2b"]
  type = list 
}

variable "instance_type" {
  description = "An ec2 instance"
  type = string
}

variable "devops_subnet" {
  default = "10.0.1.0/24"
}

variable "availability_zones" {
  default = ["eu-west-2a", "eu-west-2b"]
  type = list 
}

variable "environment" {
  
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "public_subnet" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "azs" {
  default = ["eu-west-2a", "eu-west-2b"]
}







