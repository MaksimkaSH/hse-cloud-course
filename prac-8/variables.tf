variable "yc_cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "webapp"
}

variable "environment" {
  description = "Enviroment"
  type        = string
  default     = "dev"
}

variable "network_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.128.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.128.10.0/24"
}

variable "admin_ssh_key" {
  description = "SSH public key for VM access"
  type        = string
  sensitive   = true
}

variable "instance_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "instance_memory" {
  description = "Memory size in GB"
  type        = number
  default     = 4
}

variable "instance_disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "15"
}

variable "postgres_preset" {
  description = "PostgreSQL instance preset"
  type        = string
  default     = "s2.micro"
}

variable "postgres_disk_size" {
  description = "PostgreSQL disk size in GB"
  type        = number
  default     = 10
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "default"
}

variable "db_user" {
  description = "Database username"
  type        = string
  default     = "admin"
}
