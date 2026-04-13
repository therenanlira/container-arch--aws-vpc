output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "vpc_private_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_subnet.these_private[az].id }
}

output "vpc_public_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_subnet.these_public[az].id }
}

output "vpc_data_subnet_ids" {
  value = { for az in local.aws_vpc_azs : az => aws_subnet.these_data[az].id }
}
