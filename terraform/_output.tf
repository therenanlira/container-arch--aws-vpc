output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.cidr_block
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "data_subnet_ids" {
  value = module.vpc.data_subnet_ids
}

output "dns_zone_id" {
  value = module.vpc.dns_zone_id
}

output "dns_name" {
  value = module.vpc.dns_name
}
