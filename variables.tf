variable "west_vpc_name" {
  description = "Value of the name tag for the VPC"
  type = string
  default = "us-west-2-infra-vpc"
}

variable "west_vpc_cidr" {
  description = "IPv4 CIDR range allocated for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "west_private_subnets" {
  description = "Subnets created in the VPC"
  type = map(string)
  default = {"1a": "10.0.64.0/24", "1b": "10.0.192.0/24"}
}

variable "west_public_subnets" {
  description = "Subnets created in the VPC"
  type = map(string)
  default = {"1a": "10.0.0.0/24", "1b": "10.0.128.0/24"}
}