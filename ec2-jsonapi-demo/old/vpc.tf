# VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.environment_settings["${terraform.workspace}"].vpc1_cidr
  enable_dns_hostnames = "true"
  tags = {Name = var.environment_settings["${terraform.workspace}"].vpc1_name, Environment = var.environment_settings["${terraform.workspace}"].environment}
}

# INTERNET_GATEWAY
resource "aws_internet_gateway" "igateway1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {Name = var.environment_settings["${terraform.workspace}"].igateway1_name, Environment = var.environment_settings["${terraform.workspace}"].environment}
}

# SUBNET
resource "aws_subnet" "subnet1" {
  cidr_block = var.environment_settings["${terraform.workspace}"].subnet1_cidr
  vpc_id = aws_vpc.vpc1.id
  map_public_ip_on_launch = "false"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {Name = var.environment_settings["${terraform.workspace}"].subnet1_name, Environment = var.environment_settings["${terraform.workspace}"].environment}
}

# ROUTE_TABLE
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {Name = var.environment_settings["${terraform.workspace}"].routetable1_name, Environment = var.environment_settings["${terraform.workspace}"].environment}

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igateway1.id
  }
}

resource "aws_route_table_association" "route_private_subnet_1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}