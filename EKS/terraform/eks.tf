resource "aws_iam_role" "eks_test_cluster" {
  name               = "eks-test-cluster"
  assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
  POLICY

  tags = merge(
    var.default_tags,
    {
      Name = "eks-test-cluster-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_test_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_test_cluster.name
}

resource "aws_eks_cluster" "eks_test_cluster" {
  name     = "eks-test-cluster"
  role_arn = aws_iam_role.eks_test_cluster.arn
  version  = "1.23"

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids = [
      aws_subnet.eks_public_1.id,
      aws_subnet.eks_public_2.id,
      aws_subnet.eks_private_1.id,
      aws_subnet.eks_private_2.id,
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_test_cluster_policy
  ]

  tags = merge(
    var.default_tags,
    {
      Name = "eks-test-cluster"
    }
  )
}
