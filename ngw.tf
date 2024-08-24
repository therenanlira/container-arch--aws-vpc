resource "aws_eip" "vpc_eip_1a" {
  domain = "vpc"

  tags = {
    # Name     = format("%s-eip-1a", var.project_name)
    Name     = "${var.project_name}-eip-1a"
    Resource = "eip"
  }
}

resource "aws_eip" "vpc_eip_1b" {
  domain = "vpc"

  tags = {
    # Name     = format("%s-eip-1b", var.project_name)
    Name     = "${var.project_name}-eip-1b"
    Resource = "eip"
  }
}

resource "aws_eip" "vpc_eip_1c" {
  domain = "vpc"

  tags = {
    # Name     = format("%s-eip-1c", var.project_name)
    Name     = "${var.project_name}-eip-1c"
    Resource = "eip"
  }
}

resource "aws_nat_gateway" "nat_gw_1a" {
  allocation_id = aws_eip.vpc_eip_1a.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    # Name     = format("%s-nat-gw-1a", var.project_name)
    Name     = "${var.project_name}-nat-gw-1a"
    Resource = "nat_gateway"
  }
}

resource "aws_nat_gateway" "nat_gw_1b" {
  allocation_id = aws_eip.vpc_eip_1b.id
  subnet_id     = aws_subnet.public_subnet_1b.id

  tags = {
    # Name     = format("%s-nat-gw-1b", var.project_name)
    Name     = "${var.project_name}-nat-gw-1b"
    Resource = "nat_gateway"
  }
}

resource "aws_nat_gateway" "nat_gw_1c" {
  allocation_id = aws_eip.vpc_eip_1c.id
  subnet_id     = aws_subnet.public_subnet_1c.id

  tags = {
    # Name     = format("%s-nat-gw-1c", var.project_name)
    Name     = "${var.project_name}-nat-gw-1c"
    Resource = "nat_gateway"
  }
}
