module "account_settings" {
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//account_config?ref=v1"

  environment         = local.workspace.environment
  api_gateway_logging = true
}
