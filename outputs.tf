output "subnet_cidr_block" {
  value = aws_subnet.dev_env_subnet.cidr_block
}

output "dev_ec2_publip_ip" {
  value = aws_instance.dev_env_ec2.public_ip
}