region          = "us-east-1"
profile         = "ryan-lab"
vpc_cidr        = "172.20.0.0/16"
private_subnets = ["172.20.64.0/24", "172.20.192.0/24"]
public_subnets  = ["172.20.0.0/24", "172.20.128.0/24"]
environment     = "production"