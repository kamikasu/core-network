variable "organization" {
  description = "The Name of your organization"
  type        = string
  default     = "terraform-threepoints"
}

variable "region" {
  description = "The region Terraform deploy your instance"
  type        = string
  default     = "us-east-1"
}

variable "workspace_iam_roles" {
  description = "Organization accounts associated with the workspace"
  type    = map
  default = {
    # develop = "arn:aws:iam::059152934397:role/OrganizationAccountAccessRole"
    # staging = "arn:aws:iam::022060465973:role/OrganizationAccountAccessRole"
    default = "arn:aws:iam::527770157411:user/administrador"
  }
}

variable "bastion_keys" {
  type = map
  default = {
    # develop = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIu2r/Kvhs3RuwjtZKwAwy45uIm8csAdRqJTq+zjt+fQ4QhGb+DuCqpUtsRktb1fdiF8ECoIb705ZaFLDYQuklTydcXvyYZujXngJFcCBDEh7B/e/aDK70J5trBYIt9LBnZ3e1vc0pn4I5lasfKd946gf94nzSFfFg8q/EWhbcexohD7gb/VYJ/wItuqqdA5WQZ6Cq8F3SlMr1eVgPHVXzMCGjUmvytQd4fD2WvGgNO0CiMPld84xufRmBXsxh8MR1ekLa4MDk8iF25xzPMPfmSODh5V1ycyNiHs1vKaqUtACBqj94nXRqak/e46NCETyweG6VQ5wH6NywMy5jrTwj"
    # staging = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCDorXJ7VwlrWuAeJpYi+yRfHs4ZxMckFpo+qasf+pP1CWhfasggJyvfuw/tJpdvCiX0TfdjDpzolVeJXkS0pVk/xGXET/YE33IG/RDSjtZFoU8TSaJ4eiDo3NdBBr0/o1lRJwaQ/Ea2Zk9MRpd7vRiA1ui+ZVcXiNTMX+Sy8mG54sset7UbJZO+o4cFIi0Vi1q9/njTcGHe8BTXmXLhOFJuDRbVhTSSLoS94isQEmQ/8wcRo0Btm5nG1JLTohc+kzCqOaJO1K4XES8mjal0nRWtIIih2AynA+S0ukOqjV97Hws9HdUBIecR1jqiKfJaOBzf6MuQcuCL9jw/qvGau9J"
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdAbj+FvnMO/7ZSXQaXGkFzK6vny7Zvi59YOfMCFYfNxGiXTfRSHX/lNwUbY8xFxpOUbLpOSEhxTqLKdjVi8UWy4xBzaT2NuE59QQsnRSQnRfT1+tSRxnu9nNT1DVhvL9Q/y+MkyRGATmitjSFtrifs/gYTJS2AtwcQV71J3bGK1IRHciw2hcSUJj+Dxn2DNYsdE7j1QABx4C6Jlvu7KjqxkczKtLkrq/q2gc7/TnuBr1qi4/nbXabsBeu8w8BPiO1zeK9ay513aAlwEXK52giyahe0iSsr9+28yZrFN4cpWdHnvhjTbclxNsBMogoO1Wqmiur0uO/dYVgqiilQPsNbE0stfvTwv8b2wRsXRXjrfCtg993C/JpeLdIHpsnIerdZQ2JRtJRh41BatDotVil1u6KmO7m6KTBL/3w47hGNRYjNlGZfyQXcjvU2I0UHPOmwfX8KWWp0uaNmN1B4Rr3Lf5mYdtpNrwRyZHrjsbOI1pDHDB8Zj9oorTv5am5YFh3Smu0UIOFGwnujO3d0ARYzcQFWPb/v4d7xMFQ/7rYR94kpS8VXN5mNE6qK7ixvaAzRBr2WqLN52bIsRAtVsQgaCNvYOdfl58KadInv4A1BOpH2AE4fO9ez/ny4Avhea8ysOt6o0C3y5RQunNvEX06NELf5mlDFVJUkntGUu5XaQ=="
  }
}

variable "project" {
  description = "The project Name"
  type        = string
  default     = "Core Network"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_vpn_gateway" {
  description = "Enable a VPN gateway in your VPC."
  type        = bool
  default     = false
}

variable "enable_internet_gateway" {
  description = "Enable a Internet gateway in your VPC."
  type        = bool
  default     = true
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24"
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default     = [
    "10.0.201.0/24",
    "10.0.202.0/24",
    "10.0.203.0/24",
    "10.0.204.0/24"
  ]
}

variable "databases_subnet_cidr_blocks" {
  description = "Available cidr blocks for databases subnets"
  type        = list(string)
  default     = [
    "10.0.211.0/24",
    "10.0.212.0/24",
    "10.0.213.0/24",
    "10.0.214.0/24"
  ]
}

variable "availability_zones" {
  description = "AZs"
  type        = list(string)
  default     = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d"
  ]
}

variable "type" {
  description = "Type of infrastructure"
  type        = string
  default     = "core"
}
