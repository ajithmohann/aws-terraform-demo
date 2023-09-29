output "vpc_id" {
  value = module.canopy_vpc.vpc_id
}

output "vpc_arn" {
  value = module.canopy_vpc.vpc_arn
}

output "public_subnets" {
  value = module.canopy_vpc.public_subnets
}

output "private_subnets" {
  value = module.canopy_vpc.private_subnets
}