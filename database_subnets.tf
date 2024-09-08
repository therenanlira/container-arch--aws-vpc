resource "aws_subnet" "database_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.51.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name     = "${var.project_name}-database-subnet-1a"
    Resource = "subnet"
  }
}

resource "aws_subnet" "database_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.52.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name     = "${var.project_name}-database-subnet-1b"
    Resource = "subnet"
  }
}

resource "aws_subnet" "database_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.53.0/24"
  availability_zone = "${var.region}c"

  tags = {
    Name     = "${var.project_name}-database-subnet-1c"
    Resource = "subnet"
  }
}
