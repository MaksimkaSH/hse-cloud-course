variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "access_key" {
  description = "S3 access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "S3 secret key"
  type        = string
  sensitive   = true
}

variable "unique_suffix" {
  description = "Unique suffix for bucket name"
  type        = string
}
