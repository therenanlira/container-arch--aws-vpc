module "account_settings" {
  count  = local.workspace.is_central ? 1 : 0
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//account_config?ref=v1"

  api_gateway_logging = true
}
