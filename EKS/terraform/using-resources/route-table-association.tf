resource "aws_route_table_association" "eks_public1" {
  subnet_id      = aws_subnet.eks_public_1.id
  route_table_id = aws_route_table.eks_public.id
}

resource "aws_route_table_association" "eks_public2" {
  subnet_id      = aws_subnet.eks_public_2.id
  route_table_id = aws_route_table.eks_public.id
}

resource "aws_route_table_association" "eks_private1" {
  subnet_id      = aws_subnet.eks_private_1.id
  route_table_id = aws_route_table.eks_private1.id
}

resource "aws_route_table_association" "eks_private2" {
  subnet_id      = aws_subnet.eks_private_2.id
  route_table_id = aws_route_table.eks_private2.id
}
