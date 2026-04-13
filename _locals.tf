locals {
  workspace = var.workspaces[terraform.workspace]

  tags = {
    Owner = "DevOps Team"
  }
}
