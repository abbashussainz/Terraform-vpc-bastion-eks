output "vpc_id" {
  description = "vpc id of created data structure"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "nat_public_ips" {
  description = "elastic_ip of nat gateways "
  value       = module.vpc.nat_public_ips
}