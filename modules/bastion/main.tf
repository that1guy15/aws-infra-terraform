# Bastion Host security group
resource "aws_security_group" "infra_bastion_SG" {
  name          = "infra_bastion_sg"
  description   = "Control traffic bastion host"
  vpc_id        = var.vpc_id

  ingress {
    description = "SSH from remote admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.bastion_admins
  }
  ingress {
    description = "ICMP from remote admin"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.bastion_admins
  }
   egress {
     description = "infra environment subnets"
     from_port = 0
     to_port = 0
     protocol = -1
     cidr_blocks = [var.vpc_cidr]
     ipv6_cidr_blocks = [var.ipv6_subnets]
   }
  tags = {
    Name = "infra_bastion_sg"
  }
}

# Bastion Key Pair
resource "aws_key_pair" "bastion_kp" {
  key_name   = "bastion_kp"
  public_key = var.pub_key

  tags = {
    Name = "bastion-kp"
  }
}

# Bastion Interface (AZ 1a)
resource "aws_network_interface" "bastion_intf_1a" {
  subnet_id   = var.public_subnets[0]

  security_groups = [
    aws_security_group.infra_bastion_SG.id
  ]

  tags = {
    Name = "bastion-intf-1a"
  }
}

# Bastion Interface (AZ 1b)
resource "aws_network_interface" "bastion_intf_1b" {
  subnet_id   = var.public_subnets[1]

  security_groups = [
    aws_security_group.infra_bastion_SG.id
  ]

  tags = {
    Name = "bastion-intf-1b"
  }
}

# Bastion host (AZ 1a)
resource "aws_instance" "infra_bastion_1a" {
  ami           = data.aws_ami.amazon-linux-2.image_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.bastion_kp.key_name
  availability_zone = var.azs[0]

  network_interface {
    network_interface_id = aws_network_interface.bastion_intf_1a.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Name = "${var.azs[0]}-bastion"
  }
}

# Bastion host (AZ 1b)
resource "aws_instance" "infra_bastion_1b" {
  ami           = data.aws_ami.amazon-linux-2.image_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.bastion_kp.key_name
  availability_zone = var.azs[1]

  network_interface {
    network_interface_id = aws_network_interface.bastion_intf_1b.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Name = "${var.azs[1]}-bastion"
  }
}

# Amazon Linux 2 AMI Lookup
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}
