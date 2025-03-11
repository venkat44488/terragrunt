
include "root" {
  path = find_in_parent_folders()
}


terraform {
  source = "../../../modules/vpc"
}


inputs = {
  product_name         = "boa"
  environment          = "dev"
  aws_region           = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]

  enable_nat_gateway   = true
  enable_vpc_flow_logs = true
}


