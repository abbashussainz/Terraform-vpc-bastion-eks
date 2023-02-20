resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_bastion, module.vpc]
  instance   = module.ec2_bastion.id
  vpc        = true
  tags = {
    eip = "ec2_bastion"
  }
}
