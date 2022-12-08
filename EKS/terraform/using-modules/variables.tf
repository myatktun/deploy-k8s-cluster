variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_azs" {
  type = list(string)
}

variable "vpc_public_subnets" {
  type = list(string)
}

variable "vpc_private_subnets" {
  type = list(string)
}

variable "vpc_enable_nat_gateway" {
  type = bool
}

variable "vpc_single_nat_gateway" {
  type = bool
}

variable "vpc_one_nat_gateway_per_az" {
  type = bool
}

variable "vpc_enable_dns_hostnames" {
  type = bool
}

variable "vpc_enable_dns_support" {
  type = bool
}
