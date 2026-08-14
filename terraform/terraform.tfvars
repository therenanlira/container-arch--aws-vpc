workspaces = {
  dev-us-east-2 = {
    allowed_accounts = ["150100906110"]
    environment      = "dev"
    aws_region       = "us-east-2"
    central_region   = "us-east-2"
    central_account  = 150100906110
    is_central       = true

    project_name = "container-arch"
    cidr_block   = "10.1.0.0/16"
  }

  dev-us-west-2 = {
    allowed_accounts = ["150100906110"]
    environment      = "dev"
    aws_region       = "us-west-2"
    central_region   = "us-east-2"
    central_account  = 150100906110
    is_central       = false

    project_name = "container-arch"
    cidr_block   = "10.0.0.0/16"
  }
}
