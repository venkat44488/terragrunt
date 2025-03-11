


terraform {
  backend "s3" {}  # This tells Terraform that Terragrunt will handle the remote state
}

data "aws_availability_zones" "available" {}


# Your VPC configuration
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

    tags = {
    Name = "MainVPC"
  }
}

resource "aws_internet_gateway" "igw" {
  count  = var.igw_enabled ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_cidr}-igw"
  }
}


resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "private-subnet-${count.index}"
  }
}
