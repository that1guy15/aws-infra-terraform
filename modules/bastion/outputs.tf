# Security Group
output "bastion_sg" {
  description = "The bastion host security group"
  value       = aws_security_group.infra_bastion_SG
}

# Bastion Key Pair
output "bastion_kp" {
  description = "The bastion host key pair"
  value       = aws_key_pair.bastion_kp
}

# Bastion Interface
output "bastion_intf_1a" {
  description = "The bastion host interface"
  value       = aws_network_interface.bastion_intf_1a
}

# Instance ID
output "bastion_instance_1b" {
  description = "EC2 instance of the bastion host"
  value       = aws_instance.infra_bastion_1b
}