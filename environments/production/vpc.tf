
resource "aws_vpc" "main" {
  cidr_block = var.devops_vpc
}

resource "aws_subnet" "nice_subnet" {
  vpc_id            = aws_vpc.nice_vpc.id
  availability_zone = data.aws_availability_zones.azs
  # count             = length(var.public_subnet)
  # subnet_cidr       = var.public_subnet[count.index]
}
