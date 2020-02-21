variable "random_id" {
  type        = string
  description = "Random ID string"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "project_id" {
  type        = string
  description = "Project ID to create resources"
}

variable "vpc_prefix" {
  type        = string
  default     = "vpc"
  description = "VPC name prefix"
}

variable "network_cidr" {
  type        = string
  default     = "10.128.0.0/16"
  description = "Network CIDR"
}

variable "region" {
  type        = string
  description = "Region to create resources"
}

variable "router_prefix" {
  type        = string
  default     = "rtr"
  description = "Router name prefix"
}

variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Create nat gatway for internal servers"
}

variable "enable_flow_logs" {
  type        = string
  default     = true
  description = "Enable flow logging"
}

variable "mgmt_source_cidr" {
  type        = list(string)
  default     = []
  description = "Management CIDR for remote access"
}

variable "iap_source_cidrs" {
  type        = list(string)
  default     = ["35.235.240.0/20"]
  description = "IAP cidrs"
}

variable "health_check_source_cidrs" {
  type        = list(string)
  default     = ["35.191.0.0/16", "130.211.0.0/22"]
  description = "Health check cidrs"
}

variable "labels" {
  type = map(string)
}