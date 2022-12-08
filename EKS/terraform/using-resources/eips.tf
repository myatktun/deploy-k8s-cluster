resource "aws_eip" "eks_nat1" {
  depends_on = [aws_internet_gateway.eks_igw]

  tags = merge(
    var.default_tags,
    {
      Name = "eks-EIP-1"
    }
  )
}

resource "aws_eip" "eks_nat2" {
  depends_on = [aws_internet_gateway.eks_igw]

  tags = merge(
    var.default_tags,
    {
      Name = "eks-EIP-2"
    }
  )
}
