#https://www.terraform.io/language/values/outputs
output "rds_endpoint" {
  description = "RDS Endpoint."
  value       = aws_db_instance.this.endpoint
}

output "rds_address" {
  description = "RDS Address."
  value       = aws_db_instance.this.address
}
