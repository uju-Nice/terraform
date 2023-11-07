

resource "aws_vpc" "main" {
  cidr_block = var.devops_vpc
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.devops_vpc.id
  availability_zone = data.aws_availability_zones.azs
  # cidr_subnet       = var.devops_subnet[count.index]
  # count             = length(var.devops_subnet)

}
