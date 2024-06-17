output "redshift-role-arn" {
  description = "VPC Id of openweather-etl-cloud"
  value       = aws_iam_role.redshift_role.arn
}
