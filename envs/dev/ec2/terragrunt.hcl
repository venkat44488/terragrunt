include "root" {
  path = find_in_parent_folders()
}


terraform {
  source = "../../modules/ec2"  # Change to your desired Terraform module location
}


inputs = {
  aws_region     = "us-east-1"
  ami_id         = "ami-08b5b3a93ed654d19"  # Replace with a valid AMI ID
  instance_type  = "t2.micro"
  instance_name  = "dev-instance"
  environment    = "dev"
  vpc_cidr = "10.0.1.0/16"

}






