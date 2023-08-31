output "subnet_pub_id" {
  value = aws_subnet.sn_public.id
}

output "sg_public_id" {
  value = aws_security_group.sg_public.id
}