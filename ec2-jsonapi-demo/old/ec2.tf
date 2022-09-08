# INSTANCE
resource "aws_instance" "app01" {
  ami = data.aws_ami.aws-linux.id
  instance_type = var.environment_settings["${terraform.workspace}"].instance_type
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.sg_app01_instance.id]
  monitoring = var.environment_settings["${terraform.workspace}"].monitoring
  tags = {
    Name = var.environment_settings["${terraform.workspace}"].instance_name,
    Environment = var.environment_settings["${terraform.workspace}"].environment
    }
}