module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"


  name            = var.vpc_name
  azs             = ["us-east-1a", "us-east-1b"]
  cidr            = var.vpc_cidr_block
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  #enable nat gateway and set up routable to private subnets 
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags

  vpc_tags = {
    vpc = "test-k8s-vpc"
  }


  public_subnet_tags = {
    Type = "Public-Subnets"
  }

  private_subnet_tags = {
    Type = "private-Subnets"
  }

}
