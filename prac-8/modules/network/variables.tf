variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "network_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
