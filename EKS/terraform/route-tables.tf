resource "aws_route_table" "eks_public" {
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    var.default_tags,
    {
      Name = "eks-public-rt"
    }
  )
}

resource "aws_route_table" "eks_private1" {
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_gw1.id
  }

  tags = merge(
    var.default_tags,
    {
      Name = "eks-private-rt1"
    }
  )
}

resource "aws_route_table" "eks_private2" {
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_gw2.id
  }

  tags = merge(
    var.default_tags,
    {
      Name = "eks-private-rt2"
    }
  )
}
