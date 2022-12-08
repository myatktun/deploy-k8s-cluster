variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "project_name" {
  type    = string
  default = "eks-test"
}

variable "default_tags" {
  default = {
    Project     = "eks-test"
    Environment = "test"
  }
  type = map(string)
}

variable "eks_cluster" {
  type    = string
  default = "eks-test-cluster"
}
