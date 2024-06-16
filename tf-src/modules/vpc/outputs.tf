output "vpc-id" {
  description = "VPC Id of openweather-etl-cloud"
  value       = aws_vpc.vpc.id
}

output "openweather-redshift-subnet-group" {
  description = "Id of openweather subnet group"
  value       = aws_redshift_subnet_group.openweather-redshift-subnet-group.id
}