locals {
  workspace = var.workspaces[terraform.workspace]

  tags = {
    Project     = local.workspace.project_name
    Region      = local.workspace.aws_region
    Environment = local.workspace.environment
    Workspace   = terraform.workspace
    ManagedBy   = "Terraform"
  }
}
