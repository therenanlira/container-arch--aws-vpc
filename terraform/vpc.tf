module "vpc" {
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//vpc_network?ref=v1"

  project_name = local.workspace.project_name
  environment  = local.workspace.environment

  cidr_block   = local.workspace.cidr_block
  subnet_count = 3

  create_dns_zone = local.workspace.is_central
  dns_zone_id     = local.workspace.is_central ? null : data.terraform_remote_state.aws_vpc_central[0].outputs.dns_zone_id
  dns_name        = local.workspace.is_central ? null : data.terraform_remote_state.aws_vpc_central[0].outputs.dns_name
}
