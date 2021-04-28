region          = "us-east-1"
profile         = "ryan-lab"
vpc_cidr        = "10.4.0.0/16"
private_subnets = ["10.4.64.0/24", "10.4.192.0/24"]
public_subnets  = ["10.4.0.0/24", "10.4.128.0/24"]
environment     = "production"