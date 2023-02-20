module "ec2_bastion" {
  name                   = var.ec2_name
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "3.3.0"
  ami                    = var.bastion_ami
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
  tags = {
    vpc = "bastion-host"
  }
}