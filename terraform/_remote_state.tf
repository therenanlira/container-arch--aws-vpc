data "terraform_remote_state" "aws_vpc_central" {
  count = local.workspace.is_central ? 0 : 1

  backend = "s3"
  config = {
    bucket = "150100906110--terraform-backend"
    key    = "env:/${local.central_workspace}/container-arch/aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
