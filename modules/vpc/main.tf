module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = "${var.region}_infra_vpc"
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  intra_subnets   = []

  # IPv6 Support
  enable_ipv6 = true
  assign_ipv6_address_on_creation = true

  public_subnet_ipv6_prefixes   = [0, 2]
  private_subnet_ipv6_prefixes  = [1, 3]

  # One NAT Gateway per availability zone
  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = true

  tags = {
    Owner       = "DevOps"
    Terraform   = "true"
    Environment = var.environment
  }

  vpc_tags = {
    Name = "${var.region}_infra_vpc"
  }
}