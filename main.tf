#https://registry.terraform.io/providers/hashicorp/aws/latest/docs
locals {
  rds_identifier   = "${var.environment}-${var.rds_identifier}"
  rds_subnet_group = "${var.environment}-${var.rds_identifier}-sng"
  module_version   = trimspace(chomp(file("./version")))
  last_update      = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  tags = merge(var.tags, {
    environment    = "${var.environment}",
    application    = "${var.application}",
    module_name    = "terraform-aws-rds",
    module_version = "${local.module_version}",
    last_update    = "${local.last_update}"
  })
}

#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
resource "random_password" "this" {
  length  = 16
  special = true
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter
resource "aws_ssm_parameter" "secret" {
  name        = "/${var.environment}/${var.rds_identifier}/${var.rds_user}/password"
  description = "Password for the master DB user"
  type        = "SecureString"
  value       = random_password.this.result

  tags = local.tags
}

resource "aws_db_subnet_group" "this" {
  name       = local.rds_subnet_group
  subnet_ids = var.vpc_subnet_list
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
#https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts

resource "aws_db_instance" "this" {
  identifier     = local.rds_identifier
  engine         = var.rds_engine
  engine_version = var.rds_engine_version
  instance_class = var.rds_instance_class

  allocated_storage     = var.rds_storage
  max_allocated_storage = var.environment == "prd" ? var.rds_max_storage : 0
  storage_encrypted     = var.environment == "prd" ? true : false

  multi_az             = var.environment == "prd" ? true : false
  parameter_group_name = var.rds_parameter_group != "" ? var.rds_parameter_group : null

  name     = var.rds_name != null ? var.rds_name : null
  username = var.rds_user
  password = random_password.this.result

  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.vpc_security_group_list

  skip_final_snapshot             = var.environment == "prd" ? false : true
  deletion_protection             = var.environment == "prd" ? true : false
  allow_major_version_upgrade     = var.environment == "prd" ? false : true
  auto_minor_version_upgrade      = var.environment == "prd" ? true : false
  apply_immediately               = var.environment == "prd" ? false : true
  maintenance_window              = var.environment == "prd" ? "Mon:05:00-Mon:08:00" : null
  backup_window                   = var.environment == "prd" ? "03:00-06:00" : null
  backup_retention_period         = var.environment == "prd" ? var.rds_backup_retention_period : 0
  enabled_cloudwatch_logs_exports = var.environment == "prd" ? ["postgresql", "upgrade"] : null

  tags = local.tags
}
