# SECURITY_GROUP
resource "aws_security_group" "sg_app01_instance" {
  name = "app01-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      var.environment_settings["${terraform.workspace}"].vpc1_private_subnet1_cidr, 
      var.environment_settings["${terraform.workspace}"].vpc1_private_subnet2_cidr
    ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      var.environment_settings["${terraform.workspace}"].vpc1_private_subnet1_cidr, 
      var.environment_settings["${terraform.workspace}"].vpc1_private_subnet2_cidr
    ]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app01-sg",
    Environment = var.environment_settings["${terraform.workspace}"].environment
    }
}