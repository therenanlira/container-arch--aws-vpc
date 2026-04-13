workspaces = {
  dev = {
    allowed_accounts = ["923672208632"]
    environment      = "dev"
    aws_region       = "us-east-1"

    project_name = "container-arch"

    cidr_block   = "10.0.0.0/16"
    subnet_count = 3
  }
}
