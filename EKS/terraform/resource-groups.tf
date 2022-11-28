resource "aws_resourcegroups_group" "eks_resourcegp" {
  name        = var.project_name
  description = "Resources for eks test environment"
  resource_query {
    query = <<JSON
    {
        "ResourceTypeFilters": [
            "AWS::EC2::Instance",
            "AWS::EKS::Cluster",
            "AWS::EC2::VPC",
            "AWS::EC2::Subnet",
            "AWS::EC2::InternetGateway",
            "AWS::EC2::EIP",
            "AWS::EC2::NatGateway"
        ],
        "TagFilters": [
            {
                "Key": "Project",
                "Values": ["${var.project_name}"]
            },
            {
                "Key": "Environment",
                "Values": ["test"]
            }
        ]
    }
    JSON
  }

  tags = merge(
    var.default_tags,
    {
      Name = "eks-resourcegp"
    }
  )
}
