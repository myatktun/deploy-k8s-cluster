module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = "terraform-eks"
  cluster_version = "1.23"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 1

      labels = {
        role = "general"
      }
      instance_types = ["t2.small"]
      capacity_type  = "ON_DEMAND"
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_roles = [
    {
      rolearn  = module.eks_admin_iam_role.iam_role_arn
      username = module.eks_admin_iam_role.iam_role_name
      groups   = ["system:masters"]
    }
  ]
}
