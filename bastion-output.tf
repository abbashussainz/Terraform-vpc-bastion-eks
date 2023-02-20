output "ec2_id" {
  value = module.ec2_bastion.id
}

output "ec2_eip" {
  value = aws_eip.bastion_eip.public_ip
}