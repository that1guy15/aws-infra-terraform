provider "aws" {
  profile = "ryan-lab"
  region = local.region
}

locals {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = var.west_vpc_name
  cidr = var.west_vpc_cidr

  azs             = ["${local.region}a", "${local.region}b"]
  private_subnets = var.west_private_subnets
  public_subnets  = var.west_public_subnets
  infra_subnets   = []

  # IPv6 Support
  enable_ipv6 = true
  assign_ipv6_address_on_creation = true

  public_subnet_ipv6_prefixes   = [0, 2]
  private_subnet_ipv6_prefixes  = [1, 3]

  # One NAT Gateway per availability zone
  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_sz = true

  tags = {
    Owner       = "That1Guy15"
    Terraform   = "true"
    Environment = "dev"
  }

  vpc_tags = {
    Name = var.west_vpc_name
  }
}