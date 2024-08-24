output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc.id
}

output "ssm_private_subnet_1a" {
  value = aws_ssm_parameter.private_subnet_1a.id
}

output "ssm_private_subnet_1b" {
  value = aws_ssm_parameter.private_subnet_1b.id
}

output "ssm_private_subnet_1c" {
  value = aws_ssm_parameter.private_subnet_1c.id
}

output "ssm_public_subnet_1a" {
  value = aws_ssm_parameter.public_subnet_1a.id
}

output "ssm_public_subnet_1b" {
  value = aws_ssm_parameter.public_subnet_1b.id
}

output "ssm_public_subnet_1c" {
  value = aws_ssm_parameter.public_subnet_1c.id
}

output "ssm_database_subnet_1a" {
  value = aws_ssm_parameter.database_subnet_1a.id
}

output "ssm_database_subnet_1b" {
  value = aws_ssm_parameter.database_subnet_1b.id
}

output "ssm_database_subnet_1c" {
  value = aws_ssm_parameter.database_subnet_1c.id
}