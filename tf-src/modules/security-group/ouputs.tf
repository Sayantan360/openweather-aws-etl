output "sg-id" {
  description = "Security Group ID"
  value       = aws_security_group.openweather-etl-sg.id
}
