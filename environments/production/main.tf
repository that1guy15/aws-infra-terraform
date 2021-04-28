module "aws-infra" {
  source = "../../modules/aws-infra"
  profile = var.profile
  region = var.region
  vpc_cidr = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  environment = var.environment
}