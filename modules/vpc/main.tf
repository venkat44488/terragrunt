terraform {
  backend "s3" {}
}
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.product_name}-${var.environment}-${var.aws_region}-vpc"
    Product     = var.product_name
    Environment = var.environment
    Region      = var.aws_region
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.product_name}-${var.environment}-${var.aws_region}-igw"
    Product     = var.product_name
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.product_name}-${var.environment}-${var.aws_region}-public-subnet-${count.index + 1}"
    Product     = var.product_name
    Environment = var.environment
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.product_name}-${var.environment}-${var.aws_region}-private-subnet-${count.index + 1}"
    Product     = var.product_name
    Environment = var.environment
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.product_name}-${var.environment}-${var.aws_region}-public-rt"
    Product     = var.product_name
    Environment = var.environment
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.product_name}-${var.environment}-${var.aws_region}-private-rt"
    Product     = var.product_name
    Environment = var.environment
  }
}
