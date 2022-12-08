output "vpc_id" {
  value       = aws_vpc.eks_vpc.id
  description = "EKS VPC ID"
  sensitive   = false
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.eks_test_cluster.name
}
