variable "region" {
  description = "The location where the infra is to be deployed"
  type        = string
  default     = "ap-south-1"

}

variable "vpc-cidr" {
default = "192.16.0.0/16"
description = "VPC CIDR BLOCK"
type = string
}

variable "vpc_name" {
  description = "The Name of the VPC"
  type        = string
  default     = "siva-vpc"
}

variable "igw_name" {
  description = "The Name of the IGW"
  type        = string
  default     = "demo_IGW"
}

variable "public_subnet_1" {
default = "192.16.1.0/24"
description = "public_subnet_1"
type = string
}

variable "pub_sub" {
description = "The name of public subnet"
default = "pub_subnet"
type = string
}

variable "az_name-1" {
  description = "The name of public AZ"
  default = "ap-south-1a"
  type = string
}

variable "pub_route" {
  description = "The name of public route table"
  default = "public_RT"
  type = string 
}

variable "pri_sub" {
description = "The name of private subnet"
default = "pri_subnet"
type = string
}

variable "az_name-2" {
description = "The name of private AZ"
default = "ap-south-1b"
type = string
}

variable "private_subnet_1" {
default = "192.16.2.0/24"
description = "private_subnet_1"
type = string
}

variable "key_algorithm" {
description = "The key gen algorithm"
default = "RSA"
type = string
}

variable "pem_file" {
description = "The name of pem file"
default = "TEST.pem"
type = string
}

variable "file_perm" {
description = "The file permission"
default = "0400"
type = number
}

variable "ppk_file" {
description = "The name of ppk file"
default = "TEST"
type = string
}

variable "ssh-location" {
default = "0.0.0.0/0"
description = "SSH variable for bastion host"
type = string
}

variable "instance_type" {
description = "The type of ec2 instance"
default = "t2.micro"
type = string
}

variable "key_name" {
description = "The key for ec2 instance"
default = "LL-TEST"
type = string
}

variable "pubec2-name" {
description = "The name of public ec2 instance"
default = "public-ec2"
type = string
}

