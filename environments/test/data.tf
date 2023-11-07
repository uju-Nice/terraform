
data "aws_availability_zones" "azs" {

}

# This is storing database secret using aws secrets manager (assuming the secrets have been created in the aws console )
data "aws_secretsmanager_secret" "bjss_secret_credentials" {
  name = "nice_credentials"
}

data "aws_secretsmanager_secret_version" "secret_credentials" {
  secret_id = data.aws_secretsmanager_secret.nice_credentials.id
}