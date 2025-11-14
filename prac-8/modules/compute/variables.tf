variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for VM"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
  sensitive   = true
}

variable "instance_cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "instance_memory" {
  description = "Memory size in GB"
  type        = number
}

variable "instance_disk_size" {
  description = "Boot disk size in GB"
  type        = number
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
