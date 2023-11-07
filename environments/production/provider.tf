

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "bjss-bucket"
    key            = "environemts/production/bjss.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "bjss.tfstate_lock"
  }

  

}

