# output "vpc_id" {
#   value = module.canopy_vpc.vpc_id
# }

# output "vpc_arn" {
#   value = module.canopy_vpc.vpc_arn
# }

# output "public_subnets" {
#   value = module.canopy_vpc.public_subnets
# }

# output "private_subnets" {
#   value = module.canopy_vpc.private_subnets
# }

output "vpc_id" {
  value = aws_vpc.canopy_vpc.id
}

output "vpc_arn" {
  value = aws_vpc.canopy_vpc.arn
}

output "public_subnets" {
  value = aws_subnet.canopy_public_subnet
}

output "private_subnets" {
  value = aws_subnet.canopy_private_subnet
}