locals {
  aws_vpc_subnet_private = cidrsubnet(local.workspace.aws_vpc_cidr_block, 4, 0)
  aws_vpc_subnet_public  = cidrsubnet(local.workspace.aws_vpc_cidr_block, 4, 1)
  aws_vpc_subnet_data    = cidrsubnet(local.workspace.aws_vpc_cidr_block, 4, 2)

  aws_vpc_azs = toset(slice(data.aws_availability_zones.available.names, 0, local.workspace.aws_vpc_subnet_count))

  aws_vpce_gateways = [
    "s3",
    "dynamodb"
  ]
}

########################################
########### VPC and IGW
########################################

resource "aws_vpc" "main" {
  cidr_block = local.workspace.aws_vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.workspace.project_name}--vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.workspace.project_name}--igw"
  }
}

resource "aws_eip" "eip" {
  for_each = local.aws_vpc_azs

  domain = "vpc"

  tags = {
    Name = "${local.workspace.project_name}--eip-${each.key}"
  }
}

resource "aws_nat_gateway" "natgw" {
  for_each = local.aws_vpc_azs

  allocation_id = aws_eip.eip[each.key].id
  subnet_id     = aws_subnet.these_public[each.key].id

  tags = {
    Name = "${local.workspace.project_name}--natgw-${each.key}"
  }
}

########################################
###### Private Subnets
########################################

resource "aws_subnet" "these_private" {
  for_each = local.aws_vpc_azs

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(local.aws_vpc_subnet_private, 4, index(data.aws_availability_zones.available.names, each.key))

  tags = {
    Name = "${local.workspace.project_name}--private-subnet-${each.key}"
  }
}

resource "aws_subnet" "these_public" {
  for_each = local.aws_vpc_azs

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(local.aws_vpc_subnet_public, 4, index(data.aws_availability_zones.available.names, each.key))

  tags = {
    Name = "${local.workspace.project_name}--public-subnet-${each.key}"
  }
}

resource "aws_subnet" "these_data" {
  for_each = local.aws_vpc_azs

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(local.aws_vpc_subnet_data, 4, index(data.aws_availability_zones.available.names, each.key))

  tags = {
    Name = "${local.workspace.project_name}--data-subnet-${each.key}"
  }
}

########################################
###### Private and Data Route Tables
########################################

resource "aws_route_table" "private" {
  for_each = local.aws_vpc_azs

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.workspace.project_name}--private-rt-${each.key}"
  }
}

resource "aws_route" "private_internet_access" {
  for_each = local.aws_vpc_azs

  route_table_id         = aws_route_table.private[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw[each.key].id
}

resource "aws_route_table_association" "private_rta" {
  for_each = local.aws_vpc_azs

  subnet_id      = aws_subnet.these_private[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}

resource "aws_route_table_association" "data_rta" {
  for_each = local.aws_vpc_azs

  subnet_id      = aws_subnet.these_data[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}

########################################
###### Public Route Tables
########################################

resource "aws_route_table" "public" {
  for_each = local.aws_vpc_azs

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.workspace.project_name}--public-rt-${each.key}"
  }
}

resource "aws_route" "public_internet_access" {
  for_each = local.aws_vpc_azs

  route_table_id         = aws_route_table.public[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public_rta" {
  for_each = local.aws_vpc_azs

  subnet_id      = aws_subnet.these_public[each.key].id
  route_table_id = aws_route_table.public[each.key].id
}

########################################
###### VPC Endpoints
########################################

resource "aws_vpc_endpoint" "these" {
  for_each = toset(local.aws_vpce_gateways)

  vpc_id            = aws_vpc.main.id
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${data.aws_region.current.region}.${each.key}"
  route_table_ids   = [for rt in aws_route_table.private : rt.id]

  tags = {
    Name = "${local.workspace.project_name}--vpce-${each.key}"
  }
}
