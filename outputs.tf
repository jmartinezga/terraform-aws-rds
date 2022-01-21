#https://www.terraform.io/language/values/outputs
output "endpoint" {
  description = "RDS Endpoint."
  value       = aws_db_instance.this.endpoint
}

output "address" {
  description = "RDS Address."
  value       = aws_db_instance.this.address
}
