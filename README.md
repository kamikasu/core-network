## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.55.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_bastion"></a> [ec2\_bastion](#module\_ec2\_bastion) | terraform-aws-modules/ec2-instance/aws | ~> 2.0 |
| <a name="module_sg_aurora"></a> [sg\_aurora](#module\_sg\_aurora) | terraform-aws-modules/security-group/aws | 4.3.0 |
| <a name="module_sg_efs"></a> [sg\_efs](#module\_sg\_efs) | terraform-aws-modules/security-group/aws | 4.3.0 |
| <a name="module_sg_http"></a> [sg\_http](#module\_sg\_http) | terraform-aws-modules/security-group/aws | 4.3.0 |
| <a name="module_sg_redis"></a> [sg\_redis](#module\_sg\_redis) | terraform-aws-modules/security-group/aws | 4.3.0 |
| <a name="module_sg_ssh"></a> [sg\_ssh](#module\_sg\_ssh) | terraform-aws-modules/security-group/aws | 4.3.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.ideadores](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate.workshow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | AZs | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c",<br>  "us-east-1d"<br>]</pre> | no |
| <a name="input_bastion_keys"></a> [bastion\_keys](#input\_bastion\_keys) | n/a | `map` | <pre>{<br>  "default": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdAbj+FvnMO/7ZSXQaXGkFzK6vny7Zvi59YOfMCFYfNxGiXTfRSHX/lNwUbY8xFxpOUbLpOSEhxTqLKdjVi8UWy4xBzaT2NuE59QQsnRSQnRfT1+tSRxnu9nNT1DVhvL9Q/y+MkyRGATmitjSFtrifs/gYTJS2AtwcQV71J3bGK1IRHciw2hcSUJj+Dxn2DNYsdE7j1QABx4C6Jlvu7KjqxkczKtLkrq/q2gc7/TnuBr1qi4/nbXabsBeu8w8BPiO1zeK9ay513aAlwEXK52giyahe0iSsr9+28yZrFN4cpWdHnvhjTbclxNsBMogoO1Wqmiur0uO/dYVgqiilQPsNbE0stfvTwv8b2wRsXRXjrfCtg993C/JpeLdIHpsnIerdZQ2JRtJRh41BatDotVil1u6KmO7m6KTBL/3w47hGNRYjNlGZfyQXcjvU2I0UHPOmwfX8KWWp0uaNmN1B4Rr3Lf5mYdtpNrwRyZHrjsbOI1pDHDB8Zj9oorTv5am5YFh3Smu0UIOFGwnujO3d0ARYzcQFWPb/v4d7xMFQ/7rYR94kpS8VXN5mNE6qK7ixvaAzRBr2WqLN52bIsRAtVsQgaCNvYOdfl58KadInv4A1BOpH2AE4fO9ez/ny4Avhea8ysOt6o0C3y5RQunNvEX06NELf5mlDFVJUkntGUu5XaQ=="<br>}</pre> | no |
| <a name="input_databases_subnet_cidr_blocks"></a> [databases\_subnet\_cidr\_blocks](#input\_databases\_subnet\_cidr\_blocks) | Available cidr blocks for databases subnets | `list(string)` | <pre>[<br>  "10.0.211.0/24",<br>  "10.0.212.0/24",<br>  "10.0.213.0/24",<br>  "10.0.214.0/24"<br>]</pre> | no |
| <a name="input_enable_internet_gateway"></a> [enable\_internet\_gateway](#input\_enable\_internet\_gateway) | Enable a Internet gateway in your VPC. | `bool` | `true` | no |
| <a name="input_enable_vpn_gateway"></a> [enable\_vpn\_gateway](#input\_enable\_vpn\_gateway) | Enable a VPN gateway in your VPC. | `bool` | `false` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The Name of your organization | `string` | `"terraform-threepoints"` | no |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | Available cidr blocks for private subnets | `list(string)` | <pre>[<br>  "10.0.201.0/24",<br>  "10.0.202.0/24",<br>  "10.0.203.0/24",<br>  "10.0.204.0/24"<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | The project Name | `string` | `"Core Network"` | no |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | Available cidr blocks for public subnets | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24",<br>  "10.0.103.0/24",<br>  "10.0.104.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region Terraform deploy your instance | `string` | `"us-east-1"` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of infrastructure | `string` | `"core"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR block for VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_workspace_iam_roles"></a> [workspace\_iam\_roles](#input\_workspace\_iam\_roles) | Organization accounts associated with the workspace | `map` | <pre>{<br>  "default": "arn:aws:iam::527770157411:user/administrador"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_ideadores_arn"></a> [acm\_ideadores\_arn](#output\_acm\_ideadores\_arn) | ARNs of the acm ideadores. |
| <a name="output_acm_workshow_arn"></a> [acm\_workshow\_arn](#output\_acm\_workshow\_arn) | ARNs of the acm workshow. |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | Name the subnetwork |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public ip bastion server |
| <a name="output_sg_aurora_id"></a> [sg\_aurora\_id](#output\_sg\_aurora\_id) | The ID of the security group aurora |
| <a name="output_sg_aurora_name"></a> [sg\_aurora\_name](#output\_sg\_aurora\_name) | The name of the security group aurora |
| <a name="output_sg_efs_id"></a> [sg\_efs\_id](#output\_sg\_efs\_id) | The ID of the security group efs |
| <a name="output_sg_http_id"></a> [sg\_http\_id](#output\_sg\_http\_id) | The ID of the security group http |
| <a name="output_sg_http_name"></a> [sg\_http\_name](#output\_sg\_http\_name) | The name of the security group http |
| <a name="output_sg_http_owner_id"></a> [sg\_http\_owner\_id](#output\_sg\_http\_owner\_id) | The owner ID |
| <a name="output_sg_redis_id"></a> [sg\_redis\_id](#output\_sg\_redis\_id) | The ID of the security group Redis |
| <a name="output_sg_redis_name"></a> [sg\_redis\_name](#output\_sg\_redis\_name) | The name of the security group Redis |
| <a name="output_sg_ssh_id"></a> [sg\_ssh\_id](#output\_sg\_ssh\_id) | The ID of the security group ssh |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_azs"></a> [vpc\_azs](#output\_vpc\_azs) | A list of availability zones |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_database_subnets"></a> [vpc\_database\_subnets](#output\_vpc\_database\_subnets) | List of IDs of databases subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpc_private_subnets"></a> [vpc\_private\_subnets](#output\_vpc\_private\_subnets) | List of IDs of private subnets |
| <a name="output_vpc_public_subnets"></a> [vpc\_public\_subnets](#output\_vpc\_public\_subnets) | List of IDs of public subnets |
