variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "network_id" {
  description = "VPC network ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
}

variable "postgres_preset" {
  description = "PostgreSQL instance preset"
  type        = string
}

variable "postgres_disk_size" {
  description = "PostgreSQL disk size in GB"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
