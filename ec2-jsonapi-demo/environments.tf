variable "environment_settings" {
  type = map(object({
    environment=string,
    monitoring=bool,
    instance_count=number,
    instance_type=string, 
    instance_name=string,
    vpc1_name=string,
    vpc1_cidr=string,
    vpc1_private_subnet1_cidr=string,
    vpc1_private_subnet2_cidr=string,
    vpc1_public_subnet1_cidr=string,
    vpc1_public_subnet2_cidr=string
    }))
  default = {
    "DEV" = {
      monitoring = false,
      environment = "DEVELOP",
      instance_count = 1,
      instance_type = "t2.micro", 
      instance_name = "app-01-dev",
      vpc1_name = "development-vpc1",
      vpc1_cidr = "192.168.0.0/16",
      vpc1_private_subnet1_cidr = "192.168.0.0/24",
      vpc1_private_subnet2_cidr = "192.168.1.0/24",
      vpc1_public_subnet1_cidr = "192.168.100.0/24",
      vpc1_public_subnet2_cidr = "192.168.101.0/24",
    },
   "QA" = {
      monitoring = false,
      environment = "QA",
      instance_count = 1,
      instance_type = "t2.micro", 
      instance_name = "app-01-qa",
      vpc1_name = "qa-vpc1",
      vpc1_cidr = "192.167.0.0/16",
      vpc1_private_subnet1_cidr = "192.167.0.0/24",
      vpc1_private_subnet2_cidr = "192.167.1.0/24",
      vpc1_public_subnet1_cidr = "192.167.100.0/24",
      vpc1_public_subnet2_cidr = "192.167.101.0/24",
    },
    "STAGING" = {
      monitoring = false,
      environment = "STAGING",
      instance_count = 1,
      instance_type = "t2.micro", 
      instance_name = "app-01-staging",
      vpc1_name = "staging-vpc1",
      vpc1_cidr = "192.166.0.0/16",
      vpc1_private_subnet1_cidr = "192.166.0.0/24",
      vpc1_private_subnet2_cidr = "192.166.1.0/24",
      vpc1_public_subnet1_cidr = "192.166.100.0/24",
      vpc1_public_subnet2_cidr = "192.166.101.0/24",
    },
    "PROD" = {
      monitoring = false,
      environment = "PRODUCTION",
      instance_count = 1,
      instance_type = "t2.micro", 
      instance_name = "app-01-production",
      vpc1_name = "production-vpc1",
      vpc1_cidr = "192.165.0.0/16",
      vpc1_private_subnet1_cidr = "192.165.0.0/24",
      vpc1_private_subnet2_cidr = "192.165.1.0/24",
      vpc1_public_subnet1_cidr = "192.165.100.0/24",
      vpc1_public_subnet2_cidr = "192.165.101.0/24",
    }
  }
}