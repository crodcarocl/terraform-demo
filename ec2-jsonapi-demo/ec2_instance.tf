module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = var.environment_settings["${terraform.workspace}"].instance_name
  instance_count         = var.environment_settings["${terraform.workspace}"].instance_count

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = var.environment_settings["${terraform.workspace}"].instance_type

  vpc_security_group_ids = [aws_security_group.sg_app01_instance.id]
  subnet_id              = module.vpc.private_subnets[0]
}