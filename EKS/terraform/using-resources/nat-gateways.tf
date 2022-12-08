resource "aws_nat_gateway" "eks_gw1" {
  allocation_id = aws_eip.eks_nat1.id
  subnet_id     = aws_subnet.eks_public_1.id

  tags = merge(
    var.default_tags,
    {
      Name = "eks-NAT-1"
    }
  )
}

resource "aws_nat_gateway" "eks_gw2" {
  allocation_id = aws_eip.eks_nat2.id
  subnet_id     = aws_subnet.eks_public_2.id

  tags = merge(
    var.default_tags,
    {
      Name = "eks-NAT-2"
    }
  )
}
