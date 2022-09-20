terraform {
  backend "s3" {
    bucket         = "terraform-threepoints"
    key            = "core/network.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "terraform-states-lock"
  }
}

provider "aws" {
  region = var.region
  # assume_role {
  #   role_arn = var.workspace_iam_roles[terraform.workspace]
  # }
}

locals {
  name        = "${var.organization}-${terraform.workspace}"
  user_data   = <<EOT
  #!/bin/bash
  echo "${var.bastion_keys[terraform.workspace]}" > /home/ec2-user/.ssh/authorized_keys
  EOT
  common_tags = {
    Terraform   = true
    Project     = var.project
    Environment = terraform.workspace
    Type        = var.type
  }
}

module "vpc" {
  source                      = "terraform-aws-modules/vpc/aws"
  version                     = "3.2.0"
  name                        = "${local.name}-vpc"
  cidr                        = var.vpc_cidr_block
  azs                         = var.availability_zones
  private_subnets             = var.private_subnet_cidr_blocks
  public_subnets              = var.public_subnet_cidr_blocks
  create_igw                  = var.enable_internet_gateway
  enable_dns_hostnames        = true
  enable_nat_gateway          = false
  enable_vpn_gateway          = var.enable_vpn_gateway
  database_subnets            = var.databases_subnet_cidr_blocks
  database_subnet_group_name  = "${local.name}-aurora"
  tags                        = local.common_tags
}

module "sg_http" {
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "4.3.0"
  name                     = "${local.name}-sg-http"
  description              = "Public Server http(s)"
  vpc_id                   = module.vpc.vpc_id
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_ipv6_cidr_blocks = ["::/0"]
  ingress_rules            = ["http-80-tcp", "http-8080-tcp", "https-443-tcp", "all-icmp"]
  egress_rules             = ["all-all"]
  tags                     = local.common_tags
}

module "sg_ssh" {
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "4.3.0"
  name                     = "${local.name}-sg-ssh"
  description              = "Public Server SSH"
  vpc_id                   = module.vpc.vpc_id
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_ipv6_cidr_blocks = ["::/0"]
  ingress_rules            = ["ssh-tcp"]
  egress_rules             = ["all-all"]
  tags                     = local.common_tags
}

module "sg_efs" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.3.0"
  name                = "${local.name}-sg-efs"
  description         = "EFS Security Group"
  vpc_id              = module.vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      rule                     = "nfs-tcp"
      source_security_group_id = module.sg_http.security_group_id
    }
  ]
  egress_rules        = ["all-all"]
}

module "sg_aurora" {
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "4.3.0"
  name                     = "${local.name}-sg-aurora"
  description              = "Security group for Aurora"
  vpc_id                   = module.vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      rule                     = "mysql-tcp"
      source_security_group_id = module.sg_http.security_group_id
    }
  ]
  egress_rules             = ["all-all"]
}
module "sg_redis" {
  source                   = "terraform-aws-modules/security-group/aws"
  version                  = "4.3.0"
  name                     = "${local.name}-sg-redis"
  description              = "Security group for Redis"
  vpc_id                   = module.vpc.vpc_id
  ingress_with_source_security_group_id = [
    {
      rule                     = "redis-tcp"
      source_security_group_id = module.sg_http.security_group_id
    }
  ]
  egress_rules             = ["all-all"]
}

resource "aws_acm_certificate" "workshow" {
  domain_name       = "*.workshow.live"
  validation_method = "DNS"
  tags              = {
    Name = "workshow"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "ideadores" {
  domain_name       = "*.ideadores.co"
  validation_method = "DNS"
  tags              = {
    Name = "ideadores"
  }
  lifecycle {
    create_before_destroy = true
  }
}

module "ec2_bastion" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = "ec2-bastion"
  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t3.micro"
  user_data_base64       = base64encode(local.user_data)
  monitoring             = true
  vpc_security_group_ids = [module.sg_ssh.security_group_id, module.sg_http.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags                   = {
    Terraform = true
    Env       = terraform.workspace
  }
}
