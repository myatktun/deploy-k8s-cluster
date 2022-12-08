resource "aws_resourcegroups_group" "eks_resourcegp" {
  name        = "terraform-eks-resourcegp"
  description = "Resources for eks test environment"
  resource_query {
    query = <<JSON
    {
        "ResourceTypeFilters": [
            "AWS::AllSupported"
        ],
        "TagFilters": [
            {
                "Key": "Project",
                "Values": ["terraform-eks"]
            },
            {
                "Key": "Environment",
                "Values": ["terraform-test"]
            }
        ]
    }
    JSON
  }

  tags = {
    Name = "terraform-eks-resourcegp"
  }
}
