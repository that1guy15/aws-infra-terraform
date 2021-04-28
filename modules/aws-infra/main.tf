module "vpc"{
    source = "../vpc"
    region = var.region
    profile = var.profile
    vpc_cidr = var.vpc_cidr
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
    environment = var.environment
}