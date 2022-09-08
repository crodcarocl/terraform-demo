variable "environment_settings" {
  type = map(object({
    instance_type=string, 
    monitoring=bool, 
    instance_name=string, 
    environment=string,
    vpc1_cidr=string,
    subnet1_cidr=string,
    subnet1_name=string,
    vpc1_name=string,
    routetable1_name=string,
    igateway1_name=string
    }))
  default = {
    "DEV" = {
      instance_type = "t2.micro", 
      monitoring = false,
      instance_name = "app-01-dev",
      environment = "DEVELOP",
      vpc1_cidr = "192.168.0.0/16",
      subnet1_cidr = "192.168.0.0/24",
      subnet1_name = "development-subnet1"
      vpc1_name = "development-vpc1",
      routetable1_name = "development-route-table1",
      igateway1_name = "development-igateway1"
    },
   "QA" = {
      instance_type = "t2.micro", 
      monitoring = false,
      instance_name = "app-01-qa",
      environment = "QA",
      vpc1_cidr = "192.167.0.0/16",
      subnet1_cidr = "192.167.0.0/24",
      subnet1_name = "qa-subnet1"
      vpc1_name = "qa-vpc1",
      routetable1_name = "qa-route-table1",
      igateway1_name = "qa-igateway1"
    },
    "STAGING" = {
      instance_type = "t2.micro", 
      monitoring = false,
      instance_name = "app-01-staging",
      environment = "STAGING",
      vpc1_cidr = "192.166.0.0/16"
      subnet1_cidr = "192.166.0.0/24",
      subnet1_name = "staging-subnet1"
      vpc1_name = "staging-vpc1",
      routetable1_name = "staging-route-table1",
      igateway1_name = "staging-igateway1"
    },
    "PROD" = {
      instance_type = "t2.micro", 
      monitoring = true,
      instance_name = "app-01-production",
      instance_environment = "PRODUCTION",
      vpc1_cidr = "172.16.0.0/16",
      subnet1_cidr = "172.16.0.0/24",
      subnet1_name = "production-subnet1"
      vpc1_name = "production-vpc1",
      routetable1_name = "production-route-table1",
      igateway1_name = "production-igateway1"
    }
  }
}