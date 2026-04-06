resource "aws_ssm_parameter" "vpc" {
  name  = "${var.project_name}-vpc-id"
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_subnet_1a" {
  name  = "${var.project_name}-private-subnet-1a"
  type  = "String"
  value = aws_subnet.private_subnet_1a.id
}

resource "aws_ssm_parameter" "private_subnet_1b" {
  name  = "${var.project_name}-private-subnet-1b"
  type  = "String"
  value = aws_subnet.private_subnet_1b.id
}

resource "aws_ssm_parameter" "private_subnet_1c" {
  name  = "${var.project_name}-private-subnet-1c"
  type  = "String"
  value = aws_subnet.private_subnet_1c.id
}

resource "aws_ssm_parameter" "public_subnet_1a" {
  name  = "${var.project_name}-public-subnet-1a"
  type  = "String"
  value = aws_subnet.public_subnet_1a.id
}

resource "aws_ssm_parameter" "public_subnet_1b" {
  name  = "${var.project_name}-public-subnet-1b"
  type  = "String"
  value = aws_subnet.public_subnet_1b.id
}

resource "aws_ssm_parameter" "public_subnet_1c" {
  name  = "${var.project_name}-public-subnet-1c"
  type  = "String"
  value = aws_subnet.public_subnet_1c.id
}

resource "aws_ssm_parameter" "database_subnet_1a" {
  name  = "${var.project_name}-database-subnet-1a"
  type  = "String"
  value = aws_subnet.database_subnet_1a.id
}

resource "aws_ssm_parameter" "database_subnet_1b" {
  name  = "${var.project_name}-database-subnet-1b"
  type  = "String"
  value = aws_subnet.database_subnet_1b.id
}

resource "aws_ssm_parameter" "database_subnet_1c" {
  name  = "${var.project_name}-database-subnet-1c"
  type  = "String"
  value = aws_subnet.database_subnet_1c.id
}
