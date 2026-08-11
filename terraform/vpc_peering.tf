module "peering" {
  count  = local.workspace.is_central ? 0 : 1
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//vpc_peering?ref=v1"

  providers = {
    aws         = aws
    aws.central = aws.central
  }

  environment = local.workspace.environment
  network_values = {
    vpc_id                  = module.vpc.vpc_id
    vpc_cidr_block          = module.vpc.cidr_block
    private_subnet_ids      = module.vpc.private_subnet_ids
    private_route_table_ids = module.vpc.private_route_table_ids
  }

  target_account_id      = local.workspace.central_account
  target_vpc_id          = data.terraform_remote_state.aws_vpc_central[0].outputs.vpc_id
  target_region          = local.workspace.central_region
  target_route_table_ids = data.terraform_remote_state.aws_vpc_central[0].outputs.private_route_table_ids
  target_cidr_block      = data.terraform_remote_state.aws_vpc_central[0].outputs.vpc_cidr_block
}
