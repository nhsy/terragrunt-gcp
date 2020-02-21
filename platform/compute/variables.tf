variable "project_id" {
  type        = string
  description = "Project ID to create resources"
}

variable "vpc_self_link" {
  type        = string
  description = "VPC self link"
}

variable "region" {
  type        = string
  description = "Region to create resources"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "kms_key" {
  type        = string
  description = "KMS key URI"
  default     = null
}

variable "random_id" {
  type        = string
  description = "Random ID string"
}

variable "public_subnetwork" {
  type        = string
  description = ""
}

variable "private_subnetwork" {
  type        = string
  description = ""
}

variable "common_labels" {
  type    = map(string)
  default = {}
}

variable "gce_service_account_email" {
  type    = string
  default = null
}

variable "machine_type" {
  type    = string
  default = "f1-micro"
}