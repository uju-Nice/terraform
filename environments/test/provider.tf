

terraform {
  backend "s3" {
    bucket         = "bjss-remote-state"
    key            = "environemts/test/bjss.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "bjss.tfstate_lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = var.aws_region
}