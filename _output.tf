output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "private_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_subnet.these_private[az].id }
}

output "public_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_subnet.these_public[az].id }
}

output "data_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_subnet.these_data[az].id }
}
