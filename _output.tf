output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc_id.id
}

output "ssm_private_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_ssm_parameter.private_subnet_ids[az].id }
}

output "ssm_public_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_ssm_parameter.public_subnet_ids[az].id }
}

output "ssm_data_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_ssm_parameter.data_subnet_ids[az].id }
}
