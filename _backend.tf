terraform {
  backend "s3" {
    key          = "container-arch/aws-vpc/terraform.tfstate"
    region       = "us-east-1"
    bucket       = "container-arch--terraform-backend"
    use_lockfile = true
  }
}
