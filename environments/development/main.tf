module "aws-infra" {
  source = "../../modules/aws-infra"
  profile = var.profile
  region = var.region
  vpc_cidr = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  environment = var.environment
}

module "bastion" {
    source = "../../modules/bastion"
    region = var.region
    profile = var.profile
    vpc_id = module.aws-infra.vpc_id
    vpc_cidr = var.vpc_cidr
    azs = module.aws-infra.azs
    public_subnets = module.aws-infra.public_subnets
    ipv6_subnets = module.aws-infra.ipv6_cidr_block
    environment = var.environment
    bastion_admins = var.bastion_admins
    pub_key = var.pub_key
}