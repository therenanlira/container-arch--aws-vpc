resource "aws_ssm_parameter" "vpc" {
  name  = format("/%s/vpc/vpc_id", var.project_name)
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_subnet_1a" {
  name  = format("/%s/vpc/private_subnet_1a", var.project_name)
  type  = "String"
  value = aws_subnet.private_subnet_1a.id
}

resource "aws_ssm_parameter" "private_subnet_1b" {
  name  = format("/%s/vpc/private_subnet_1b", var.project_name)
  type  = "String"
  value = aws_subnet.private_subnet_1b.id
}

resource "aws_ssm_parameter" "private_subnet_1c" {
  name  = format("/%s/vpc/private_subnet_1c", var.project_name)
  type  = "String"
  value = aws_subnet.private_subnet_1c.id
}

resource "aws_ssm_parameter" "public_subnet_1a" {
  name  = format("/%s/vpc/public_subnet_1a", var.project_name)
  type  = "String"
  value = aws_subnet.public_subnet_1a.id
}

resource "aws_ssm_parameter" "public_subnet_1b" {
  name  = format("/%s/vpc/public_subnet_1b", var.project_name)
  type  = "String"
  value = aws_subnet.public_subnet_1b.id
}

resource "aws_ssm_parameter" "public_subnet_1c" {
  name  = format("/%s/vpc/public_subnet_1c", var.project_name)
  type  = "String"
  value = aws_subnet.public_subnet_1c.id
}

resource "aws_ssm_parameter" "database_subnet_1a" {
  name  = format("/%s/vpc/database_subnet_1a", var.project_name)
  type  = "String"
  value = aws_subnet.database_subnet_1a.id
}

resource "aws_ssm_parameter" "database_subnet_1b" {
  name  = format("/%s/vpc/database_subnet_1b", var.project_name)
  type  = "String"
  value = aws_subnet.database_subnet_1b.id
}

resource "aws_ssm_parameter" "database_subnet_1c" {
  name  = format("/%s/vpc/database_subnet_1c", var.project_name)
  type  = "String"
  value = aws_subnet.database_subnet_1c.id
}