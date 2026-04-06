resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${local.workspace.project_name}/${local.workspace.environment}/vpc_id"
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  for_each = local.aws_vpc_azs

  name  = "/${local.workspace.project_name}/${local.workspace.environment}/${each.key}/private_subnet_ids"
  type  = "StringList"
  value = aws_subnet.these_private[each.key].id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  for_each = local.aws_vpc_azs

  name  = "/${local.workspace.project_name}/${local.workspace.environment}/${each.key}/public_subnet_ids"
  type  = "StringList"
  value = aws_subnet.these_public[each.key].id
}

resource "aws_ssm_parameter" "data_subnet_ids" {
  for_each = local.aws_vpc_azs

  name  = "/${local.workspace.project_name}/${local.workspace.environment}/${each.key}/data_subnet_ids"
  type  = "StringList"
  value = aws_subnet.these_data[each.key].id
}
