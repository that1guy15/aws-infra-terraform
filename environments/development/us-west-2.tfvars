region          = "us-west-2"
profile         = "ryan-lab"
vpc_cidr        = "172.16.0.0/16"
private_subnets = ["172.16.64.0/24", "172.16.192.0/24"]
public_subnets  = ["172.16.0.0/24", "172.16.128.0/24"]
environment     = "production"