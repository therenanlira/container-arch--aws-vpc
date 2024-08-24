resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.48.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name     = format("%s_public_subnet_1a", var.project_name)
    Resource = "subnet"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.49.0/24"
  availability_zone = format("%sb", var.region)

  tags = {
    Name     = format("%s_public_subnet_1b", var.project_name)
    Resource = "subnet"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.50.0/24"
  availability_zone = format("%sc", var.region)

  tags = {
    Name     = format("%s_public_subnet_1c", var.project_name)
    Resource = "subnet"
  }
}

resource "aws_route_table" "public_internet_access_1a" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = format("%s_public_internet_access", var.project_name)
    Resource = "route_table"
  }
}

resource "aws_route_table" "public_internet_access_1b" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = format("%s_public_internet_access", var.project_name)
    Resource = "route_table"
  }
}

resource "aws_route_table" "public_internet_access_1c" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = format("%s_public_internet_access", var.project_name)
    Resource = "route_table"
  }
}

resource "aws_route" "public_route_1a" {
  route_table_id         = aws_route_table.public_internet_access_1a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "public_route_1b" {
  route_table_id         = aws_route_table.public_internet_access_1b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "public_route_1c" {
  route_table_id         = aws_route_table.public_internet_access_1c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_rta_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_internet_access_1a.id
}

resource "aws_route_table_association" "public_rta_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_internet_access_1b.id
}

resource "aws_route_table_association" "public_rta_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_internet_access_1c.id
}
