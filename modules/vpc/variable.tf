# variable "vpc_cidr" {}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "igw_enabled" {
  description = "Flag to enable an Internet Gateway"
  type        = bool
  default     = true
}
