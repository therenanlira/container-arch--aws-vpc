module "vpc" {
  source = "git@github.com:therenanlira/container-arch--aws-ecs-module//network?ref=v1.4.0"

  project_name = local.workspace.project_name
  environment  = local.workspace.environment

  cidr_block   = "10.0.0.0/16"
  subnet_count = 3
}
