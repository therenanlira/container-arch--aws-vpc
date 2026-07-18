terraform {
  backend "s3" {
    key          = "container-arch/aws-vpc/terraform.tfstate"
    region       = "us-east-2"
    bucket       = "150100906110--terraform-backend"
    use_lockfile = true
  }
}
