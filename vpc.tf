# Create VPC
# terraform aws create vpc
resource "aws_vpc" "vpc" {
cidr_block = "${var.vpc-cidr}"
instance_tenancy        = "default"
enable_dns_hostnames    = true
tags      = {
Name    = "${var.vpc_name}"
}
}
# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
vpc_id    = aws_vpc.vpc.id
tags = {
Name    = "${var.igw_name}"
}
}
# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = "${var.public_subnet_1}"
availability_zone       = "${var.az_name-1}"
map_public_ip_on_launch = true
tags      = {
Name    = "${var.pub_sub}"
}
}
# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.internet-gateway.id
}
tags       = {
Name     = "${var.pub_route}"
}
}
# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
subnet_id           = aws_subnet.public-subnet-1.id
route_table_id      = aws_route_table.public-route-table.id
}
# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
vpc_id                   = aws_vpc.vpc.id
cidr_block               = "${var.private_subnet_1}"
availability_zone        = "${var.az_name-2}"
map_public_ip_on_launch  = false
tags      = {
Name    = "${var.pri_sub}"
}
}