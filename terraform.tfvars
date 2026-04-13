workspaces = {
  dev = {
    allowed_accounts = ["923672208632"]
    environment      = "dev"
    aws_region       = "us-east-1"

    project_name = "container-arch"

    aws_vpc_cidr_block   = "10.0.0.0/16"
    aws_vpc_subnet_count = 3
  }
}
