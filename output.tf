output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "vpc_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "vpc_database_subnets" {
  description = "List of IDs of databases subnets"
  value       = module.vpc.database_subnets
}

output "vpc_azs" {
  description = "A list of availability zones"
  value       = module.vpc.azs
}

output "db_subnet_group" {
  description = "Name the subnetwork"
  value       = module.vpc.database_subnet_group_name
}

output "sg_http_id" {
  description = "The ID of the security group http"
  value       = module.sg_http.security_group_id
}

output "sg_ssh_id" {
  description = "The ID of the security group ssh"
  value       = module.sg_ssh.security_group_id
}

output "sg_efs_id" {
  description = "The ID of the security group efs"
  value       = module.sg_efs.security_group_id
}

output "sg_aurora_id" {
  description = "The ID of the security group aurora"
  value       = module.sg_aurora.security_group_id
}
output "sg_redis_id" {
  description = "The ID of the security group Redis"
  value       = module.sg_redis.security_group_id
}

output "sg_http_owner_id" {
  description = "The owner ID"
  value       = module.sg_http.security_group_owner_id
}

output "sg_http_name" {
  description = "The name of the security group http"
  value       = module.sg_http.security_group_name
}

output "sg_aurora_name" {
  description = "The name of the security group aurora"
  value       = module.sg_aurora.security_group_name
}
output "sg_redis_name" {
  description = "The name of the security group Redis"
  value       = module.sg_redis.security_group_name
}

output "public_ip" {
  description = "The public ip bastion server"
  value       = module.ec2_bastion.public_ip
}

output "acm_workshow_arn" {
  description = "ARNs of the acm workshow."
  value       = aws_acm_certificate.workshow.arn
}

output "acm_ideadores_arn" {
  description = "ARNs of the acm ideadores."
  value       = aws_acm_certificate.ideadores.arn
}
