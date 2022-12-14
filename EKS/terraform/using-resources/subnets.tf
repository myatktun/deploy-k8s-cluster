resource "aws_subnet" "eks_public_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "192.168.0.0/18"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = merge(
    var.default_tags,
    {
      Name                                       = "eks-public-ap-southeast-1a"
      "kubernetes.io/cluster/${var.eks_cluster}" = "shared"
      "kubernetes.io/role/elb"                   = 1
    }
  )
}

resource "aws_subnet" "eks_public_2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "192.168.64.0/18"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = merge(
    var.default_tags,
    {
      Name                                       = "eks-public-ap-southeast-1b"
      "kubernetes.io/cluster/${var.eks_cluster}" = "shared"
      "kubernetes.io/role/elb"                   = 1
    }
  )
}

resource "aws_subnet" "eks_private_1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "192.168.128.0/18"
  availability_zone = "ap-southeast-1a"

  tags = merge(
    var.default_tags,
    {
      Name                                       = "eks-private-ap-southeast-1a"
      "kubernetes.io/cluster/${var.eks_cluster}" = "shared"
      "kubernetes.io/role/internal-elb"          = 1
    }
  )
}

resource "aws_subnet" "eks_private_2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "192.168.192.0/18"
  availability_zone = "ap-southeast-1b"

  tags = merge(
    var.default_tags,
    {
      Name                                       = "eks-private-ap-southeast-1b"
      "kubernetes.io/cluster/${var.eks_cluster}" = "shared"
      "kubernetes.io/role/internal-elb"          = 1
    }
  )
}
