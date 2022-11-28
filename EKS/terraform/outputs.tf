output "vpc_id" {
  value       = aws_vpc.eks_vpc.id
  description = "EKS VPC ID"
  sensitive   = false
}
