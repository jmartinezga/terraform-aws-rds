#https://www.terraform.io/language/values/variables
###############################################################################
# Required variables
###############################################################################
variable "rds_identifier" {
  description = "(Required) RDS Instance name"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.rds_identifier) > 0
    error_message = "RDS Instance name is required."
  }
}
variable "rds_engine" {
  description = "(Required) RDS Engine"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.rds_engine) > 0
    error_message = "RDS Engine is required (ex: postgres)."
  }
}

variable "rds_engine_version" {
  description = "(Required) RDS Engine version"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.rds_engine_version) > 0
    error_message = "RDS Engine version is required (ex: 9.6)."
  }
}

variable "rds_instance_class" {
  description = "(Required) RDS Instance class"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.rds_instance_class) > 0
    error_message = "RDS Instance class is required (ex: db.t2.micro)."
  }
}

variable "rds_user" {
  description = "(Required) RDS user name"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.rds_user) > 0
    error_message = "RDS user name is required."
  }
}

###############################################################################
# Networking
###############################################################################
variable "vpc_cidr" {
  description = "(Required) VPC CIDR."
  type        = string
  nullable    = false

  validation {
    condition     = can(regex("\\d{1,3}\\.{1}\\d{1,3}\\.{1}\\d{1,3}\\.{1}\\d{1,3}[/]{1}\\d{1,2}", var.vpc_cidr))
    error_message = "RDS VPC CIDR is required."
  }
}

variable "vpc_subnet_list" {
  description = "(Required) VPC Subnet id list."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.vpc_subnet_list) > 0
    error_message = "RDS VPC Subnet id list is required."
  }
}

variable "vpc_security_group_list" {
  description = "(Required) VPC Security Group id list."
  type        = list(string)
  nullable    = false

  validation {
    condition     = length(var.vpc_security_group_list) > 0
    error_message = "RDS VPC Security Group id list is required."
  }
}
###############################################################################
# Optional variables
###############################################################################
variable "rds_name" {
  description = "(Required) RDS database name."
  type        = string
  default     = null
}

variable "rds_storage" {
  description = "(Optional) RDS allocated storage (GB)."
  type        = number
  default     = 5
}

variable "rds_max_storage" {
  description = "(Optional) RDS max allocated storage (GB)."
  type        = number
  default     = 100
}

variable "rds_parameter_group" {
  description = "(Optional) RDS parameter group."
  type        = string
  default     = ""
}

variable "rds_backup_retention_period" {
  description = "(Optional) RDS Backup retention period (days)."
  type        = number
  default     = 7
}

variable "tags" {
  description = "(Optional) List of policies arn."
  type        = any
  default     = {}
}
