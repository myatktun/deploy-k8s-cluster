resource "aws_resourcegroups_group" "eks_resourcegp" {
  name        = var.project_name
  description = "Resources for streamit dev environment"
  resource_query {
    query = <<JSON
    {
        "ResourceTypeFilters": [
            "AWS::EC2::Instance",
            "AWS::EKS::Cluster",
            "AWS::EC2::VPC",
            "AWS::EC2::Subnet"
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

  tags = var.default_tags
}
