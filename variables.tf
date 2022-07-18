variable "region" {
  description = "The location where the infra is to be deployed"
  type        = string
  default     = "ap-south-1"

}

variable "vpc-cidr" {
default = "192.16.0.0/24"
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