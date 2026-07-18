module "vpc" {
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//network?ref=v1"

  project_name = local.workspace.project_name
  environment  = local.workspace.environment

  cidr_block   = "10.0.0.0/16"
  subnet_count = 3
}
