resource "aws_ssm_parameter" "vpc" {
  # name  = format("/%s/vpc/vpc_id", var.project_name)
  name  = "${var.project_name}-vpc-id"
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_subnet_1a" {
  # name  = format("/%s/vpc/private_subnet_1a", var.project_name)
  name  = "${var.project_name}-private-subnet-1a"
  type  = "String"
  value = aws_subnet.private_subnet_1a.id
}

resource "aws_ssm_parameter" "private_subnet_1b" {
  # name  = format("/%s/vpc/private_subnet_1b", var.project_name)
  name  = "${var.project_name}-private-subnet-1b"
  type  = "String"
  value = aws_subnet.private_subnet_1b.id
}

resource "aws_ssm_parameter" "private_subnet_1c" {
  # name  = format("/%s/vpc/private_subnet_1c", var.project_name)
  name  = "${var.project_name}-private-subnet-1c"
  type  = "String"
  value = aws_subnet.private_subnet_1c.id
}

resource "aws_ssm_parameter" "public_subnet_1a" {
  # name  = format("/%s/vpc/public_subnet_1a", var.project_name)
  name  = "${var.project_name}-public-subnet-1a"
  type  = "String"
  value = aws_subnet.public_subnet_1a.id
}

resource "aws_ssm_parameter" "public_subnet_1b" {
  # name  = format("/%s/vpc/public_subnet_1b", var.project_name)
  name  = "${var.project_name}-public-subnet-1b"
  type  = "String"
  value = aws_subnet.public_subnet_1b.id
}

resource "aws_ssm_parameter" "public_subnet_1c" {
  # name  = format("/%s/vpc/public_subnet_1c", var.project_name)
  name  = "${var.project_name}-public-subnet-1c"
  type  = "String"
  value = aws_subnet.public_subnet_1c.id
}

resource "aws_ssm_parameter" "database_subnet_1a" {
  # name  = format("/%s/vpc/database_subnet_1a", var.project_name)
  name  = "${var.project_name}-database-subnet-1a"
  type  = "String"
  value = aws_subnet.database_subnet_1a.id
}

resource "aws_ssm_parameter" "database_subnet_1b" {
  # name  = format("/%s/vpc/database_subnet_1b", var.project_name)
  name  = "${var.project_name}-database-subnet-1b"
  type  = "String"
  value = aws_subnet.database_subnet_1b.id
}

resource "aws_ssm_parameter" "database_subnet_1c" {
  # name  = format("/%s/vpc/database_subnet_1c", var.project_name)
  name  = "${var.project_name}-database-subnet-1c"
  type  = "String"
  value = aws_subnet.database_subnet_1c.id
}
