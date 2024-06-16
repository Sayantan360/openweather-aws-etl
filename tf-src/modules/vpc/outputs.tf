output "vpc-id" {
  description = "VPC Id of openweather-etl-cloud"
  value       = aws_vpc.vpc.id
}