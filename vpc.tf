module "vpc" {
  source = "../container-arch--aws-ecs-module/network"

  project_name = local.workspace.project_name
  environment  = local.workspace.environment

  cidr_block   = "10.0.0.0/16"
  subnet_count = 3
}
