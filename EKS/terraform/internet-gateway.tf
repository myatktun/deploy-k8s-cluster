resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    var.default_tags,
    {
      Name = "eks-igw"
    }
  )
}
