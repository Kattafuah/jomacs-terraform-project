
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source    = "./modules/vpc"
  target_id = module.ec2.instance_id
}

module "ec2" {
  source          = "./modules/ec2"
  instance_subnet = module.vpc.private_subnet
  instance_sg     = module.vpc.instance_sg
}