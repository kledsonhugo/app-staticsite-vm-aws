resource "aws_instance" "instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_pub_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  user_data              = var.instance_user_data
  key_name               = var.instance_key_name
}