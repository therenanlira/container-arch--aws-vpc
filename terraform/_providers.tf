terraform {
  required_version = "~> 1.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = local.workspace.allowed_accounts
  region              = local.workspace.aws_region
  default_tags {
    tags = local.tags
  }
}

provider "aws" {
  alias               = "central"
  allowed_account_ids = local.workspace.allowed_accounts
  region              = local.workspace.central_region
  default_tags {
    tags = local.tags
  }
}
