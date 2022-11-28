resource "aws_iam_role" "eks_test_nodes" {
  name               = "eks-test-nodes"
  assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
  POLICY

  tags = merge(
    var.default_tags,
    {
      Name = "eks-test-nodes"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_test_nodes.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_test_nodes.name
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_test_nodes.name
}

resource "aws_eks_node_group" "eks-test-node-group" {
  cluster_name    = aws_eks_cluster.eks_test_cluster.name
  node_group_name = "eks-test-node-group"
  node_role_arn   = aws_iam_role.eks_test_nodes.arn
  subnet_ids = [
    aws_subnet.eks_private_1.id,
    aws_subnet.eks_private_2.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  disk_size            = 20
  force_update_version = false
  instance_types       = ["t2.small"]
  labels = {
    role = "eks-test-node-group"
  }
  version = "1.23"
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only
  ]
  tags = merge(
    var.default_tags,
    {
      Name = "eks-test-node-group"
    }
  )
}
