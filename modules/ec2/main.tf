# provider "aws" {
#   region = var.aws_region
# }
terraform {
  backend "s3" {}
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
    Env  = var.environment
  }
}

# output "instance_id" {
#   value = aws_instance.ec2_instance.id
# }

