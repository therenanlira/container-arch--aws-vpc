module "account_settings" {
  source = "git::https://github.com/therenanlira/container-arch--aws-modules.git//account_config?ref=v1"

  api_gateway_logging = true
}
