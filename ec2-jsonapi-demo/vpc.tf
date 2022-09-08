module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.environment_settings["${terraform.workspace}"].vpc1_name
  cidr = var.environment_settings["${terraform.workspace}"].vpc1_cidr

  azs             = [
    data.aws_availability_zones.available.names[0], 
    data.aws_availability_zones.available.names[1]
    ]

  private_subnets = [
    var.environment_settings["${terraform.workspace}"].vpc1_private_subnet1_cidr, 
    var.environment_settings["${terraform.workspace}"].vpc1_private_subnet2_cidr
    ]
    
  public_subnets  = [
    var.environment_settings["${terraform.workspace}"].vpc1_public_subnet1_cidr,
    var.environment_settings["${terraform.workspace}"].vpc1_public_subnet2_cidr
    ]

  tags = {Environment = var.environment_settings["${terraform.workspace}"].environment}

  enable_nat_gateway = true
  single_nat_gateway = true
  # one_nat_gateway_per_az = true
}