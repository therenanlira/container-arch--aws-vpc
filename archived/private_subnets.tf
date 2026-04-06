resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = "${var.region}a"

  tags = {
    Name     = "${var.project_name}-private-subnet-1a"
    Resource = "subnet"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = "${var.region}b"

  tags = {
    Name     = "${var.project_name}-private-subnet-1b"
    Resource = "subnet"
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/20"
  availability_zone = "${var.region}c"

  tags = {
    Name     = "${var.project_name}-private-subnet-1c"
    Resource = "subnet"
  }
}

resource "aws_route_table" "private_internet_access_1a" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = "${var.project_name}-private-internet-access-1a"
    Resource = "route_table"
  }
}

resource "aws_route_table" "private_internet_access_1b" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = "${var.project_name}-private-internet-access-1b"
    Resource = "route_table"
  }
}

resource "aws_route_table" "private_internet_access_1c" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = "${var.project_name}-private-internet-access-1c"
    Resource = "route_table"
  }
}

resource "aws_route" "private_route_1a" {
  route_table_id         = aws_route_table.private_internet_access_1a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_1a.id
}

resource "aws_route" "private_route_1b" {
  route_table_id         = aws_route_table.private_internet_access_1b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_1b.id
}

resource "aws_route" "private_route_1c" {
  route_table_id         = aws_route_table.private_internet_access_1c.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_1c.id
}

resource "aws_route_table_association" "private_rta_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_internet_access_1a.id
}

resource "aws_route_table_association" "private_rta_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_internet_access_1b.id
}

resource "aws_route_table_association" "private_rta_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_internet_access_1c.id
}
