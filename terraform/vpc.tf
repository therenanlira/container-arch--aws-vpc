module "vpc" {
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//vpc_network?ref=v1"

  project_name = local.workspace.project_name
  environment  = local.workspace.environment

  cidr_block   = local.workspace.cidr_block
  subnet_count = 3
}
