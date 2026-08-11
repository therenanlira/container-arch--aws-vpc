locals {
  workspace = var.workspaces[terraform.workspace]

  central_workspace = "${local.workspace.environment}-${local.workspace.central_region}"

  tags = {
    Project     = local.workspace.project_name
    Region      = local.workspace.aws_region
    Environment = local.workspace.environment
    Workspace   = terraform.workspace
    ManagedBy   = "Terraform"
    Owner       = "DevOps Team"
  }
}
