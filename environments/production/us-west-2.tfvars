region          = "us-west-2"
profile         = "ryan-lab"
vpc_cidr        = "10.0.0.0/16"
private_subnets = ["10.0.64.0/24", "10.0.192.0/24"]
public_subnets  = ["10.0.0.0/24", "10.0.128.0/24"]
environment     = "production"