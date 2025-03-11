variable "product_name" {}
variable "environment" {}
variable "aws_region" {}
variable "vpc_cidr" {}
variable "enable_dns_support" { default = true }
variable "enable_dns_hostnames" { default = true }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "availability_zones" { type = list(string) }
variable "enable_nat_gateway" { default = true }
variable "enable_vpc_flow_logs" { default = false }
