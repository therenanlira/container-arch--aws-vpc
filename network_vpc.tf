module "vpc" {
  source = "../container-arch--aws-ecs-module/network"

  project_name = local.workspace.project_name
  cidr_block   = local.workspace.cidr_block
  subnet_count = local.workspace.subnet_count
}
