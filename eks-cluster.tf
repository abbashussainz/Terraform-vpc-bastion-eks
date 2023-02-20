resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-master-cluster"
  role_arn = aws_iam_role.eks_master_role.arn

  vpc_config {
    subnet_ids              = module.vpc.public_subnets
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy , 
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController]

}